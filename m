Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA97CFF8867
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 07:44:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D58A10EE9E;
	Wed, 29 Apr 2026 07:44:00 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9DB10EE9E;
 Wed, 29 Apr 2026 07:43:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/dp=5Flink=3A_Ref?=
 =?utf-8?q?actor_DP_link_capability_logic_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 Apr 2026 07:43:58 -0000
Message-ID: <177744863896.24056.14337261643489577272@5ab824fced77>
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

Series: drm/i915/dp_link: Refactor DP link capability logic (rev2)
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
commit 0efd76609cc7bc4da43e4ee6c4765a59bea3d3dc
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
+ /mt/dim checkpatch a53aafc879e9c52b2776089762591d2766a27f0a drm-intel
6e6a453e0523 drm/i915/dp: Move clamping max link rate to common rates setup
3be61b0e0478 drm/i915/dp: Clamp max lane count to max common lane count
cb3fef1ab725 drm/i915/dp: Bump connector epoch on link capability changes
be416851f235 drm/i915/dp_link_training: Introduce link training state struct
93b81838584f drm/i915/dp_link_training: Factor out link training state reset helper
62e7c43e7bef drm/i915/dp_link_training: Reset link training state on link capability change
eee35db8518b drm/i915/dp_link_training: Flush commits in debugfs entries
88b645c297a4 drm/i915/dp_link_training: Move link training helpers to link training code
aecb710a6c76 drm/i915/dp_link_training: Use link_training as base pointer in debugfs
c03a107ae8a9 drm/i915/dp_link_training: Add helpers to access force retrain state
5513521313db drm/i915/dp_link_training: Move link recovery/debug state to link_training
8f6a6f582ad4 drm/i915/dp_link_training: Prevent repeated autoretrain attempts
2614b4b0e107 drm/i915/dp_link_training: Clamp sequential link training failure counter
1b60894b9076 drm/i915/dp_link_training: Check for pending autoretrain explicitly
0e3506a02d16 drm/i915/dp_link_training: Add helper to query pending autoretrain
4bb1fa615319 drm/i915/dp_link_training: Add helper to query allowed autoretrain
36f416d94214 drm/i915/dp_link_training: Add helper to mark link training failure
d8168dca3ca2 drm/i915/dp_link_training: Add helper to reset link recovery state
9a2f8c38d291 drm/i915/dp_link_training: Track link recovery state with an enum
-:108: CHECK:LINE_SPACING: Please don't use multiple blank lines
#108: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.c:1347:
 
+

total: 0 errors, 0 warnings, 1 checks, 94 lines checked
956abe1c6925 drm/i915/dp_link_training: Add no-fallback link recovery state
ec6ce4085a27 drm/i915/display: Factor out a helper to modeset a pipe with atomic state
2a60321efd1e drm/i915/display: Simplify intel_modeset_commit_pipes_for_atomic_state()
845a230f3ae2 drm/i915/dp_link_training: Allocate atomic state for autoretrain modeset
3d09ef605183 drm/i915/dp_link_training: Disallow autoretrains after failed modeset
4f60d7a5dea0 drm/i915/dp_link_training: Fix kernel-doc of intel_dp_init_lttpr_and_dprx_caps()
c15715ca012c drm/i915/dp_link_training: Document DP link recovery logic
01af8fe0f76b drm/i915/dp: Rename intel_dp_link_config to intel_dp_link_config_entry
8c7eac4c5aff drm/i915/dp: Add struct intel_dp_link_config
52e561e52684 drm/i915/dp_link_caps: Introduce DP link capability module
-:83: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#83: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 113 lines checked
7b17082cf71e drm/i915/dp_link_caps: Move common rate helpers to link caps
8ab1d83aeea4 drm/i915/dp_link_caps: Move forced link param helpers to link caps
c2a0806466cc drm/i915/dp: Simplify querying of forced link parameters
e67a23382e9c drm/i915/dp_link_caps: Move forced and max link debugfs entries to link caps
f07fe025e951 drm/i915/dp_link_training: Use helpers to get forced link params
6ee0dde91010 drm/i915/dp_link_caps: Move forced link params to link_caps
4fb070c7d093 drm/i915/dp_link_caps: Move link config helpers to link caps
7df35130b1c0 drm/i915/dp_link_caps: Move link config tracking to link_caps
-:63: CHECK:SPACING: No space is necessary after a cast
#63: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.c:28:
+#define INTEL_DP_LINK_RATE_IDX_BITS		(BITS_PER_TYPE(u8) - INTEL_DP_LANE_COUNT_EXP_BITS)

total: 0 errors, 0 warnings, 1 checks, 113 lines checked
78094ec90754 drm/i915/dp_link_caps: Rename helper updating the link configurations
383c139ebf4c drm/i915/dp: Factor out helper to get link rate capabilities
82ecd4c861fa drm/i915/dp_link_caps: Pass supported link rates to link caps update
ba653d99791f drm/i915/dp_link_caps: Add helper to get all supported link rates
e577926aa5fb drm/i915/dp_link_caps: Add helper to get the number of supported link rates
851e767d0d68 drm/i915/dp_link_caps: Add helper to get common rate index
-:104: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#104: FILE: drivers/gpu/drm/i915/display/intel_dp_test.c:60:
+								   intel_dp->compliance.test_link_rate);

total: 0 errors, 1 warnings, 0 checks, 74 lines checked
091d7ba459f3 drm/i915/dp_link_caps: Move tracking of common rates to link_caps struct
65781779bd3a drm/i915/dp_link_caps: Track max common lane count in link_caps
67ad896e02f7 drm/i915/dp_link_caps: Move max lane count change detection to link_caps
676436b37f84 drm/i915/dp_link_caps: Use max common lane count from link_caps
-:31: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#31: FILE: drivers/gpu/drm/i915/display/intel_dp.c:3598:
+	intel_dp->link.max_lane_count = intel_dp_link_caps_max_common_lane_count(intel_dp->link.caps);

total: 0 errors, 1 warnings, 0 checks, 59 lines checked
7c18f14e1ad6 drm/i915/dp_link_caps: Move updating max link limits to link_caps update
07481382b2f7 drm/i915/dp_link_caps: Add helpers to get max link limits
df8d52186f77 drm/i915/dp_link_caps: Add helpers to set max link limits
f90c8187d15f drm/i915/dp_link_caps: Validate max link limits
b42ba5bb9348 drm/i915/dp_link_caps: Add helper to reset max link limits
09ecba8fb855 drm/i915/dp_link_caps: Add helper to reset link_caps state
b0c5c78e2ead drm/i915/dp_link_caps: Move max link limits to link_caps
124d28fdcba9 drm/i915/dp_link_caps: Pass link_caps to static functions
-:118: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#118: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.c:565:
+static int parse_link_rate(struct intel_dp_link_caps *link_caps, const char __user *ubuf, size_t len)

total: 0 errors, 1 warnings, 0 checks, 110 lines checked
46cb48c4859f drm/i915/dp_link_caps: Pass link_caps to config update/lookup helpers
c832237829ed drm/i915/dp_link_caps: Pass link_caps to common rate helpers
a70663ec8bd3 drm/i915/dp_link_caps: Add link_caps prefix to common rate helpers
06acbb4062e7 drm/i915/dp_link_caps: Add missing documentation to exported functions
000900b6b27f drm/i915/dp_link_caps: Set forced link params before resetting link params
1c9998d6b5c5 drm/i915/dp_link_caps: Adjust max_limits during link config update
5a61b7cb3c37 drm/i915/dp_link_caps: Adjust max_limits when setting or resetting it
7d67b99314ac drm/i915/dp: Simplify the modeset max link rate limit computation
55dba5d39bf7 drm/i915/dp: Query max limits via link_caps during mode validation
0d7a249a5e21 drm/i915/dp_tunnel: Query max link limits via link_caps for BW computation
0c9ec42af75b drm/i915/doc: Document DP link capabilities
d33b1e2206f4 drm/i915/dp_link_caps: Move config table members to a substruct
80c7c9423079 drm/i915/dp_link_caps: Factor out a helper to look up a config table rate
5335307949b4 drm/i915/dp_link_caps: Pass config table pointer to rate lookup helper
fec972d8a8ca drm/i915/dp_link_caps: Factor out helper to get link config from table by index
0723b5c6b72c drm/i915/dp_link_caps: Add helper to get config at iterator position
7552bb2ab6a0 drm/i915/dp_link_caps: Add helper to find position of matching config
05287d76c089 drm/i915/dp_link_training: Reset the max link limits in the fallback code
a71417de7cce drm/i915/dp_link_training: Use config iterator for BW-order fallback
161f43416f81 drm/i915/dp_link_training: Look up configurations using fuzzy rate matching
52dd07943001 drm/i915/dp_link_caps: Pass table pointer to the sort compare function
5de5abb7a751 drm/i915/dp_link_caps: Compare config tables instead of link parameters
da98cedf16c9 drm/i915/dp_link_caps: Precompute config table before update
df0563280c57 drm/i915/dp_link_caps: Compare internal config entries during table matching
d0fb8b0a93a1 drm/i915/dp_link_caps: Use virtual config indexing in config table
13ad426fd272 drm/i915/dp_link_caps: Simplify idx->link rate/lane count lookup
a1a8c7e7b039 drm/i915/dp_link_caps: Simplify BW order pos->config index array
e78ac70d2ebe drm/i915/dp_link_caps: Add helper to get iteration order for a connector
f602eb75b8ba drm/i915/dp_link_caps: Add reset and merge update modes
39c713b1a14a drm/i915/dp_link_caps: Add mask for disabled link configurations
-:84: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#84: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.c:202:
 };
+/* Assert that config masks have enough bits. */

-:85: CHECK:SPACING: No space is necessary after a cast
#85: FILE: drivers/gpu/drm/i915/display/intel_dp_link_caps.c:203:
+static_assert(BITS_PER_TYPE(u32) >=

total: 0 errors, 0 warnings, 2 checks, 77 lines checked
4cd21f60bb44 drm/i915/dp_link_caps: Add link configuration iterators
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
b6c802c57e6d drm/i915/dp_link_caps: Preserve disabled config mask during merge update
9fd43175c91e drm/i915/dp_link_caps: Account for disabled configs during max link info update
e91a9d90cff2 drm/i915/dp_link_caps: Add debugfs entry showing allowed configurations
ef4854d14165 drm/i915/dp: Add a mask of valid configurations for modeset computation
-:81: WARNING:LONG_LINE: line length of 181 exceeds 100 columns
#81: FILE: drivers/gpu/drm/i915/display/intel_dp.c:2631:
+		    "[ENCODER:%d:%s][CRTC:%d:%s] DP link limits: pixel clock %d kHz DSC %s max link %dx%d max pipe_bpp %d min link_bpp " FXP_Q4_FMT " max link_bpp " FXP_Q4_FMT "\n",

total: 0 errors, 1 warnings, 0 checks, 201 lines checked
7462c53a9715 drm/i915/dp: Iterate configurations via link_caps for SST non-DSC
0cb6203be1eb drm/i915/dp: Iterate configurations via link_caps for SST DSC
34a1b1888734 drm/i915/dp: Use link caps for eDP DSC config selection
72837ac86633 drm/i915/dp_mst: Use link caps for non-DSC config selection
2ae32187fd36 drm/i915/dp_mst: Use link caps for MST DSC config selection
0949a977dbc0 drm/i915/dp_test: Use link caps for compliance link configs
-:145: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#145: FILE: drivers/gpu/drm/i915/display/intel_dp_test.c:78:
+
+}

total: 0 errors, 0 warnings, 1 checks, 183 lines checked
4a1a9ca186a5 drm/i915/dp: Remove min/max link config limits
1ebe465e7b5c drm/i915/dp_link_training: Account for disabled configs during SST fallback
-:104: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#104: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.c:1927:
+							       INTEL_DP_LINK_CAPS_CONFIG_MATCH_EXACT,

total: 0 errors, 1 warnings, 0 checks, 93 lines checked
1dff5ca051ae drm/i915/dp_link_training: Disable failed config during fallback
-:100: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#100: FILE: drivers/gpu/drm/i915/display/intel_dp_link_training.c:1975:
+							   INTEL_DP_LINK_CAPS_CONFIG_MATCH_FUZZY_RATE,

total: 0 errors, 1 warnings, 0 checks, 94 lines checked
d0f99edfc4e5 drm/i915/kunit: Enable KUnit tests
-:12: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#12: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 30 lines checked
d8eb0a562af6 drm/i915/kunit: Add DP link test stub
-:26: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#26: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 62 lines checked
7205b6164142 drm/xe/kunit: Add display test config
-:28: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#28: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 15 lines checked
cd04a0d003f9 drm/xe/kunit: Build DP link display tests
-:29: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#29: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 20 lines checked
028a071246fd drm/i915/kunit: setup DP link test context
aebadc7621bd drm/i915/kunit: Export link training and caps funcs for testing
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
e58522ad0cff drm/i915/kunit: DP link: add baseline fixed table reference test
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
1cb643594faa drm/i915/kunit: DP link: add update config tests
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
0efd76609cc7 drm/i915/kunit: DP link: add fallback tests
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


