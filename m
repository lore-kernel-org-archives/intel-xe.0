Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AEC7C5B552
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 20:34:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0772110E886;
	Fri, 30 May 2025 20:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WS1Jtn2r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8801110E87A
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 20:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748637278; x=1780173278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jav3HndAgFtm0Gwf3otH4ki5eiu8VemhgpEIgq/H1sc=;
 b=WS1Jtn2rV+G2jPYYDrX5KYGi1S9HQWb/FicfnVSSPTh2RYJtWG/xJUiw
 ytoVCbiSAgirgcxCVTPA8VjIsCKmQ+SFBtXsLN0kyYj3pZh5yzt3Jy9k2
 CbYztG/9bdo4G9nq6LLkpufEWYIO+MldaMRRVogBAD5LhyEehLkRKzvfr
 t0a7ZPSOtCw2NC2exiROi/tohkdinmQiLhlyfIs2/7lWMchaozpbepWIA
 K68CGHxywbjF1TpF93sv0elfO+1zycUn396qulzfFSvK2X2jcgrUuwFTI
 5d4kELKvEpf2xEkUNShU/yKW3rVPSt9UfGGBx/wZGCRQJ+RcAVo08XGqQ Q==;
X-CSE-ConnectionGUID: kFwJdGD/RB+kgbWdfVr3Ag==
X-CSE-MsgGUID: KS68pdM2RoOgqEbUgE79Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="54405798"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="54405798"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 13:34:38 -0700
X-CSE-ConnectionGUID: yx6G/tQZQ7u9hWKUbO98SA==
X-CSE-MsgGUID: b30sPzSySVawIcdgRuXwvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="149246691"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com)
 ([10.124.223.23])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 13:34:37 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH 09/10] sysfs debug
Date: Fri, 30 May 2025 16:33:46 -0400
Message-ID: <20250530203356.190234-9-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530203356.190234-1-michael.j.ruhl@intel.com>
References: <20250530203356.190234-1-michael.j.ruhl@intel.com>
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

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 31 +++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index 7291c93d71df..985f2c685841 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -469,6 +469,34 @@ trigger_store(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RW(trigger);
 
+#define DEBUG_REGISTER_INFO
+#ifdef DEBUG_REGISTER_INFO
+static ssize_t
+status_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
+	u32 status = readl(crashlog->entry.disc_table + crashlog->info->status.offset);
+	u32 control = readl(crashlog->entry.disc_table + crashlog->info->control.offset);
+	int len = 0;
+
+	len += sysfs_emit_at(buf, len, "clear_support: 0x%08x\n", status & crashlog->info->status.clear_supported);
+	len += sysfs_emit_at(buf, len, "rearmed: 0x%08x\n", status & crashlog->info->status.rearmed);
+	len += sysfs_emit_at(buf, len, "error: 0x%08x\n", status & crashlog->info->status.error);
+	len += sysfs_emit_at(buf, len, "consumed: 0x%08x\n", status & crashlog->info->status.consumed);
+	len += sysfs_emit_at(buf, len, "disable: 0x%08x\n", status & crashlog->info->status.disabled);
+	len += sysfs_emit_at(buf, len, "cleared: 0x%08x\n", status & crashlog->info->status.cleared);
+	len += sysfs_emit_at(buf, len, "in_progress: 0x%08x\n", status & crashlog->info->status.in_progress);
+	len += sysfs_emit_at(buf, len, "complete: 0x%08x\n", status & crashlog->info->status.complete);
+	len += sysfs_emit_at(buf, len, "sts_off: 0x%02x  ctl_off: 0x%02x\n", crashlog->info->status.offset,
+			     crashlog->info->control.offset);
+	len += sysfs_emit_at(buf, len, "status:  0x%08x\n", status);
+	len += sysfs_emit_at(buf, len, "control: 0x%08x\n", control);
+
+	return len;
+}
+static DEVICE_ATTR_RO(status);
+#endif
+
 static struct attribute *pmt_crashlog_attrs[] = {
 	&dev_attr_enable.attr,
 	&dev_attr_trigger.attr,
@@ -482,6 +510,9 @@ static struct attribute *pmt_crashlog_ver2_attrs[] = {
 	&dev_attr_error.attr,
 	&dev_attr_rearm.attr,
 	&dev_attr_trigger.attr,
+#ifdef DEBUG_REGISTER_INFO
+	&dev_attr_status.attr,
+#endif
 	NULL
 };
 
-- 
2.49.0

