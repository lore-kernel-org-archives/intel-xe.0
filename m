Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FA6CCA470
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 19:10:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 679E710E8CC;
	Wed,  8 Oct 2025 19:10:01 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B9D10E8CC;
 Wed,  8 Oct 2025 19:10:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/prefill=3A_Intro?=
 =?utf-8?q?duce_helpers_for_prefill_latency_calculations?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Oct 2025 19:10:00 -0000
Message-ID: <175995060015.19604.4464797486146477052@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251008182559.20615-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20251008182559.20615-1-ville.syrjala@linux.intel.com>
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

Series: drm/i915/prefill: Introduce helpers for prefill latency calculations
URL   : https://patchwork.freedesktop.org/series/155628/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 268c6e8f691fa9b6caeb90512ed76b517b5afdd9
Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
Date:   Wed Oct 8 21:25:58 2025 +0300

    drm/i915/prefill: Also print out the worst case estimates
    
    We don't use the worst case prefill estimates yet for anything.
    Print them out alongside the actual prefill details to help
    conmfirm they are at leat getting computed somewhat sanely.
    
    Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+ /mt/dim checkpatch f929eafc95342ea5377f79705864d50dd325c79f drm-intel
e355b31685cf drm/i915: Reject modes with linetime > 64 usec
6f010d057ba9 drm/i915/cdclk: Add prefill helpers for CDCLK
e3f870a0ed6a drm/i915/cdclk: Add intel_cdclk_min_cdclk_for_prefill()
0b47c77ca528 drm/i915/dsc: Add prefill helper for DSC
de752dfbe02d drm/i915/scaler: Add scaler prefill helpers
8480fc39140d drm/i195/wm: Add WM0 prefill helpers
59783f76014d drm/i915: Introduce intel_compute_global_watermarks_late()
e6570326d034 drm/i915/prefill: Introduce intel_prefill.c
-:39: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#39: 
new file mode 100644

-:61: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#61: FILE: drivers/gpu/drm/i915/display/intel_prefill.c:18:
+static unsigned int prefill_usecs_to_lines(const struct intel_crtc_state *crtc_state, unsigned int usecs)

total: 0 errors, 2 warnings, 0 checks, 229 lines checked
bda656ad872a drm/i915/wm: Use intel_prefill
afbfc66bdff7 drm/i915/prefill: Print the prefill details
-:22: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#22: FILE: drivers/gpu/drm/i915/display/intel_prefill.c:19:
+#define FP_ARG(val) (val) >> 16, (((val) & 0xffff) * 15625) >> 10

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

-:22: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'val' - possible side-effects?
#22: FILE: drivers/gpu/drm/i915/display/intel_prefill.c:19:
+#define FP_ARG(val) (val) >> 16, (((val) & 0xffff) * 15625) >> 10

-:29: WARNING:LONG_LINE: line length of 106 exceeds 100 columns
#29: FILE: drivers/gpu/drm/i915/display/intel_prefill.c:26:
+	drm_dbg_kms(display->drm, "prefill      prefill.fixed: " FP_FMT "\n", FP_ARG(ctx->prefill.fixed));

-:30: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#30: FILE: drivers/gpu/drm/i915/display/intel_prefill.c:27:
+	drm_dbg_kms(display->drm, "prefill        prefill.wm0: " FP_FMT "\n", FP_ARG(ctx->prefill.wm0));

-:31: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#31: FILE: drivers/gpu/drm/i915/display/intel_prefill.c:28:
+	drm_dbg_kms(display->drm, "prefill prefill.scaler_1st: " FP_FMT "\n", FP_ARG(ctx->prefill.scaler_1st));

-:32: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#32: FILE: drivers/gpu/drm/i915/display/intel_prefill.c:29:
+	drm_dbg_kms(display->drm, "prefill prefill.scaler_2nd: " FP_FMT "\n", FP_ARG(ctx->prefill.scaler_2nd));

-:33: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#33: FILE: drivers/gpu/drm/i915/display/intel_prefill.c:30:
+	drm_dbg_kms(display->drm, "prefill        prefill.dsc: " FP_FMT "\n", FP_ARG(ctx->prefill.dsc));

-:34: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#34: FILE: drivers/gpu/drm/i915/display/intel_prefill.c:31:
+	drm_dbg_kms(display->drm, "prefill       prefill.full: " FP_FMT "\n", FP_ARG(ctx->prefill.full));

-:36: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#36: FILE: drivers/gpu/drm/i915/display/intel_prefill.c:33:
+	drm_dbg_kms(display->drm, "prefill          adj.cdclk: " FP_FMT "\n", FP_ARG(ctx->adj.cdclk));

-:37: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#37: FILE: drivers/gpu/drm/i915/display/intel_prefill.c:34:
+	drm_dbg_kms(display->drm, "prefill     adj.scaler_1st: " FP_FMT "\n", FP_ARG(ctx->adj.scaler_1st));

-:38: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#38: FILE: drivers/gpu/drm/i915/display/intel_prefill.c:35:
+	drm_dbg_kms(display->drm, "prefill     adj.scaler_2nd: " FP_FMT "\n", FP_ARG(ctx->adj.scaler_2nd));

total: 1 errors, 9 warnings, 1 checks, 60 lines checked
268c6e8f691f drm/i915/prefill: Also print out the worst case estimates


