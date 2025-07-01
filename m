Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601B2C83030
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 03:15:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0355810E4E1;
	Tue,  1 Jul 2025 03:15:04 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B99310E25D;
 Tue,  1 Jul 2025 03:15:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_AuxCCS_handling_and_rende?=
 =?utf-8?q?r_compression_modifiers_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Jul 2025 03:15:02 -0000
Message-ID: <175133970261.122429.1028484266895687272@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250630124711.8209-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250630124711.8209-1-tvrtko.ursulin@igalia.com>
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

Series: AuxCCS handling and render compression modifiers (rev8)
URL   : https://patchwork.freedesktop.org/series/144186/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit bf45724a0dd92a3cdb62584bfa927c6a1b4bf87d
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Mon Jun 30 13:47:10 2025 +0100

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
+ /mt/dim checkpatch 2180444bb7f18fb5bab882ad682a1f2f068e8535 drm-intel
f1f7697d019d drm/xe: Consolidate LRC offset calculations
91a27d644345 drm/xe: Generalize wa bb emission code
22f6d4da1790 drm/xe: Rename utilisation workaround emission function
cd87097bc8fb drm/xe: Return number of written dwords from workaround batch buffer emission
71405c9764f3 drm/xe: Allow specifying number of extra dwords at the end of wa bb emission
b7c6a374b378 drm/xe: Add plumbing for indirect context workarounds
de0341f1707b drm/xe/xelp: Implement Wa_16010904313
2d849d755b16 drm/xe/xelp: Add Wa_18022495364
eb0d5471da2e drm/xe: Use emit_flush_imm_ggtt helper instead of open coding
287bf02bd992 drm/xe/xelpg: Flush CCS when flushing caches
795b1360e872 drm/xe: Flush L3 when flushing render cache
-:19: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#19: FILE: drivers/gpu/drm/xe/instructions/xe_gpu_commands.h:48:
+#define   PIPE_CONTROL_FLUSH_L3                         (1<<30)
                                                           ^

total: 0 errors, 0 warnings, 1 checks, 23 lines checked
68d7614b1dd5 drm/xe/xelp: Quiesce memory traffic before invalidating auxccs
03b169db6175 drm/xe/xelp: Support auxccs invalidation on blitter
2b85f30340a5 drm/xe/xelp: Use MI_FLUSH_DW_CCS on auxccs platforms
45f9892200e4 drm/xe/xelp: Wait for AuxCCS invalidation to complete
e6070aba6912 drm/xe/xelp: Add AuxCCS invalidation to the buffer migration path
4ce320a495c5 drm/xe: Export xe_emit_aux_table_inv
6872bbd62775 drm/xe/xelp: Add AuxCCS invalidation to the indirect context workarounds
c14c1280a23d drm/xe: Use fb cached min alignment
64c5e6965734 drm/xe: Flush GGTT writes after populating DPT
-:72: WARNING:MEMORY_BARRIER: memory barrier without comment
#72: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:114:
+	wmb();

total: 0 errors, 1 warnings, 0 checks, 66 lines checked
1d03158a56a6 drm/xe: Handle DPT in system memory
f6eb0d023e41 drm/xe: Force flush system memory AuxCCS framebuffers before scan out
6f738052998f drm/xe/display: Add support for AuxCCS
bf45724a0dd9 drm/i915/display: Expose AuxCCS frame buffer modifiers for Xe
-:10: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")'
#10: 
done in cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if

-:16: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#16: 
		uapi: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=visible, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)

total: 1 errors, 1 warnings, 0 checks, 12 lines checked


