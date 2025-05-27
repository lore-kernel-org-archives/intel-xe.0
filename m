Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7500C5AE59
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 00:59:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A1E10E417;
	Tue, 27 May 2025 00:59:29 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B0F10E031;
 Tue, 27 May 2025 00:59:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_AuxCCS_handling_and_rende?=
 =?utf-8?q?r_compression_modifiers_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 May 2025 00:59:27 -0000
Message-ID: <174830756786.22163.989989158199483065@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250514133904.12131-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250514133904.12131-1-tvrtko.ursulin@igalia.com>
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

Series: AuxCCS handling and render compression modifiers (rev6)
URL   : https://patchwork.freedesktop.org/series/144186/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f4377ea16963ecb51170ea34d7ccc3722299fd53
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Wed May 14 14:39:01 2025 +0100

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
+ /mt/dim checkpatch 3e019cc3eaffcb7022b9de66871eabdefd6e06ff drm-intel
51328e838c44 drm/xe: Clarify LRC size when allocating
59772e493606 drm/xe/xelp: Implement HSDES#16010904313 workarounds
-:127: CHECK:SPACING: spaces preferred around that '+' (ctx:VxW)
#127: FILE: drivers/gpu/drm/xe/xe_lrc.c:1021:
+	*cmd++ = __xe_lrc_regs_ggtt_addr(lrc)+ CTX_CMD_BUF_CCTL * sizeof(u32);
 	                                     ^

-:175: CHECK:MULTIPLE_ASSIGNMENTS: multiple assignments should be avoided
#175: FILE: drivers/gpu/drm/xe/xe_lrc.c:1069:
+	start = cmd = map.vaddr;

total: 0 errors, 0 warnings, 2 checks, 190 lines checked
80948e4724a2 drm/xe/xelp: Add Wa_1607983814
33dadd1d3460 drm/xe: Use emit_flush_imm_ggtt helper instead of open coding
5a6ca3d6d11e drm/xe/xelpg: Flush CCS when flushing caches
b061ccfc7af1 drm/xe: Flush L3 when flushing render cache
-:19: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#19: FILE: drivers/gpu/drm/xe/instructions/xe_gpu_commands.h:50:
+#define   PIPE_CONTROL_FLUSH_L3                         (1<<27)
                                                           ^

total: 0 errors, 0 warnings, 1 checks, 23 lines checked
3c104e74a722 drm/xe/xelp: Quiesce memory traffic before invalidating auxccs
aa3d969c06af drm/xe/xelp: Support auxccs invalidation on blitter
5e19b6ace0d9 drm/xe/xelp: Use MI_FLUSH_DW_CCS on auxccs platforms
1ba4ee42eea3 drm/xe/xelp: Wait for AuxCCS invalidation to complete
82ee4e504d42 drm/xe/xelp: Add AuxCCS invalidation to the buffer migration path
6e27c9ace320 drm/xe: Export xe_emit_aux_table_inv
35ee5122b7ba drm/xe/xelp: Add AuxCCS invalidation to the indirect context workarounds
9c2a2a88efde drm/xe: Use fb cached min alignment
50f800ea1508 drm/xe: Flush GGTT writes after populating DPT
-:72: WARNING:MEMORY_BARRIER: memory barrier without comment
#72: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:115:
+	wmb();

total: 0 errors, 1 warnings, 0 checks, 66 lines checked
767e74ae103e drm/xe: Handle DPT in system memory
d7eb203f6b76 drm/xe: Force flush system memory AuxCCS framebuffers before scan out
31807aa56fe5 drm/xe/display: Add support for AuxCCS
-:83: CHECK:ASSIGNMENT_CONTINUATIONS: Assignment operator '=' should be on the previous line
#83: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:95:
+	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index)
+		= ggtt->pt_ops->pte_encode_bo;

total: 0 errors, 0 warnings, 1 checks, 133 lines checked
f4377ea16963 drm/i915/display: Expose AuxCCS frame buffer modifiers for Xe
-:10: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")'
#10: 
done in cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if

-:16: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#16: 
		uapi: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=visible, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)

total: 1 errors, 1 warnings, 0 checks, 12 lines checked


