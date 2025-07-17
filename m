Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF768C83F34
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 22:28:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8477810E32E;
	Thu, 17 Jul 2025 22:28:12 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E8910E22E;
 Thu, 17 Jul 2025 22:28:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_adl_auxcss_ci_run_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 17 Jul 2025 22:28:11 -0000
Message-ID: <175279129126.170943.16787064343622973000@1538d3639d33>
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

Series: adl auxcss ci run (rev2)
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
commit 7f65cdafb198025ef98e5825be07bb32fca2dc54
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Thu Jul 17 22:52:27 2025 +0100

    always flush
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
+ /mt/dim checkpatch 6cb329ec28293e8b9e670b09611149c05223dca0 drm-intel
13f12dd6e3d9 drm/xe: Use emit_flush_imm_ggtt helper instead of open coding
5f0a73c7a888 drm/xe/xelpg: Flush CCS when flushing caches
04d119f9c74c drm/xe: Flush L3 when flushing render cache
-:19: CHECK:SPACING: spaces preferred around that '<<' (ctx:VxV)
#19: FILE: drivers/gpu/drm/xe/instructions/xe_gpu_commands.h:48:
+#define   PIPE_CONTROL_FLUSH_L3                         (1<<30)
                                                           ^

total: 0 errors, 0 warnings, 1 checks, 23 lines checked
6097ae294bd9 drm/xe/xelp: Quiesce memory traffic before invalidating auxccs
ed820b9c1129 drm/xe/xelp: Support auxccs invalidation on blitter
c64600097250 drm/xe/xelp: Use MI_FLUSH_DW_CCS on auxccs platforms
cce1c3a3fa19 drm/xe/xelp: Wait for AuxCCS invalidation to complete
2168a559b29e drm/xe/xelp: Add AuxCCS invalidation to the buffer migration path
3c6a20423e1d drm/xe: Export xe_emit_aux_table_inv
45b67cdec1a1 drm/xe/xelp: Add AuxCCS invalidation to the indirect context workarounds
6596af6ee61b drm/xe: Use fb cached min alignment
1e1473f2e6d4 drm/xe: Flush GGTT writes after populating DPT
-:72: WARNING:MEMORY_BARRIER: memory barrier without comment
#72: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:115:
+	wmb();

total: 0 errors, 1 warnings, 0 checks, 66 lines checked
10096c6248b2 drm/xe: Handle DPT in system memory
0d02f2033dc3 drm/xe: Force flush system memory AuxCCS framebuffers before scan out
978689df6cb9 drm/xe/display: Add support for AuxCCS
c05b22fbb28e drm/i915/display: Expose AuxCCS frame buffer modifiers for Xe
-:10: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")'
#10: 
done in cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if

-:16: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#16: 
		uapi: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=visible, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)

total: 1 errors, 1 warnings, 0 checks, 12 lines checked
7f65cdafb198 always flush
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:35: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 12)
#35: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:439:
+	if (!xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo))
+	    drm_clflush_sg(xe_bo_sg(bo));

total: 0 errors, 2 warnings, 0 checks, 25 lines checked


