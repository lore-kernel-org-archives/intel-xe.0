Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E68E7F12E
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 21:21:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E90110E18B;
	Tue, 26 Sep 2023 21:21:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659CF10E18B
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 21:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695763268; x=1727299268;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t+CANGfa82NVtQOdil2epEGn5FjOWC+q+xba3amopMo=;
 b=aqiDVHv1rYRPnoXtzV6dDDYuqpVKP9pl5MmKjT7k9LtVntErkKik+N2E
 bMBkuqf78Wa3FDAdoEDYjm3liqH20lobPdmmdPFjtZqrIM3h6OgRvmb7k
 1vN6cnf20PZ9TWB24f0aNkAXGIKafEoROvFH595qw496lo+tLPdkZTd2g
 HHrRpaSdOI9224H6b6qNSXxnvOOfm2jG3Cr3077+TY8PTbbzeQ7NbIGok
 IYvq+lsQFdUtKktMuN4Seq8nDvx5U5Xf7DlV6p5Mg4xp6Mwx4Re9oEosg
 DRvKS1D8SVU8XJfYidKSnbjuiNZ8XGj/sTGGgGOqwf62ywl5WrnyLkOkW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="467958428"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="467958428"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 14:21:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="778288833"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="778288833"
Received: from dut027tgly.fm.intel.com ([10.105.19.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 14:21:03 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Date: Tue, 26 Sep 2023 21:20:55 +0000
Message-Id: <20230926212056.40881-1-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Print devcoredump to drm_info
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
Cc: stuart.summers@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Currently the devcoredump is available in the file system
for a user. However 1) CI isn't currently set up to dump
this data and 2) if we try to dump this during the driver
load when a failure is observed, the driver will be torn
down before we have a chance to actually read this data.

Add a quick routine to print this out with drm_info as well
if CONFIG_DRM_XE_DEBUG is enabled.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 17 ++++++++++++++++-
 drivers/gpu/drm/xe/xe_devcoredump.h |  3 +++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 68abc0b195be..aa41d8e9b602 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -78,7 +78,11 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	iter.remain = count;
 
 	ss = &coredump->snapshot;
-	p = drm_coredump_printer(&iter);
+
+	if (iter.data)
+		p = drm_coredump_printer(&iter);
+	else
+		p = drm_info_printer(coredump_to_xe(coredump)->drm.dev);
 
 	drm_printf(&p, "**** Xe Device Coredump ****\n");
 	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
@@ -102,6 +106,15 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	return count - iter.remain;
 }
 
+/* Print the coredump locally also for debug purposes */
+void
+xe_devcoredump_print(struct xe_devcoredump *coredump)
+{
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+	xe_devcoredump_read(NULL, 0, 0, coredump, 0);
+#endif
+}
+
 static void xe_devcoredump_free(void *data)
 {
 	struct xe_devcoredump *coredump = data;
@@ -192,5 +205,7 @@ void xe_devcoredump(struct xe_exec_queue *q)
 
 	dev_coredumpm(xe->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
 		      xe_devcoredump_read, xe_devcoredump_free);
+
+	xe_devcoredump_print(coredump);
 }
 #endif
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
index 6ac218a5c194..ba0c2a7b71b4 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump.h
@@ -8,6 +8,9 @@
 
 struct xe_device;
 struct xe_exec_queue;
+struct xe_devcoredump;
+
+void xe_devcoredump_print(struct xe_devcoredump *coredump);
 
 #ifdef CONFIG_DEV_COREDUMP
 void xe_devcoredump(struct xe_exec_queue *q);
-- 
2.34.1

