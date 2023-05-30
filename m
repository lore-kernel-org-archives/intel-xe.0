Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E688EC7EE23
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 05:05:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C07A310E33B;
	Tue, 30 May 2023 05:05:16 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F35D510E33B
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 05:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685423115; x=1716959115;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4cVobN9BfZUgQhMsx/Ll47GUqbcbhOkAhvwNB9tICdY=;
 b=JDdpZ3HYGMy/LWr1yEZ4/E0rKA8wHV7tE1yUmXVSGqlVvcPzv81YknvZ
 AH8pVyUfzrSD6DvhDhVX2I/mdDsL3+gwzmnjRrXhVRfhXGgPBXCt1Mq02
 gsCrlyHukzN9nFVQFNa1+509QCOoBEPABITcMEYi591NZtHZDxuRQ3iQM
 b9sUs+h34XWD3IwVNaQzsaGABBRY8VZKQ1EjVKsZe3ZgGiiggA/EJDrW6
 Q5TqgPDtBUC3fOGbjj8tT3fOJkIYoxgdvmQL7Dl6RjiL7mN++fGZYiDig
 b4yXlB5R7Ew8RmdO/M5f7Sm5CBaK7BF+SU6i02hEwtZqtV53s9yBBiCYd A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="339406378"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="339406378"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 22:05:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="739360333"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="739360333"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by orsmga001.jf.intel.com with ESMTP; 29 May 2023 22:05:12 -0700
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 10:43:02 +0530
Message-Id: <20230530051302.2248354-1-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Sysfs entries to query fused min,
 max frequency of
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

Adding sysfs entries to get fused min, max frequency of lmem
using the pcode mailbox interface.

Co-developed-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 44 ++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index e799faa1c6b8..a38493bcadae 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -65,6 +65,10 @@
  * - freq_rpn: The Render Performance (RP) N level, which is the minimal one.
  * - freq_rpe: The Render Performance (RP) E level, which is the efficient one.
  * - freq_rp0: The Render Performance (RP) 0 level, which is the maximum one.
+ * - freq_mem_rp0: The fused maximum frequency of LMEM using the PCODE mailbox
+ *		   interface.
+ * - freq_mem_rpn: The fused minimal frequency of LMEM using the PCODE mailbox
+ *		   interface.
  *
  * device/gt#/freq_* *read-write* files:
  * - freq_min: GuC PC min request.
@@ -625,6 +629,44 @@ static ssize_t rc6_residency_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(rc6_residency);
 
+static ssize_t freq_mem_rp0_show(struct device *dev,
+				 struct device_attribute *attr, char *buff)
+{
+	u32 val;
+	int err;
+
+	err = xe_pcode_read(dev, XEHPSDV_PCODE_FREQUENCY_CONFIG,
+			    PCODE_MBOX_FC_SC_READ_FUSED_P0,
+			    PCODE_MBOX_DOMAIN_HBM, &val);
+	if (err)
+		return err;
+
+	/* data_out - Fused P0 for domain ID in units of 50 MHz */
+	val *= GT_FREQUENCY_MULTIPLIER;
+
+	return sysfs_emit(buff, "%u\n", val);
+}
+static DEVICE_ATTR_RO(freq_mem_rp0);
+
+static ssize_t freq_mem_rpn_show(struct device *dev,
+				 struct device_attribute *attr, char *buff)
+{
+	u32 val;
+	int err;
+
+	err = xe_pcode_read(dev, XEHPSDV_PCODE_FREQUENCY_CONFIG,
+			    PCODE_MBOX_FC_SC_READ_FUSED_PN,
+			    PCODE_MBOX_DOMAIN_HBM, &val);
+	if (err)
+		return err;
+
+	/* data_out - Fused P0 for domain ID in units of 50 MHz */
+	val *= GT_FREQUENCY_MULTIPLIER;
+
+	return sysfs_emit(buff, "%u\n", val);
+}
+static DEVICE_ATTR_RO(freq_mem_rpn);
+
 static const struct attribute *pc_attrs[] = {
 	&dev_attr_freq_act.attr,
 	&dev_attr_freq_cur.attr,
@@ -635,6 +677,8 @@ static const struct attribute *pc_attrs[] = {
 	&dev_attr_freq_max.attr,
 	&dev_attr_rc_status.attr,
 	&dev_attr_rc6_residency.attr,
+	&dev_attr_freq_mem_rp0.attr,
+	&dev_attr_freq_mem_rpn.attr,
 	NULL
 };
 
-- 
2.25.1

