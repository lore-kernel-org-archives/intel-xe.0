Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F386C25B76
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 10:08:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA4D10E4A6;
	Tue, 11 Jun 2024 10:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dlO+Erpp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED24310E58E
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 10:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718100502; x=1749636502;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lYEdVFJ9VezO78ytnG+KcyeQrd0EE5MhULa3eBaw3R0=;
 b=dlO+ErppjMslYMsedfxt7lOi8642JhyWmjZSzIRMQjiUlKpI3DnRSesq
 1TuEKbknjDx1KSO2tHc9kklilg1CEaAZPJM4F3iEpZo3w2PZrWnjtwbZq
 5BMZnymHdwkVVdfOIXwd1EDm7ZRdmMuRX5hHr+4SJNPpwhD+2JBt4ptkQ
 Nttd8wb29h3EofG/TfStsO0ZDrrdp0p2CCHStQRRG8tw3wZ0SUWKyu1Fn
 Q5HJF8HKYQyArg2SWg2bvhuR/o3IYiiYn0HmGlgUpk9Y2L3U1kD1Fm8Li
 6IUB8/up1JJNxOEyjLcFbKAVWApxy5Z4bL2Zruuha1CfmkIKpiK9fRTkz A==;
X-CSE-ConnectionGUID: M5dssSqaT7ic5DChB+G5HQ==
X-CSE-MsgGUID: 53I2jEAkQRq5lj0FxvlxZw==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="18582076"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="18582076"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 03:08:21 -0700
X-CSE-ConnectionGUID: xwzqLzyAQOaZA3Qiss1Lgw==
X-CSE-MsgGUID: Oi+QZHEeSxOcQq4QieQHFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="39456877"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.94.248.185])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 03:08:20 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 4/4] drm/xe/vf: Ignore force-wake requests if VF
Date: Tue, 11 Jun 2024 12:07:57 +0200
Message-Id: <20240611100757.1856-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240611100757.1856-1-michal.wajdeczko@intel.com>
References: <20240611100757.1856-1-michal.wajdeczko@intel.com>
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

The control and ack force-wake registers are not accessible for
the VF drivers. To avoid changing existing code logic that tracks
woken domains, simply ignore all attempts to access control or ack
registers if we are running as a VF driver.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 6967efdfd01c..ea391ffb07bd 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -12,6 +12,7 @@
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_mmio.h"
+#include "xe_sriov.h"
 
 #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
 
@@ -101,6 +102,9 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 
 static void __domain_ctl(struct xe_gt *gt, struct xe_force_wake_domain *domain, bool wake)
 {
+	if (IS_SRIOV(gt_to_xe(gt)))
+		return;
+
 	xe_mmio_write32(gt, domain->reg_ctl, domain->mask | (wake ? domain->val : 0));
 }
 
@@ -109,6 +113,9 @@ static int __domain_wait(struct xe_gt *gt, struct xe_force_wake_domain *domain,
 	u32 value;
 	int ret;
 
+	if (IS_SRIOV(gt_to_xe(gt)))
+		return 0;
+
 	ret = xe_mmio_wait32(gt, domain->reg_ack, domain->val, wake ? domain->val : 0,
 			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
 			     &value, true);
-- 
2.43.0

