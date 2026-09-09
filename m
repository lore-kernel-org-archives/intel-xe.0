Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AABAC79FA1
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 01:42:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A4010EE2F;
	Wed,  9 Sep 2026 01:42:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LSm4b+vh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF6C10EE2F
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 01:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788918170; x=1820454170;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IOEjWbNGkUv/FQvEWyoiBYNfCRWMaZvpsrFf8k8ITp8=;
 b=LSm4b+vhmZGBljCSNoCz5Xxo3oWfCYwP2fjdOJ00W+2cDf7XazQK2/ZS
 7Y0SU0472VGwGFsvf/v1EbCfUga8wpNIEJhOvp93eQKBFT9Fam0lutgNs
 C9toQvym1qznyH0FW0g8Z17wTFdNmQWTtfymAhhtjr9kEBco1CJF0rx2D
 fbcAF7XZczrzGf1jgJemoUQBwdV3Xm+2vnIsAv8FROoExZLPdxB6KEqUQ
 twq744fhGkdkLKiWVWlhRozgE2C3NddRQbjYL8T9UiZdylzPV+j25hS0O
 4p3u1CTS3Pvfe0qawyXNwaRrHtKzljQN9L1QMo45ZLOeo73H2xk4h8uay g==;
X-CSE-ConnectionGUID: tuLLivP5QSKUugGgL+bT6Q==
X-CSE-MsgGUID: 4hOm4LBIQ9aAmjahVDOqfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="114876493"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="114876493"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 18:42:50 -0700
X-CSE-ConnectionGUID: XRZd0W24QzG/UaGzrJeOCg==
X-CSE-MsgGUID: VyD/w81KRJWFxMNNNLcNYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="276388510"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.16])
 by fmviesa005.fm.intel.com with ESMTP; 08 Sep 2026 18:42:50 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Viv <rodrigo.vivi@intel.com>
Subject: [PATCH 2/2] drm/xe: Poll GT for C6 before D3
Date: Tue,  8 Sep 2026 18:37:12 -0700
Message-Id: <20260909013712.1962521-2-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20260909013712.1962521-1-vinay.belgaumkar@intel.com>
References: <20260909013712.1962521-1-vinay.belgaumkar@intel.com>
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

Check if GTs are in C6 before transitioning to D3. PM subsystem can
retry if this is not the case. This ensures some component is not
accessing the GT when D3 state is forced.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Viv <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 187a39894513..62af84c041cf 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -7,6 +7,7 @@
 
 #include <kunit/static_stub.h>
 #include <linux/device/driver.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/pm_runtime.h>
@@ -1378,10 +1379,25 @@ static int xe_pci_resume(struct device *dev)
 	return 0;
 }
 
+static int wait_for_gt_c6_state(struct xe_gt *gt,
+				int timeout_ms)
+{
+	struct xe_guc_pc *pc = &gt->uc.guc.pc;
+	enum xe_gt_idle_state state;
+
+	return poll_timeout_us(state = gt->gtidle.idle_status(pc),
+			       state == GT_IDLE_C6,
+			       20,
+			       timeout_ms * USEC_PER_MSEC,
+			       false);
+}
+
 static int xe_pci_runtime_suspend(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct xe_device *xe = pdev_to_xe_device(pdev);
+	struct xe_gt *gt;
+	u8 id;
 	int err;
 
 	/*
@@ -1397,6 +1413,14 @@ static int xe_pci_runtime_suspend(struct device *dev)
 	if (err)
 		return err;
 
+	/* Poll and retry if we don't enter C6 on any GT */
+	for_each_gt(gt, xe, id) {
+		if (wait_for_gt_c6_state(gt, 200)) {
+			xe_gt_info(gt, "GT is not in C6\n");
+			return -EAGAIN;
+		}
+	}
+
 	pci_save_state(pdev);
 
 	if (xe->d3cold.allowed) {
-- 
2.38.1

