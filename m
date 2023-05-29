Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5BAC77B7E
	for <intel-xe@archiver.kernel.org>; Mon, 29 May 2023 09:19:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7FD310E260;
	Mon, 29 May 2023 09:19:20 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85C410E260
 for <intel-xe@lists.freedesktop.org>; Mon, 29 May 2023 09:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685351957; x=1716887957;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5d3F018O4e8ofvFOwdyFf1xVn5AtMlQCOstV5Yh3zhU=;
 b=XHXCelEjNk52+1+vy/Q40G6FprToi0sRwLtkbmLX+wLXrzefum8pxGiD
 /bRDK9dTBYLXMr36ZeWAvMgpurbbco1IJoKcghgq/kgYqsH73cVq+yDSq
 Rp/2o8u2MqzWOUN1PlS3+DgH2hOqrH3rcdnNg0HSqsKRqdwGbz0FwLEgw
 wxERWivAkonOIaSrwH8mgQEQVv3R1/bXjeAflc1mN/VLwkU+zn0YT/26E
 OhUP94J6ILJBXoA1hTR1sYSlRdiO8USeLmJncAturplO4hQQ9QYQIhAWR
 K5FBxenYs7OEunm+gZOcfUfVHHkoivqZTWyL+PqbtyusNPoTsNdCKMpZf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="334289974"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; d="scan'208";a="334289974"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 02:19:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="1036143275"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; d="scan'208";a="1036143275"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by fmsmga005.fm.intel.com with ESMTP; 29 May 2023 02:19:16 -0700
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 29 May 2023 14:57:03 +0530
Message-Id: <20230529092703.1451203-1-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Add a sysfs node for requested frequency
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

Adding freq_pureq as a sysfs node to expose the frequency requested
by the PUnit.

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index e799faa1c6b8..8a1b3bc5d397 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -62,6 +62,7 @@
  * device/gt#/freq_* *read-only* files:
  * - freq_act: The actual resolved frequency decided by PCODE.
  * - freq_cur: The current one requested by GuC PC to the Hardware.
+ * - freq_pureq: The frequency requested by PUnit.
  * - freq_rpn: The Render Performance (RP) N level, which is the minimal one.
  * - freq_rpe: The Render Performance (RP) E level, which is the efficient one.
  * - freq_rp0: The Render Performance (RP) 0 level, which is the maximum one.
@@ -425,6 +426,19 @@ static ssize_t freq_cur_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(freq_cur);
 
+static ssize_t freq_pureq_show(struct device *dev,
+			        struct device_attribute *attr, char *buf)
+{
+	struct kobject *kobj = &dev->kobj;
+	struct xe_gt *gt = kobj_to_gt(kobj);
+	u32 freq;
+
+	freq = xe_mmio_read32(gt, RPNSWREQ);
+
+	return sysfs_emit(buf, "%d\n", decode_freq(freq));
+}
+static DEVICE_ATTR_RO(freq_pureq);
+
 static ssize_t freq_rp0_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
@@ -628,6 +642,7 @@ static DEVICE_ATTR_RO(rc6_residency);
 static const struct attribute *pc_attrs[] = {
 	&dev_attr_freq_act.attr,
 	&dev_attr_freq_cur.attr,
+	&dev_attr_freq_pureq.attr,
 	&dev_attr_freq_rp0.attr,
 	&dev_attr_freq_rpe.attr,
 	&dev_attr_freq_rpn.attr,
-- 
2.25.1

