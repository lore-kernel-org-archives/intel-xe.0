Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DADCEFCD9B
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 11:35:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA4B10E4DE;
	Mon,  9 Mar 2026 11:35:51 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA9010E4DD;
 Mon,  9 Mar 2026 11:35:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_AuxCCS_handling_and_rende?=
 =?utf-8?q?r_compression_modifiers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Mar 2026 11:35:50 -0000
Message-ID: <177305615075.333122.13979214844473408925@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260306101014.92774-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20260306101014.92774-1-tvrtko.ursulin@igalia.com>
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

Series: AuxCCS handling and render compression modifiers (rev2)
URL   : https://patchwork.freedesktop.org/series/162746/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3ab54c72be0f129ff1dff1e774cdfd73fb2be359
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Fri Mar 6 10:10:14 2026 +0000

    drm/xe/xelp: Expose AuxCCS frame buffer modifiers on Alderlake-P
    
    Now that we have implemented all the related missing bits we can enable
    the AuxCCS compressed modifiers which were disabled in
    cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe").
    
    Tested with KDE Wayland, on Lenovo Carbon X1 ADL-P:
    
            [PLANE:32:plane 1A]: type=PRI
                    uapi: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=visible, src=28
                    hw: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=yes, src=2880.000
    
    Display is working fine - no artefacts, no DMAR/PIPE faults.
    
    v2:
     * Adjust patch title. (Rodrigo)
    
    v3:
     * Complete rewrite based on the display parent interface.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    References: cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")
    Cc: Jani Nikula <jani.nikula@intel.com>
    Cc: José Roberto de Souza <jose.souza@intel.com>
    Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 5bb4c677496179faf77e5c4f6fa0c2a44c4ee75d drm-intel
8b6bcb118364 drm/xe: Rename XE_BO_FLAG_SCANOUT to XE_BO_FLAG_FORCE_WC
-:127: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#127: FILE: drivers/gpu/drm/xe/xe_bo.c:517:
+		if ((!bo->cpu_caching && bo->flags & XE_BO_FLAG_FORCE_WC) ||
 		     (!xe->info.has_cached_pt && bo->flags & XE_BO_FLAG_PAGETABLE))

total: 0 errors, 0 warnings, 1 checks, 128 lines checked
0f3d2a44cd71 drm/xe: Use write-combine mapping when populating DPT
a6ac8b82f3e5 drm/xe/xelpg: Limit AuxCCS ring buffer programming to Alderlake
-:26: WARNING:TYPO_SPELLING: 'explicity' may be misspelled - perhaps 'explicitly'?
#26: FILE: drivers/gpu/drm/xe/xe_ring_ops.c:308:
+	 * AuxCCS, and we explicity do not want to support it on MTL.
 	                  ^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 11 lines checked
2386c949b266 drm/xe/xelp: Quiesce memory traffic before invalidating AuxCCS
96dda33ccc90 drm/xe/xelp: Wait for AuxCCS invalidation to complete
49c1bad5d67e drm/xe: Move aux table invalidation to ring ops
90a0519731a4 drm/xe/xelp: Add AuxCCS invalidation to the indirect context workarounds
74b970205c0c drm/xe/display: Add support for AuxCCS
3ab54c72be0f drm/xe/xelp: Expose AuxCCS frame buffer modifiers on Alderlake-P
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe").

-:12: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")'
#12: 
cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe").

total: 1 errors, 1 warnings, 0 checks, 20 lines checked


