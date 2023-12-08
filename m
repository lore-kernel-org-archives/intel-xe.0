Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E04DC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 14:34:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1B810E2D8;
	Fri,  8 Dec 2023 14:34:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61AAC10E964
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 14:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702046091; x=1733582091;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h/5KdkvzZ5Uw754gKPtEYSmKUXF9r24M3trnwUC5Kwk=;
 b=KG23RsM9xgFCVNOQ0z+fTvLbxFbAXFZHmSNE1qNiXjuQiAOCS0HL7ao+
 NnMMua0GWkQZhpyBDXYHU8C4l6qGcdUDb7ukAyw6VY/4U5KQNSdfQaHyW
 x6ZN/yGkibjjYNN2IiQnOcNuXdRsS0QaY4Yd/H/tH7GQYuCdm6CVVgriu
 MYe90uLdbqvSowyXLE4fYpoQwH69P8dLX/7UBdLVDYiF/8HK+7yR/Rdkl
 4p/yWvLJdR74p/BgEv7NhrFBNYMVl4yAON6+ejNeNBEVAkL6f0Gj4vZpa
 jQPil9o4OX911/gCzbToPhpNencYo6K80H6m9514RfaZ98JiUW+9op2AD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1481800"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="1481800"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 06:34:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="945435601"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="945435601"
Received: from hdevries-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.251.223.103])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 06:34:50 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: check mask in xe_wait_user_fence_ioctl()
Date: Fri,  8 Dec 2023 14:34:27 +0000
Message-Id: <20231208143427.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Check the drm_xe_wait_user_fence mask is one of the allowed values
DRM_XE_UFENCE_WAIT_MASK_* provided in xe_drm.h.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_wait_user_fence.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index 4d5c2555ce41..a73139fe3fe0 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -164,6 +164,12 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, args->num_engines > XE_HW_ENGINE_MAX_INSTANCE))
 		return -EINVAL;
 
+	if (XE_IOCTL_DBG(xe, args->mask != DRM_XE_UFENCE_WAIT_MASK_U8 &&
+			 args->mask != DRM_XE_UFENCE_WAIT_MASK_U16 &&
+			 args->mask != DRM_XE_UFENCE_WAIT_MASK_U32 &&
+			 args->mask != DRM_XE_UFENCE_WAIT_MASK_U64))
+		return -EINVAL;
+
 	if (!no_engines) {
 		err = copy_from_user(eci, user_eci,
 				     sizeof(struct drm_xe_engine_class_instance) *
-- 
2.34.1

