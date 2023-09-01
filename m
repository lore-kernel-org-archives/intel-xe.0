Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFC4CA0FE6
	for <intel-xe@archiver.kernel.org>; Fri,  1 Sep 2023 12:05:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F09010E7B2;
	Fri,  1 Sep 2023 12:05:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7273B10E7B2
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Sep 2023 12:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693569939; x=1725105939;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5iP9aAcM/lzlTg5VDFmmby5qCzIqivZIKIc7THBhXck=;
 b=jVCqPbWGS7UeyTGjrESnOLQlpUBAI+s2bnA35u85iWiTtv+s4fHk8e8y
 nBro6TDp4RnXlxDkbKmlgJQn2xH2HMf8yuqiFs57J8dmhYXizfbKhTnBg
 Ib5EZUc8jRJ+tPhou0UhhnewtTNiS8c3J6lv5nTbkJrpqk/Rxz3VEFfLg
 TiMoNaO+8yWDyZAZoWV6kYZKsZUk9Z4gXz25kcnWBtRL8OsIjoqvhsqgy
 l3ckY7do6gII+UjtZAjRS2UHcQuSkRsD/aHfFcNDojIjswCvygychVAA7
 XR8Me8PVag/DEFFJeqSHbWpdBQ826C0i3B9zb+J07q71JWZW8EvOqai86 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="379994946"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="379994946"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 05:05:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="913666787"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="913666787"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by orsmga005.jf.intel.com with ESMTP; 01 Sep 2023 05:05:38 -0700
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  1 Sep 2023 17:45:45 +0530
Message-Id: <20230901121545.361436-4-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230901121545.361436-1-sujaritha.sundaresan@intel.com>
References: <20230901121545.361436-1-sujaritha.sundaresan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3,
 v2] drm/xe: Sysfs entries to query vram fused min, max frequency
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add sysfs enteries for vram rp0 and vram rpn frequencies

v2: Fix review comments (Anshuman)

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 54 ++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 6a139d1dbf66..5084da83896b 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -752,6 +752,54 @@ static const struct attribute *pvc_perf_power_attrs[] = {
 	NULL
 };
 
+static ssize_t freq_vram_rp0_show(struct device *dev, struct device_attribute *attr,
+				  char *buff)
+{
+	struct kobject *kobj = &dev->kobj;
+	struct xe_gt *gt = kobj_to_gt(kobj);
+	u32 val;
+	int err;
+
+	err = xe_pcode_read_p(gt, XEHP_PCODE_FREQUENCY_CONFIG,
+			      PCODE_MBOX_FC_SC_READ_FUSED_P0,
+			      PCODE_MBOX_DOMAIN_HBM, &val);
+	if (err)
+		return err;
+
+	/* data_out - Fused P0 for domain ID in units of 50 MHz */
+	val *= GT_FREQUENCY_MULTIPLIER;
+
+	return sysfs_emit(buff, "%u\n", val);
+}
+static DEVICE_ATTR_RO(freq_vram_rp0);
+
+static ssize_t freq_vram_rpn_show(struct device *dev, struct device_attribute *attr,
+				  char *buff)
+{
+	struct kobject *kobj = &dev->kobj;
+	struct xe_gt *gt = kobj_to_gt(kobj);
+	u32 val;
+	int err;
+
+	err = xe_pcode_read_p(gt, XEHP_PCODE_FREQUENCY_CONFIG,
+			      PCODE_MBOX_FC_SC_READ_FUSED_PN,
+			      PCODE_MBOX_DOMAIN_HBM, &val);
+	if (err)
+		return err;
+
+	/* data_out - Fused P0 for domain ID in units of 50 MHz */
+	val *= GT_FREQUENCY_MULTIPLIER;
+
+	return sysfs_emit(buff, "%u\n", val);
+}
+static DEVICE_ATTR_RO(freq_vram_rpn);
+
+static const struct attribute *vram_freq_attrs[] = {
+	&dev_attr_freq_vram_rp0.attr,
+	&dev_attr_freq_vram_rpn.attr,
+	NULL
+};
+
 static void mtl_init_fused_rp_values(struct xe_guc_pc *pc)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
@@ -1041,6 +1089,12 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 			return err;
 	}
 
+	if (xe->info.platform == XE_PVC) {
+		err = sysfs_create_files(tile->sysfs, vram_freq_attrs);
+		if (err)
+			return err;
+	}
+
 	err = drmm_add_action_or_reset(&xe->drm, pc_fini, pc);
 	if (err)
 		return err;
-- 
2.25.1

