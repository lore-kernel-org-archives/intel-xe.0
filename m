Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6754EB64DA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jul 2023 08:39:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A066810E431;
	Wed, 19 Jul 2023 08:39:03 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F319E10E431
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jul 2023 08:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689755940; x=1721291940;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0ZWeJT7ElTIYNDoFF5UF4te85y31X5VUiYsw4Y2s5ys=;
 b=S+Lz/5VnDHyk1vCbyG7BeLvhWPOMBMfwXZNSW6s2QgWoxXo6DnP1mNFM
 h2GenbKxudmyF2bHmyCbWHSJxlp11nnWarIxxwP5vHp9xXuFvFZnpl/is
 i62Uz25jJLig3qJGX20P2xB/IDrD5Uo4+I2BTtDxI11a/mYwI0/sRALhE
 7RndVy1mbd3vGY5g2LdKKS2hM6CAP81xj1e6hn74g9tBrMFey7fGu0GQS
 7iWtPri6xQhMt6nvWq7d+WO+Pxzgq+X/Gi0SVI092q1Kkgpg8Frow03ty
 YnbukClsgMX2WN/8bMi5jAeiKH4MflMtJ8u8kS32wR9s8zT13SyASEKqZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="345999039"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="345999039"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 01:39:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="837603350"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="837603350"
Received: from gtroy-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.29.95])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 01:38:59 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 19 Jul 2023 09:38:07 +0100
Message-ID: <20230719083801.182123-17-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230719083801.182123-12-matthew.auld@intel.com>
References: <20230719083801.182123-12-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v15 05/10] drm/xe/mmio: grab mem_access in
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

