Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1557E106ACCB
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 16:31:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C0710EA5D;
	Thu, 12 Mar 2026 16:31:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MhmIyamN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B7C10EA5D
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Mar 2026 16:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773333069; x=1804869069;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=NU3wHXa8eS76Ynd06hO5tdhrImzMH0adOz+qpVoqVx8=;
 b=MhmIyamNFKbPmc5t2sJR0RoRmWRTOiaXZqhKKAGEtEfEUaM/TSS2H8HQ
 CK0H+VFkIXO94dWS5aqUIyDI+IQ4W1O+QZl5dYbFzkbp3xpGcofiyBU3r
 nHb5FiXvwaHcVDdaAjc7w2eLfmyXBUcuBs1G1ZQRZIQs9nGHQvtrM585t
 ziufJYSrADH7SaZL36HFQIFX0QNBevrt95XATOGVhPaE3dA07Re5E5/UL
 U+lcLqgSaMSismbjtxJXRKRGqzQetrFArEwThpx6EsUTteA3v4NhY1U2w
 YvAoV/B6qBSNSWEmiSxd/zIOMRMHSquQfFCYR3e2QfNlKm6GB3O+jCooV A==;
X-CSE-ConnectionGUID: A8Uhtc9NQRqsHx0qGKHVCw==
X-CSE-MsgGUID: OCVXbSV5SkWniERIqL93yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74473897"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="74473897"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 09:31:08 -0700
X-CSE-ConnectionGUID: VgDlUSyOSzyQXw8cyWvBiA==
X-CSE-MsgGUID: mbaIBISuQ8yT58oiuc3Xjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="220945408"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 09:31:09 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Thu, 12 Mar 2026 09:29:23 -0700
Subject: [PATCH] drm/xe/wa: Drop redundant entries for Wa_16021867713 &
 Wa_14019449301
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260312-wa_merge_fix-v1-1-2ec6607f1e0c@intel.com>
X-B4-Tracking: v=1; b=H4sIAOTpsmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0Mj3fLE+NzUovTU+LTMCl3jVIs0C+PkJFOzJDMloJaColSgMNi46Nj
 aWgDlJCaNXgAAAA==
X-Change-ID: 20260312-wa_merge_fix-3e8f83cb56b6
To: intel-xe@lists.freedesktop.org
Cc: Simona Vetter <simona.vetter@ffwll.ch>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2825;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=NU3wHXa8eS76Ynd06hO5tdhrImzMH0adOz+qpVoqVx8=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpsupMTrNm45JIG+10xjdMwrf1EzV6seVVVzeHp
 e2dC4pzlpeJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCabLqTAAKCRBNeSQFyHKQ
 BOD3D/9H5wNakKgqYIobGVA4o5pj5QgLwXYEPdxq/DFldWCBHp6pbCLB4n4Bucr46dNe7oQXNHo
 eP6erMpNm7FFoCZBPnBKxXDWJYD4mO4bN9Vy6dP5Yc1SzFZYQwajKC0hWNj2l1ezU6xshRwLqs1
 89t2ZZiqgELyXL9UFrmprOSSXnNHyPkFA9s/BH8gW1Jle5GkC/pMkU+sCL+I6tOgmgT9UYaWFU+
 DKpGejoHZuPX7RO1VH3NeiGzWT2216JlzdtpQ3r1RWZWU3hIwsxZmyokkq78QoBgzKQTdwTux5W
 j4zRb7JS/UYveEyVJQq23eAbFfrpER8vRcmgAJWrEFw+4FZufH1fABTWFfzkD8uxRlXou7s1etz
 XP8fENuUO+/sTb9r7TZxu+33rseonnIehVsmtuEg/7w+YDG8Jpr0Cig+Pu8hEDGhrSE6mDQCFK1
 eXttMzK+74IZ+TPN+YMX4IceDcjUUMqfZx0HO3zzZF298cboW1fTgCpoCXhfNo6rc5zhxgJzbZt
 N6KRQZh9RG9f5XcgmSkQhxpHzigwkHHJjIpv4f1amZKvcxzLdmjZqhkA+RJL5jWAcrmKOCyIB1i
 wavdmyEmHTEEqnHv/9gVx1QSW8IOeWnp8CGuasCVrC5c+0Zm0COaDeDuEpYbmY73jkT2sKQ9WQ8
 hWjw3eB0VeL/DvQ==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The Xe2_HPM-specific RTP table entries for Wa_16021867713 and
Wa_14019449301 were removed by commit 941f538b0af8 ("drm/xe: Consolidate
workaround entries for Wa_16021867713") and commit aa0f0a678370
("drm/xe: Consolidate workaround entries for Wa_14019449301") in favor
of alternate entries earlier in the table that cover a wider range of IP
versions.  However these Xe2_HPM-specific entries were accidentally
resurrected during a backmerge, which causes the Xe driver to complain
on probe about two entries trying to program the same registers+bits:

  <3> [48.491155] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT1: discarding save-restore reg 1c3f1c (clear: 00000008, set: 00000008, masked: no, mcr: no): ret=-22
  <3> [48.491211] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT1: discarding save-restore reg 1d3f1c (clear: 00000008, set: 00000008, masked: no, mcr: no): ret=-22
  <3> [48.491225] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT1: discarding save-restore reg 1c3f08 (clear: 00000020, set: 00000020, masked: no, mcr: no): ret=-22
  <3> [48.491238] xe 0000:03:00.0: [drm] *ERROR* Tile0: GT1: discarding save-restore reg 1d3f08 (clear: 00000020, set: 00000020, masked: no, mcr: no): ret=-22

Re-drop the redundant Xe2_HPM-specific entries to eliminate the dmesg
errors.

Fixes: 58351f46de26 ("Merge v7.0-rc3 into drm-next")
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7608
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 025ec102bf0776f0fdb408f66123fa2ff3d84103..8c55cd187a0c2f17f1d6ed0ef2f9c7a87913a840 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -263,20 +263,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 				   LSN_DIM_Z_WGT(1)))
 	},
 
-	/* Xe2_HPM */
-
-	{ XE_RTP_NAME("16021867713"),
-	  XE_RTP_RULES(MEDIA_VERSION(1301),
-		       ENGINE_CLASS(VIDEO_DECODE)),
-	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
-	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
-	},
-	{ XE_RTP_NAME("14019449301"),
-	  XE_RTP_RULES(MEDIA_VERSION(1301), ENGINE_CLASS(VIDEO_DECODE)),
-	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08(0), CG3DDISHRS_CLKGATE_DIS)),
-	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
-	},
-
 	/* Xe3_LPG */
 
 	{ XE_RTP_NAME("14021871409"),

---
base-commit: 3ccc0e3404591e404d0dee79406cd013f377356a
change-id: 20260312-wa_merge_fix-3e8f83cb56b6

Best regards,
-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

