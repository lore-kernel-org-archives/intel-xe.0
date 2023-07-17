Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218E5C001B0
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jul 2023 11:25:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B4810E238;
	Mon, 17 Jul 2023 11:25:48 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C9B10E236
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jul 2023 11:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689593146; x=1721129146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0ZWeJT7ElTIYNDoFF5UF4te85y31X5VUiYsw4Y2s5ys=;
 b=DSWjGZT4Rca8YEFaM9s15gfNwacOGRAa8fTfl5oruXMvq6MTkPJX82Bm
 cyxmQPPFGrTjCIGAKIabdYf2VyjfYtcUoPDuO+dPepHqogt3UNeCHWlOH
 sTvyaSHKbwZ7Qs6Ok/NEeFUbuT8D0jbfuxBxMvr1cXC8+wnyyXUxD8HEQ
 Ws1ZH4qMqgsT8maYEw875gRW42cJr0Lt5iUMc+ft/ourEtl3Ox6f5Hnxk
 mqDDdzLSFIYYWaUkUcdRj3YREUQ7qBF1yv84kJCx3X0jAsXzP4iAF0bH7
 VuAVmc13fCdAF/p5TA0QzesrOgYz1vrMEzIl16rkEeq7Ar7L/YtwkNoG2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="365948481"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="365948481"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 04:25:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="897174857"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="897174857"
Received: from kprutko-mobl3.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.13.224])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 04:25:44 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 17 Jul 2023 12:25:08 +0100
Message-ID: <20230717112502.32379-17-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230717112502.32379-12-matthew.auld@intel.com>
References: <20230717112502.32379-12-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v14 05/10] drm/xe/mmio: grab mem_access in
 xe_mmio_ioctl
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Any kind of device memory access should first ensure the device is not
suspended, mmio included.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 448b874c7a3c..8d0f07261bfd 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -483,6 +483,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
 	 */
 	reg = XE_REG(args->addr);
 
+	xe_device_mem_access_get(xe);
 	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 
 	if (args->flags & DRM_XE_MMIO_WRITE) {
@@ -526,6 +527,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
 
 exit:
 	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	xe_device_mem_access_put(xe);
 
 	return ret;
 }
-- 
2.41.0

