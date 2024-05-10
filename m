Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06699C41513
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 18:12:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9526D10EF42;
	Fri, 10 May 2024 18:12:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ONjeKNjl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D08110EF39
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 18:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715364757; x=1746900757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xtns0N6E6xDenxubbXmnlB2+wQhJN+pCTk6W/SbF7XU=;
 b=ONjeKNjl1Rj3iYjJ58zfrAuPoUIw6jHP7VJPoFJkCauaX3gc9eALcZGe
 uxR2XOrAdOiT45qZe4JFoJhP3iA+ufIc/pOjEN5gjKVwtBfNdmdtEdUox
 9hRoGqpxuurQEKdowdDOIoynd/CEiCxMXjQ1co5xEAY6TY3pfUeqVReWg
 yekPlO+y/XaiOekFhzjO5ircSmK1rcO/1/46PrO+Ur0KyueJibgYHTUT3
 vOU5bI1Du6VI9XcHNP44szfY9DV5LKBi8YvMcwlGoxR7m2EYpCDa4PRG0
 KlHzDw5bYvIylqgZD2bRe64iaclkcJg9WelDfkhMc5VKU2OqFRCRsQqqy A==;
X-CSE-ConnectionGUID: Mstmf4xoS9SEgrYXHsoHbA==
X-CSE-MsgGUID: s01bpipCSMSygQKVQCqdng==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="28844591"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="28844591"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:12:37 -0700
X-CSE-ConnectionGUID: lASVJlgCRAi7RIVmSs1l9Q==
X-CSE-MsgGUID: KQ7D3z9VRTqCdR3K8FIrpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="60544091"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.149])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:12:35 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH 08/20] drm/xe/guc_pc: move pc_fini to devm
Date: Fri, 10 May 2024 19:12:21 +0100
Message-ID: <20240510181212.264622-30-matthew.auld@intel.com>
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

Here we are touching the HW/GuC and presumably this should happen when
the device is removed. Currently if you hotunplug the device this is
skipped if there is already open driver instance.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index d10aab29651e..4164dab1ab66 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -893,7 +893,7 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
  * @drm: DRM device
  * @arg: opaque pointer that should point to Xe_GuC_PC instance
  */
-static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
+static void xe_guc_pc_fini(void *arg)
 {
 	struct xe_guc_pc *pc = arg;
 	struct xe_device *xe = pc_to_xe(pc);
@@ -941,5 +941,5 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 
 	pc->bo = bo;
 
-	return drmm_add_action_or_reset(&xe->drm, xe_guc_pc_fini, pc);
+	return devm_add_action_or_reset(xe->drm.dev, xe_guc_pc_fini, pc);
 }
-- 
2.45.0

