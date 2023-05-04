Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484CAC7EE26
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 11:15:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 263EC10E0A5;
	Thu,  4 May 2023 11:15:30 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E70C10E05F
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 11:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683198926; x=1714734926;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GZarUIokgj+1WhpRldikoz4naKCXrEOZIpW/rJKyL6I=;
 b=ZMEkYMSUt9d9fEBMUDuw2iQzQm2Jf/5w2Y6EYo8yXYwRlvLZrWfXQBex
 vUMOA0iZZtAwIClnA+bfeVX3nu9JD3b4dOzBEquApUatc7eIHgwCW7NOL
 0Nr6Qq8GMEANouN7j32NjRcBML0xnFD8IG6ZzZAhpBDravDSCl2uCPT0n
 ukiSotYAdw0VT1wnte315sZ3LpsNC7mj34XIyRQVfyuYBpRNMsxJqWUF1
 muyO9IR79QrsaaVncg6rVYwVnsedGmT71JnwC5O5Aa/CvDXFT0LD56Quc
 +VRjOkjIHJpmehKHjke5+xEGhVNexrx4p9IWNbWPBYhRmVvULkS2zzsPj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="333282443"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="333282443"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 04:15:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="943297258"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="943297258"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmsmga006.fm.intel.com with ESMTP; 04 May 2023 04:15:24 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  4 May 2023 16:50:19 +0530
Message-Id: <20230504112020.300498-3-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230504112020.300498-1-tejas.upadhyay@intel.com>
References: <20230504112020.300498-1-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/xe: Register drm device prior to gt init
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
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

GT init creates few sysfs entries under /sys/class/drm
and makes use of drm_class device thus it needs drm
device to be registered prior to gt init.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 45d6e5ff47fd..c5380914da18 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -301,6 +301,10 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_irq_shutdown;
 
+	err = drm_dev_register(&xe->drm, 0);
+	if (err)
+		goto err_irq_shutdown;
+
 	for_each_gt(gt, xe, id) {
 		err = xe_gt_init(gt);
 		if (err)
@@ -311,10 +315,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_fini_display;
 
-	err = drm_dev_register(&xe->drm, 0);
-	if (err)
-		goto err_irq_shutdown;
-
 	xe_display_register(xe);
 
 	xe_debugfs_register(xe);
-- 
2.25.1

