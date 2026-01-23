Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44381D778A6
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 18:07:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02BBE10EB94;
	Fri, 23 Jan 2026 18:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h/kFfBJw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D8D210EB94
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 18:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769191654; x=1800727654;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NHZ0XDggcMdS28Ro6x9QZ0q6EhCfPZkU6IFaJmq7VGk=;
 b=h/kFfBJw13510u4MpjtZrDaHhjsuvVtiXdtAnUIAS0wuEVCEZ4sqLeDn
 WVy3JVDO4AWQJ2qKXAD+fX2S3JnBHDslwzyAD16SZ2BFbj/KoBJGDgQrt
 JuHX3bib7vKOw5NM/JjYoHEZDx7i3LOhww2JNdly/5Dfi2stAMZK70aCA
 sjht1GIBggqB8h2ErSDA7oVgHA+Is0PnUjTOtRheSA1JOA0WZUW+hxCE/
 gWstQp/Btq2Dgv37kGsFIKubRyBrorVLvWDqKfXr2GPSLQlRjQHhSCwr/
 thNKYvYKb0iUZsoT91nPdpQumpnrqw+JNHwLH0I4szdqtGr1lFf9BkeBD Q==;
X-CSE-ConnectionGUID: FG6ovOJBRXOfV1YrH7vFNA==
X-CSE-MsgGUID: nf8c6oDPQqqYj9zcHc194A==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="74309582"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="74309582"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 10:07:34 -0800
X-CSE-ConnectionGUID: hO+ibyv4TD2+lXy7bNS/9g==
X-CSE-MsgGUID: qQ/MBVpLQJSzR4ZL7CEdHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="207430798"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa010.fm.intel.com with ESMTP; 23 Jan 2026 10:07:33 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>, Xin Wang <x.wang@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe/gt: Use CLASS() for forcewake in
 xe_gt_enable_comp_1wcoh
Date: Fri, 23 Jan 2026 18:04:26 +0000
Message-ID: <20260123180425.3262944-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Adopt the scoped forcewake management using CLASS(xe_force_wake, ...)
to simplify the code and ensure proper resource release.

Cc: Xin Wang <x.wang@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 9d090d0f2438..22132467ff4f 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -141,15 +141,14 @@ static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
 static void xe_gt_enable_comp_1wcoh(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	unsigned int fw_ref;
 	u32 reg;
 
 	if (IS_SRIOV_VF(xe))
 		return;
 
 	if (GRAPHICS_VER(xe) >= 30 && xe->info.has_flat_ccs) {
-		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-		if (!fw_ref)
+		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+		if (!fw_ref.domains)
 			return;
 
 		reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
@@ -163,8 +162,6 @@ static void xe_gt_enable_comp_1wcoh(struct xe_gt *gt)
 			reg |= EN_CMP_1WCOH_GW;
 			xe_gt_mcr_multicast_write(gt, XE2_GAMWALK_CTRL_3D, reg);
 		}
-
-		xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	}
 }
 
-- 
2.50.1

