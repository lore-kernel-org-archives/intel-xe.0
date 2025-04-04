Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E782DC3601E
	for <intel-xe@archiver.kernel.org>; Fri,  4 Apr 2025 02:19:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93BC810E1D3;
	Fri,  4 Apr 2025 02:19:59 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49E110E090;
 Fri,  4 Apr 2025 02:19:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_AuxCCS_handling_and_rende?=
 =?utf-8?q?r_compression_modifiers_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 04 Apr 2025 02:19:58 -0000
Message-ID: <174373319866.37103.11106020712087283048@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250403190317.6064-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250403190317.6064-1-tvrtko.ursulin@igalia.com>
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

Series: AuxCCS handling and render compression modifiers (rev5)
URL   : https://patchwork.freedesktop.org/series/144186/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6b214cad24aea5ee558238442c6e386848a1d06c
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Thu Apr 3 20:03:16 2025 +0100

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
+ /mt/dim checkpatch bc18da45d48d337b92a7ff9546ba61da32b3b586 drm-intel
034386ad672e drm/xe: Adjust ringbuf emission for maximum possible size
7acd16502746 drm/xe: Use emit_flush_imm_ggtt helper instead of open coding
3408ee1a2829 drm/xe/xelpg: Flush CCS when flushing caches
9104ec9115bf drm/xe: Flush L3 when flushing render cache
-:19: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#19: FILE: drivers/gpu/drm/xe/instructions/xe_gpu_commands.h:50:
+#define   PIPE_CONTROL_FLUSH_L3                         (1<<27)
                                                           ^

total: 0 errors, 0 warnings, 1 checks, 23 lines checked
23c1ada4d1b2 drm/xe/xelp: Quiesce memory traffic before invalidating auxccs
55ac85859eaf drm/xe/xelp: Support auxccs invalidation on blitter
e2179001dd19 drm/xe/xelp: Use MI_FLUSH_DW_CCS on auxccs platforms
1d42c4768e86 drm/xe/xelp: Wait for AuxCCS invalidation to complete
63b0b5060a76 drm/xe/xelp: Add AuxCCS invalidation to the buffer migration path
019c6a3ae5ad drm/xe: Use fb cached min alignment
c54880508475 drm/xe: Reduce DPT table alignment as in i915
4fd2e151de6a drm/xe: Flush GGTT writes after populating DPT
-:72: WARNING:MEMORY_BARRIER: memory barrier without comment
#72: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:115:
+	wmb();

total: 0 errors, 1 warnings, 0 checks, 66 lines checked
c37276c9b21a drm/xe: Handle DPT in system memory
ff26db9ab067 drm/xe: Force flush system memory AuxCCS framebuffers before scan out
e2a7535dffdf drm/xe/display: Add support for AuxCCS
-:83: CHECK:ASSIGNMENT_CONTINUATIONS: Assignment operator '=' should be on the previous line
#83: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:95:
+	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index)
+		= ggtt->pt_ops->pte_encode_bo;

total: 0 errors, 0 warnings, 1 checks, 133 lines checked
6b214cad24ae drm/i915/display: Expose AuxCCS frame buffer modifiers for Xe
-:10: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")'
#10: 
done in cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if

-:16: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#16: 
		uapi: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=visible, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)

total: 1 errors, 1 warnings, 0 checks, 12 lines checked


