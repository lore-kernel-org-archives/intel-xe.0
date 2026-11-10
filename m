Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F1A606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 23:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fdGt7FR2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC26A10E9AE;
	Tue, 10 Nov 2026 23:23:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE8910E9AE
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 23:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794353028; x=1825889028;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rbKpeoNVRL22F6j0A278cKLtQLojkbAqIeAsGfM91fM=;
 b=fdGt7FR2EoO0evn6pqurM/RTbdRoFw4/6ifCKztsNqdnQKUzo8B2/avk
 pwmduuoPjGEibYO0bcgiNO4F/9otToD+mAXOvsMJuq8t9C7RDHFuxo2k2
 W0JQl9x1PWGiFYAeo8iTwSra27RJpTQjmIB1aI06WwBLk2FIEYaQABtf5
 GW1oZf+Z4m5B8Fvnnc7pYDSAwJHWi7NVpIAR3RMnKgqjyBCO5u/f94NEG
 u+YrcHPexcQUWl+Nl13q1jFCLmHNJ2Xr8CYnZ7OjSMKhrkYz2D6IoOvu0
 j7Ytn81Jku4XzVlzp4iokrKGZhCjhjS/WLi+aeXX4vIbUwltURfK//MpO A==;
X-CSE-ConnectionGUID: DUH6Krz0Q7mTS/o/7I748Q==
X-CSE-MsgGUID: IGEYUx1aR02XGJkrpn59EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3118748"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3118748"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 15:23:47 -0800
X-CSE-ConnectionGUID: f6Ibqe4xQmWPsBP3IUL1Xg==
X-CSE-MsgGUID: dJjZ3z1VR/+LK9dzCrhP4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8271671"
Received: from cyp07.fm.intel.com (HELO pallavi-cyp07.fm.intel.com)
 ([10.36.54.237])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 15:23:47 -0800
From: Pallavi Mishra <pallavi.mishra@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: gustavo.sousa@intel.com
Subject: [PATCH v4 1/2] drm/xe: Store GMD_ID as a struct
Date: Tue, 10 Nov 2026 15:23:27 -0800
Message-ID: <20261110232328.842758-2-pallavi.mishra@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110232328.842758-1-pallavi.mishra@intel.com>
References: <20261110232328.842758-1-pallavi.mishra@intel.com>
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

Replace gt->info.gmdid with struct xe_gmdid so the register value and
subunit stay together. Read GMD_ID once before GuC upload and use the
stored subunit instead of another MMIO read. Platforms without the
register store zero.

Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c   |  6 +++---
 drivers/gpu/drm/xe/xe_gt.c       | 21 +++++++++++++++------
 drivers/gpu/drm/xe/xe_gt_types.h | 17 +++++++++++++++--
 drivers/gpu/drm/xe/xe_guc.c      | 12 +++++-------
 drivers/gpu/drm/xe/xe_query.c    | 11 +++++------
 5 files changed, 43 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 273e2c45fea9..36d659b4eabd 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1321,9 +1321,9 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p)
 		drm_printf(p, "\tType: %s\n",
 			   gt->info.type == XE_GT_TYPE_MAIN ? "main" : "media");
 		drm_printf(p, "\tIP ver: %u.%u.%u\n",
-			   REG_FIELD_GET(GMD_ID_ARCH_MASK, gt->info.gmdid),
-			   REG_FIELD_GET(GMD_ID_RELEASE_MASK, gt->info.gmdid),
-			   REG_FIELD_GET(GMD_ID_REVID, gt->info.gmdid));
+			   REG_FIELD_GET(GMD_ID_ARCH_MASK, gt->info.gmdid.value),
+			   REG_FIELD_GET(GMD_ID_RELEASE_MASK, gt->info.gmdid.value),
+			   REG_FIELD_GET(GMD_ID_REVID, gt->info.gmdid.value));
 		drm_printf(p, "\tCS reference clock: %u\n", gt->info.reference_clock);
 	}
 }
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 671b87f1b9e9..becc82566457 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -534,6 +534,19 @@ static void dump_pat_on_error(struct xe_gt *gt)
 	xe_pat_dump(gt, &p);
 }
 
+/*
+ * Store GMD_ID before GuC upload. Main GAMCTRL consumes the stored subunit
+ * field during upload. Pre-MTL platforms do not implement the register, so
+ * the read returns zero.
+ */
+static void xe_gt_read_gmdid(struct xe_gt *gt)
+{
+	u32 raw = xe_mmio_read32(&gt->mmio, GMD_ID);
+
+	gt->info.gmdid.value = raw;
+	gt->info.gmdid.subip = REG_FIELD_GET(GMD_ID_SUBIP_FLAG_MASK, raw);
+}
+
 static int gt_init_with_gt_forcewake(struct xe_gt *gt)
 {
 	int err;
@@ -542,6 +555,8 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
 	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
+	xe_gt_read_gmdid(gt);
+
 	err = xe_uc_init(&gt->uc);
 	if (err)
 		return err;
@@ -580,12 +595,6 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
 	if (err)
 		return err;
 
-	/*
-	 * Stash hardware-reported version.  Since this register does not exist
-	 * on pre-MTL platforms, reading it there will (correctly) return 0.
-	 */
-	gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
-
 	if (GRAPHICS_VER(gt_to_xe(gt)) >= 20 && xe_gt_is_main_type(gt))
 		gt->info.has_wmtp_disabled = !!(xe_mmio_read32(&gt->mmio, XEHP_FUSE4) &
 			CFEG_WMTP_DISABLE);
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index c00a7c171f80..7bfcd806aac6 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -120,6 +120,19 @@ enum xe_steering_type {
 		 const struct xe_gt * : (const struct xe_device *)(gt_to_tile(gt__)->xe),	\
 		 struct xe_gt * : gt_to_tile(gt__)->xe)
 
+/**
+ * struct xe_gmdid - GMD_ID register contents
+ *
+ * Zero on platforms that do not implement GMD_ID, matching a read of the
+ * unimplemented register.
+ */
+struct xe_gmdid {
+	/** @value: GMD_ID register value */
+	u32 value;
+	/** @subip: GMD_ID[13:6]; subunit indicator on media version 35, else reserved */
+	u8 subip;
+};
+
 /**
  * struct xe_gt - A "Graphics Technology" unit of the GPU
  *
@@ -151,8 +164,8 @@ struct xe_gt {
 		 * See @user_engines.mask
 		 */
 		u64 engine_mask;
-		/** @info.gmdid: raw GMD_ID value from hardware */
-		u32 gmdid;
+		/** @info.gmdid: GMD_ID register contents for this GT */
+		struct xe_gmdid gmdid;
 		/**
 		 * @info.multi_queue_engine_class_mask: Bitmask of engine classes with
 		 * multi queue support enabled.
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 300126e6624f..9b060aa2890e 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1888,18 +1888,16 @@ bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc)
 	/*
 	 * For Xe3p media gt (35), the GuC and the CS subunits may be still Xe3
 	 * that lacks the Main GAMCTRL support. Reserved bits from the GMD_ID
-	 * inform the IP version of the subunits.
+	 * inform the IP version of the subunits. Those bits are stored in
+	 * gt->info.gmdid.subip and are reserved on other IPs.
 	 */
 	if (xe_gt_is_media_type(gt) && MEDIA_VER(gt_to_xe(gt)) == 35) {
-		u32 val = xe_mmio_read32(&gt->mmio, GMD_ID);
-		u32 subip = REG_FIELD_GET(GMD_ID_SUBIP_FLAG_MASK, val);
-
-		if (!subip)
+		if (!gt->info.gmdid.subip)
 			return true;
 
-		xe_gt_WARN(gt, subip != 1,
+		xe_gt_WARN(gt, gt->info.gmdid.subip != 1,
 			   "GMD_ID has unknown value in the SUBIP_FLAG field - 0x%x\n",
-			   subip);
+			   gt->info.gmdid.subip);
 
 		return false;
 	}
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index dc975f595368..ec621be77a18 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -424,12 +424,11 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 			gt_list->gt_list[iter].near_mem_regions;
 
 		gt_list->gt_list[iter].ip_ver_major =
-			REG_FIELD_GET(GMD_ID_ARCH_MASK, gt->info.gmdid);
-		gt_list->gt_list[iter].ip_ver_minor =
-			REG_FIELD_GET(GMD_ID_RELEASE_MASK, gt->info.gmdid);
-		gt_list->gt_list[iter].ip_ver_rev =
-			REG_FIELD_GET(GMD_ID_REVID, gt->info.gmdid);
-
+				REG_FIELD_GET(GMD_ID_ARCH_MASK, gt->info.gmdid.value);
+			gt_list->gt_list[iter].ip_ver_minor =
+				REG_FIELD_GET(GMD_ID_RELEASE_MASK, gt->info.gmdid.value);
+			gt_list->gt_list[iter].ip_ver_rev =
+				REG_FIELD_GET(GMD_ID_REVID, gt->info.gmdid.value);
 		iter++;
 	}
 
-- 
2.43.0

