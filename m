Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F54C25B10
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 18:12:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C7910E7BA;
	Fri, 10 May 2024 18:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J6Q3ZHph";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EBF10EC25
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 18:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715364770; x=1746900770;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SychnyikB8kbgogHaChmSt+VS8WFKRt9SrkGTlDi1Qk=;
 b=J6Q3ZHph8wntOV3e4kPCOM99Td5B9sWixJwtL2s69x5oXId9iYanwuTN
 JEb/SVrYOhr2q1wB7K347R4vVIXIr/hqGTImlts1tqXUUoA4O6/mvYrlo
 oz95AOLKMV8mY7OPF0+TqDmWyiUBoWCXXoRc8cD3DtQyaAV8uQf3QQFG+
 xwH+JZgEM5v27xbJK7gqOPVscHGYEVnem/oe0W5oO4pwr5zO9PpwzmztY
 RGILX1JzjKrR2GRMHiMMGmnZICBTi0Gb3a04RrrCN1OJHaiqrGbwsNbBG
 VvltPCn53wmCDlMJrgRwS5sAcCDa4qxa7zlQNyISYUqsaGYjDFkW08yj7 w==;
X-CSE-ConnectionGUID: bLtepTZqQLSWxxc3xuVdkA==
X-CSE-MsgGUID: mmVu+gAnQ4SmNARv9OOrIg==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="28844623"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="28844623"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:12:50 -0700
X-CSE-ConnectionGUID: OmujPQ16QAqY0mUCdqNhUw==
X-CSE-MsgGUID: vWkh38QZStKcdrgaj2r55A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="60544149"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.149])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:12:48 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 18/20] drm/xe/display: move display fini stuff to devm
Date: Fri, 10 May 2024 19:12:31 +0100
Message-ID: <20240510181212.264622-40-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240510181212.264622-22-matthew.auld@intel.com>
References: <20240510181212.264622-22-matthew.auld@intel.com>
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

Match the i915 display handling here with calling both no_irq and
noaccel when removing the device.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 0de0566e5b39..6d74c9f55b0a 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -126,9 +126,9 @@ int xe_display_init_nommio(struct xe_device *xe)
 	return drmm_add_action_or_reset(&xe->drm, xe_display_fini_nommio, xe);
 }
 
-static void xe_display_fini_noirq(struct drm_device *dev, void *dummy)
+static void xe_display_fini_noirq(void *arg)
 {
-	struct xe_device *xe = to_xe_device(dev);
+	struct xe_device *xe = arg;
 
 	if (!xe->info.enable_display)
 		return;
@@ -163,12 +163,12 @@ int xe_display_init_noirq(struct xe_device *xe)
 	if (err)
 		return err;
 
-	return drmm_add_action_or_reset(&xe->drm, xe_display_fini_noirq, NULL);
+	return devm_add_action_or_reset(xe->drm.dev, xe_display_fini_noirq, xe);
 }
 
-static void xe_display_fini_noaccel(struct drm_device *dev, void *dummy)
+static void xe_display_fini_noaccel(void *arg)
 {
-	struct xe_device *xe = to_xe_device(dev);
+	struct xe_device *xe = arg;
 
 	if (!xe->info.enable_display)
 		return;
@@ -187,7 +187,7 @@ int xe_display_init_noaccel(struct xe_device *xe)
 	if (err)
 		return err;
 
-	return drmm_add_action_or_reset(&xe->drm, xe_display_fini_noaccel, NULL);
+	return devm_add_action_or_reset(xe->drm.dev, xe_display_fini_noaccel, xe);
 }
 
 int xe_display_init(struct xe_device *xe)
-- 
2.45.0

