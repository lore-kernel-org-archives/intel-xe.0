Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC66C27C78
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 16:35:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D7F10E13F;
	Tue, 11 Jun 2024 16:35:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yb8vKj6/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3088510E105
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 16:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718123756; x=1749659756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i+TOZnssXx7X9BmjveJNZXs6ePPNjd8EHMl+c7DZxtg=;
 b=Yb8vKj6/RtO31m0YrXc7wm8Io7L4tohK7LZkdelq82fMwXQuwFOTHVvo
 hQY4nklap0m0+/6e3Qel1rDw2I1XZfcwW/R8aaS1Vgdg7vXcg/kIfv8GW
 ilzk/XX0EjOXAxy6WXcVMn8NC3p6hhagtmlYLW5dR2bNQbWjVwBTbRF5b
 4DcQJucEGwaj8d6Z7WqgmokX21NY7u2e6MqUjji5O3BDlAasKVHGdjatA
 5O+DzR8hW9azARXinsCbgqSQlalparM5feBcfVfPmBP68fwNcUxBTna1X
 VspXyuWB5Gu6nrjCTPfp7uunjS5XXhTmDUBQBDJdbYsPsAYxmqHbweyVw g==;
X-CSE-ConnectionGUID: 03z68kUWRS+XjSz+bBm7yQ==
X-CSE-MsgGUID: 8IDDfWNbQQmI6ggmwIBMpw==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="40247882"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="40247882"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 09:35:56 -0700
X-CSE-ConnectionGUID: iZjAEGM8Qna8zVU6/UBJuw==
X-CSE-MsgGUID: 1OwlYjvZTxej1XpyAnZcYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="44388686"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.94.248.185])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 09:35:54 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 3/5] drm/xe: Include additional info on failed force-wake
 operation
Date: Tue, 11 Jun 2024 18:35:35 +0200
Message-Id: <20240611163537.1944-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240611163537.1944-1-michal.wajdeczko@intel.com>
References: <20240611163537.1944-1-michal.wajdeczko@intel.com>
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
v2: remove ret2 (Rodrigo)
---
 drivers/gpu/drm/xe/xe_force_wake.c | 48 +++++++++++++++++-------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 8799a2544648..afbca81c12dd 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -97,9 +97,17 @@ static void domain_wake(struct xe_gt *gt, struct xe_force_wake_domain *domain)
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
@@ -110,9 +118,17 @@ static void domain_sleep(struct xe_gt *gt, struct xe_force_wake_domain *domain)
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
+	if (ret)
+		xe_gt_notice(gt, "Force wake domain %d failed to ack sleep (%pe) reg[%#x] = %#x\n",
+			     domain->id, ERR_PTR(ret), domain->reg_ack.addr, value);
+
+	return ret;
 }
 
 #define for_each_fw_domain_masked(domain__, mask__, fw__, tmp__) \
@@ -128,7 +144,7 @@ int xe_force_wake_get(struct xe_force_wake *fw,
 	struct xe_force_wake_domain *domain;
 	enum xe_force_wake_domains tmp, woken = 0;
 	unsigned long flags;
-	int ret, ret2 = 0;
+	int ret = 0;
 
 	spin_lock_irqsave(&fw->lock, flags);
 	for_each_fw_domain_masked(domain, domains, fw, tmp) {
@@ -138,16 +154,12 @@ int xe_force_wake_get(struct xe_force_wake *fw,
 		}
 	}
 	for_each_fw_domain_masked(domain, woken, fw, tmp) {
-		ret = domain_wake_wait(gt, domain);
-		ret2 |= ret;
-		if (ret)
-			xe_gt_notice(gt, "Force wake domain (%d) failed to ack wake, ret=%d\n",
-				     domain->id, ret);
+		ret |= domain_wake_wait(gt, domain);
 	}
 	fw->awake_domains |= woken;
 	spin_unlock_irqrestore(&fw->lock, flags);
 
-	return ret2;
+	return ret;
 }
 
 int xe_force_wake_put(struct xe_force_wake *fw,
@@ -157,7 +169,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
 	struct xe_force_wake_domain *domain;
 	enum xe_force_wake_domains tmp, sleep = 0;
 	unsigned long flags;
-	int ret, ret2 = 0;
+	int ret = 0;
 
 	spin_lock_irqsave(&fw->lock, flags);
 	for_each_fw_domain_masked(domain, domains, fw, tmp) {
@@ -167,14 +179,10 @@ int xe_force_wake_put(struct xe_force_wake *fw,
 		}
 	}
 	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
-		ret = domain_sleep_wait(gt, domain);
-		ret2 |= ret;
-		if (ret)
-			xe_gt_notice(gt, "Force wake domain (%d) failed to ack sleep, ret=%d\n",
-				     domain->id, ret);
+		ret |= domain_sleep_wait(gt, domain);
 	}
 	fw->awake_domains &= ~sleep;
 	spin_unlock_irqrestore(&fw->lock, flags);
 
-	return ret2;
+	return ret;
 }
-- 
2.43.0

