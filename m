Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72CACFC501
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 07:37:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A260B10E3A7;
	Mon, 14 Oct 2024 07:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nerq1bfE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD4F710E3A7
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Oct 2024 07:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728891448; x=1760427448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VuKiFktvdp/r8CRYbqfaDr7UW10r4ggT7eSxrOwePtY=;
 b=nerq1bfEI7mniMpRGKrc9mc0QH11iNhVtY4H+6F93GMrPNL2Fw2xTSxw
 /KR8hMXW/y4EzlZVghO6O5ZgMSyyGLjV5/gx4KH93jGm040o/cTJTaXfM
 QdhIOEvzgwcHt2TkUZNc2BbtHxmMFsLD65H9VRUN+ltlBVLmyBThdhSoJ
 48dOI6it79LD9c3q0iFpHy8tQ2Wh3nQ2l7/+tL3Za99Xq4veea0g4I70t
 xjInTtnKy0ZubXIcyvF74PdK2y8F2IXy0qDUc4/5BXAMlXdcGv9qpz391
 lqDpIegGhBmfXfBVEH9FdUCdqIauf53ddA7i/bHk0vNo4e6RT/8GI8lVo Q==;
X-CSE-ConnectionGUID: 6Hv3lSTdSCu2c7+eS14ZXw==
X-CSE-MsgGUID: Moh3/h9iQSOTMY46jS4alg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="27686735"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="27686735"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 00:37:28 -0700
X-CSE-ConnectionGUID: Mz2uKcUrTR2i3bgAckTK6A==
X-CSE-MsgGUID: SKDx0kmkRFitHe39+ssJtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="82268606"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa005.jf.intel.com with ESMTP; 14 Oct 2024 00:37:26 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v9 04/26] drm/xe: Error handling in xe_force_wake_get()
Date: Mon, 14 Oct 2024 13:25:39 +0530
Message-Id: <20241014075601.2324382-5-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
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

If an acknowledgment timeout occurs for a forcewake domain awake
request, do not increment the reference count for the domain. This
ensures that subsequent _get calls do not incorrectly assume the domain
is awake. The return value is a mask of domains that got refcounted,
and these domains need to be provided for subsequent xe_force_wake_put
call.

While at it, add simple kernel-doc for xe_force_wake_get()

v3
- Use explicit type for mask (Michal/Badal)
- Improve kernel-doc (Michal)
- Use unsigned int instead of abusing enum (Michal)

v5
- Use unsigned int for return (MattB/Badal/Rodrigo)
- use xe_gt_WARN for domain awake ack failure (Badal/Rodrigo)

v6
- Change XE_FORCEWAKE_ALL to single bit, this helps accommodate
actually refcounted domains in return. (Michal)
- Modify commit message and warn message (Badal)
- Remove unnecessary information in kernel-doc (Michal)

v7
- Add assert condition for valid input domains (Badal)

v9
- Update kernel-doc and simplify conditions (Michal)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c       | 52 +++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_force_wake.h       |  4 +-
 drivers/gpu/drm/xe/xe_force_wake_types.h |  2 +-
 3 files changed, 45 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index ac0419da7173..d36ed4f8bdbe 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -154,29 +154,61 @@ static int domain_sleep_wait(struct xe_gt *gt,
 					 (ffs(tmp__) - 1))) && \
 					 domain__->reg_ctl.addr)
 
-int xe_force_wake_get(struct xe_force_wake *fw,
-		      enum xe_force_wake_domains domains)
+/**
+ * xe_force_wake_get() : Increase the domain refcount
+ * @fw: struct xe_force_wake
+ * @domains: forcewake domains to get refcount on
+ *
+ * This function wakes up @domains if they are asleep and takes references.
+ * If requested domain is XE_FORCEWAKE_ALL then only applicable/initialized
+ * domains will be considered for refcount and it is a caller responsibility
+ * to check returned ref if it includes any specific domain by using
+ * xe_force_wake_ref_has_domain() function. Caller must call
+ * xe_force_wake_put() function to decrease incremented refcounts.
+ *
+ * Return: opaque reference to woken domains or zero if none of requested
+ * domains were awake.
+ */
+unsigned int xe_force_wake_get(struct xe_force_wake *fw,
+			       enum xe_force_wake_domains domains)
 {
 	struct xe_gt *gt = fw->gt;
 	struct xe_force_wake_domain *domain;
-	enum xe_force_wake_domains tmp, woken = 0;
+	unsigned int ref_incr = 0, awake_rqst = 0, awake_failed = 0;
+	unsigned int tmp, ref_rqst;
 	unsigned long flags;
-	int ret = 0;
 
+	xe_gt_assert(gt, is_power_of_2(domains));
+	xe_gt_assert(gt, domains <= XE_FORCEWAKE_ALL);
+	xe_gt_assert(gt, domains == XE_FORCEWAKE_ALL || fw->initialized_domains & domains);
+
+	ref_rqst = (domains == XE_FORCEWAKE_ALL) ? fw->initialized_domains : domains;
 	spin_lock_irqsave(&fw->lock, flags);
-	for_each_fw_domain_masked(domain, domains, fw, tmp) {
+	for_each_fw_domain_masked(domain, ref_rqst, fw, tmp) {
 		if (!domain->ref++) {
-			woken |= BIT(domain->id);
+			awake_rqst |= BIT(domain->id);
 			domain_wake(gt, domain);
 		}
+		ref_incr |= BIT(domain->id);
 	}
-	for_each_fw_domain_masked(domain, woken, fw, tmp) {
-		ret |= domain_wake_wait(gt, domain);
+	for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
+		if (domain_wake_wait(gt, domain) == 0) {
+			fw->awake_domains |= BIT(domain->id);
+		} else {
+			awake_failed |= BIT(domain->id);
+			--domain->ref;
+		}
 	}
-	fw->awake_domains |= woken;
+	ref_incr &= ~awake_failed;
 	spin_unlock_irqrestore(&fw->lock, flags);
 
-	return ret;
+	xe_gt_WARN(gt, awake_failed, "Forcewake domain%s %#x failed to acknowledge awake request\n",
+		   str_plural(hweight_long(awake_failed)), awake_failed);
+
+	if (domains == XE_FORCEWAKE_ALL && ref_incr == fw->initialized_domains)
+		ref_incr |= XE_FORCEWAKE_ALL;
+
+	return ref_incr;
 }
 
 int xe_force_wake_put(struct xe_force_wake *fw,
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 1608a55edc84..75fa1a19797c 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -15,8 +15,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt,
 			   struct xe_force_wake *fw);
 void xe_force_wake_init_engines(struct xe_gt *gt,
 				struct xe_force_wake *fw);
-int xe_force_wake_get(struct xe_force_wake *fw,
-		      enum xe_force_wake_domains domains);
+unsigned int xe_force_wake_get(struct xe_force_wake *fw,
+			       enum xe_force_wake_domains domains);
 int xe_force_wake_put(struct xe_force_wake *fw,
 		      enum xe_force_wake_domains domains);
 
diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
index fde17dc3d01e..899fbbcb3ea9 100644
--- a/drivers/gpu/drm/xe/xe_force_wake_types.h
+++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
@@ -48,7 +48,7 @@ enum xe_force_wake_domains {
 	XE_FW_MEDIA_VEBOX2	= BIT(XE_FW_DOMAIN_ID_MEDIA_VEBOX2),
 	XE_FW_MEDIA_VEBOX3	= BIT(XE_FW_DOMAIN_ID_MEDIA_VEBOX3),
 	XE_FW_GSC		= BIT(XE_FW_DOMAIN_ID_GSC),
-	XE_FORCEWAKE_ALL	= BIT(XE_FW_DOMAIN_ID_COUNT) - 1
+	XE_FORCEWAKE_ALL	= BIT(XE_FW_DOMAIN_ID_COUNT)
 };
 
 /**
-- 
2.34.1

