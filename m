Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C980C47258
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 20:45:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C26FB10E46D;
	Tue, 23 Jan 2024 20:45:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9F810E3F2
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jan 2024 20:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706042710; x=1737578710;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HcM9jdtpwBhjVjgPd1wQ8KWTt+6OMisVPERfxsrBuYo=;
 b=cwyW2OrIn2rs5d86WagvzhY6gh05cHXQwE+kquf2zI8oGhGqNSGnDjOt
 dXObp++b5VBMhSYomO/FlXNnAGr9mIBHqDGLclnQwBE6LlH/WqQM4axo1
 WcbbRwZ/4dJpr2fjX6HJZdiMoTgOuOh0i8hUV0r1zAHvJkU0nghlmpqQ7
 u3coXpEU4yEDZPUSlytWMtKNvSL6wcocPTn3nCR1H8UTMV9vK8+KsYNKx
 ozzDcplhPOECd7gtGqQyg70K1eNV9EeNobHXpMV6hrIt3/U+6MSyJcjes
 MQNYQAdnLWAfX9P4tpLexgevm7jLauesr6MT4nWQWTsSOWEEII8JEKAkA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8319860"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="8319860"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 12:45:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="909421945"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="909421945"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 12:45:07 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 4/9] drm/xe: Stash GMD_ID value in xe_gt
Date: Tue, 23 Jan 2024 12:44:49 -0800
Message-ID: <20240123204454.246788-4-jose.souza@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123204454.246788-1-jose.souza@intel.com>
References: <20240123204454.246788-1-jose.souza@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Matt Roper <matthew.d.roper@intel.com>

Although we've stored the major and minor versions for graphics/media in
xe_device, it will be simpler to implement the uapi version query if we
also stash the raw register value in the GT itself.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c       | 6 ++++++
 drivers/gpu/drm/xe/xe_gt_types.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 1fe4d54409d34..47cb87f599e46 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -399,6 +399,12 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	/* Initialize CCS mode sysfs after early initialization of HW engines */
 	xe_gt_ccs_mode_sysfs_init(gt);
 
+	/*
+	 * Stash hardware-reported version.  Since this register does not exist
+	 * on pre-MTL platforms, reading it there will (correctly) return 0.
+	 */
+	gt->info.gmdid = xe_mmio_read32(gt, GMD_ID);
+
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 	XE_WARN_ON(err);
 	xe_device_mem_access_put(gt_to_xe(gt));
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 3caaea2ff908a..354d589fb92d5 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -117,6 +117,8 @@ struct xe_gt {
 		 * hwconfig blob.
 		 */
 		u64 __engine_mask;
+		/** @gmdid: raw GMD_ID value from hardware */
+		u32 gmdid;
 	} info;
 
 	/**
-- 
2.43.0

