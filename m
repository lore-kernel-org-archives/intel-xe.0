Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB7C1075290
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 10:13:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F7810E967;
	Thu, 19 Mar 2026 10:13:02 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213FD10E962;
 Thu, 19 Mar 2026 10:13:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_AuxCCS_handling_and_rende?=
 =?utf-8?q?r_compression_modifiers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Mar 2026 10:13:01 -0000
Message-ID: <177391518111.375151.13369392800071783209@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260319100707.60157-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20260319100707.60157-1-tvrtko.ursulin@igalia.com>
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

Series: AuxCCS handling and render compression modifiers
URL   : https://patchwork.freedesktop.org/series/163519/
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
commit 6a28ea2599a22ad407de5a19f67f56eaece5a62b
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Thu Mar 19 10:07:07 2026 +0000

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
+ /mt/dim checkpatch 73694175c9632682b410199c5987a3420bd5444c drm-intel
ec33fb28c433 drm/xe: Rename XE_BO_FLAG_SCANOUT to XE_BO_FLAG_FORCE_WC
-:127: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#127: FILE: drivers/gpu/drm/xe/xe_bo.c:517:
+		if ((!bo->cpu_caching && bo->flags & XE_BO_FLAG_FORCE_WC) ||
 		     (!xe->info.has_cached_pt && bo->flags & XE_BO_FLAG_PAGETABLE))

total: 0 errors, 0 warnings, 1 checks, 128 lines checked
8c18d01d50c0 drm/xe: Use write-combine mapping when populating DPT
5f112ac25141 drm/xe/xelpg: Limit AuxCCS ring buffer programming to Alderlake
-:26: WARNING:TYPO_SPELLING: 'explicity' may be misspelled - perhaps 'explicitly'?
#26: FILE: drivers/gpu/drm/xe/xe_ring_ops.c:308:
+	 * AuxCCS, and we explicity do not want to support it on MTL.
 	                  ^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 11 lines checked
3161d5142339 drm/xe/xelp: Quiesce memory traffic before invalidating AuxCCS
2bfe119a54ef drm/xe/xelp: Wait for AuxCCS invalidation to complete
ef4024c3ac55 drm/xe: Move aux table invalidation to ring ops
d2b001c94582 drm/xe/xelp: Add AuxCCS invalidation to the indirect context workarounds
96cc999a3ddb drm/xe/display: Move remapped plane loop out of __xe_pin_fb_vma_dpt
-:51: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#51: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:90:
+		write_dpt_remapped_tiled(bo, map, &dpt_ofs,
+				   remap_info->plane[i].offset,

total: 0 errors, 0 warnings, 1 checks, 52 lines checked
87fc11ef5081 drm/xe/display: Change write_dpt_remapped_tiled function signature
cbdefbaff68a drm/xe/display: Respect remapped plane alignment
557d73f57d89 drm/xe/display: Add support for AuxCCS
6a28ea2599a2 drm/xe/xelp: Expose AuxCCS frame buffer modifiers on Alderlake-P
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe").

-:12: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")'
#12: 
cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe").

total: 1 errors, 1 warnings, 0 checks, 20 lines checked


