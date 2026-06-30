Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F38C43458
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 09:22:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B9110EBD2;
	Tue, 30 Jun 2026 09:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WwPOsmfq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C6B10EBD2
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 09:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782811318; x=1814347318;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=biCAux08V/v9SE9PWQVzDw+qiGLBSLpNvxIC5uBn0t0=;
 b=WwPOsmfqGWJR2o17LD+FvFf54qGQSQ9gUXRnFCL2nD3hrAXaiPX/aVAW
 kId82zI9/ZGeIfwBHJzkm4uZEKwlWQe6cN1PWBZ3It5gR76Y3+aXxR2AF
 GD6wt6uns+/z5QDNfdqZlTULdodgiiNVMNrytp6bIR8KLtVTYGGmyMS4x
 REeRvZz+vmkDo2Q24Wz2OGDsLtCDOzr3yGpwclq5VmY9TEPguNWRY1rM0
 IWOxVdwuHPeaOtOZAD6IGlMJmSzBxVbYxz+NAuN6rQbsl4K5L2vbTos2P
 O/8KOWGXXVHPMuffsL6H/pJjobLBsyYKDeyQjm9D2l5QhBGdZsQ6vDjMg w==;
X-CSE-ConnectionGUID: ZK5HcqBVRdefKXyZDotUFQ==
X-CSE-MsgGUID: /G18APl0QJCghswxqekC+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83390620"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; d="scan'208";a="83390620"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 02:21:58 -0700
X-CSE-ConnectionGUID: 1ZLs/ChETouAI349j0MT/A==
X-CSE-MsgGUID: LdC/CH1SRPenzThEuToT7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; d="scan'208";a="252862850"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa009.jf.intel.com with ESMTP; 30 Jun 2026 02:21:57 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: heikki.krogerus@linux.intel.com, rodrigo.vivi@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe/i2c: Drop manual VF check
Date: Tue, 30 Jun 2026 14:48:00 +0530
Message-ID: <20260630091800.403926-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

Clear has_i2c flag inside vf_update_device_info() instead of manually
checking for VF instance.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 1 +
 drivers/gpu/drm/xe/xe_i2c.c    | 3 ---
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index e8b6afb29ab6..cfd4983be411 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -745,6 +745,7 @@ static void vf_update_device_info(struct xe_device *xe)
 	xe->info.probe_display = 0;
 	xe->info.has_heci_cscfi = 0;
 	xe->info.has_heci_gscfi = 0;
+	xe->info.has_i2c = 0;
 	xe->info.has_late_bind = 0;
 	xe->info.skip_guc_pc = 1;
 	xe->info.skip_pcode = 1;
diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index 706783863d07..bd956776b10b 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -334,9 +334,6 @@ int xe_i2c_probe(struct xe_device *xe)
 	if (!xe->info.has_i2c)
 		return 0;
 
-	if (IS_SRIOV_VF(xe))
-		return 0;
-
 	xe_i2c_read_endpoint(xe_root_tile_mmio(xe), &ep);
 	if (ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
 		return 0;
-- 
2.43.0

