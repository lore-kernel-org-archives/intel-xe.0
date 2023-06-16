Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7BCEB64DA
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 14:14:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B2310E642;
	Fri, 16 Jun 2023 14:14:09 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42B410E63E
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 14:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686924845; x=1718460845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/mpzcQ8jWQHqkZ/9vutwe7js8XC5Qb8GSGJQrHctkDc=;
 b=MsmYifOrHkkW3LrKyI/mGrN/A/aLcbETKJ7o+rhduo2cFHEEK8mpmrWm
 YAd2gf+q9ZzvxB3LBCgpYfY23m/l5qY0yl27qewm0uLGwMPYBTc7dF4jN
 tnM5UkNRRWgkepwZ3Ru1pu64qz6ZNK5FgGhbMOdPAPu3v2VR4D1UI7rW3
 AidZNn+EtyaT+3OBXv6s/Y2PhweLGSvOkGfptNYy96PdThZc+1L9hqiSl
 A11uoMFc80bwVb9n+xojMpzFUo6mvYXn9Jf0t3qK4uo2ziQ7Tuzvn0M0u
 YMfPtfacbdBODgRaTDLle/dtmrZNaQnxGk/QVw3dAX3xEldJVEWCzj13H A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="422872898"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="422872898"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 07:13:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="707113170"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="707113170"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 07:13:13 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 16 Jun 2023 19:41:15 +0530
Message-Id: <20230616141115.1128000-3-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230616141115.1128000-1-anshuman.gupta@intel.com>
References: <20230616141115.1128000-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe/pm: Fix PM runtime_idle callback
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

xe driver is using runtime_idle RPM callback but
xe_pm_runtime_put() is using pm_runtime_put_autosuspend(), which
eventually make PM Core to trigger autosuspend directly
without even calling runtime_idle callback.

Fixing it accordingly in both xe_pm_runtime_put()
and xe_pci_runtime_idle().

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 5 ++++-
 drivers/gpu/drm/xe/xe_pm.c  | 3 +--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 2991cf5365d5..7d2f93728585 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -796,6 +796,7 @@ static int xe_pci_runtime_idle(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct xe_device *xe = pdev_to_xe_device(pdev);
+	int ret = 1; /* Trigger autosuspend */
 
 	/*
 	 * TODO: d3cold should be allowed (true) if
@@ -810,7 +811,9 @@ static int xe_pci_runtime_idle(struct device *dev)
 	 */
 	 xe->d3cold_allowed = false;
 
-	return 0;
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_autosuspend(dev);
+	return ret;
 }
 #endif
 
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 04c5353ba870..ad48312c4e1d 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -206,8 +206,7 @@ int xe_pm_runtime_get(struct xe_device *xe)
 
 int xe_pm_runtime_put(struct xe_device *xe)
 {
-	pm_runtime_mark_last_busy(xe->drm.dev);
-	return pm_runtime_put_autosuspend(xe->drm.dev);
+	return pm_runtime_put(xe->drm.dev);
 }
 
 static bool xe_pm_runtime_suspended(struct xe_device *xe)
-- 
2.38.0

