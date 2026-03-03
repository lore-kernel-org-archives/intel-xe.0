Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD730EC142E
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 11:08:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 434BB10E799;
	Tue,  3 Mar 2026 11:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NMz9wRZB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E6E10E799;
 Tue,  3 Mar 2026 11:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772536122; x=1804072122;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vTKNn1YodUXX/qedFBj10CZRxq43Ui15MVMo9Giz26g=;
 b=NMz9wRZBqvtnZyiRnB6qRa91q/8sVtK7l9mhD2akHeJac6DwRx13ELaK
 9pmK+VkLQqfFhOOLc/RYWPJANcn/PQY08slMWIGBw2u/W0Mhf+glrIQhs
 7pRF342hU101DMbYD1W95A6ymiDxCrAGev2CMKOsAIko8JrU1WSq7rJFG
 qVge/mG1dCYit5jt8nPnJqW8SrZAlLEEuVwAl+w00uXDmH5pO4wv4+Zkh
 GoLTcWgbZRShlLltyoaT0VLAtVJC4bPh2l5+zIcI3HoSb8SEc0kJQ5riE
 Ep2CpchxYYDm9l9x84nHHmoSIFOt1zB5QhlyL7H4PDZa8t36qrqL2twmW w==;
X-CSE-ConnectionGUID: pCpfOD8gT7GyxEsMUB8irA==
X-CSE-MsgGUID: BdILE7nBRWiTm0Huk8J3TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="77410102"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="77410102"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 03:08:41 -0800
X-CSE-ConnectionGUID: z+u6gWszS1SPrvpQZ/gPgQ==
X-CSE-MsgGUID: bUYR5YvFTqeK8WGHD9HEWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="248460012"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa002.jf.intel.com with ESMTP; 03 Mar 2026 03:08:39 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, simona@ffwll.ch, mripard@kernel.org,
 matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 christian.koenig@amd.com, andrealmeid@igalia.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 2/3] drm: Update log for 'none' recovery method
Date: Tue,  3 Mar 2026 16:35:18 +0530
Message-ID: <20260303110556.3577612-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303110556.3577612-1-raag.jadav@intel.com>
References: <20260303110556.3577612-1-raag.jadav@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Update log for 'none' recovery method for wedged event where driver wants
to hint "no recovery" without resetting the device from driver context.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 2915118436ce..72e7e09225c7 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -586,7 +586,7 @@ int drm_dev_wedged_event(struct drm_device *dev, unsigned long method,
 		snprintf(event_string, sizeof(event_string), "%s", "WEDGED=unknown");
 
 	drm_info(dev, "device wedged, %s\n", method == DRM_WEDGE_RECOVERY_NONE ?
-		 "but recovered through reset" : "needs recovery");
+		 "but no recovery needed" : "needs recovery");
 
 	if (info && (info->comm[0] != '\0') && (info->pid >= 0)) {
 		snprintf(pid_string, sizeof(pid_string), "PID=%u", info->pid);
-- 
2.43.0

