Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201A9C77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 17:33:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E064D10E351;
	Tue, 16 May 2023 17:33:34 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1144710E353
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 17:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684258408; x=1715794408;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=8UCQMhiPFZsLgJXYFxLS29hbRCm3iYdVRbmzjMtXIOM=;
 b=I7CX3y6OAWtJLdTlPumGZCFNlDjsbM/vvaX4ssFSCv35Du4co2FS7rbJ
 Lrfr4yR/LLYnPLqE0rkPEabvdcGDsihr6Qk1djgFQD+DzIeOv4K6m+z/I
 uPWHEHc7IkjRt0DqrYL6o0q/G5avZIlCA77bPs6aP3hUPiMSUfslZWWJp
 EL9Fufg+HNtPRemH8JXFc2kpuZJrUfW2B6EPlFeA1VB5wN1MAutwplSqd
 PYucFzAtmxUWbGMP1jm+kyKIIbEl/XtiYEnAU+DZQuN70MCHuLJYWyabz
 czJCYATWabafMfEi2WiP5J9sRnYy6qAcArFhqs5Ah/9EDOEzagwzllPTz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="331904083"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="331904083"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 10:33:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="791146488"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="791146488"
Received: from dmarkey-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.19.120])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 10:33:27 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 16 May 2023 18:32:58 +0100
Message-Id: <20230516173258.181118-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516173258.181118-1-matthew.auld@intel.com>
References: <20230516173258.181118-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 7/7] HAX
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

Just for lockdep.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 5 +++--
 drivers/gpu/drm/xe/xe_pci.c    | 5 +++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 01ef88bf099d..d45cd1617cca 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -163,6 +163,7 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 
 	destroy_workqueue(xe->ordered_wq);
 	ttm_device_fini(&xe->ttm);
+	mutex_destroy(&xe->mem_access.lock);
 }
 
 struct xe_device *xe_device_create(struct pci_dev *pdev,
@@ -208,6 +209,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 
 	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
 
+	mutex_init(&xe->mem_access.lock);
+
 	err = xe_display_create(xe);
 	if (WARN_ON(err))
 		goto err_put;
@@ -216,8 +219,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (err)
 		goto err_put;
 
-	drmm_mutex_init(&xe->drm, &xe->mem_access.lock);
-
 	return xe;
 
 err_put:
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index e789a50a1310..c311199b09e6 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -684,6 +684,11 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return err;
 	}
 
+
+	mutex_lock(&xe->mem_access.lock);
+	xe_pm_runtime_resume(xe);
+	mutex_unlock(&xe->mem_access.lock);
+
 	xe_pm_runtime_init(xe);
 
 	return 0;
-- 
2.40.1

