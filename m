Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984A7C27C5F
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 18:38:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4732A10E403;
	Mon, 10 Jun 2024 18:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C32mwUny";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534E610E37B
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 18:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718044694; x=1749580694;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KHxqINb/Qe3kixkQXcPVMlSFDJa3Z5GNzQbHsnTM69k=;
 b=C32mwUny26b+r9vwIEYclG0vUR+bNme6ywfjptAxO1HTkpErU25KlX2m
 t+1UVFh4wfIkQSZ65xEulVS1JnVLJfoG2bVVbRFoS8lPsbEXM7qPfQcCH
 X34QyRsbKYZuMuJXG0BySR13MCe5x09KdU1XrXf2UfoXIFjuIQv9Q6JLj
 LP7FOkS0PeV9Tmp4GUkdGm0pyD+qZKR5TekqhWQTSs3+OfaUZqEQTAQNk
 2xW8/GO2oVOXdpBnVfA60xBVeRGFrb6R1AWtOe4zfrAhH6rccaNrF9LDF
 Iy+IUscCO2h4oxLV8cHj0XefWyCXHAUt6Y7iZbDv0FxUGbPlCO6C3ft5i Q==;
X-CSE-ConnectionGUID: oU+6s1mdRW6mgAwltr7Zrg==
X-CSE-MsgGUID: uWN0DYF7Ru6LNPaVwHcNZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14846265"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14846265"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 11:38:14 -0700
X-CSE-ConnectionGUID: 5I+RzRtFTemGNwTjQ3cj3g==
X-CSE-MsgGUID: 080ikAK+QDuqVeeyZC174w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="43726880"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 11:38:13 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 3/4] drm/xe: Combine common force-wake code into helpers
Date: Mon, 10 Jun 2024 20:37:56 +0200
Message-Id: <20240610183757.1812-4-michal.wajdeczko@intel.com>
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

The code of 'control' and 'wait' force-wake operations are very
similar for both 'wake' and 'sleep' cases. Add helpers to maximize
code reuse.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 55 ++++++++++++++++--------------
 1 file changed, 30 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index a1d97cce3d56..b0baa9094418 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -20,6 +20,11 @@ static struct xe_gt *fw_to_gt(struct xe_force_wake *fw)
 	return fw->gt;
 }
 
+static inline const char *str_wake_sleep(bool v)
+{
+	return v ? "wake" : "sleep";
+}
+
 static void domain_init(struct xe_force_wake_domain *domain,
 			enum xe_force_wake_domain_id id,
 			struct xe_reg reg, struct xe_reg ack)
@@ -94,47 +99,47 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 			    FORCEWAKE_ACK_GSC);
 }
 
+static void __domain_ctl(struct xe_gt *gt, struct xe_force_wake_domain *domain, bool wake)
+{
+	xe_mmio_write32(gt, domain->reg_ctl, domain->mask | (wake ? domain->val : 0));
+}
+
+static int __domain_wait(struct xe_gt *gt, struct xe_force_wake_domain *domain, bool wake)
+{
+	u32 value;
+	int ret;
+
+	ret = xe_mmio_wait32(gt, domain->reg_ack, domain->val, wake ? domain->val : 0,
+			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
+			     &value, true);
+	if (ret)
+		xe_gt_notice(gt, "Force wake domain %d failed to ack %s (%pe) reg[%#x] = %#x\n",
+			     domain->id, str_wake_sleep(wake), ERR_PTR(ret),
+			     domain->reg_ack.addr, value);
+
+	return ret;
+}
+
 static void domain_wake(struct xe_gt *gt, struct xe_force_wake_domain *domain)
 {
-	xe_mmio_write32(gt, domain->reg_ctl, domain->mask | domain->val);
+	__domain_ctl(gt, domain, true);
 }
 
 static int domain_wake_wait(struct xe_gt *gt,
 			    struct xe_force_wake_domain *domain)
 {
-	u32 value;
-	int ret;
-
-	ret = xe_mmio_wait32(gt, domain->reg_ack, domain->val, domain->val,
-			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
-			     &value, true);
-	if (ret)
-		xe_gt_notice(gt, "Force wake domain %d failed to ack wake (%pe) reg[%#x] = %#x\n",
-			     domain->id, ERR_PTR(ret), domain->reg_ack.addr, value);
-
-	return ret;
+	return __domain_wait(gt, domain, true);
 }
 
 static void domain_sleep(struct xe_gt *gt, struct xe_force_wake_domain *domain)
 {
-	xe_mmio_write32(gt, domain->reg_ctl, domain->mask);
+	__domain_ctl(gt, domain, false);
 }
 
 static int domain_sleep_wait(struct xe_gt *gt,
 			     struct xe_force_wake_domain *domain)
 {
-	u32 value;
-	int ret;
-
-	ret = xe_mmio_wait32(gt, domain->reg_ack, domain->val, 0,
-			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
-			     &value, true);
-
-	if (ret)
-		xe_gt_notice(gt, "Force wake domain %d failed to ack sleep (%pe) reg[%#x] = %#x\n",
-			     domain->id, ERR_PTR(ret), domain->reg_ack.addr, value);
-
-	return ret;
+	return __domain_wait(gt, domain, false);
 }
 
 #define for_each_fw_domain_masked(domain__, mask__, fw__, tmp__) \
-- 
2.43.0

