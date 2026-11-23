import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_cam_boncuk_firini/oyun_cam_boncuk_firini.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(camBoncukConfig.title.length, 33);
    expect(camBoncukConfig.tagline.length, 33);
    for (final s in camBoncukConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(camBoncukConfig.gameId, camBoncukId);
    expect(camBoncukRules.gameId, camBoncukId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(camBoncukRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: camBoncukId, optionalMechanics: camBoncukRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(camBoncukRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
