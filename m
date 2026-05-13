Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D90BCD4F21
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 17:58:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F183D10EFAE;
	Wed, 13 May 2026 17:58:51 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF8010EFAE;
 Wed, 13 May 2026 17:58:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_CMTG_enablement_=28rev7?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 May 2026 17:58:50 -0000
Message-ID: <177869513010.69473.9713200128522079159@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260513163857.1541888-1-animesh.manna@intel.com>
In-Reply-To: <20260513163857.1541888-1-animesh.manna@intel.com>
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

Series: CMTG enablement (rev7)
URL   : https://patchwork.freedesktop.org/series/157663/
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
commit 9ae8b54527ff539ef61366cc6efb3b1e119281ef
Author: Animesh Manna <animesh.manna@intel.com>
Date:   Wed May 13 22:08:57 2026 +0530

    debug patch
    
    Signed-off-by: Animesh Manna <animesh.manna@intel.com>
+ /mt/dim checkpatch 848634197d2738329d56c588df7cd8f21c0f7568 drm-intel
e2cc46ce878e drm/i915/cmtg: Add intel_cmtg_is_allowed() for CMTG
bab6f74badf6 drm/i915/cmtg: Set CMTG clock select
423f7e25fc75 drm/i915/cmtg: Add cmtg transcoder offset in struct _device_info
b0bdad27f800 drm/i915/cmtg: Set timings for CMTG
6f10adbe80e7 drm/i915/cmtg: Program VRR registers of CMTG
08662491fe34 drm/i915/cmtg: Set transcoder mn for CMTG
647f628e5d27 drm/i915/cmtg: Add hook to enable CMTG with sync to port
60bd17c13d2c drm/i915/cmtg: Add a hook to make eDP transcoder secondary
6e6e1e0d9ea8 drm/i915/cmtg: Split CMTG support check from intel_cmtg_is_allowed()
3e62465a6b20 drm/i915/cmtg: Modify existing hook to disable CMTG
52dae93bc3f8 drm/i915/cmtg: Add CMTG interrupt handling
93c53fabbefd drm/i915/cmtg: Add CMTG HWGB programming
cbe71baeadcc drm/i915/cmtg: Add CMTG scan line programming
6735a09bcae7 drm/i915/cmtg: Add trigger to enable/disable cmtg
94cb3d92cb5d drm/i915/cmtg: Restore CMTG after DC6 entry
9ae8b54527ff debug patch
-:7: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:32: WARNING:LONG_LINE: line length of 105 exceeds 100 columns
#32: FILE: drivers/gpu/drm/i915/display/intel_cmtg.c:336:
+	drm_dbg_kms(display->drm, "0x%x\n", INTEL_DISPLAY_DEVICE_TRANS_OFFSET(display, cmtg_transcoder));

-:47: WARNING:LONG_LINE: line length of 122 exceeds 100 columns
#47: FILE: drivers/gpu/drm/i915/display/intel_cmtg.c:358:
+	drm_dbg_kms(display->drm, "0x%x, 0x%x\n", TRANS_VRR_VMIN(display, cmtg_transcoder).reg, crtc_state->vrr.vmin - 1);

-:48: WARNING:LONG_LINE: line length of 122 exceeds 100 columns
#48: FILE: drivers/gpu/drm/i915/display/intel_cmtg.c:359:
+	drm_dbg_kms(display->drm, "0x%x, 0x%x\n", TRANS_VRR_VMAX(display, cmtg_transcoder).reg, crtc_state->vrr.vmax - 1);

-:49: WARNING:LONG_LINE: line length of 130 exceeds 100 columns
#49: FILE: drivers/gpu/drm/i915/display/intel_cmtg.c:360:
+	drm_dbg_kms(display->drm, "0x%x, 0x%x\n", TRANS_VRR_FLIPLINE(display, cmtg_transcoder).reg, crtc_state->vrr.flipline - 1);

-:57: WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#57: FILE: drivers/gpu/drm/i915/display/intel_cmtg.c:380:
+	drm_dbg_kms(display->drm, "0x%x, 0x%x\n", TRANS_VRR_CTL(display, cmtg_transcoder).reg, vrr_ctl);

-:65: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#65: FILE: drivers/gpu/drm/i915/display/intel_cmtg.c:394:
+	drm_dbg_kms(display->drm, "0x%x, 0x%x\n", PIPE_DATA_M1(display, cmtg_transcoder).reg, m_n->link_m);

-:66: WARNING:LONG_LINE: line length of 107 exceeds 100 columns
#66: FILE: drivers/gpu/drm/i915/display/intel_cmtg.c:395:
+	drm_dbg_kms(display->drm, "0x%x, 0x%x\n", PIPE_DATA_N1(display, cmtg_transcoder).reg, m_n->link_n);

total: 0 errors, 8 warnings, 0 checks, 65 lines checked


