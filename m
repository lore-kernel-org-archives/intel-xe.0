Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1907BC25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 11:29:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D5A10E362;
	Mon,  3 Jun 2024 11:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AW2FHNBk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E6810E362
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 11:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717414182; x=1748950182;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=w8GlviJxNVGT8jIzJ00If4kZosJMN125n2zS1R0UehI=;
 b=AW2FHNBkHahudQEHFW1k8SlLhwf6daU3BRF7CoYbJct3ADb09jy+uqSZ
 x8MM2B/eIF4PYbUSHhuul6cNNr0SL0m65aCOEtW6eVGqmYg5HqKcFagfC
 CG1UDOivFD1w1VCcmO8UbuuBMpi3XH9jMdQFeDD+4Vqejc4kR11KxlbVu
 xNUSYW94VODLoPBUI5t5AcjwwmXJiwOWPDjmQyh9ijJ0V7rO8q/wHHrug
 qVY46CaZ9mbNIIBcgQdrajRXfb6XtxUYT829sGn13vGHeUWfNfLilDq86
 mkHqLDGT9aogYU6ZCk9JxVtgBV0bUvRvGor76JiZwnVt543iLtFwjke8n Q==;
X-CSE-ConnectionGUID: RFTIPZVSRzCpypMmh+LVDA==
X-CSE-MsgGUID: SCVk6RnBSU2gt6RX28ORSg==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="17726456"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="17726456"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 04:29:41 -0700
X-CSE-ConnectionGUID: RaIA/JUUTxuOo5NecM5bFg==
X-CSE-MsgGUID: 3nRcvdQ0SEaJAsiEnA7SaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="37298081"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa006.jf.intel.com with ESMTP; 03 Jun 2024 04:29:40 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe: Always check force_wake_get return code
Date: Mon,  3 Jun 2024 17:00:05 +0530
Message-Id: <20240603113005.710746-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
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

A force_wake_get failure means that the HW might not be awake for the
access we're doing; this can lead to an immediate error or it can be a
more subtle problem.

In this case, user has asked information and in case of forcewake
failure, it might lead to wrong information, so return in case of
error.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 4a19b771e3a0..e050fc6d8dd7 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -264,7 +264,8 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
 		if (!hwe)
 			continue;
 
-		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+		if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT))
+			return;
 		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
 		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 		break;
-- 
2.25.1

