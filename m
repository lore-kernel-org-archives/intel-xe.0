Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEE8C43458
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 12:56:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8447610ECC5;
	Tue,  7 Jul 2026 12:56:54 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E29610ECC5;
 Tue,  7 Jul 2026 12:56:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dp=5Flink=3A_Uni?=
 =?utf-8?q?fy_modeset/fallback_config_selection_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 07 Jul 2026 12:56:53 -0000
Message-ID: <178342901351.159884.9188668217646230010@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260701153204.4124150-1-imre.deak@intel.com>
In-Reply-To: <20260701153204.4124150-1-imre.deak@intel.com>
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

Series: drm/i915/dp_link: Unify modeset/fallback config selection (rev5)
URL   : https://patchwork.freedesktop.org/series/169636/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8b1914d8716f4bc55af26c11131b9ce69b0a1cfd
Author: Imre Deak <imre.deak@intel.com>
Date:   Wed Jul 1 18:32:03 2026 +0300

    drm/i915/kunit: DP link: add fallback tests
    
    Add KUnit tests for DP link fallback selection across eDP, SST, and MST.
    Verify that the fallback logic properly selects the maximum allowed
    configuration, iterates through allowed configurations, and disables
    failed configs as expected.
    
    These tests include UHBR vs. non-UHBR conditions, MST vs. SST mode,
    and validate that subsequent fallback selections respect the updated
    allowed configuration mask.
    
    v2:
    - Rebase on changes using a filter object instead of a mask of
      configuration indices.
    - Rebase on changes using an iteration object.
    
    Signed-off-by: Imre Deak <imre.deak@intel.com>
    Reviewed-by: Michał Grzelak <michal.grzelak@intel.com>
+ /mt/dim checkpatch cd8abe2554ec7eba16c1d48ab508732bf93534eb drm-intel
7acbf15c289b drm/i915/doc: Document DP link capabilities
-:12: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#12: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 105 lines checked
3246c81f999e drm/i915/dp_link_caps: Factor out helper to get link config by index
7ebd0d7186ec drm/i915/dp_link_caps: Add support for link rate, lane count iteration orders
983452baccd7 drm/i915/dp_link_caps: Add link configuration iterator
-:39: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#39: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.c:150:
 };
+static_assert(BITS_PER_TYPE(((struct intel_dp_link_caps_filter *)NULL)->config_mask) >=

-:368: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#368: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.h:106:
+#define for_each_dp_link_config(__iter, __config) \
+	while ((__iter)->get_next_config((__iter), (__config)))

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

-:368: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__iter' - possible side-effects?
#368: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.h:106:
+#define for_each_dp_link_config(__iter, __config) \
+	while ((__iter)->get_next_config((__iter), (__config)))

total: 1 errors, 0 warnings, 2 checks, 355 lines checked
6e1bb5710eda drm/i915/dp_link_caps: Add helper to get iteration order for a connector
0dfd3f902bac drm/i915/dp_link_caps: Validate max link limits
705a2c9f8b1f drm/i915/dp_link_caps: Add filter for enabled link configurations
3c8ce56aedab drm/i915/dp_link_caps: Re-enable link configurations after a link reset
dd69fc3f53fc drm/i915/dp_link_caps: Re-enable link configurations after sink caps change
b9a5c963e6ab drm/i915/dp_link_caps: Drop noupdate postfix from max link limit set helpers
2deb3fb5361b drm/i915/dp_link_caps: Add debugfs entry showing allowed configurations
cb53d9b99186 drm/i915/dp: Add link configuration filter for modeset computation
-:67: WARNING:LONG_LINE: line length of 181 exceeds 100 columns
#67: FILE: drivers/gpu/drm/i915/display/intel_dp.c:2644:
+		    "[ENCODER:%d:%s][CRTC:%d:%s] DP link limits: pixel clock %d kHz DSC %s max link %dx%d max pipe_bpp %d min link_bpp " FXP_Q4_FMT " max link_bpp " FXP_Q4_FMT "\n",

total: 0 errors, 1 warnings, 0 checks, 197 lines checked
f20e219319e7 drm/i915/dp_link_caps: Add helper to query max BW link configuration
-:36: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#36: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.c:565:
+					       bw_desc_config_order().key, INTEL_DP_LINK_CAPS_FILTER_ALL,

total: 0 errors, 1 warnings, 0 checks, 32 lines checked
59b3f788915a drm/i915/dp: Query max BW config via link_caps during mode validation
b90d573c15d3 drm/i915/dp_tunnel: Query max BW config via link_caps for BW computation
063e4045484b drm/i915/dp_test: Use link caps for compliance link configs
3bca8f3a952d drm/i915/dp: Iterate configurations via link_caps for SST non-DSC
2d0d027ea384 drm/i915/dp: Iterate configurations via link_caps for SST DSC
8ece9b5aa5aa drm/i915/dp: Use link caps for eDP DSC config selection
ff6ad415b608 drm/i915/dp_mst: Use link caps for non-DSC config selection
6b912a4f77e9 drm/i915/dp_mst: Use link caps for MST DSC config selection
53f7a6caa11f drm/i915/dp: Remove min/max link config limits
bafb06627be0 drm/i915/dp_link_training: Reset the max link limits in the fallback code
1df11ee5e22e drm/i915/dp_link_training: Use config iterator for fallback
0bd42c8c22bc drm/i915/dp_link_training: Disable failed config during fallback
0b187a43fe5c drm/i915/kunit: Enable KUnit tests
-:19: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#19: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 27 lines checked
44305777924d drm/i915/kunit: Add DP link test stub
-:30: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#30: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 62 lines checked
00736906a3c1 drm/xe/kunit: Add display test config
-:32: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#32: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 15 lines checked
0f5265ceb81f drm/xe/kunit: Build DP link display tests
-:36: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#36: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 22 lines checked
bf21e3437361 drm/i915/kunit: Setup DP link test context
3ff4508c3582 drm/i915/kunit: Export link training and caps funcs for testing
-:67: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#67: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.h:160:
+#define INTEL_DP_LINK_CAPS_TEST_OPS_MEMBERS(__X) \
+	__X(connector_compute_order,	intel_dp_link_caps_connector_compute_order) \
+	__X(connector_fallback_order,	intel_dp_link_caps_connector_fallback_order) \
+	__X(iter_start,			intel_dp_link_caps_iter_start) \
+	__X(iter_end,			intel_dp_link_caps_iter_end) \
+	__X(set_max_limits,		intel_dp_link_caps_set_max_limits) \
+	__X(get_max_limits,		intel_dp_link_caps_get_max_limits) \
+	__X(get_max_bw_config,		intel_dp_link_caps_get_max_bw_config) \
+	__X(reset_max_limits,		intel_dp_link_caps_reset_max_limits) \
+	__X(disable_config,		intel_dp_link_caps_disable_config) \
+	__X(update,			intel_dp_link_caps_update) \
+	__X(init,			intel_dp_link_caps_init) \
+	__X(cleanup,			intel_dp_link_caps_cleanup)

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

-:67: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__X' - possible side-effects?
#67: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.h:160:
+#define INTEL_DP_LINK_CAPS_TEST_OPS_MEMBERS(__X) \
+	__X(connector_compute_order,	intel_dp_link_caps_connector_compute_order) \
+	__X(connector_fallback_order,	intel_dp_link_caps_connector_fallback_order) \
+	__X(iter_start,			intel_dp_link_caps_iter_start) \
+	__X(iter_end,			intel_dp_link_caps_iter_end) \
+	__X(set_max_limits,		intel_dp_link_caps_set_max_limits) \
+	__X(get_max_limits,		intel_dp_link_caps_get_max_limits) \
+	__X(get_max_bw_config,		intel_dp_link_caps_get_max_bw_config) \
+	__X(reset_max_limits,		intel_dp_link_caps_reset_max_limits) \
+	__X(disable_config,		intel_dp_link_caps_disable_config) \
+	__X(update,			intel_dp_link_caps_update) \
+	__X(init,			intel_dp_link_caps_init) \
+	__X(cleanup,			intel_dp_link_caps_cleanup)

-:81: WARNING:MULTISTATEMENT_MACRO_USE_DO_WHILE: Non-declarative macros with multiple statements should be enclosed in a do - while loop
#81: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.h:174:
+#define __DECLARE_MEMBER(__name, __fn) \
+	typeof(__fn) *__name;

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

-:81: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__name' may be better as '(__name)' to avoid precedence issues
#81: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.h:174:
+#define __DECLARE_MEMBER(__name, __fn) \
+	typeof(__fn) *__name;

-:81: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#81: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.h:174:
+#define __DECLARE_MEMBER(__name, __fn) \
+	typeof(__fn) *__name;

-:186: WARNING:MULTISTATEMENT_MACRO_USE_DO_WHILE: Non-declarative macros with multiple statements should be enclosed in a do - while loop
#186: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.h:84:
+#define __DECLARE_MEMBER(__name, __fn) \
+	typeof(__fn) *__name;

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

-:186: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__name' may be better as '(__name)' to avoid precedence issues
#186: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.h:84:
+#define __DECLARE_MEMBER(__name, __fn) \
+	typeof(__fn) *__name;

-:186: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#186: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.h:84:
+#define __DECLARE_MEMBER(__name, __fn) \
+	typeof(__fn) *__name;

total: 1 errors, 4 warnings, 3 checks, 210 lines checked
3e90bbe7ea21 drm/i915/kunit: DP link: add baseline fixed table reference test
877578a663b4 drm/i915/kunit: DP link: add update config tests
-:238: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#238: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:424:
+		for (lane_count = 1; lane_count <= expected_table->max_lane_count; lane_count <<= 1) {

-:300: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#300: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:486:
+		KUNIT_EXPECT_LE(test, iter_config.lane_count,
+				      expected_table->max_lane_count);

-:337: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#337: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:523:
+		for (lane_count = 1; lane_count <= expected_table->max_lane_count; lane_count <<= 1) {

-:365: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#365: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:551:
+		for (lane_count = 1; lane_count <= expected_table->max_lane_count; lane_count <<= 1) {

-:395: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#395: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:581:
+		verify_link_caps_for_order(expected_table, link_caps, config_orders[i], &max_limits);

-:401: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#401: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:587:
+			for (lane_count = 1; lane_count <= expected_table->max_lane_count; lane_count <<= 1) {

-:409: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#409: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:595:
+					KUNIT_EXPECT_FALSE(test, ops->set_max_limits(link_caps, &config));

-:414: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#414: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:600:
+				verify_link_caps_for_order(expected_table, link_caps, config_orders[i],

-:554: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#554: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:740:
+		INIT_STANDARD_TABLE(test, LINK_TEST_NUM_STANDARD_RATES,
+					  LINK_TEST_MAX_LANE_COUNT);

-:613: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#613: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:799:
+		INIT_STANDARD_TABLE(test, LINK_TEST_NUM_STANDARD_RATES,
+					  LINK_TEST_MAX_LANE_COUNT);

-:762: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#762: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:948:
+		INIT_STANDARD_TABLE(test, LINK_TEST_NUM_STANDARD_RATES,
+						   LINK_TEST_MAX_LANE_COUNT);

total: 0 errors, 7 warnings, 4 checks, 837 lines checked
8b1914d8716f drm/i915/kunit: DP link: add fallback tests
-:50: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#50: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:1050:
+		INIT_STANDARD_TABLE(test, LINK_TEST_NUM_STANDARD_RATES,
+					  LINK_TEST_MAX_LANE_COUNT);

-:184: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#184: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:1184:
+
+	}

-:201: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#201: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:1201:
+
+	}

-:281: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#281: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:1281:
+		INIT_STANDARD_TABLE(test, LINK_TEST_NUM_STANDARD_RATES,
+					  LINK_TEST_MAX_LANE_COUNT);

total: 0 errors, 0 warnings, 4 checks, 330 lines checked


