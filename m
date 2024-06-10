Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EA1C27C5E
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 18:38:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12AD410E37B;
	Mon, 10 Jun 2024 18:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lW4WiYai";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC7110E37B
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 18:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718044693; x=1749580693;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wJSBJ6Kp+mu09iA9sa/OOqqANCwCLLocwAU+oehHJy8=;
 b=lW4WiYai7IRZDt5y7yr5/s4LTqKmm2dNA0mWzZyhOpFJJbYEoTRt9AvO
 82UZuxt2csSaDP9JOf6VYJ8lgQVwaHb4RkIG6ndGXtvU0z2dMNfe4RFh9
 toyPAFI93Ix+/2bhcQjQUCw/vPqKUe0cc2oItN/B8kvatijHytp984Nyx
 10c3wrmKFdVrWd+DIMXceXJo8yeMvtgiYtlUpmxtgFECaVuBFlAN1Zo5D
 jOT3CPDCXsJOpImdF8SlpeKoHCaoC3MgdX66PbV+Qge9HeRzquQNJwgv3
 Q81tlToCpCvdRu7HTY10SUDdFTz6tUxOcgz3mWxbGioRfABSdNVixDQY1 A==;
X-CSE-ConnectionGUID: 4lXx5/58SLu0s64eURKm7g==
X-CSE-MsgGUID: ZUGd5wlkRxe00oM/ArhEDQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14846258"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14846258"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 11:38:13 -0700
X-CSE-ConnectionGUID: vE4P01NxT+CO1nv4UzeVbg==
X-CSE-MsgGUID: VhhKH1KwSU65ShCkyY7v/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="43726877"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 11:38:12 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/4] drm/xe: Include additional info on failed force-wake
 operation
Date: Mon, 10 Jun 2024 20:37:55 +0200
Message-Id: <20240610183757.1812-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240610183757.1812-1-michal.wajdeczko@intel.com>
References: <20240610183757.1812-1-michal.wajdeczko@intel.com>
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

For debug purposes it might be useful to look at the values of the
force-wake ack registers in case wake/sleep operations failures.

Move xe_gt_notice() from the caller to the helper function, where
we have the latest value of force-wake ack register available.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 35 ++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 2497f0f65aa0..a1d97cce3d56 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -102,9 +102,17 @@ static void domain_wake(struct xe_gt *gt, struct xe_force_wake_domain *domain)
 static int domain_wake_wait(struct xe_gt *gt,
 			    struct xe_force_wake_domain *domain)
 {
-	return xe_mmio_wait32(gt, domain->reg_ack, domain->val, domain->val,
-			      XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
-			      NULL, true);
+	u32 value;
+	int ret;
+
+	ret = xe_mmio_wait32(gt, domain->reg_ack, domain->val, domain->val,
+			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
+			     &value, true);
+	if (ret)
+		xe_gt_notice(gt, "Force wake domain %d failed to ack wake (%pe) reg[%#x] = %#x\n",
+			     domain->id, ERR_PTR(ret), domain->reg_ack.addr, value);
+
+	return ret;
 }
 
 static void domain_sleep(struct xe_gt *gt, struct xe_force_wake_domain *domain)
@@ -115,9 +123,18 @@ static void domain_sleep(struct xe_gt *gt, struct xe_force_wake_domain *domain)
 static int domain_sleep_wait(struct xe_gt *gt,
 			     struct xe_force_wake_domain *domain)
 {
-	return xe_mmio_wait32(gt, domain->reg_ack, domain->val, 0,
-			      XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
-			      NULL, true);
+	u32 value;
+	int ret;
+
+	ret = xe_mmio_wait32(gt, domain->reg_ack, domain->val, 0,
+			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
+			     &value, true);
+
+	if (ret)
+		xe_gt_notice(gt, "Force wake domain %d failed to ack sleep (%pe) reg[%#x] = %#x\n",
+			     domain->id, ERR_PTR(ret), domain->reg_ack.addr, value);
+
+	return ret;
 }
 
 #define for_each_fw_domain_masked(domain__, mask__, fw__, tmp__) \
@@ -145,9 +162,6 @@ int xe_force_wake_get(struct xe_force_wake *fw,
 	for_each_fw_domain_masked(domain, woken, fw, tmp) {
 		ret = domain_wake_wait(gt, domain);
 		ret2 |= ret;
-		if (ret)
-			xe_gt_notice(gt, "Force wake domain (%d) failed to ack wake, ret=%d\n",
-				     domain->id, ret);
 	}
 	fw->awake_domains |= woken;
 	spin_unlock_irqrestore(&fw->lock, flags);
@@ -174,9 +188,6 @@ int xe_force_wake_put(struct xe_force_wake *fw,
 	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
 		ret = domain_sleep_wait(gt, domain);
 		ret2 |= ret;
-		if (ret)
-			xe_gt_notice(gt, "Force wake domain (%d) failed to ack sleep, ret=%d\n",
-				     domain->id, ret);
 	}
 	fw->awake_domains &= ~sleep;
 	spin_unlock_irqrestore(&fw->lock, flags);
-- 
2.43.0

