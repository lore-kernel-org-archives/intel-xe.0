Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1C1C87FDC
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 23:53:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E5710E400;
	Tue,  6 Jun 2023 23:53:13 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B6F10E06E
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 23:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686095590; x=1717631590;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2uPfkIzJ5XC/f5L6mvIXCtK8LOkTgjTWli93PPug6wg=;
 b=fR1NnfUkBOJyWhq0As+0UyPiS/xD0AzrChzYUZWgTydBzDDeRqhPSKs9
 V+AGQMqagbMj+1/EFz/N/A2u2yMUB9M/tVPtvTxDE+VnW8v3Oy0fZR9+K
 qGENVvvGn8mu/lzzvwDXWb1/mekrgU230/XMnnUn70ybEI9Jyt561anBf
 h60rudIjc5pYSZpKuiRGfvQgtb97DBihU7xRhr+sIWEkqFnYruCZQa1gr
 P17Ksiu7xyt2A4AF10SEVCJ1t9anpu6XaZTkg2wbkWTATQVEBgtFBFC+w
 PTp8AIvHWgxgtYFb12FdTvz2FJZ0zavjONIxHvPe2h4yGkhVkORxS+60A w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="341481328"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="341481328"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 16:52:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="703385596"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="703385596"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 16:52:50 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  6 Jun 2023 16:52:40 -0700
Message-Id: <20230606235242.1895643-9-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606235242.1895643-1-matthew.d.roper@intel.com>
References: <20230606235242.1895643-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 08/10] drm/i915: Fix error handling if driver
 creation fails during probe
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
Cc: matthew.d.roper@intel.com, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

If i915_driver_create() fails to create a valid 'i915' object, we
should just disable the PCI device and return immediately without trying
to call i915_probe_error() that relies on a valid i915 pointer.

Fixes: 12e6f6dc78e4 ("drm/i915/display: Handle GMD_ID identification in display code")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/55236f93-dcc5-481e-b788-9f7e95b129d8@kili.mountain/
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230601173804.557756-1-matthew.d.roper@intel.com
(cherry picked from commit 718551bbed3ca5308a9f9429305dd074727e8d46)
---
 drivers/gpu/drm/i915/i915_driver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 27e5de529b06..67e5a05e565c 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -762,8 +762,8 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	i915 = i915_driver_create(pdev, ent);
 	if (IS_ERR(i915)) {
-		ret = PTR_ERR(i915);
-		goto out_pci_disable;
+		pci_disable_device(pdev);
+		return PTR_ERR(i915);
 	}
 
 	ret = i915_driver_early_probe(i915);
-- 
2.40.1

