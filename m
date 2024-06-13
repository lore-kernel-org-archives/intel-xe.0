Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705BCC27C79
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 12:08:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BC310EA65;
	Thu, 13 Jun 2024 12:08:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i36OEeUv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6660F10EA5B
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 12:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718280483; x=1749816483;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sN4sf261HbPlleDHAEKSC71R+w8RjPlILUH037prxL0=;
 b=i36OEeUvsY2yZmcFysW5pUkLGbrre78XMXPggvd0TXOTwO3IclPDzyKK
 gdN1QtGliPgF41hna+ptoTPMp8wTy31awbVhosEDwnhZV6X9hOCYzqc2F
 jnTrIRTlTKeuIqUGQPrI9loY+O62sb+02ol1300jAABf7EjCuZyphjeWl
 Omis8KyEXClpVbOEp3sQgtz62WrCI8Kr7i9+cLus3Tt0SrK4XuWUg0u7l
 rAkbhqHsyVDZaZ4tBl/jI3eAvF1CwtTUudPtWdbp3365XOj+EvhKRQn1j
 +GBQdxjksyVUIRxuFDT4EzXpVQOHwdkmI2nNZH0OBZZemKKRsvt+vmt6e Q==;
X-CSE-ConnectionGUID: p61Q8FXcQhaMJkSFReH/Bw==
X-CSE-MsgGUID: KEosZi0nRDG9DOe/AylqUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="15247661"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="15247661"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 05:08:02 -0700
X-CSE-ConnectionGUID: hbzMAu+0QbC3Mpq0sxLPMg==
X-CSE-MsgGUID: 3n/lf4LMTqyTu4U2aBRgLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="40052337"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 05:08:00 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH] drm/xe/vf: Use correct check for being a VF driver
Date: Thu, 13 Jun 2024 14:07:49 +0200
Message-Id: <20240613120749.2032-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The IS_SRIOV macro returns true also when we are running as a PF
driver. Use correct IS_SRIOV_VF macro to skip force-wake management.

Fixes: 513ea833c201 ("drm/xe/vf: Ignore force-wake requests if VF")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 5db6926120c3..b263fff15273 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -97,7 +97,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 
 static void __domain_ctl(struct xe_gt *gt, struct xe_force_wake_domain *domain, bool wake)
 {
-	if (IS_SRIOV(gt_to_xe(gt)))
+	if (IS_SRIOV_VF(gt_to_xe(gt)))
 		return;
 
 	xe_mmio_write32(gt, domain->reg_ctl, domain->mask | (wake ? domain->val : 0));
@@ -108,7 +108,7 @@ static int __domain_wait(struct xe_gt *gt, struct xe_force_wake_domain *domain,
 	u32 value;
 	int ret;
 
-	if (IS_SRIOV(gt_to_xe(gt)))
+	if (IS_SRIOV_VF(gt_to_xe(gt)))
 		return 0;
 
 	ret = xe_mmio_wait32(gt, domain->reg_ack, domain->val, wake ? domain->val : 0,
-- 
2.43.0

