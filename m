Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEE7EB64DC
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 11:58:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F97410E2DF;
	Tue, 27 Jun 2023 11:58:25 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 409C910E2E1
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jun 2023 11:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687867103; x=1719403103;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wIDiCjeHtS8OkV7IY4nm+zB5c1PnW2zQAWU2IplTUZc=;
 b=kRCHDeUoacqI6TZJG968wNPc4Z7AM7g4hmRZvYH5BeefZhZvj5EqodF5
 MHirdIEll4JsW3K+7AxU9b0Y3acBqb7bSVUBnuLNg496LEINmzjIOUWYR
 XDeSc/94lzPfqyEqFJ94QTseQGnibZbad1jmyENB0Es2QkFitiUqyjnvg
 PKD55y4YKVA65B0FpO9a7D7VU/C262IZ/TyX7EgW4Ies28RrDHVYKLSKL
 ogmLgLnhgxjgU62YylidAGAWHuJ6Qrkkk12b+P//awe+7kXZNALHJPDuX
 i6Eo8ds65IsGeIZhAys9tbhYMtCS1kGM45axrUETlgihqj5vhI/eNg4Co w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="351334009"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="351334009"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 04:58:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="890668128"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="890668128"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 04:58:20 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 27 Jun 2023 17:26:39 +0530
Message-Id: <20230627115642.2087251-3-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230627115642.2087251-1-anshuman.gupta@intel.com>
References: <20230627115642.2087251-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 2/5] drm/xe/pm: Refactor xe_pm_runtime_init
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
index f6000047a471..1b526d1e4d75 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -684,7 +684,6 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err)
 		goto err_pci_disable;
 
-	xe_pm_runtime_init(xe);
 	xe_pm_init(xe);
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 534768ac4410..c250a36b99ad 100644
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
index 38764537a566..e0c4f92e27c5 100644
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

