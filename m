Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C53FF885A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 16:33:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E0810E353;
	Tue, 28 Apr 2026 16:33:57 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882DD10E353;
 Tue, 28 Apr 2026 16:33:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/tests=3A_Add_kunit?=
 =?utf-8?q?_tests_for_memory_based_interrupts?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 Apr 2026 16:33:56 -0000
Message-ID: <177739403655.22199.15479444657123284094@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260428142722.582-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260428142722.582-1-michal.wajdeczko@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe/tests: Add kunit tests for memory based interrupts
URL   : https://patchwork.freedesktop.org/series/165651/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c8c12e558adaef7a4d125d83b6e1f8824bc13b82
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 395d15296dff07c7a84870a45283aad23fa09092
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Apr 28 16:27:20 2026 +0200

    drm/xe/tests: Add kunit tests for memory based interrupts
    
    Add basic kunit tests for the memory based interrupts. For maximum
    coverage, we will use non-real device definition with custom mix of
    GT IPs that are defined with the largest number of engines.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch e066eb26712bca7174e694a358351c50a38661d6 drm-intel
4da73b511746 drm/xe/ggtt: Rename parameter name in xe_ggtt_init_kunit()
6a2097147607 drm/xe/guc: Allow to replace xe_guc_irq_handler() with stub
b4e281e17701 drm/xe/hwe: Allow to replace xe_hw_engine_handle_irq() with stub
f38eaa083eb8 drm/xe/mmio: Allow to replace xe_mmio_read32|write32() with stub
4b58aedae808 drm/xe/kunit: Promote GGTT initialization to test_init() helper
b11451f01e7e drm/xe/kunit: Promote fake BO activation to test_init() helper
ce476abd7a09 drm/xe/kunit: Activate empty MMIO stubs in test_init()
af6a5b30ac29 drm/xe/memirq: Make page layout macros private
584f5e2134a6 drm/xe/memirq: Introduce helper to calculate source page offset
6fe6df8e9814 drm/xe/memirq: Introduce helper to calculate status vector offset
a36bf197d3aa drm/xe/memirq: Refactor xe_memirq_hwe_handler
5fa2e2e00719 drm/xe/memirq: Dump additional source pages if MSI-X
395d15296dff drm/xe/tests: Add kunit tests for memory based interrupts
-:13: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#13: 
new file mode 100644

-:213: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'n' - possible side-effects?
#213: FILE: drivers/gpu/drm/xe/tests/xe_memirq_kunit.c:196:
+#define INTR_bcs(n)	((((n) < 8) ? INTR_BCS(n) : INTR_BCS8) + BUILD_BUG_ON_ZERO((n) > 8))

-:215: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'IIR' - possible side-effects?
#215: FILE: drivers/gpu/drm/xe/tests/xe_memirq_kunit.c:198:
+#define MAKE_MEMIRQ_TEST_PARAM(NAME, SRC, S0, INST, IIR, ...) {	\
+	.name = (NAME),						\
+	.source = ilog2(INTR_##SRC) __VA_ARGS__,		\
+	.source0 = ilog2(INTR_##S0) __VA_ARGS__,		\
+	.instance = (INST),					\
+	.status = ilog2(IIR),					\
+	.iir = (IIR),						\
+}

-:224: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'GUC' - possible side-effects?
#224: FILE: drivers/gpu/drm/xe/tests/xe_memirq_kunit.c:207:
+#define MAKE_MEMIRQ_TEST_PARAM_GUC(GUC, IIR, ...) \
+	MAKE_MEMIRQ_TEST_PARAM(#GUC " " #IIR, GUC, GUC, 0, GUC_INTR_##IIR)

-:227: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'ENG' - possible side-effects?
#227: FILE: drivers/gpu/drm/xe/tests/xe_memirq_kunit.c:210:
+#define MAKE_MEMIRQ_TEST_PARAM_HWE(ENG, INST, IIR, ...) \
+	MAKE_MEMIRQ_TEST_PARAM(#ENG #INST " " #IIR, ENG(INST), ENG(0), (INST), \
+			       GT_##IIR, ##__VA_ARGS__)

-:227: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'INST' - possible side-effects?
#227: FILE: drivers/gpu/drm/xe/tests/xe_memirq_kunit.c:210:
+#define MAKE_MEMIRQ_TEST_PARAM_HWE(ENG, INST, IIR, ...) \
+	MAKE_MEMIRQ_TEST_PARAM(#ENG #INST " " #IIR, ENG(INST), ENG(0), (INST), \
+			       GT_##IIR, ##__VA_ARGS__)

-:253: CHECK:SPACING: spaces preferred around that '+' (ctx:WxV)
#253: FILE: drivers/gpu/drm/xe/tests/xe_memirq_kunit.c:236:
+	MAKE_MEMIRQ_TEST_PARAM_HWE(VCS, 0, MI_USER_INTERRUPT, +32),
 	                                                      ^

-:254: CHECK:SPACING: spaces preferred around that '+' (ctx:WxV)
#254: FILE: drivers/gpu/drm/xe/tests/xe_memirq_kunit.c:237:
+	MAKE_MEMIRQ_TEST_PARAM_HWE(VCS, 1, MI_USER_INTERRUPT, +32),
 	                                                      ^

-:255: CHECK:SPACING: spaces preferred around that '+' (ctx:WxV)
#255: FILE: drivers/gpu/drm/xe/tests/xe_memirq_kunit.c:238:
+	MAKE_MEMIRQ_TEST_PARAM_HWE(VCS, 2, MI_USER_INTERRUPT, +32),
 	                                                      ^

-:256: CHECK:SPACING: spaces preferred around that '+' (ctx:WxV)
#256: FILE: drivers/gpu/drm/xe/tests/xe_memirq_kunit.c:239:
+	MAKE_MEMIRQ_TEST_PARAM_HWE(VCS, 3, MI_USER_INTERRUPT, +32),
 	                                                      ^

-:257: CHECK:SPACING: spaces preferred around that '+' (ctx:WxV)
#257: FILE: drivers/gpu/drm/xe/tests/xe_memirq_kunit.c:240:
+	MAKE_MEMIRQ_TEST_PARAM_HWE(VCS, 4, MI_USER_INTERRUPT, +32),
 	                                                      ^

-:258: CHECK:SPACING: spaces preferred around that '+' (ctx:WxV)
#258: FILE: drivers/gpu/drm/xe/tests/xe_memirq_kunit.c:241:
+	MAKE_MEMIRQ_TEST_PARAM_HWE(VCS, 5, MI_USER_INTERRUPT, +32),
 	                                                      ^

-:259: CHECK:SPACING: spaces preferred around that '+' (ctx:WxV)
#259: FILE: drivers/gpu/drm/xe/tests/xe_memirq_kunit.c:242:
+	MAKE_MEMIRQ_TEST_PARAM_HWE(VCS, 6, MI_USER_INTERRUPT, +32),
 	                                                      ^

-:260: CHECK:SPACING: spaces preferred around that '+' (ctx:WxV)
#260: FILE: drivers/gpu/drm/xe/tests/xe_memirq_kunit.c:243:
+	MAKE_MEMIRQ_TEST_PARAM_HWE(VCS, 7, MI_USER_INTERRUPT, +32),
 	                                                      ^

-:261: CHECK:SPACING: spaces preferred around that '+' (ctx:WxV)
#261: FILE: drivers/gpu/drm/xe/tests/xe_memirq_kunit.c:244:
+	MAKE_MEMIRQ_TEST_PARAM_HWE(VECS, 0, MI_USER_INTERRUPT, +32),
 	                                                       ^

-:262: CHECK:SPACING: spaces preferred around that '+' (ctx:WxV)
#262: FILE: drivers/gpu/drm/xe/tests/xe_memirq_kunit.c:245:
+	MAKE_MEMIRQ_TEST_PARAM_HWE(VECS, 1, MI_USER_INTERRUPT, +32),
 	                                                       ^

-:263: CHECK:SPACING: spaces preferred around that '+' (ctx:WxV)
#263: FILE: drivers/gpu/drm/xe/tests/xe_memirq_kunit.c:246:
+	MAKE_MEMIRQ_TEST_PARAM_HWE(VECS, 2, MI_USER_INTERRUPT, +32),
 	                                                       ^

-:264: CHECK:SPACING: spaces preferred around that '+' (ctx:WxV)
#264: FILE: drivers/gpu/drm/xe/tests/xe_memirq_kunit.c:247:
+	MAKE_MEMIRQ_TEST_PARAM_HWE(VECS, 3, MI_USER_INTERRUPT, +32),
 	                                                       ^

total: 0 errors, 1 warnings, 17 checks, 283 lines checked


