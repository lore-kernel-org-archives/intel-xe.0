Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE888606A339
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 13:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kiDpbmfN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A58A10F59B;
	Tue, 24 Nov 2026 13:26:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F0010F59B
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 13:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795526795; x=1827062795;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7nJyG5f4eZkUdZoyss5LgX72blDxh16FhZTR3In/UYA=;
 b=kiDpbmfNNLQfp2bUr5VaWPep1GUTToVObLNhBrKOABfp6rtbppYvpNnq
 YqveZANcLbdo9+g/JSIfZr+gn8UTW1KjTH3wXYbTlNwIjC8/P0zqiUL10
 Nm0NkiGkw73ivoUanr3k92VqYGqntnYS60xp2ZRiWmAO0HlzeIWRhj6UW
 bUrmuN0SpEw0w2DAwLeZmzv6CKIMHIgyJF4psXkfmDOAqQ/+YOIib6VdX
 cGCoEOUbsOp/1s60sJ3YW312vGkjJDbMLij07B+e6gqyeOsH4zSTf3LI7
 VrXltF4q5io6gcj6UNqNLcD87eXb67HDZSwT8tV7WxbojxCofFvyHpa/v Q==;
X-CSE-ConnectionGUID: IT5EGePRQCOSfGTL5keKIA==
X-CSE-MsgGUID: VEXM2bbeRKK6tCcbbkjfbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4388690"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4388690"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 05:07:15 -0800
X-CSE-ConnectionGUID: OiwM5UJ+Re2a72lpuBiPhA==
X-CSE-MsgGUID: d7jTYrTrRnGt3UeT/zYD4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11347105"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 05:07:14 -0800
From: Varun Gupta <varun.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, gustavo.sousa@intel.com,
 tilak.tirumalesh.tangudu@intel.com, tejas.upadhyay@intel.com
Subject: [PATCH 2/2] drm/xe/guc: Enable the KLV for Wa_14028597154
Date: Tue, 24 Nov 2026 18:37:00 +0530
Message-ID: <20261124130657.800225-6-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124130657.800225-4-varun.gupta@intel.com>
References: <20261124130657.800225-4-varun.gupta@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

Wa_14028597154: the GuC can not rely on the semaphore wait information
that the HW provides for multi-queue contexts.

The workaround is implemented by the GuC, so we just need to enable it
via the dedicated KLV. Once enabled, the GuC no longer relies on that
information to track the contexts waiting on a semaphore. This is
supported starting from GuC 70.81.

Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h |  1 +
 drivers/gpu/drm/xe/xe_guc_ads.c       | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 4103de0b1c97..37ae08849ccb 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -513,6 +513,7 @@ enum  {
  */
 enum xe_guc_klv_ids {
 	GUC_FEATURE_KLV_DISABLE_MULTI_QUEUE						= 0x5001,
+	GUC_WA_KLV_DISABLE_PPHWSP_ACCESS_FOR_MULTIQ_SEM_TOKEN_64			= 0x5002,
 	GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED				= 0x9002,
 	GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTRY_RESTORE_AT_EXIT		= 0x9004,
 	GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING				= 0x9005,
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index f333480f94e5..4948281219f3 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -413,6 +413,18 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
 				 GUC_FEATURE_KLV_DISABLE_MULTI_QUEUE);
 	}
 
+	/* Wa_14028597154: implemented by the GuC, only needed if multi-queue can be used */
+	if (XE_GT_WA(gt, 14028597154) && xe_gt_has_multi_queue(gt)) {
+		if (GUC_FIRMWARE_VER_AT_LEAST(&gt->uc.guc, 70, 81)) {
+			u32 data = 1;
+
+			guc_waklv_enable(ads, &data, 1, &offset, &remain,
+					 GUC_WA_KLV_DISABLE_PPHWSP_ACCESS_FOR_MULTIQ_SEM_TOKEN_64);
+		} else {
+			xe_gt_info(gt, "Wa_14028597154 needs GuC 70.81 or greater\n");
+		}
+	}
+
 	size = guc_ads_waklv_size(ads) - remain;
 	if (!size)
 		return;
-- 
2.43.0

