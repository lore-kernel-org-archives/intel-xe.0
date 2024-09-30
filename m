Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A34CF6491
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 05:13:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 655E010E2CA;
	Mon, 30 Sep 2024 05:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i87oeod0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033EE10E0DB
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 05:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727673207; x=1759209207;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z1ayVTbAq0VPFgcPA/HBtWa/dobg0jlnpzGvBRefkgk=;
 b=i87oeod0FLCTVpLnoL+wvAIWhtpq2lkMCIBjo49QF7x5Zx6Prrll7BIz
 0B1CBKdVzovvf7oVnS/R2xX/ofYgMKd3g18VbV2VLDj5q2asW0KHShdg1
 z28fGNSJt03WTvyD6+1+uR93ZEpV1aJH6rc98gH1OQlsWpL9NBmaICNFV
 YC6BU62gXMt204h3/I2/eiIiEOLvyMA/HUMo3w7A87O9Anrn76o7S+6Oh
 DWqGkFL3SzgpjQwRPipGUcDDil+NQ4JiRYOlNe9BYpe7KJvJINTHErcPP
 pmDcjEShcMN4EX46U8XvH7aC7BTDW2XIqkm1Vo/9gjOPNk29FXvEn/bn0 w==;
X-CSE-ConnectionGUID: MZBTuSxARWW+9jKLxA4ijw==
X-CSE-MsgGUID: KhO0OhkQQuOl8eEkUjP3gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="14367950"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="14367950"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2024 22:13:27 -0700
X-CSE-ConnectionGUID: 4TadTFr8TcCXptRAjm1wWg==
X-CSE-MsgGUID: E0X5Mom/SPm+fc+YYhjIHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="72752090"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa006.fm.intel.com with ESMTP; 29 Sep 2024 22:13:25 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v6 01/25] drm/xe: Add member initialized_domains to
 xe_force_wake()
Date: Mon, 30 Sep 2024 11:01:25 +0530
Message-Id: <20240930053149.1246339-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
References: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
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

This field serves as a bitmask representing all initialized forcewake
domains on the GT.

While at it, fix the datatype for awake_domains since it can have
value different from enum xe_force_wake_domains.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c       | 24 +++++++++++++++++-------
 drivers/gpu/drm/xe/xe_force_wake_types.h |  4 +++-
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index a64c14757c84..5ce9e912818a 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -21,15 +21,25 @@ static const char *str_wake_sleep(bool wake)
 	return wake ? "wake" : "sleep";
 }
 
-static void domain_init(struct xe_force_wake_domain *domain,
+static void mark_domain_initialized(struct xe_force_wake *fw,
+				    enum xe_force_wake_domain_id id)
+{
+	fw->initialized_domains |= BIT(id);
+}
+
+static void domain_init(struct xe_force_wake *fw,
 			enum xe_force_wake_domain_id id,
 			struct xe_reg reg, struct xe_reg ack)
 {
+	struct xe_force_wake_domain *domain = &fw->domains[id];
+
 	domain->id = id;
 	domain->reg_ctl = reg;
 	domain->reg_ack = ack;
 	domain->val = FORCEWAKE_MT(FORCEWAKE_KERNEL);
 	domain->mask = FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL);
+
+	mark_domain_initialized(fw, id);
 }
 
 void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
@@ -43,12 +53,12 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
 	xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
 
 	if (xe->info.graphics_verx100 >= 1270) {
-		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
+		domain_init(fw,
 			    XE_FW_DOMAIN_ID_GT,
 			    FORCEWAKE_GT,
 			    FORCEWAKE_ACK_GT_MTL);
 	} else {
-		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
+		domain_init(fw,
 			    XE_FW_DOMAIN_ID_GT,
 			    FORCEWAKE_GT,
 			    FORCEWAKE_ACK_GT);
@@ -63,7 +73,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 	xe_gt_assert(gt, GRAPHICS_VER(gt_to_xe(gt)) >= 11);
 
 	if (!xe_gt_is_media_type(gt))
-		domain_init(&fw->domains[XE_FW_DOMAIN_ID_RENDER],
+		domain_init(fw,
 			    XE_FW_DOMAIN_ID_RENDER,
 			    FORCEWAKE_RENDER,
 			    FORCEWAKE_ACK_RENDER);
@@ -72,7 +82,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 		if (!(gt->info.engine_mask & BIT(i)))
 			continue;
 
-		domain_init(&fw->domains[XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j],
+		domain_init(fw,
 			    XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j,
 			    FORCEWAKE_MEDIA_VDBOX(j),
 			    FORCEWAKE_ACK_MEDIA_VDBOX(j));
@@ -82,14 +92,14 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 		if (!(gt->info.engine_mask & BIT(i)))
 			continue;
 
-		domain_init(&fw->domains[XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j],
+		domain_init(fw,
 			    XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j,
 			    FORCEWAKE_MEDIA_VEBOX(j),
 			    FORCEWAKE_ACK_MEDIA_VEBOX(j));
 	}
 
 	if (gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0))
-		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GSC],
+		domain_init(fw,
 			    XE_FW_DOMAIN_ID_GSC,
 			    FORCEWAKE_GSC,
 			    FORCEWAKE_ACK_GSC);
diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
index ed0edc2cdf9f..fde17dc3d01e 100644
--- a/drivers/gpu/drm/xe/xe_force_wake_types.h
+++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
@@ -78,7 +78,9 @@ struct xe_force_wake {
 	/** @lock: protects everything force wake struct */
 	spinlock_t lock;
 	/** @awake_domains: mask of all domains awake */
-	enum xe_force_wake_domains awake_domains;
+	unsigned int awake_domains;
+	/** @initialized_domains: mask of all initialized domains */
+	unsigned int initialized_domains;
 	/** @domains: force wake domains */
 	struct xe_force_wake_domain domains[XE_FW_DOMAIN_ID_COUNT];
 };
-- 
2.34.1

