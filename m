Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146C1C4828D
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 19:27:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B100C112D8B;
	Tue,  6 Feb 2024 19:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UZ8cq9am";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D3F112D95
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 19:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707247663; x=1738783663;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=apECEMqkFWhFEjmDFGjTKjoz8XVk78a6jD/FiQiAHVg=;
 b=UZ8cq9amCTRLWHlYJktzUPKDXgWg/PrBWv9I9UMADr23tIRGPCl8cc36
 jOqEcgG79HABomwd44A+3Uc5U1G5yooW1r3s+tHUj+q/tlPDh+Gn7xU4c
 uSNIKqF9h+O0xyRAsZIQk6dBoHh5ZsKhJHTSxno+EHlQOyiYu2AzRnKoP
 zGrBM5EeVe7q7nLVTFZJ/8g6fJ3h0JvHrYzKOCqSh99LJwWAGSjdPlmCW
 luzeR20nf0FeSoY4g2tHdjIwE5863nmNUpF204/1BRMCHSWt3Ok1aoWtu
 4yYcK+5CZGli7dABWNT05tr6mCSJJfHScD06YEuicEyso1BH+ymMo72Rl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="978217"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="978217"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 11:27:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; d="scan'208";a="24363866"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 11:27:41 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Riana Tauro <riana.tauro@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
Subject: [PATCH] drm/xe/xe_gt_idle: Drop redundant newline in name
Date: Tue,  6 Feb 2024 11:27:31 -0800
Message-ID: <20240206192731.3533608-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Newline in name is redunant and produces an unnecessary empty line during
'cat name'. Newline is added during sysfs_emit. See '27a1a1e2e47d ("drm/xe:
stringify the argument to avoid potential vulnerability")'.

v2: Add Fixes tag (Riana)

Fixes: 7b076d14f21a ("drm/xe/mtl: Add support to get C6 residency/status of MTL")
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_idle.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 9358f73368896..9fcae65b64699 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -145,10 +145,10 @@ void xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
 	}
 
 	if (xe_gt_is_media_type(gt)) {
-		sprintf(gtidle->name, "gt%d-mc\n", gt->info.id);
+		sprintf(gtidle->name, "gt%d-mc", gt->info.id);
 		gtidle->idle_residency = xe_guc_pc_mc6_residency;
 	} else {
-		sprintf(gtidle->name, "gt%d-rc\n", gt->info.id);
+		sprintf(gtidle->name, "gt%d-rc", gt->info.id);
 		gtidle->idle_residency = xe_guc_pc_rc6_residency;
 	}
 
-- 
2.41.0

