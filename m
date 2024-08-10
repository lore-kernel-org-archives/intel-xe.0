Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 942BAC3DA4A
	for <intel-xe@archiver.kernel.org>; Sat, 10 Aug 2024 01:55:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5938C10EA5F;
	Sat, 10 Aug 2024 01:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UwV04U4l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B642410EA55
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Aug 2024 01:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723254894; x=1754790894;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=9RpLEFnL6UJY6OveZQ310T7xyX6jZhRLmuFUyUxdZW0=;
 b=UwV04U4lBZGUwT/q7XOBqVrKv7WiVJKrDbG2e2hoWL9YuWw4JGgGwIBZ
 5KevO7pZAEXdmOv7vqCgerP1XhmoZ5TpYJmdrXtK5xcuXGO8PE4gxgnO/
 I3oOsH4UYx2i3GQN9Xedfn7dXzZJyu2VIlA5s9dmtI26prhwNSvGer5Fa
 wWM0aCMzD5sETLfu2504I2FdXf/eaiRbIwb/QINq9CuWP+uHr1OJyrU0L
 e7Wz0SR0vbWx1LgnuJCqO1T7HkFIsE8EYILNQKjfMur+vbMKOYdhhAJ2W
 te9uAoHG8pMhptyyfPSCOO3q2+Uu5AuMSErJZ437nHPbQZFbUttHen2dS Q==;
X-CSE-ConnectionGUID: JEggglXyQbuIwM14xP0aKg==
X-CSE-MsgGUID: IUMoCVTxT4OqHCz85+U0aA==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21420022"
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; d="scan'208";a="21420022"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 18:54:53 -0700
X-CSE-ConnectionGUID: XQzxahVmSRSPKt1noCOsKQ==
X-CSE-MsgGUID: FjfwbpVfRR6PJ8avGaDlDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; d="scan'208";a="57813381"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 18:54:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 01/11] drm/xe: use devm instead of drmm for managed bo
Date: Fri,  9 Aug 2024 18:55:34 -0700
Message-Id: <20240810015544.3443258-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240810015544.3443258-1-matthew.brost@intel.com>
References: <20240810015544.3443258-1-matthew.brost@intel.com>
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

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

The BO cleanup touches the GGTT and therefore requires the HW to be
available, so we need to use devm instead of drmm.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1160
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 3295bc92d7aa..45652d7e6fa6 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1576,7 +1576,7 @@ struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
 	return bo;
 }
 
-static void __xe_bo_unpin_map_no_vm(struct drm_device *drm, void *arg)
+static void __xe_bo_unpin_map_no_vm(void *arg)
 {
 	xe_bo_unpin_map_no_vm(arg);
 }
@@ -1591,7 +1591,7 @@ struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile
 	if (IS_ERR(bo))
 		return bo;
 
-	ret = drmm_add_action_or_reset(&xe->drm, __xe_bo_unpin_map_no_vm, bo);
+	ret = devm_add_action_or_reset(xe->drm.dev, __xe_bo_unpin_map_no_vm, bo);
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -1639,7 +1639,7 @@ int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, str
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
-	drmm_release_action(&xe->drm, __xe_bo_unpin_map_no_vm, *src);
+	devm_release_action(xe->drm.dev, __xe_bo_unpin_map_no_vm, *src);
 	*src = bo;
 
 	return 0;
-- 
2.34.1

