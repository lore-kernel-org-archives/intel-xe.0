Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438E6C41535
	for <intel-xe@archiver.kernel.org>; Tue, 19 Dec 2023 09:52:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0758410E43D;
	Tue, 19 Dec 2023 09:52:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1DE10E44A
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Dec 2023 09:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702979555; x=1734515555;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wK6N5E6lOcFLsQwx3OFZFqXwjoS5x7T8E9bxFnpQ0/U=;
 b=Zwm3cOjSb+f59xoy6VBpQa6QZSWVHd9vJlLzLFG+ZbQuKgs0lH8gIc28
 nT3B9zw59+gqjuvkwMJiiIdkB7mi7G4/vVn4cI3pk3aITNpRtApBa0Qr5
 UHtyCmomApJ1/P7AhBeyudu1r4cx5N0HGIq3NKHfhbsoxcwxKVYTiHxPO
 RtRlCJotoau8thYfD2P2PA2yha0nYFbMK6S2ZcAmxY9yns+jaETRXg+wV
 cdHFk1qMJ/hnAZ2wS/yfjcw9VBq/4ahEr+NzDAxBHXZZB0puB6/DHYvlB
 eAVo24PzoXpFl/xN4kpfPDYwA7o0VBc4uXocV7poj/vreaTspL7f1XvnH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="386058457"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; d="scan'208";a="386058457"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 01:52:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="752106888"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; d="scan'208";a="752106888"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by orsmga006.jf.intel.com with ESMTP; 19 Dec 2023 01:52:23 -0800
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/3] [RFC] drm/xe: Add media rp0/rpn sysfs attributes
Date: Tue, 19 Dec 2023 15:37:11 +0530
Message-Id: <20231219100711.645011-3-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231219100711.645011-1-sujaritha.sundaresan@intel.com>
References: <20231219100711.645011-1-sujaritha.sundaresan@intel.com>
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add media frequency sysfs to the balance directory.

device/tile#/gt#/freq0/balance
			|- media_rp0_freq
			|- media_rpn_freq

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_balance_sysfs.c | 47 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode_api.h        |  1 +
 2 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_balance_sysfs.c b/drivers/gpu/drm/xe/xe_gt_balance_sysfs.c
index 054b90ca128d..e39629c211d0 100644
--- a/drivers/gpu/drm/xe/xe_gt_balance_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_balance_sysfs.c
@@ -137,11 +137,58 @@ static ssize_t base_rpn_freq_show(struct device *dev, struct device_attribute *a
 }
 static DEVICE_ATTR_RO(base_rpn_freq);
 
+static ssize_t media_rp0_freq_show(struct device *dev, struct device_attribute *attr,
+				   char *buff)
+{
+	struct xe_gt *gt = dev_to_gt(dev);
+	u32 val, mbox;
+	int err;
+
+	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
+		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_P0)
+		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_MEDIAFF);
+
+	err = xe_pcode_read(gt, mbox, &val, NULL);
+	if (err)
+		return err;
+
+	/* Fused media RP0 read from pcode is in units of 50 MHz */
+	val *= GT_FREQUENCY_MULTIPLIER;
+
+	return sysfs_emit(buff, "%u\n", val);
+}
+static DEVICE_ATTR_RO(media_rp0_freq);
+
+static ssize_t media_rpn_freq_show(struct device *dev, struct device_attribute *attr,
+				   char *buff)
+{
+	struct xe_gt *gt = dev_to_gt(dev);
+	u32 val, mbox;
+	int err;
+
+	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
+		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_PN)
+		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_MEDIAFF);
+
+	err = xe_pcode_read(gt, mbox, &val, NULL);
+
+	if (err)
+		return err;
+
+	/* Fused media RP0 read from pcode is in units of 50 MHz */
+	val *= GT_FREQUENCY_MULTIPLIER;
+
+	return sysfs_emit(buff, "%u\n", val);
+}
+static DEVICE_ATTR_RO(media_rpn_freq);
+
 static struct attribute *balance_attrs[] = {
 	&dev_attr_base_freq_factor.attr,
 	&dev_attr_base_freq_factor_scale.attr,
 	&dev_attr_base_rp0_freq.attr,
 	&dev_attr_base_rpn_freq.attr,
+	&dev_attr_media_rp0_freq.attr,
+	&dev_attr_media_rpn_freq.attr,
 	NULL
 };
 
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 87213b52df4a..9fe42ef87730 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -49,6 +49,7 @@
 /* PCODE_MBOX_DOMAIN_* - mailbox domain IDs */
 /* PCODE_FREQUENCY_CONFIG param2 */
 #define     PCODE_MBOX_DOMAIN_HBM		0x2
+#define     PCODE_MBOX_DOMAIN_MEDIAFF		0x3
 #define     PCODE_MBOX_DOMAIN_CHIPLET		0x6
 #define     PCODE_MBOX_DOMAIN_BASE		0x8
 #define   PCODE_QOS_MULTIPLIER_SET		0x67
-- 
2.25.1

