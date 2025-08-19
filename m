Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794F6CA0EEB
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 19:04:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE4310E658;
	Tue, 19 Aug 2025 19:04:18 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502CA10E652;
 Tue, 19 Aug 2025 19:04:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_auxccs_late_flush_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Aug 2025 19:04:17 -0000
Message-ID: <175563025732.249628.1925396117667262323@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250819143821.3158-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250819143821.3158-1-tvrtko.ursulin@igalia.com>
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

Series: auxccs late flush (rev2)
URL   : https://patchwork.freedesktop.org/series/153121/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
553439844b6500767ce8aef522cfe9fbb7ece541
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 96d58052a92b27e347f3186c7008f89459c33dd8
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Tue Aug 19 15:38:20 2025 +0100

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
+ /mt/dim checkpatch 8093b67375779a975c13b9a23c8fcc25cb1e9c83 drm-intel
e16e0a76510d drm/xe/xelpg: Flush CCS when flushing caches
7db986484778 drm/xe/xelp: Quiesce memory traffic before invalidating auxccs
ea7d4979ccc0 drm/xe/xelp: Support auxccs invalidation on blitter
f2466a8a3fcf drm/xe/xelp: Use MI_FLUSH_DW_CCS on auxccs platforms
7f986370dc46 drm/xe/xelp: Wait for AuxCCS invalidation to complete
0dd6c9f7c9aa drm/xe: Export xe_emit_aux_table_inv
951646672253 drm/xe/xelp: Add AuxCCS invalidation to the indirect context workarounds
7a66441c61aa drm/xe: Flush GGTT writes after populating DPT
-:72: WARNING:MEMORY_BARRIER: memory barrier without comment
#72: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:115:
+	wmb();

total: 0 errors, 1 warnings, 0 checks, 66 lines checked
c38ffc59a329 drm/xe: Handle DPT in system memory
6c1b0f80315c drm/xe/display: Add support for AuxCCS
ecb2fcae2a84 drm/xe: Force flush system memory AuxCCS data before scan out
-:58: WARNING:MEMORY_BARRIER: memory barrier without comment
#58: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:399:
+		mb();

-:61: CHECK:PREFER_KERNEL_TYPES: Prefer kernel type 'u8' over 'uint8_t'
#61: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:402:
+			uint8_t *page_virtual;

-:69: WARNING:MEMORY_BARRIER: memory barrier without comment
#69: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:410:
+		mb();

total: 0 errors, 2 warnings, 1 checks, 103 lines checked
ed85c9a0f942 late flush
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:58: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#58: FILE: drivers/gpu/drm/i915/gem/i915_gem_object.h:777:
+{
+

-:59: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#59: FILE: drivers/gpu/drm/i915/gem/i915_gem_object.h:778:
+
+}

total: 0 errors, 1 warnings, 2 checks, 159 lines checked
96d58052a92b drm/i915/display: Expose AuxCCS frame buffer modifiers for Xe
-:10: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")'
#10: 
done in cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if

-:16: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#16: 
		uapi: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=visible, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)

total: 1 errors, 1 warnings, 0 checks, 12 lines checked


