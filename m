Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA2FE98E13
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 09:18:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF9A10E2B6;
	Mon, 23 Feb 2026 09:18:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wiz95h6s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2791410E2B3;
 Mon, 23 Feb 2026 09:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771838289; x=1803374289;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=ITHiJ8mV8MjBhrvl31MX8m6mVWmn+8bPpVNr5l5vxvo=;
 b=Wiz95h6sviC0anwthvzdO/xNYiEpj0Omvd8vmyLJIoNHiu+Y56YyhtUp
 aALN9WqnREkOUc8dgCiV0UGJd4ntHQXcy/ieYvH7W3W1TsEHqs+B6AMpg
 OM2OmJscNzBOTy/m0Hc5TLkgfAuN3xfgEB7RnkqkN2D6FXslgNWeXKClS
 YcuU5JzPSXur4hVHx7ysokka3jfFQGu4QARaYL/B/ts0Vhq4naqWM/P9g
 4+WhLhqBYs+7A5pgR86829CCK1Mrq030blVrI/V1mzpRBJhG8DhFdmwDI
 c0GfN7qn26TvwboX81UJxX1glmw4DsKQA1X6nPKsxshbHn4U12Yn0ZhTZ Q==;
X-CSE-ConnectionGUID: O9HATJyVQdODTFbRu8fTGQ==
X-CSE-MsgGUID: T5h6cVeYT9SEPhjUVhdAuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="76690818"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="76690818"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 01:18:09 -0800
X-CSE-ConnectionGUID: yaAgtltqQfKYGdTddwCgOg==
X-CSE-MsgGUID: 8nVWkjxQSo6zBsw3S0oBSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="220048855"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa005.fm.intel.com with ESMTP; 23 Feb 2026 01:18:03 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Mon, 23 Feb 2026 14:46:05 +0530
Subject: [PATCH v10 7/7] drm: Introduce DRM_CAP_ATOMIC_ERROR_REPORTING
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-atomic-v10-7-f59c8def2e70@intel.com>
References: <20260223-atomic-v10-0-f59c8def2e70@intel.com>
In-Reply-To: <20260223-atomic-v10-0-f59c8def2e70@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, xaver.hugl@kde.org, 
 harry.wentland@amd.com, uma.shankar@intel.com, louis.chauvet@bootlin.com, 
 naveen1.kumar@intel.com, ramya.krishna.yella@intel.com
Cc: "Imported from f20260210-atomic-v9-5-525c88fd2402"@intel.com, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>, 
 Suraj Kandpal <suraj.kandpal@intel.com>
X-Mailer: b4 0.15-dev
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

The new capability informs users that atomic_ioctl() supports
failure reporting when an error occurs.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/drm_ioctl.c | 3 +++
 include/uapi/drm/drm.h      | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index ff193155129e7e863888d8958458978566b144f8..59f2b5b53830fd3aadc6e18cf49f0660a99e9c96 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -304,6 +304,9 @@ static int drm_getcap(struct drm_device *dev, void *data, struct drm_file *file_
 		req->value = drm_core_check_feature(dev, DRIVER_ATOMIC) &&
 			     dev->mode_config.async_page_flip;
 		break;
+	case DRM_CAP_ATOMIC_ERROR_REPORTING:
+		req->value = drm_core_check_feature(dev, DRIVER_ATOMIC) && 1;
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 27cc159c1d275c7a7fe057840ef792f30a582bb7..6082410bcabfb4aa37b85e5f03d3611e5aed4aa5 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -812,6 +812,13 @@ struct drm_gem_change_handle {
  * commits.
  */
 #define DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP	0x15
+/**
+ * DRM_CAP_ATOMIC_ERROR_REPORTING
+ *
+ * If set to 1, the driver supports reporting of failure codes on error in
+ * atomic ioctl().
+ */
+#define DRM_CAP_ATOMIC_ERROR_REPORTING	0x16
 
 /* DRM_IOCTL_GET_CAP ioctl argument type */
 struct drm_get_cap {

-- 
2.25.1

