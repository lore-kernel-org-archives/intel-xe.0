Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D22AC83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 13:49:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A7810E14A;
	Thu, 24 Jul 2025 13:49:05 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A3F10E064;
 Thu, 24 Jul 2025 13:49:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_adl_auxcss_ci_run?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Jul 2025 13:49:05 -0000
Message-ID: <175336494502.186650.8637819330742682660@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250724131711.74291-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250724131711.74291-1-tvrtko.ursulin@igalia.com>
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

Series: adl auxcss ci run
URL   : https://patchwork.freedesktop.org/series/152063/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63535c743231a7497a612c53f6edbb8a7d14412d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f44974e88c48a0663da36137a8e4b4555f6fa9cb
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Thu Jul 24 14:17:10 2025 +0100

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
+ /mt/dim checkpatch add9d6a10141822e2c828645804801123e937e86 drm-intel
d5c286d4f7fe drm/xe: Use emit_flush_imm_ggtt helper instead of open coding
de6172817b53 drm/xe/xelpg: Flush CCS when flushing caches
8bd9d9c4b423 drm/xe/xelp: Quiesce memory traffic before invalidating auxccs
4c782f87d7d9 drm/xe/xelp: Support auxccs invalidation on blitter
4d29e9616893 drm/xe/xelp: Use MI_FLUSH_DW_CCS on auxccs platforms
7f472cd28480 drm/xe/xelp: Wait for AuxCCS invalidation to complete
a45fbc3e70ca drm/xe: Export xe_emit_aux_table_inv
89575f90a144 drm/xe/xelp: Add AuxCCS invalidation to the indirect context workarounds
998d088d62d8 drm/xe: Flush GGTT writes after populating DPT
-:72: WARNING:MEMORY_BARRIER: memory barrier without comment
#72: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:115:
+	wmb();

total: 0 errors, 1 warnings, 0 checks, 66 lines checked
54b2f9e60c74 drm/xe: Handle DPT in system memory
2606e9051563 drm/xe/display: Add support for AuxCCS
4ec54e015998 drm/xe: Force flush system memory AuxCCS data before scan out
-:58: WARNING:MEMORY_BARRIER: memory barrier without comment
#58: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:400:
+		mb();

-:61: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#61: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:403:
+			uint8_t *page_virtual;

-:64: WARNING:DEPRECATED_API: Deprecated use of 'kmap_atomic', prefer 'kmap_local_page' instead
#64: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:406:
+			page_virtual = kmap_atomic(page);

-:67: WARNING:DEPRECATED_API: Deprecated use of 'kunmap_atomic', prefer 'kunmap_local' instead
#67: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:409:
+			kunmap_atomic(page_virtual);

-:69: WARNING:MEMORY_BARRIER: memory barrier without comment
#69: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:411:
+		mb();

total: 0 errors, 4 warnings, 1 checks, 103 lines checked
f44974e88c48 drm/i915/display: Expose AuxCCS frame buffer modifiers for Xe
-:10: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")'
#10: 
done in cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if

-:16: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#16: 
		uapi: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=visible, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)

total: 1 errors, 1 warnings, 0 checks, 12 lines checked


