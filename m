Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F81FF885A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 15:29:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F3610E344;
	Tue, 28 Apr 2026 15:29:39 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9B910E344;
 Tue, 28 Apr 2026 15:29:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dp=5Flink=3A_Ref?=
 =?utf-8?q?actor_DP_link_capability_logic?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 Apr 2026 15:29:38 -0000
Message-ID: <177739017811.22199.7252419899604549271@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260428125233.1664668-1-imre.deak@intel.com>
In-Reply-To: <20260428125233.1664668-1-imre.deak@intel.com>
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

Series: drm/i915/dp_link: Refactor DP link capability logic
URL   : https://patchwork.freedesktop.org/series/165633/
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
commit b69bb34ce65baf7b3af62e80b936327878720ff4
Author: Imre Deak <imre.deak@intel.com>
Date:   Tue Apr 28 15:52:29 2026 +0300

    drm/i915/kunit: DP link: add fallback tests
    
    Add KUnit tests for DP link fallback selection across eDP, SST, and MST.
    Verify that the fallback logic properly selects the maximum allowed
    configuration, iterates through allowed configurations, and disables
    failed configs as expected.
    
    These tests include UHBR vs. non-UHBR conditions, MST vs. SST mode,
    and validate that subsequent fallback selections respect the updated
    allowed configuration mask.
    
    Signed-off-by: Imre Deak <imre.deak@intel.com>
+ /mt/dim checkpatch e066eb26712bca7174e694a358351c50a38661d6 drm-intel
8884ab20c748 drm/i915/dp: Move clamping max link rate to common rates setup
8a08bfd7a3ca drm/i915/dp: Clamp max lane count to max common lane count
62566e067d62 drm/i915/dp: Bump connector epoch on link capability changes
9dca36ee1595 drm/i915/dp_link_training: Introduce link training state struct
655a88bf82ee drm/i915/dp_link_training: Factor out link training state reset helper
32bafbcf4a9a drm/i915/dp_link_training: Reset link training state on link capability change
ca866ca84836 drm/i915/dp_link_training: Flush commits in debugfs entries
0ef339015d9b drm/i915/dp_link_training: Move link training helpers to link training code
69cb4584567c drm/i915/dp_link_training: Use link_training as base pointer in debugfs
f95d1cc11a24 drm/i915/dp_link_training: Add helpers to access force retrain state
337b75c57391 drm/i915/dp_link_training: Move link recovery/debug state to link_training
e4f141d588f8 drm/i915/dp_link_training: Prevent repeated autoretrain attempts
5b42eb813bee drm/i915/dp_link_training: Clamp sequential link training failure counter
e4b1dee39eff drm/i915/dp_link_training: Check for pending autoretrain explicitly
5f740108a16d drm/i915/dp_link_training: Add helper to query pending autoretrain
e3b42a698819 drm/i915/dp_link_training: Add helper to query allowed autoretrain
3dfc13ed7fe3 drm/i915/dp_link_training: Add helper to mark link training failure
3b6dd93154b9 drm/i915/dp_link_training: Add helper to reset link recovery state
f5488bc73181 drm/i915/dp_link_training: Track link recovery state with an enum
-:108: CHECK:LINE_SPACING: Please don't use multiple blank lines
#108: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.c:1347:
 
+

total: 0 errors, 0 warnings, 1 checks, 94 lines checked
796165bbe7b7 drm/i915/dp_link_training: Add no-fallback link recovery state
b6d674519a27 drm/i915/display: Factor out a helper to modeset a pipe with atomic state
1d3dc047fd3d drm/i915/display: Simplify intel_modeset_commit_pipes_for_atomic_state()
37bd498ba727 drm/i915/dp_link_training: Allocate atomic state for autoretrain modeset
f0f503d4ec6b drm/i915/dp_link_training: Disallow autoretrains after failed modeset
2571a08efd95 drm/i915/dp_link_training: Fix kernel-doc of intel_dp_init_lttpr_and_dprx_caps()
9b022f794353 drm/i915/dp_link_training: Document DP link recovery logic
a920f2570b38 drm/i915/dp: Rename intel_dp_link_config to intel_dp_link_config_entry
88d29d4f9c13 drm/i915/dp: Add struct intel_dp_link_config
ac01079a4285 drm/i915/dp_link_caps: Introduce DP link capability module
-:83: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#83: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 113 lines checked
632966c52bf1 drm/i915/dp_link_caps: Move common rate helpers to link caps
0d9562dce557 drm/i915/dp_link_caps: Move forced link param helpers to link caps
4384cab41a9c drm/i915/dp: Simplify querying of forced link parameters
97ce0497313e drm/i915/dp_link_caps: Move forced and max link debugfs entries to link caps
193bdfe3018f drm/i915/dp_link_training: Use helpers to get forced link params
fb47f3624376 drm/i915/dp_link_caps: Move forced link params to link_caps
c44977a8a38c drm/i915/dp_link_caps: Move link config helpers to link caps
001c4db6f9f8 drm/i915/dp_link_caps: Move link config tracking to link_caps
-:63: CHECK:SPACING: No space is necessary after a cast
#63: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.c:28:
+#define INTEL_DP_LINK_RATE_IDX_BITS		(BITS_PER_TYPE(u8) - INTEL_DP_LANE_COUNT_EXP_BITS)

total: 0 errors, 0 warnings, 1 checks, 113 lines checked
7d13c358de71 drm/i915/dp_link_caps: Rename helper updating the link configurations
d6359427082a drm/i915/dp: Factor out helper to get link rate capabilities
61905567fc96 drm/i915/dp_link_caps: Pass supported link rates to link caps update
bfa8883a0c71 drm/i915/dp_link_caps: Add helper to get all supported link rates
0dda820f2147 drm/i915/dp_link_caps: Add helper to get the number of supported link rates
31521f127501 drm/i915/dp_link_caps: Add helper to get common rate index
-:104: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#104: FILE: drivers/gpu/drm/i915/display/intel_dp_test.c:60:
+								   intel_dp->compliance.test_link_rate);

total: 0 errors, 1 warnings, 0 checks, 74 lines checked
8cccdcdd50e5 drm/i915/dp_link_caps: Move tracking of common rates to link_caps struct
7237903c6e7c drm/i915/dp_link_caps: Track max common lane count in link_caps
fa42f05e6373 drm/i915/dp_link_caps: Move max lane count change detection to link_caps
798f40e90b42 drm/i915/dp_link_caps: Use max common lane count from link_caps
-:31: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#31: FILE: drivers/gpu/drm/i915/display/intel_dp.c:3598:
+	intel_dp->link.max_lane_count = intel_dp_link_caps_max_common_lane_count(intel_dp->link.caps);

total: 0 errors, 1 warnings, 0 checks, 59 lines checked
7905dfd83652 drm/i915/dp_link_caps: Move updating max link limits to link_caps update
7fe3ec43f64d drm/i915/dp_link_caps: Add helpers to get max link limits
da5a2918d230 drm/i915/dp_link_caps: Add helpers to set max link limits
5ccbfda32b1d drm/i915/dp_link_caps: Validate max link limits
809e36c6bef4 drm/i915/dp_link_caps: Add helper to reset max link limits
121cf66cdd65 drm/i915/dp_link_caps: Add helper to reset link_caps state
59ed664983e6 drm/i915/dp_link_caps: Move max link limits to link_caps
4e229d4ca316 drm/i915/dp_link_caps: Pass link_caps to static functions
-:118: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#118: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.c:565:
+static int parse_link_rate(struct intel_dp_link_caps *link_caps, const char __user *ubuf, size_t len)

total: 0 errors, 1 warnings, 0 checks, 110 lines checked
0050f3d332aa drm/i915/dp_link_caps: Pass link_caps to config update/lookup helpers
a1cbab1eef7a drm/i915/dp_link_caps: Pass link_caps to common rate helpers
332f11ccf981 drm/i915/dp_link_caps: Add link_caps prefix to common rate helpers
9878ca17efd0 drm/i915/dp_link_caps: Add missing documentation to exported functions
4dcabe90d7cc drm/i915/dp_link_caps: Set forced link params before resetting link params
0ee6319e6b94 drm/i915/dp_link_caps: Adjust max_limits during link config update
0f733c4c5a48 drm/i915/dp_link_caps: Adjust max_limits when setting or resetting it
b2cfa3146c49 drm/i915/dp: Simplify the modeset max link rate limit computation
ff87c13506c5 drm/i915/dp: Query max limits via link_caps during mode validation
ab6c8665005f drm/i915/dp_tunnel: Query max link limits via link_caps for BW computation
e76a5125c0e6 drm/i915/doc: Document DP link capabilities
de5575b4ea24 drm/i915/dp_link_caps: Move config table members to a substruct
b69bd1eb495e drm/i915/dp_link_caps: Factor out a helper to look up a config table rate
b1f9a73746ed drm/i915/dp_link_caps: Pass config table pointer to rate lookup helper
98a0b72a4e24 drm/i915/dp_link_caps: Factor out helper to get link config from table by index
3282f7922fdc drm/i915/dp_link_caps: Add helper to get config at iterator position
62fe86795b5e drm/i915/dp_link_caps: Add helper to find position of matching config
d04e673b031b drm/i915/dp_link_training: Reset the max link limits in the fallback code
3a6d1dd96c87 drm/i915/dp_link_training: Use config iterator for BW-order fallback
f8d06e760d31 drm/i915/dp_link_training: Look up configurations using fuzzy rate matching
248c524f19e8 drm/i915/dp_link_caps: Pass table pointer to the sort compare function
b78da702cf1d drm/i915/dp_link_caps: Compare config tables instead of link parameters
d3203cd3b485 drm/i915/dp_link_caps: Precompute config table before update
4aa254542bce drm/i915/dp_link_caps: Compare internal config entries during table matching
d4e42d111bc4 drm/i915/dp_link_caps: Use virtual config indexing in config table
171e522d6b8f drm/i915/dp_link_caps: Simplify idx->link rate/lane count lookup
6886eabc70df drm/i915/dp_link_caps: Simplify BW order pos->config index array
bcc37d74ff47 drm/i915/dp_link_caps: Add helper to get iteration order for a connector
e3178a50ae00 drm/i915/dp_link_caps: Add reset and merge update modes
7a463389b7a3 drm/i915/dp_link_caps: Add mask for disabled link configurations
-:84: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#84: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.c:202:
 };
+/* Assert that config masks have enough bits. */

-:85: CHECK:SPACING: No space is necessary after a cast
#85: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.c:203:
+static_assert(BITS_PER_TYPE(u32) >=

total: 0 errors, 0 warnings, 2 checks, 77 lines checked
a9fedf21134b drm/i915/dp_link_caps: Add link configuration iterators
-:139: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 13)
#139: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.h:153:
+	for (int __iter_pos = 0, \
[...]
+	     for_each_if((__config_mask) & BIT(*(__config_idx_p)))

-:141: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#141: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.h:155:
+	     *__config_idx_p = intel_dp_link_caps_first_non_null((__config_idx), &(__iter_config_idx)); \

-:142: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#142: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.h:156:
+	     (__iter_fn)((__link_caps), (__config_order), (__iter_pos), (__config), (__config_idx_p)); \

total: 0 errors, 3 warnings, 0 checks, 127 lines checked
9ffc9e49a8dd drm/i915/dp_link_caps: Preserve disabled config mask during merge update
1685a25144bd drm/i915/dp_link_caps: Account for disabled configs during max link info update
73bd3ff04f41 drm/i915/dp_link_caps: Add debugfs entry showing allowed configurations
1a7d00be63de drm/i915/dp: Add a mask of valid configurations for modeset computation
-:81: WARNING:LONG_LINE: line length of 181 exceeds 100 columns
#81: FILE: drivers/gpu/drm/i915/display/intel_dp.c:2631:
+		    "[ENCODER:%d:%s][CRTC:%d:%s] DP link limits: pixel clock %d kHz DSC %s max link %dx%d max pipe_bpp %d min link_bpp " FXP_Q4_FMT " max link_bpp " FXP_Q4_FMT "\n",

total: 0 errors, 1 warnings, 0 checks, 201 lines checked
e587ec765511 drm/i915/dp: Iterate configurations via link_caps for SST non-DSC
e6573bf2f697 drm/i915/dp: Iterate configurations via link_caps for SST DSC
1c6204725ed3 drm/i915/dp: Use link caps for eDP DSC config selection
417debad60e0 drm/i915/dp_mst: Use link caps for non-DSC config selection
ec4d45dc6dab drm/i915/dp_mst: Use link caps for MST DSC config selection
e6821a909f37 drm/i915/dp_test: Use link caps for compliance link configs
-:145: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#145: FILE: drivers/gpu/drm/i915/display/intel_dp_test.c:78:
+
+}

total: 0 errors, 0 warnings, 1 checks, 183 lines checked
fdb4724610ff drm/i915/dp: Remove min/max link config limits
bdb79a1395da drm/i915/dp_link_training: Account for disabled configs during SST fallback
-:104: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#104: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.c:1927:
+							       INTEL_DP_LINK_CAPS_CONFIG_MATCH_EXACT,

total: 0 errors, 1 warnings, 0 checks, 93 lines checked
c84c43f34a19 drm/i915/dp_link_training: Disable failed config during fallback
-:100: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#100: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.c:1975:
+							   INTEL_DP_LINK_CAPS_CONFIG_MATCH_FUZZY_RATE,

total: 0 errors, 1 warnings, 0 checks, 94 lines checked
181501cb3dd7 drm/i915/kunit: Enable KUnit tests
-:12: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#12: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 30 lines checked
6b0498e1e8aa drm/i915/kunit: Add DP link test stub
-:24: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#24: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 61 lines checked
074648459f66 drm/xe/kunit: Add display test config
-:28: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#28: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 15 lines checked
4c0c0f2dc5e6 drm/xe/kunit: Build DP link display tests
-:29: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#29: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 20 lines checked
32e4bc4dbb71 drm/i915/kunit: setup DP link test context
f368c1e96308 drm/i915/kunit: Export link training and caps funcs for testing
-:63: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#63: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.h:228:
+#define INTEL_DP_LINK_CAPS_TEST_OPS_MEMBERS(__X) \
+	__X(config_order_for_connector,	intel_dp_link_caps_config_order_for_connector) \
+	__X(get_config_by_pos,		intel_dp_link_caps_get_config_by_pos) \
+	__X(get_allowed_config_mask,	intel_dp_link_caps_get_allowed_config_mask) \
+	__X(find_allowed_config_idx,	intel_dp_link_caps_find_allowed_config_idx) \
+	__X(set_max_limits,		intel_dp_link_caps_set_max_limits) \
+	__X(get_max_limits,		intel_dp_link_caps_get_max_limits) \
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
#63: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.h:228:
+#define INTEL_DP_LINK_CAPS_TEST_OPS_MEMBERS(__X) \
+	__X(config_order_for_connector,	intel_dp_link_caps_config_order_for_connector) \
+	__X(get_config_by_pos,		intel_dp_link_caps_get_config_by_pos) \
+	__X(get_allowed_config_mask,	intel_dp_link_caps_get_allowed_config_mask) \
+	__X(find_allowed_config_idx,	intel_dp_link_caps_find_allowed_config_idx) \
+	__X(set_max_limits,		intel_dp_link_caps_set_max_limits) \
+	__X(get_max_limits,		intel_dp_link_caps_get_max_limits) \
+	__X(reset_max_limits,		intel_dp_link_caps_reset_max_limits) \
+	__X(disable_config,		intel_dp_link_caps_disable_config) \
+	__X(update,			intel_dp_link_caps_update) \
+	__X(init,			intel_dp_link_caps_init) \
+	__X(cleanup,			intel_dp_link_caps_cleanup)

-:76: WARNING:MULTISTATEMENT_MACRO_USE_DO_WHILE: Non-declarative macros with multiple statements should be enclosed in a do - while loop
#76: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.h:241:
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

-:76: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__name' may be better as '(__name)' to avoid precedence issues
#76: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.h:241:
+#define __DECLARE_MEMBER(__name, __fn) \
+	typeof(__fn) *__name;

-:76: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#76: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.h:241:
+#define __DECLARE_MEMBER(__name, __fn) \
+	typeof(__fn) *__name;

-:172: WARNING:MULTISTATEMENT_MACRO_USE_DO_WHILE: Non-declarative macros with multiple statements should be enclosed in a do - while loop
#172: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.h:81:
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

-:172: CHECK:MACRO_ARG_PRECEDENCE: Macro argument '__name' may be better as '(__name)' to avoid precedence issues
#172: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.h:81:
+#define __DECLARE_MEMBER(__name, __fn) \
+	typeof(__fn) *__name;

-:172: WARNING:TRAILING_SEMICOLON: macros should not use a trailing semicolon
#172: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.h:81:
+#define __DECLARE_MEMBER(__name, __fn) \
+	typeof(__fn) *__name;

total: 1 errors, 4 warnings, 3 checks, 201 lines checked
3a9e2715b659 drm/i915/kunit: DP link: add baseline fixed table reference test
-:30: CHECK:MACRO_ARG_REUSE: Macro argument reuse '__test_ctx' - possible side-effects?
#30: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:24:
+#define test_for_each_dp_link_config_idx(__test_ctx, __config_order, __config_mask, \
+					 __config, __config_idx) \
+	for_each_dp_link_config_idx_iter((__test_ctx)->dev.dp.link.caps, \
+					 (__test_ctx)->link_caps_ops->get_config_by_pos, \
+					 (__config_order), (__config_mask), (__config), (__config_idx))

-:34: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#34: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:28:
+					 (__config_order), (__config_mask), (__config), (__config_idx))

total: 0 errors, 1 warnings, 1 checks, 257 lines checked
d2854ce482bd drm/i915/kunit: DP link: add update config tests
-:255: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#255: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:482:
+		KUNIT_EXPECT_LE(test, iter_config.lane_count,
+				      expected_table->max_lane_count);

-:262: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#262: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:489:
+		KUNIT_EXPECT_EQ(test, config_disabled,
+				      has_config(&expected_table->disabled_configs,

-:280: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#280: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:507:
+	KUNIT_EXPECT_EQ(test, num_actual_configs,
+			      get_num_configs(expected_table->rates.size,

-:393: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#393: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:620:
+				INIT_STANDARD_TABLE(test, num_rates,
+							     max_lane_count);

-:455: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#455: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:682:
+	disable_configs_and_verify(test, link_caps, expected_table,
+			&config_set);

-:492: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#492: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:719:
+		INIT_STANDARD_TABLE(test, LINK_TEST_NUM_STANDARD_RATES,
+					  LINK_TEST_MAX_LANE_COUNT);

-:555: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#555: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:782:
+		INIT_STANDARD_TABLE(test, LINK_TEST_NUM_STANDARD_RATES,
+					  LINK_TEST_MAX_LANE_COUNT);

-:708: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#708: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:935:
+		INIT_STANDARD_TABLE(test, LINK_TEST_NUM_STANDARD_RATES,
+						   LINK_TEST_MAX_LANE_COUNT);

total: 0 errors, 0 warnings, 8 checks, 796 lines checked
b69bb34ce65b drm/i915/kunit: DP link: add fallback tests
-:41: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#41: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:1041:
+		INIT_STANDARD_TABLE(test, LINK_TEST_NUM_STANDARD_RATES,
+					  LINK_TEST_MAX_LANE_COUNT);

-:173: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#173: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:1173:
+
+	}

-:190: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#190: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:1190:
+
+	}

-:270: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#270: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:1270:
+		INIT_STANDARD_TABLE(test, LINK_TEST_NUM_STANDARD_RATES,
+					  LINK_TEST_MAX_LANE_COUNT);

-:290: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#290: FILE: drivers/gpu/drm/i915/display/tests/intel_dp_link_test.c:1290:
+	target_found = get_target_config(&expected_table, output_type,
+					max_rate, &target_config);

total: 0 errors, 0 warnings, 5 checks, 328 lines checked


