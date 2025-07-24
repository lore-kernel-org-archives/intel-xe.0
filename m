Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92518C83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 12:12:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 512DE10E93C;
	Thu, 24 Jul 2025 12:12:03 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE2A10E93B;
 Thu, 24 Jul 2025 12:12:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_adl_auxcss_ci_run?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Jul 2025 12:12:02 -0000
Message-ID: <175335912228.186619.13866720763994710616@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250724120405.72946-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250724120405.72946-1-tvrtko.ursulin@igalia.com>
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
URL   : https://patchwork.freedesktop.org/series/152058/
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
commit 319a54d5af86a4246a67222ec973b173b020b470
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Thu Jul 24 13:04:01 2025 +0100

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
+ /mt/dim checkpatch e95f7906632d9bacee7d6f47884f856632393fa0 drm-intel
0dc0098cfff5 drm/xe: Use emit_flush_imm_ggtt helper instead of open coding
3f121a5870ec drm/xe/xelpg: Flush CCS when flushing caches
61c403bf626e drm/xe/xelp: Quiesce memory traffic before invalidating auxccs
af0a0c63c013 drm/xe/xelp: Support auxccs invalidation on blitter
fe5d500539ea drm/xe/xelp: Use MI_FLUSH_DW_CCS on auxccs platforms
b437f3b30f62 drm/xe/xelp: Wait for AuxCCS invalidation to complete
e862085bdb07 drm/xe: Export xe_emit_aux_table_inv
23cee4e0c34b drm/xe/xelp: Add AuxCCS invalidation to the indirect context workarounds
da1b340a634a drm/xe: Flush GGTT writes after populating DPT
-:72: WARNING:MEMORY_BARRIER: memory barrier without comment
#72: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:115:
+	wmb();

total: 0 errors, 1 warnings, 0 checks, 66 lines checked
b493b5554eb2 drm/xe: Handle DPT in system memory
a4f69adf0f6d drm/xe/display: Add support for AuxCCS
fb668422c862 drm/xe: Force flush system memory AuxCCS data before scan out
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
319a54d5af86 drm/i915/display: Expose AuxCCS frame buffer modifiers for Xe
-:10: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")'
#10: 
done in cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if

-:16: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#16: 
		uapi: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=visible, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)

total: 1 errors, 1 warnings, 0 checks, 12 lines checked


