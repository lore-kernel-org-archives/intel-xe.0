Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B71D606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 02:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=glNMeVbT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E0D10F940;
	Wed, 28 Oct 2026 02:06:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C04D10F94A
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 02:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793153166; x=1824689166;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=K3Q3J4A2hCQe4vYmyzxffvGYiK9tfVGctw/Nph6b0yY=;
 b=glNMeVbTo2C/hyEMt+7vSe6Y+FViRXQIcwfX5qo8PIHUhDwGawx3BNWC
 eAP3tCW8LnzjS43bJTUkq+PGnnL07XyyCWbWLff41Q8Os/uziaXHwFGwZ
 bnIE93i2XKxaHmqu5wUwGeN2REHygWoaDFloGJBJKvLUFD1ZRlwho2AF5
 jowRMz0w4FFPqlkrBOjlTmUE0PHr4B/wtiaOvREyMdOGSM3Wjgjjy6XkI
 rw01qXoCLnntNTRxbWFGE29lTAz1afm1MkWSssZUZJpRx97WURWXFc2Mj
 OB3SzY8i4uEmHk5+SSynJBBxsWDvTx8gEj487irboPULtQpuVpyoKtbxt Q==;
X-CSE-ConnectionGUID: uVRzNUlbRjikJ/6FiRxDzQ==
X-CSE-MsgGUID: HlrNY0coQNiYuD/zhTV9VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1753812"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1753812"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 19:06:06 -0700
X-CSE-ConnectionGUID: 9LVhRcUxSRaWRJnQwLwFOw==
X-CSE-MsgGUID: tmxMqounSiyUEIcexUM9HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="5065478"
Received: from cyp07.fm.intel.com (HELO pallavi-cyp07.fm.intel.com)
 ([10.36.54.237])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 19:06:05 -0700
From: Pallavi Mishra <pallavi.mishra@intel.com>
To: intel-xe@lists.freedesktop.org,
	matthew.d.roper@intel.com
Subject: [PATCH] drm/xe: Store GMD_ID subunit during GT init
Date: Tue, 27 Oct 2026 19:05:54 -0700
Message-ID: <20261028020554.390714-1-pallavi.mishra@intel.com>
X-Mailer: git-send-email 2.43.0
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

Read GMD_ID during GT forcewake initialization and store both the
full GMD_ID value and the subip field in gt->info.
Keeping the field in gt->info provides a common source for
future users and avoids additional GMD_ID reads.

Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c       | 20 ++++++++++++++------
 drivers/gpu/drm/xe/xe_gt_types.h |  2 ++
 drivers/gpu/drm/xe/xe_guc.c      | 12 +++++-------
 3 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 60d35ada2853..39ae7105aaa0 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -564,6 +564,18 @@ static void dump_pat_on_error(struct xe_gt *gt)
 	xe_pat_dump(gt, &p);
 }
 
+/*
+ * Store GMD_ID and sub-IP before GuC upload. Main GAMCTRL consumes the stored
+ * subunit field during upload.
+ */
+static void xe_gt_read_gmdid(struct xe_gt *gt)
+{
+	u32 gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
+
+	gt->info.gmdid = gmdid;
+	gt->info.subip = REG_FIELD_GET(GMD_ID_SUBIP_FLAG_MASK, gmdid);
+}
+
 static int gt_init_with_gt_forcewake(struct xe_gt *gt)
 {
 	int err;
@@ -572,6 +584,8 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
 	if (!fw_ref.domains)
 		return -ETIMEDOUT;
 
+	xe_gt_read_gmdid(gt);
+
 	err = xe_uc_init(&gt->uc);
 	if (err)
 		return err;
@@ -610,12 +624,6 @@ static int gt_init_with_gt_forcewake(struct xe_gt *gt)
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
index c00a7c171f80..c67fb0d512b0 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -153,6 +153,8 @@ struct xe_gt {
 		u64 engine_mask;
 		/** @info.gmdid: raw GMD_ID value from hardware */
 		u32 gmdid;
+		/** @info.subip: GMD_ID subunit field */
+		u8 subip;
 		/**
 		 * @info.multi_queue_engine_class_mask: Bitmask of engine classes with
 		 * multi queue support enabled.
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index b1f4e132fa0c..37d72ce1d589 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1864,18 +1864,16 @@ bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc)
 	/*
 	 * For Xe3p media gt (35), the GuC and the CS subunits may be still Xe3
 	 * that lacks the Main GAMCTRL support. Reserved bits from the GMD_ID
-	 * inform the IP version of the subunits.
+	 * inform the IP version of the subunits. That field is captured once
+	 * at GT init and stored in gt->info.subip.
 	 */
 	if (xe_gt_is_media_type(gt) && MEDIA_VER(gt_to_xe(gt)) == 35) {
-		u32 val = xe_mmio_read32(&gt->mmio, GMD_ID);
-		u32 subip = REG_FIELD_GET(GMD_ID_SUBIP_FLAG_MASK, val);
-
-		if (!subip)
+		if (!gt->info.subip)
 			return true;
 
-		xe_gt_WARN(gt, subip != 1,
+		xe_gt_WARN(gt, gt->info.subip != 1,
 			   "GMD_ID has unknown value in the SUBIP_FLAG field - 0x%x\n",
-			   subip);
+			   gt->info.subip);
 
 		return false;
 	}
-- 
2.43.0

