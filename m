Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02307C43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 16:39:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B748710F06B;
	Wed,  1 Jul 2026 16:39:03 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892C710EFAA;
 Wed,  1 Jul 2026 16:39:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dp=5Flink=3A_Uni?=
 =?utf-8?q?fy_modeset/fallback_config_selection?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 01 Jul 2026 16:39:02 -0000
Message-ID: <178292394255.139769.6286273222839418221@6beec6c84f66>
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

Series: drm/i915/dp_link: Unify modeset/fallback config selection
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
commit 44e2734cd99d935b9c03fc727915b949b804b2b9
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
+ /mt/dim checkpatch f6157a5d128c8b41e39133ce58d1daf430d42bd5 drm-intel
3b29656d39be drm/i915/doc: Document DP link capabilities
-:11: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#11: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 105 lines checked
8546a53e3392 drm/i915/dp_link_caps: Factor out helper to get link config by index
461e4c3ccd54 drm/i915/dp_link_caps: Add support for link rate, lane count iteration orders
79277ca6491e drm/i915/dp_link_caps: Add link configuration iterator
-:38: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#38: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.c:150:
 };
+static_assert(BITS_PER_TYPE(((struct intel_dp_link_caps_filter *)NULL)->config_mask) >=

-:367: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#367: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.h:106:
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

-:367: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__iter' - possible side-effects?
#367: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.h:106:
+#define for_each_dp_link_config(__iter, __config) \
+	while ((__iter)->get_next_config((__iter), (__config)))

total: 1 errors, 0 warnings, 2 checks, 355 lines checked
415db32698a3 drm/i915/dp_link_caps: Add helper to get iteration order for a connector
e8981adea808 drm/i915/dp_link_caps: Validate max link limits
1bc5984838d0 drm/i915/dp_link_caps: Add filter for enabled link configurations
29af679416f2 drm/i915/dp_link_caps: Re-enable link configurations after a link reset
5cb03e07c673 drm/i915/dp_link_caps: Re-enable link configurations after sink caps change
648dbe2bf0be drm/i915/dp_link_caps: Drop noupdate postfix from max link limit set helpers
2b37eda90efc drm/i915/dp_link_caps: Add debugfs entry showing allowed configurations
cc70387f1aed drm/i915/dp: Add link configuration filter for modeset computation
-:66: WARNING:LONG_LINE: line length of 181 exceeds 100 columns
#66: FILE: drivers/gpu/drm/i915/display/intel_dp.c:2644:
+		    "[ENCODER:%d:%s][CRTC:%d:%s] DP link limits: pixel clock %d kHz DSC %s max link %dx%d max pipe_bpp %d min link_bpp " FXP_Q4_FMT " max link_bpp " FXP_Q4_FMT "\n",

total: 0 errors, 1 warnings, 0 checks, 197 lines checked
810bfb35f4df drm/i915/dp_link_caps: Add helper to query max BW link configuration
-:35: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#35: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.c:565:
+					       bw_desc_config_order().key, INTEL_DP_LINK_CAPS_FILTER_ALL,

total: 0 errors, 1 warnings, 0 checks, 32 lines checked
1b0c24af969f drm/i915/dp: Query max BW config via link_caps during mode validation
7762dc90e7dd drm/i915/dp_tunnel: Query max BW config via link_caps for BW computation
41bcc2a368d8 drm/i915/dp_test: Use link caps for compliance link configs
6ebde4237edb drm/i915/dp: Iterate configurations via link_caps for SST non-DSC
a602cd374ad8 drm/i915/dp: Iterate configurations via link_caps for SST DSC
1470e4998189 drm/i915/dp: Use link caps for eDP DSC config selection
ab613ab44f27 drm/i915/dp_mst: Use link caps for non-DSC config selection
8cd82db18cae drm/i915/dp_mst: Use link caps for MST DSC config selection
9ed53b82f904 drm/i915/dp: Remove min/max link config limits
f82cc26fc36d drm/i915/dp_link_training: Reset the max link limits in the fallback code
893b64e131b1 drm/i915/dp_link_training: Use config iterator for fallback
c2101ba51161 drm/i915/dp_link_training: Disable failed config during fallback
c8ac505c020a drm/i915/kunit: Enable KUnit tests
-:12: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#12: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 30 lines checked
0d940e721ea6 drm/i915/kunit: Add DP link test stub
-:26: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#26: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 62 lines checked
0e48fa5a6053 drm/xe/kunit: Add display test config
-:28: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#28: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 15 lines checked
edaf6a993148 drm/xe/kunit: Build DP link display tests
-:29: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#29: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 20 lines checked
3f41c914da1f drm/i915/kunit: Setup DP link test context
b6ce9ae083e2 drm/i915/kunit: Export link training and caps funcs for testing
-:63: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#63: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.h:160:
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

-:63: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__X' - possible side-effects?
#63: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.h:160:
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

-:77: WARNING:MULTISTATEMENT_MACRO_USE_DO_WHILE: Non-declarative macros with multiple statements should be enclosed in a do - while loop
#77: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.h:174:
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

-:77: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__name' may be better as '(__name)' to avoid precedence issues
#77: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.h:174:
+#define __DECLARE_MEMBER(__name, __fn) \
+	typeof(__fn) *__name;

-:77: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#77: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.h:174:
+#define __DECLARE_MEMBER(__name, __fn) \
+	typeof(__fn) *__name;

-:182: WARNING:MULTISTATEMENT_MACRO_USE_DO_WHILE: Non-declarative macros with multiple statements should be enclosed in a do - while loop
#182: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.h:84:
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

-:182: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__name' may be better as '(__name)' to avoid precedence issues
#182: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.h:84:
+#define __DECLARE_MEMBER(__name, __fn) \
+	typeof(__fn) *__name;

-:182: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#182: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.h:84:
+#define __DECLARE_MEMBER(__name, __fn) \
+	typeof(__fn) *__name;

total: 1 errors, 4 warnings, 3 checks, 210 lines checked
e5a2b93c0378 drm/i915/kunit: DP link: add baseline fixed table reference test
b18b6b35706d drm/i915/kunit: DP link: add update config tests
-:207: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#207: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:394:
+		for (lane_count = 1; lane_count <= expected_table->max_lane_count; lane_count <<= 1) {

-:269: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#269: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:456:
+		KUNIT_EXPECT_LE(test, iter_config.lane_count,
+				      expected_table->max_lane_count);

-:306: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#306: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:493:
+		for (lane_count = 1; lane_count <= expected_table->max_lane_count; lane_count <<= 1) {

-:334: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#334: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:521:
+		for (lane_count = 1; lane_count <= expected_table->max_lane_count; lane_count <<= 1) {

-:364: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#364: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:551:
+		verify_link_caps_for_order(expected_table, link_caps, config_orders[i], &max_limits);

-:370: WARNING:LONG_LINE: line length of 110 exceeds 100 columns
#370: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:557:
+			for (lane_count = 1; lane_count <= expected_table->max_lane_count; lane_count <<= 1) {

-:378: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#378: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:565:
+					KUNIT_EXPECT_FALSE(test, ops->set_max_limits(link_caps, &config));

-:383: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#383: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:570:
+				verify_link_caps_for_order(expected_table, link_caps, config_orders[i],

-:432: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#432: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:619:
+				INIT_STANDARD_TABLE(test, num_rates,
+							     max_lane_count);

-:486: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#486: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:673:
+	disable_configs_and_verify(test, link_caps, expected_table,
+			&config_set);

-:523: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#523: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:710:
+		INIT_STANDARD_TABLE(test, LINK_TEST_NUM_STANDARD_RATES,
+					  LINK_TEST_MAX_LANE_COUNT);

-:582: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#582: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:769:
+		INIT_STANDARD_TABLE(test, LINK_TEST_NUM_STANDARD_RATES,
+					  LINK_TEST_MAX_LANE_COUNT);

-:731: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#731: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:918:
+		INIT_STANDARD_TABLE(test, LINK_TEST_NUM_STANDARD_RATES,
+						   LINK_TEST_MAX_LANE_COUNT);

total: 0 errors, 7 warnings, 6 checks, 813 lines checked
44e2734cd99d drm/i915/kunit: DP link: add fallback tests
-:46: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#46: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:1020:
+		INIT_STANDARD_TABLE(test, LINK_TEST_NUM_STANDARD_RATES,
+					  LINK_TEST_MAX_LANE_COUNT);

-:180: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#180: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:1154:
+
+	}

-:197: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#197: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:1171:
+
+	}

-:277: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#277: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:1251:
+		INIT_STANDARD_TABLE(test, LINK_TEST_NUM_STANDARD_RATES,
+					  LINK_TEST_MAX_LANE_COUNT);

total: 0 errors, 0 warnings, 4 checks, 330 lines checked


