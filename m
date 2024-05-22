Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CA4C25B77
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 10:22:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E82D10F492;
	Wed, 22 May 2024 10:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WCRNfBow";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEAA110EE6B
 for <intel-xe@lists.freedesktop.org>; Wed, 22 May 2024 10:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716373333; x=1747909333;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=6euySp+QP3Ffahd88M12XxZgpbSux6NV49Ojq3DriAc=;
 b=WCRNfBowXG7ZrEbjV9bcMaI310Khu1Cwa9lJU8cG4n+HQkg5zpWHomn7
 0BgBR36dXjqOk7p6RTXZ1DdEU8ZGu9nkm+y0cVOtD1pnaCmscvkJ5XIgU
 NK5KqgopVAm+ZJwKM0HVAEEDVteoQ0KJ/22AkfdWJBJrwGO3yd2M8bvbh
 8HaU8R1sPf+6TJMAxpQ7ATjojmlEC82o0nF7zI09M6bTnBxZyb6Uq6AQD
 qS+L+VN2hGEU3MgSvqsTbu7u/EbS+2gUw5zIWJ/vgxYECJl5+7TTNOEal
 p3JK8b1k6ju7Srx40CLUGvqT9u32B8LalKeDzjksbj1hUuGsVOuxDE/w+ w==;
X-CSE-ConnectionGUID: IPMAhCDJTiKnptm7CHbb6g==
X-CSE-MsgGUID: JF0YxY2xTLq1n1Jcr9Vqdw==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="15562691"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="15562691"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:22:12 -0700
X-CSE-ConnectionGUID: TN8/lxSGSaaP4jH256WbkA==
X-CSE-MsgGUID: WVvC2CI+TcyQN5vVpUA05Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="38195281"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.245.124])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:22:12 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 09/18] drm/xe/device: move flr to devm
Date: Wed, 22 May 2024 11:21:52 +0100
Message-ID: <20240522102143.128069-27-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240522102143.128069-19-matthew.auld@intel.com>
References: <20240522102143.128069-19-matthew.auld@intel.com>
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

Should be called when driver is removed, not when this particular driver
instance is destroyed.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index f17283c9dcb9..861b4f73207e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -380,7 +380,7 @@ static void xe_driver_flr(struct xe_device *xe)
 	xe_mmio_write32(gt, GU_DEBUG, DRIVERFLR_STATUS);
 }
 
-static void xe_driver_flr_fini(struct drm_device *drm, void *arg)
+static void xe_driver_flr_fini(void *arg)
 {
 	struct xe_device *xe = arg;
 
@@ -585,7 +585,7 @@ int xe_device_probe(struct xe_device *xe)
 	err = xe_devcoredump_init(xe);
 	if (err)
 		return err;
-	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
+	err = devm_add_action_or_reset(xe->drm.dev, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
 
-- 
2.45.1

