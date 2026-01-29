Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB27D358E5
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 08:55:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9209810E81A;
	Thu, 29 Jan 2026 08:55:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AnfRrHNN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C1B110E816;
 Thu, 29 Jan 2026 08:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769676921; x=1801212921;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=j8caEJFJoZctWCZKqOai2mTTBem3XyphJ3Qk3UwcL1s=;
 b=AnfRrHNNWcccjTiZe3Dzxm6IcC3VzeZzPnH2K6++6igh5+Q9rBF+aVYf
 kjczCVbKzGnnKouO/iOsnuQHeFD/0Bn2B3RmiuLDwC8KpoSrVE3Hqxjxq
 VJ1z8euXFifZu7CwDKubWwAgZIGTeTUdIZI5gwP3a2Jdof9x3Kdg2/NsW
 rou69tnwfj8hEHDWZuTa+GCc2ECJkeYXVX9vx12dArUtF1+iPSr34MJN4
 rueI1HEXRmt6NG62LiauTyB8mFQsWFU3NECVe0ZNsUmRuRYzIc2Lgyl32
 QqyHp3PfCSacY7Jf0ms0/vURGbb6If1bLtZKsOl0d07jCJzO2fYJyhr+D w==;
X-CSE-ConnectionGUID: V8GIMB/jQ9KPR2exJv1p6w==
X-CSE-MsgGUID: 6B0+zcfpRbSwwkzZkgJwmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="69919996"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="69919996"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 00:55:21 -0800
X-CSE-ConnectionGUID: 1pFegfxrTeqYjnUlEzINgA==
X-CSE-MsgGUID: npERnojURqKEhrawCLdpAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="213019591"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa005.fm.intel.com with ESMTP; 29 Jan 2026 00:55:16 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Thu, 29 Jan 2026 14:23:04 +0530
Subject: [PATCH v8 7/7] drm: Introduce DRM_CAP_ATOMIC_ERROR_REPORTING
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-atomic-v8-7-4cb7b0faa051@intel.com>
References: <20260129-atomic-v8-0-4cb7b0faa051@intel.com>
In-Reply-To: <20260129-atomic-v8-0-4cb7b0faa051@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, xaver.hugl@kde.org, 
 harry.wentland@amd.com, uma.shankar@intel.com, louis.chauvet@bootlin.com, 
 naveen1.kumar@intel.com, ramya.krishna.yella@intel.com
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>
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

The new capability conveys the user that failure reporting on error in
atomic_ioctl() is supported.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
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

