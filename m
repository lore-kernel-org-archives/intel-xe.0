Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0413DC25B10
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 18:12:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F74D10E7BA;
	Fri, 10 May 2024 18:12:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DV2QySZK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A9B10EEFB
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 18:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715364755; x=1746900755;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zkMJbHTcnzAVNc2ipWp+JwWqG4r5mvYIGyyxP6aOBAI=;
 b=DV2QySZKPWgpMupyAU8xKXsyyux19CwqFPKsH9fQt98p/bgN1wiRvsdG
 E5eMGdguIPfIJDO1wvJ6BviJaNKRf0ol10Dt/pNizXn5rcHEurNIrVwq6
 3cAY3gmMAlvLXEz8Nz+zr+Xf2XbABlQpuKbni4Y+eaWenqHNqoSolCurj
 CPsVJaPbBUIa/mRtO5ggZDF44SqUMnRV4gDiquTwBCs7HCNpiifWa+xm3
 RpNfnxZcPjxMuo+aBqPHLhl+zK3Hxgd3UZ1dqz6IJYKH/+gAlf/JZY8Z5
 30FktVHNkToJryjEday7R+vMw8dxXU+ra1dJ5I0TB2ouNOuR6nLhc2u0l g==;
X-CSE-ConnectionGUID: v5YnLLGpS+icYVN24k0vLw==
X-CSE-MsgGUID: xOFB5fY7QG2QRY2FnlH+DA==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="28844590"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="28844590"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:12:35 -0700
X-CSE-ConnectionGUID: EMxrgEm/QFasSvacuKvfUA==
X-CSE-MsgGUID: VYElpQ4qQSu17RN64rf/ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="60544081"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.149])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:12:33 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 07/20] drm/xe/guc: s/guc_fini/guc_fini_hw/
Date: Fri, 10 May 2024 19:12:20 +0100
Message-ID: <20240510181212.264622-29-matthew.auld@intel.com>
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

Make it clear that is about cleaning up the HW/FW side, and not software
state.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 97e2b62df486..90d994e85e43 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -239,7 +239,7 @@ static void guc_write_params(struct xe_guc *guc)
 		xe_mmio_write32(gt, SOFT_SCRATCH(1 + i), guc->params[i]);
 }
 
-static void guc_fini(void *arg)
+static void guc_fini_hw(void *arg)
 {
 	struct xe_guc *guc = arg;
 	struct xe_gt *gt = guc_to_gt(guc);
@@ -323,7 +323,7 @@ int xe_guc_init(struct xe_guc *guc)
 	if (ret)
 		goto out;
 
-	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini, guc);
+	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini_hw, guc);
 	if (ret)
 		goto out;
 
-- 
2.45.0

