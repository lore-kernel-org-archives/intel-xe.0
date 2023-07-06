Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAFEEB64DD
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 12:03:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E9910E4FB;
	Thu,  6 Jul 2023 12:03:40 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E48910E4FB
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 12:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688645018; x=1720181018;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=84GrYRBdKF1NasvRu2ZJOm7ydXcuBrwNA5lAGAydxZ0=;
 b=BZ1ySyEC7hRnNg8TJF1VHz7+xkQPSZP15/rMH1ZJ8bqxf6uLjX1hvO00
 G7QBPf3St8kEAXwwTS8CnldWMh3Rr5KTFXKSz2eRoyUsqPXms0DO2rIpg
 g1FAQcynYVgBLD/r6EHnFTStnR0xKAfYYtlXGB+SNrrKOJxPZ99znR9kN
 YPU9lOJ4dgEcZyNhq5d9ZNx30X2H2pT+RmrCn8o5Xk9Zs7EnHNWWNP41d
 LfC6YmFljMPkimzxYtY1GGGM2QpsHwU303PmBepCfVVv1ZECbRqHfU6+D
 UhQtJOrTGZGxqddywET5oojiwF33j3SvEdhCsU/Kt03rvlyjJRg9fcf8z w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="449942890"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="449942890"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 05:03:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="843663418"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="843663418"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 05:03:35 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Jul 2023 17:32:05 +0530
Message-Id: <20230706120208.2828158-3-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230706120208.2828158-1-anshuman.gupta@intel.com>
References: <20230706120208.2828158-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 2/5] drm/xe/pm: Refactor xe_pm_runtime_init
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
Cc: sujaritha.sundaresan@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Wrap xe_pm_runtime_init inside xe_pm_init.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 -
 drivers/gpu/drm/xe/xe_pm.c  | 3 ++-
 drivers/gpu/drm/xe/xe_pm.h  | 1 -
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e8dc8c9574fc..4919fe85c704 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -692,7 +692,6 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err)
 		goto err_pci_disable;
 
-	xe_pm_runtime_init(xe);
 	xe_pm_init(xe);
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 1b8f25586470..4371a6a04f4a 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -132,7 +132,7 @@ static bool xe_pm_pci_d3cold_capable(struct pci_dev *pdev)
 	return true;
 }
 
-void xe_pm_runtime_init(struct xe_device *xe)
+static void xe_pm_runtime_init(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
 
@@ -148,6 +148,7 @@ void xe_pm_init(struct xe_device *xe)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
+	xe_pm_runtime_init(xe);
 	xe->d3cold_capable = xe_pm_pci_d3cold_capable(pdev);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 864cd0be014a..193e5d687353 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -13,7 +13,6 @@ struct xe_device;
 int xe_pm_suspend(struct xe_device *xe);
 int xe_pm_resume(struct xe_device *xe);
 
-void xe_pm_runtime_init(struct xe_device *xe);
 void xe_pm_init(struct xe_device *xe);
 void xe_pm_runtime_fini(struct xe_device *xe);
 int xe_pm_runtime_suspend(struct xe_device *xe);
-- 
2.38.0

