Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2344C636CC
	for <intel-xe@archiver.kernel.org>; Wed, 15 Feb 2023 10:30:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6035810EA91;
	Wed, 15 Feb 2023 10:30:39 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3806610EA91
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Feb 2023 10:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676457037; x=1707993037;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pOKS4C76yjqABUUer8xtjAEWhrU5wF4yNsjfFXvqr1U=;
 b=Iq1mJnwjCcRLAJQdobfbV7n7Ffjooq42OeoEY6F0dAf9vGDEo16xc908
 NCttl/JvHQ18GVftWaAd3gBDvZRB/gKX1RXf3iO9BepPd6F7MrZLZDdZp
 TLaWkF00ZxIWtfoyOAfMMP2QCc2bBl2s1dyaRNBBolmbI2X9DT/R7U3I3
 KMaI2DzhckXEkcn7eIcW3Clcs3pK4Qj0T/nuisc0pcTm5ThDhqofhQTLa
 1WngLA9rPtlzpuc63D9ZMYRCdWfFBMa5JEdcX+ct/Hm2pRUutAqPDnH58
 esKdQu6Xqt9tdeWdhEmy3xtPEQdPzdR80dVvHWH/Gwv5zinz+vMAHl4Om A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="311758962"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="311758962"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 02:30:08 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="758352290"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="758352290"
Received: from merinomx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.18.230])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 02:30:06 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Feb 2023 10:28:43 +0000
Message-Id: <20230215102845.278677-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 1/3] drm/xe/mmio: fix forcewake ref leak in
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Make sure we properly release the forcewake ref on all error paths.

v2(Lucas):
  - Make it less verbose and just fold the unimplemented options into
    the default. The exact return value doesn't seem to matter for the
    corresponding IGT.
  - Replace the user triggerable WARN() with drm_dbg().

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 8a953df2b468..ba327b1e8dea 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -425,31 +425,28 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
 
 	if (args->flags & DRM_XE_MMIO_WRITE) {
 		switch (bits_flag) {
-		case DRM_XE_MMIO_8BIT:
-			return -EINVAL; /* TODO */
-		case DRM_XE_MMIO_16BIT:
-			return -EINVAL; /* TODO */
 		case DRM_XE_MMIO_32BIT:
-			if (XE_IOCTL_ERR(xe, args->value > U32_MAX))
-				return -EINVAL;
+			if (XE_IOCTL_ERR(xe, args->value > U32_MAX)) {
+				ret = -EINVAL;
+				goto exit;
+			}
 			xe_mmio_write32(to_gt(xe), args->addr, args->value);
 			break;
 		case DRM_XE_MMIO_64BIT:
 			xe_mmio_write64(to_gt(xe), args->addr, args->value);
 			break;
 		default:
-			drm_WARN(&xe->drm, 1, "Invalid MMIO bit size");
-			ret = -EINVAL;
+			drm_dbg(&xe->drm, "Invalid MMIO bit size");
+			fallthrough;
+		case DRM_XE_MMIO_8BIT: /* TODO */
+		case DRM_XE_MMIO_16BIT: /* TODO */
+			ret = -ENOTSUPP;
 			goto exit;
 		}
 	}
 
 	if (args->flags & DRM_XE_MMIO_READ) {
 		switch (bits_flag) {
-		case DRM_XE_MMIO_8BIT:
-			return -EINVAL; /* TODO */
-		case DRM_XE_MMIO_16BIT:
-			return -EINVAL; /* TODO */
 		case DRM_XE_MMIO_32BIT:
 			args->value = xe_mmio_read32(to_gt(xe), args->addr);
 			break;
@@ -457,8 +454,11 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
 			args->value = xe_mmio_read64(to_gt(xe), args->addr);
 			break;
 		default:
-			drm_WARN(&xe->drm, 1, "Invalid MMIO bit size");
-			ret = -EINVAL;
+			drm_dbg(&xe->drm, "Invalid MMIO bit size");
+			fallthrough;
+		case DRM_XE_MMIO_8BIT: /* TODO */
+		case DRM_XE_MMIO_16BIT: /* TODO */
+			ret = -ENOTSUPP;
 		}
 	}
 
-- 
2.39.1

