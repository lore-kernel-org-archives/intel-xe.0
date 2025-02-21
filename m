Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD33DC021AA
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 10:25:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A247A10E257;
	Fri, 21 Feb 2025 10:25:44 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE95A10E24A;
 Fri, 21 Feb 2025 10:25:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_AuxCCS_handling_and_rende?=
 =?utf-8?q?r_compression_modifiers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Feb 2025 10:25:43 -0000
Message-ID: <174013354371.440796.16162101256318275478@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250221101736.78986-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250221101736.78986-1-tvrtko.ursulin@igalia.com>
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
URL   : https://patchwork.freedesktop.org/series/144186/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ae1a2f22d2d8a15e3edb2067a323a4dd2a0e2645
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Fri Feb 21 10:17:31 2025 +0000

    drm/xe/display: Expose AuxCCS frame buffer modifiers
    
    Now that we have fixed the DPT handling we can undo the nerf which was
    done in cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if
    built for Xe").
    
    Tested with KDE Wayland, on Lenovo Carbon X1 ADL-P:
    
            [PLANE:32:plane 1A]: type=PRI
                    uapi: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=visible, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)
                    hw: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=yes, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)
    
    Display working fine - no artefacts, no DMAR/PIPE faults.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    References: cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")
    Cc: José Roberto de Souza <jose.souza@intel.com>
    Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
+ /mt/dim checkpatch a22ac320a08377d760e73fa530c27782f0b68b6d drm-intel
b4eb1532423b drm/xe: Fix MOCS debugfs LNCF readout
0bb58538587b drm/xe: Fix ring flush invalidation
358b061a813f drm/xe: Pass flags directly to emit_flush_imm_ggtt
6b84acb6e3ff drm/xe: Add ring buffer handling for AuxCCS
-:19: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#19: FILE: drivers/gpu/drm/xe/instructions/xe_gpu_commands.h:48:
+#define   PIPE_CONTROL_FLUSH_L3                         (1<<27)
                                                           ^

total: 0 errors, 0 warnings, 1 checks, 315 lines checked
ebb2e61a63fa drm/xe: Use correct type width for alignment in fb pinning code
71e11a4d31b2 drm/xe: Use fb cached min alignment
d4ea0ba7413b drm/xe: Reduce DPT table alignment as in i915
386bbc72559b drm/xe: Flush GGTT writes after populating DPT
-:65: WARNING:MEMORY_BARRIER: memory barrier without comment
#65: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:114:
+	wmb();

total: 0 errors, 1 warnings, 0 checks, 66 lines checked
b50f8f412262 drm/xe: Handle DPT in system memory
d8a5b7c47aa2 drm/xe: Force flush system memory AuxCCS framebuffers before scan out
8e93267029f2 drm/xe/display: Add support for AuxCCS
-:83: CHECK:ASSIGNMENT_CONTINUATIONS: Assignment operator '=' should be on the previous line
#83: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:94:
+	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index)
+		= ggtt->pt_ops->pte_encode_bo;

total: 0 errors, 0 warnings, 1 checks, 133 lines checked
ae1a2f22d2d8 drm/xe/display: Expose AuxCCS frame buffer modifiers
-:10: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")'
#10: 
done in cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if

-:16: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#16: 
		uapi: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=visible, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)

total: 1 errors, 1 warnings, 0 checks, 12 lines checked


