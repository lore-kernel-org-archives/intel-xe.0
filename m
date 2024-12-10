Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC253E7717F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 08:38:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC5510E822;
	Tue, 10 Dec 2024 08:38:04 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC7FE10E828;
 Tue, 10 Dec 2024 08:38:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_GuC_changes_for_flicker-f?=
 =?utf-8?q?ree_boot=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Dec 2024 08:38:02 -0000
Message-ID: <173381988289.777753.7457650789423732502@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241210083111.230484-1-dev@lankhorst.se>
In-Reply-To: <20241210083111.230484-1-dev@lankhorst.se>
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

Series: GuC changes for flicker-free boot.
URL   : https://patchwork.freedesktop.org/series/142338/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5356969b3e9c538457325bf6d0d7581846078e7c
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Tue Dec 10 09:31:11 2024 +0100

    drm/xe: Do not attempt to bootstrap VF in execlists mode
    
    It was mentioned in a review that there is a possibility of choosing
    to load the module with VF in execlists mode.
    
    Of course this doesn't work, just bomb out as hard as possible.
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch bb4897e2c04e59ecadbb34893ef907aefe2b5c0d drm-intel
a86b9cfa44c1 drm/xe/display: Add intel_plane_initial_vblank_wait
-:110: WARNING:LONG_LINE: line length of 115 exceeds 100 columns
#110: FILE: drivers/gpu/drm/xe/display/xe_plane_initial.c:37:
+	ret = xe_mmio_wait32_not(xe_root_tile_mmio(xe), pipe_frmtmstmp, ~0U, timestamp, 40000U, &timestamp, false);

total: 0 errors, 1 warnings, 0 checks, 91 lines checked
236e7d33a4ad drm/xe: Remove double pageflip
b6f6561e3c3f drm/xe: Move suballocator init to after display init
5a7fce25e222 drm/xe: Defer irq init until after xe_display_init_noaccel
cba2c54de064 drm/xe/display: Use a single early init call for display
f160a3e608b3 drm/xe: Defer memirq init until needed
212cdb788d41 drm/xe/sriov: Move VF bootstrap and query_config to vf_guc_init
ffabc73be874 drm/xe: Simplify GuC early initialisation
-:329: WARNING:LONG_LINE_COMMENT: line length of 112 exceeds 100 columns
#329: FILE: drivers/gpu/drm/xe/xe_uc.c:47:
+	/* HuC and GSC have no early dependencies and can be completely initialised during full xe_uc_init(). */

total: 0 errors, 1 warnings, 0 checks, 274 lines checked
4e96b0419e47 drm/xe: Make it possible to read instance0 MCR registers after xe_gt_mcr_init_early
-:9: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#9: 
instance 0, which fortunately means no dependencies on further initialisation

total: 0 errors, 1 warnings, 0 checks, 95 lines checked
c743beea7a7c drm/xe: Split init of xe_gt_init_hwconfig to xe_gt_init and *_early
5356969b3e9c drm/xe: Do not attempt to bootstrap VF in execlists mode


