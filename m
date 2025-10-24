Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C6CCCD1AB
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 12:31:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9175010EA7F;
	Fri, 24 Oct 2025 12:31:38 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E900D10EA7E;
 Fri, 24 Oct 2025 12:31:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_AuxCCS_handling_and_rende?=
 =?utf-8?q?r_compression_modifiers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Oct 2025 12:31:37 -0000
Message-ID: <176130909794.51928.3270420565697533630@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251024104727.74886-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20251024104727.74886-1-tvrtko.ursulin@igalia.com>
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
URL   : https://patchwork.freedesktop.org/series/156472/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
8677d3b99d5fd579c143b22605d99121e2482e8a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fb8e617e9e71fc0b5d6aa1d68a999e0bc6aa9d39
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Fri Oct 24 11:47:26 2025 +0100

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
+ /mt/dim checkpatch 1e54d2c469a91e00a39ff7f6b98c31d290245ecf drm-intel
ed7aefab22a5 drm/xe: Fix ggtt fb alignment
-:13: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#13: 
Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
62b308b04515 drm/xe/xelpg: Flush CCS when flushing caches
a6f65adbd34f drm/xe/xelp: Quiesce memory traffic before invalidating AuxCCS
0ed24b9fe9e7 drm/xe/xelp: Support auxccs invalidation on blitter
62d9a2753e18 drm/xe/xelp: Use MI_FLUSH_DW_CCS on auxccs platforms
c4f63a7f8e0e drm/xe/xelp: Wait for AuxCCS invalidation to complete
a694e19fe3d6 drm/xe: Export xe_emit_aux_table_inv
54a887e28256 drm/xe/xelp: Add AuxCCS invalidation to the indirect context workarounds
b7e4c2436280 drm/xe: Flush GGTT writes after populating DPT
-:72: WARNING:MEMORY_BARRIER: memory barrier without comment
#72: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:115:
+	wmb();

total: 0 errors, 1 warnings, 0 checks, 66 lines checked
be3c059dfd1a drm/xe: Handle DPT in system memory
04a195065537 drm/xe: Do not use stolen memory for DPT on IGFX and AuxCCS
199a52bc453f drm/xe/display: Add support for AuxCCS
fb8e617e9e71 drm/i915/display: Expose AuxCCS frame buffer modifiers for Xe
-:10: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")'
#10: 
done in cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if

-:16: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#16: 
		uapi: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=visible, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)

total: 1 errors, 1 warnings, 0 checks, 12 lines checked


