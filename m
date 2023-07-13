Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA96C001DD
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 14:32:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A5510E6EC;
	Thu, 13 Jul 2023 14:32:46 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3387710E0E3
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 14:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689258763; x=1720794763;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=84GrYRBdKF1NasvRu2ZJOm7ydXcuBrwNA5lAGAydxZ0=;
 b=iZhHnP1WcsAaWVX53SEwvrWubKWpEAS2vIf9CX46vxGfyMhu60TZGqA2
 p4Jfe7bfcM4F9RMtCSdBtDDj9zrssmEDUIcTrpBG90XLa5jVGEpBlcrdt
 keSQFQxWtv2xt0SGgJphy0orJ13OruZtJ9DTtEDwgGbV9hjg65+1j/O9F
 DLZORU6feVKHmRx3PBzZ4C5ZnMgG/HN3uaT9Sst0URaYqsAXiUTKWu8eH
 BegWBF5+yLuCS1KUaaJ9KDn8z8cx9IZxhbnxJdnU92IE9FK7GHxqWcnco
 geo2tQzqqQLOHbzrCqV+FjuWXl9nOccdTUEUJ3ha5gToFk/gaN93/7kSa A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="362668557"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="362668557"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 07:32:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="812016304"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; d="scan'208";a="812016304"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 07:32:39 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 13 Jul 2023 20:01:18 +0530
Message-Id: <20230713143121.3901357-3-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230713143121.3901357-1-anshuman.gupta@intel.com>
References: <20230713143121.3901357-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 2/5] drm/xe/pm: Refactor xe_pm_runtime_init
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

