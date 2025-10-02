Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D51CCA471
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 14:42:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E0C10E7F4;
	Thu,  2 Oct 2025 14:42:26 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D93310E1BB;
 Thu,  2 Oct 2025 14:42:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_CCS_uncached_mocs_0_test_?=
 =?utf-8?q?run?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 02 Oct 2025 14:42:25 -0000
Message-ID: <175941614563.56.8857984178667204047@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251002142453.25574-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20251002142453.25574-1-tvrtko.ursulin@igalia.com>
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

Series: CCS uncached mocs 0 test run
URL   : https://patchwork.freedesktop.org/series/155337/
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
commit dae492c07f6203a526a5a2d0199440c2f98a0da6
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Thu Oct 2 15:24:51 2025 +0100

    drm/i915/display: Expose AuxCCS frame buffer modifiers for Xe
    
    Now that we have fixed the DPT handling we can undo the nerf which was
    done in cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if
    built for Xe").
    
    Tested with KDE Wayland, on Lenovo Carbon X1 ADL-P:
    
            [PLANE:32:plane 1A]: type=PRI
                    uapi: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=visible, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)
                    hw: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=yes, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)
    
    Display working fine - no artefacts, no DMAR/PIPE faults.
    
    v2:
     * Adjust patch title. (Rodrigo)
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    References: cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")
    Cc: José Roberto de Souza <jose.souza@intel.com>
    Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 84ca7020309a0416ee72fd8e12f40d7654496b2f drm-intel
8bc3166a1c32 drm/xe: Fix ggtt fb alignment
-:13: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#13: 
Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
d8a23b3bdd84 drm/xe/xelpg: Flush CCS when flushing caches
260cdf079005 drm/xe/xelp: Quiesce memory traffic before invalidating AuxCCS
9b98151b5d33 drm/xe/xelp: Support auxccs invalidation on blitter
40e409f3f6ce drm/xe/xelp: Use MI_FLUSH_DW_CCS on auxccs platforms
b2fa7c111a30 drm/xe/xelp: Wait for AuxCCS invalidation to complete
b1cce9f01f0d drm/xe: Export xe_emit_aux_table_inv
8782c7c49cbf drm/xe/xelp: Add AuxCCS invalidation to the indirect context workarounds
a6695a089007 drm/xe: Flush GGTT writes after populating DPT
-:72: WARNING:MEMORY_BARRIER: memory barrier without comment
#72: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:115:
+	wmb();

total: 0 errors, 1 warnings, 0 checks, 66 lines checked
bd36cef7af2f drm/xe: Handle DPT in system memory
735c1b0ad459 drm/xe/display: Add support for AuxCCS
972147bc4112 mocs 0 uncached
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:16: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#16: FILE: drivers/gpu/drm/xe/xe_mocs.c:145:
+#define GEN12_MOCS_ENTRIES \
+	/* Base - L3 + LLC */ \
+	MOCS_ENTRY(2, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3), \
+		   L3_3_WB), \
+	/* Base - Uncached */ \
+	MOCS_ENTRY(3, \
+		   LE_1_UC | LE_TC_1_LLC, \
+		   L3_1_UC), \
+	/* Base - L3 */ \
+	MOCS_ENTRY(4, \
+		   LE_1_UC | LE_TC_1_LLC, \
+		   L3_3_WB), \
+	/* Base - LLC */ \
+	MOCS_ENTRY(5, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3), \
+		   L3_1_UC), \
+	/* Age 0 - LLC */ \
+	MOCS_ENTRY(6, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(1), \
+		   L3_1_UC), \
+	/* Age 0 - L3 + LLC */ \
+	MOCS_ENTRY(7, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(1), \
+		   L3_3_WB), \
+	/* Age: Don't Chg. - LLC */ \
+	MOCS_ENTRY(8, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(2), \
+		   L3_1_UC), \
+	/* Age: Don't Chg. - L3 + LLC */ \
+	MOCS_ENTRY(9, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(2), \
+		   L3_3_WB), \
+	/* No AOM - LLC */ \
+	MOCS_ENTRY(10, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_AOM(1), \
+		   L3_1_UC), \
+	/* No AOM - L3 + LLC */ \
+	MOCS_ENTRY(11, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_AOM(1), \
+		   L3_3_WB), \
+	/* No AOM; Age 0 - LLC */ \
+	MOCS_ENTRY(12, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(1) | LE_AOM(1), \
+		   L3_1_UC), \
+	/* No AOM; Age 0 - L3 + LLC */ \
+	MOCS_ENTRY(13, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(1) | LE_AOM(1), \
+		   L3_3_WB), \
+	/* No AOM; Age:DC - LLC */ \
+	MOCS_ENTRY(14, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(2) | LE_AOM(1), \
+		   L3_1_UC), \
+	/* No AOM; Age:DC - L3 + LLC */ \
+	MOCS_ENTRY(15, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(2) | LE_AOM(1), \
+		   L3_3_WB), \
+	/* Self-Snoop - L3 + LLC */ \
+	MOCS_ENTRY(18, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_SSE(3), \
+		   L3_3_WB), \
+	/* Skip Caching - L3 + LLC(12.5%) */ \
+	MOCS_ENTRY(19, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_SCC(7), \
+		   L3_3_WB), \
+	/* Skip Caching - L3 + LLC(25%) */ \
+	MOCS_ENTRY(20, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_SCC(3), \
+		   L3_3_WB), \
+	/* Skip Caching - L3 + LLC(50%) */ \
+	MOCS_ENTRY(21, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_SCC(1), \
+		   L3_3_WB), \
+	/* Skip Caching - L3 + LLC(75%) */ \
+	MOCS_ENTRY(22, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_RSC(1) | LE_SCC(3), \
+		   L3_3_WB), \
+	/* Skip Caching - L3 + LLC(87.5%) */ \
+	MOCS_ENTRY(23, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3) | LE_RSC(1) | LE_SCC(7), \
+		   L3_3_WB), \
+	/* Implicitly enable L1 - HDC:L1 + L3 + LLC */ \
+	MOCS_ENTRY(48, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3), \
+		   L3_3_WB), \
+	/* Implicitly enable L1 - HDC:L1 + L3 */ \
+	MOCS_ENTRY(49, \
+		   LE_1_UC | LE_TC_1_LLC, \
+		   L3_3_WB), \
+	/* Implicitly enable L1 - HDC:L1 + LLC */ \
+	MOCS_ENTRY(50, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3), \
+		   L3_1_UC), \
+	/* Implicitly enable L1 - HDC:L1 */ \
+	MOCS_ENTRY(51, \
+		   LE_1_UC | LE_TC_1_LLC, \
+		   L3_1_UC), \
+	/* HW Special Case (CCS) */ \
+	MOCS_ENTRY(60, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3), \
+		   L3_1_UC), \
+	/* HW Special Case (Displayable) */ \
+	MOCS_ENTRY(61, \
+		   LE_1_UC | LE_TC_1_LLC, \
+		   L3_3_WB), \
+	/* HW Reserved - SW program but never use */ \
+	MOCS_ENTRY(62, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3), \
+		   L3_1_UC), \
+	/* HW Reserved - SW program but never use */ \
+	MOCS_ENTRY(63, \
+		   LE_3_WB | LE_TC_1_LLC | LE_LRUM(3), \
+		   L3_1_UC)

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

total: 1 errors, 1 warnings, 0 checks, 262 lines checked
dae492c07f62 drm/i915/display: Expose AuxCCS frame buffer modifiers for Xe
-:10: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")'
#10: 
done in cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if

-:16: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#16: 
		uapi: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=visible, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)

total: 1 errors, 1 warnings, 0 checks, 12 lines checked


