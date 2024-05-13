Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF94C25B5F
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 06:54:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04AD510E3F3;
	Mon, 13 May 2024 06:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a69PT2Ww";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D55810E3E1
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 06:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715583244; x=1747119244;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rGGXYMeLyjM8+T6nQBoc3612nySkeiMkOpoNCc1gWBc=;
 b=a69PT2WwoEVyk+45lwgFoMgKcJAHaum50zomG10vnkXFbG0crYm9lBSa
 2nl/K3csOXGe7HNnw8kzuvdQzuCJHfKA3IHL/Hy0cZizyjaHx0Zge0ws/
 5qPYMI25Et38+DRsSpEtzY2rsznWdb5QMLjgYmrsZDFjUVXwOeQ7prKE0
 t+UwfwHX2EUV/qE2P5Pl8Q0AJnS6m2ss6tjUmpfYViayXgJWG9SdzCwCi
 vux3pNzOlN3PbEftpcwwdbSbbkoQLUhOOoFpw3FsWvkk6DQhKEF6dqnLv
 GPxETfQQPfxXYmAnz9HePb9m8qe+md49JjADHl2OdX1M367TjTOMCnkcr g==;
X-CSE-ConnectionGUID: /yG3pWLdTRmXHWqXUEqS3w==
X-CSE-MsgGUID: RmW80Pd1SCCnRD2PRuXE8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11657841"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="11657841"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 23:54:04 -0700
X-CSE-ConnectionGUID: Q20UMrP2Rie10ttQRQjhLg==
X-CSE-MsgGUID: 4sUnzrEdRBuG6XJ46w2dYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="30321389"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 23:54:02 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, vinay.belgaumkar@intel.com
Subject: [PATCH 1/2] drm/xe/xe_gt_idle: use GT forcewake domain assertion
Date: Mon, 13 May 2024 12:35:45 +0530
Message-Id: <20240513070546.3754640-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240513070546.3754640-1-riana.tauro@intel.com>
References: <20240513070546.3754640-1-riana.tauro@intel.com>
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

The rc6 registers used in disable_c6 function belong
to the GT forcewake domain. Hence change the forcewake
assertion to check GT forcewake domain.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_idle.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index a4f6f0a96d05..2f247cb910d1 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -200,7 +200,7 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt)
 void xe_gt_idle_disable_c6(struct xe_gt *gt)
 {
 	xe_device_assert_mem_access(gt_to_xe(gt));
-	xe_force_wake_assert_held(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
 
 	xe_mmio_write32(gt, PG_ENABLE, 0);
 	xe_mmio_write32(gt, RC_CONTROL, 0);
-- 
2.40.0

