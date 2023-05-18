Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95C1C77B73
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 21:57:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A22C210E565;
	Thu, 18 May 2023 21:57:28 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F1010E137
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 21:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684447046; x=1715983046;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LdnrhZP7H4PIuKKMh0HDgJDJH59qYX+pCwjYOBBBMdE=;
 b=RGqxQZGUxZGmOsNV5Nv9AZNlOhKcLMsbfF7uU+h9wmrN/oD3xYky6+ou
 DEwpO6cg3knfhMwHlUoH+VvSi1OfvknaerDxw7ejcmc5LsH2BsKYx8SVK
 FK275Y0SejuO4PfYrj6y0KtvVQp0LdMIXTRs9OyTwE/L8y1kOGjY0ANLg
 Dj5dsxCNql4/Ap6e31ISHxquN7/EImZXl9R8p0zW1ZHMMNfwaDuM1zMTV
 6n1ZVYK05kcHd160ur1kj1l5uYDCGZtTq1A7ReFI68FrgC67373ncn//o
 6yQFaB0B0LUxw+SwQw7NiKvXTH7kYoYUB221SNawoI7V9rp0P08d4XzWO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="349720242"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="349720242"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 14:57:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="876595988"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="876595988"
Received: from rdcurry-mobl1.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.255.38.227])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 14:57:25 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 18 May 2023 18:56:50 -0300
Message-Id: <20230518215651.502159-2-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230518215651.502159-1-gustavo.sousa@intel.com>
References: <20230518215651.502159-1-gustavo.sousa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Call drmm_add_action_or_reset()
 early in xe_device_create()
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

Otherwise no cleanup is actually done if we branch to err_put.

This works for now: currently we do know that, once inside
xe_device_destroy(), ttm_device_init() was successful so we can safely
call ttm_device_fini(); and, for xe->ordered_wq, there is an upcoming
commit to check its value before calling destroy_workqueue().

However, we might need change this in the future if we have more
initializers called that can fail in a way that we can not know which
one was it once inside xe_device_destroy().

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index f7f6a6a97757..4614bb791fb0 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -187,6 +187,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (WARN_ON(err))
 		goto err_put;
 
+	err = drmm_add_action_or_reset(&xe->drm, xe_device_destroy, NULL);
+	if (err)
+		goto err_put;
+
 	xe->info.devid = pdev->device;
 	xe->info.revid = pdev->revision;
 	xe->info.enable_guc = enable_guc;
@@ -212,10 +216,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (WARN_ON(err))
 		goto err_put;
 
-	err = drmm_add_action_or_reset(&xe->drm, xe_device_destroy, NULL);
-	if (err)
-		goto err_put;
-
 	return xe;
 
 err_put:
-- 
2.40.1

