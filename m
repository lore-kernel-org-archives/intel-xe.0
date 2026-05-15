Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1462ACD343F
	for <intel-xe@archiver.kernel.org>; Fri, 15 May 2026 08:35:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C860B10F46A;
	Fri, 15 May 2026 08:35:34 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1491D10F46A;
 Fri, 15 May 2026 08:35:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Use_P?=
 =?utf-8?q?IPEDMC=5FFRMTMSTMP_on_display_ver_=3E=3D_30?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 15 May 2026 08:35:34 -0000
Message-ID: <177883413407.74432.3499108972088281189@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260515082443.975592-1-suraj.kandpal@intel.com>
In-Reply-To: <20260515082443.975592-1-suraj.kandpal@intel.com>
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

Series: drm/i915/display: Use PIPEDMC_FRMTMSTMP on display ver >= 30
URL   : https://patchwork.freedesktop.org/series/166634/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ae6ee90554e480b969d7a5f1bd64a6182934ea92
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Fri May 15 13:54:43 2026 +0530

    drm/i915/display: Use PIPEDMC_FRMTMSTMP on display ver >= 30
    
    Starting with display version 30, the per-pipe frame timestamp is read
    from the PIPEDMC register block (PIPEDMC_FRMTMSTMP) instead of the
    legacy PIPE_FRMTMSTMP MMIO. Extend PIPE_FRMTMSTMP() to take the display
    and select the appropriate register based on DISPLAY_VER(), and update
    all callers (intel_vblank, intel_initial_plane) accordingly.
    
    Bspec: 79482
    WA: 14022946399
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch b9819223b7e92173091b674c2212252b99ea6c4b drm-intel
ae6ee90554e4 drm/i915/display: Use PIPEDMC_FRMTMSTMP on display ver >= 30
-:28: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'pipe' - possible side-effects?
#28: FILE: drivers/gpu/drm/i915/display/intel_display_regs.h:3154:
+#define PIPE_FRMTMSTMP(display, pipe)	(DISPLAY_VER(display) >= 30 ? \
+	_MMIO_PIPE(pipe, _PIPEDMC_FRMTMSTMP_A, _PIPEDMC_FRMTMSTMP_B) : \
+	_MMIO_PIPE(pipe, _PIPE_FRMTMSTMP_A, _PIPE_FRMTMSTMP_B))

total: 0 errors, 0 warnings, 1 checks, 40 lines checked


