Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3335C83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 07:08:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E72410E0DE;
	Fri, 18 Jul 2025 07:08:59 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4316810E004;
 Fri, 18 Jul 2025 07:08:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_adl_auxcss_ci_run_=28rev3?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 18 Jul 2025 07:08:58 -0000
Message-ID: <175282253826.171567.9784086139763955538@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250717215229.88140-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250717215229.88140-1-tvrtko.ursulin@igalia.com>
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

Series: adl auxcss ci run (rev3)
URL   : https://patchwork.freedesktop.org/series/151753/
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
commit 93f2b73799e333d3af0bf2d3e3a2d9bfbe32b565
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Thu Jul 17 22:52:27 2025 +0100

    always flush
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
+ /mt/dim checkpatch f680f6d0a532122a3b57909c69613bce1c2f1b2e drm-intel
a0488e901c66 drm/xe: Use emit_flush_imm_ggtt helper instead of open coding
b4d6af1b11eb drm/xe/xelpg: Flush CCS when flushing caches
386c1df09153 drm/xe: Flush L3 when flushing render cache
-:19: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#19: FILE: drivers/gpu/drm/xe/instructions/xe_gpu_commands.h:48:
+#define   PIPE_CONTROL_FLUSH_L3                         (1<<30)
                                                           ^

total: 0 errors, 0 warnings, 1 checks, 23 lines checked
7bd772795e35 drm/xe/xelp: Quiesce memory traffic before invalidating auxccs
3a8040362974 drm/xe/xelp: Support auxccs invalidation on blitter
2b870dac62e0 drm/xe/xelp: Use MI_FLUSH_DW_CCS on auxccs platforms
aceda13522af drm/xe/xelp: Wait for AuxCCS invalidation to complete
1589aa94136a drm/xe/xelp: Add AuxCCS invalidation to the buffer migration path
4daac08f85e9 drm/xe: Export xe_emit_aux_table_inv
1eb273fd6779 drm/xe/xelp: Add AuxCCS invalidation to the indirect context workarounds
78b6d08fd483 drm/xe: Use fb cached min alignment
b8c15b01a35d drm/xe: Flush GGTT writes after populating DPT
-:72: WARNING:MEMORY_BARRIER: memory barrier without comment
#72: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:115:
+	wmb();

total: 0 errors, 1 warnings, 0 checks, 66 lines checked
6548dff1642f drm/xe: Handle DPT in system memory
e491f5724328 drm/xe: Force flush system memory AuxCCS framebuffers before scan out
433df430ccc5 drm/xe/display: Add support for AuxCCS
86259c8916fc drm/i915/display: Expose AuxCCS frame buffer modifiers for Xe
-:10: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")'
#10: 
done in cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if

-:16: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#16: 
		uapi: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=visible, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)

total: 1 errors, 1 warnings, 0 checks, 12 lines checked
93f2b73799e3 always flush
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:35: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 12)
#35: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:439:
+	if (!xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo))
+	    drm_clflush_sg(xe_bo_sg(bo));

total: 0 errors, 2 warnings, 0 checks, 25 lines checked


