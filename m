Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FF2CAC593
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 17:56:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3FFE10E4E7;
	Tue, 17 Sep 2024 17:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UpJdi8ei";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1588610E4E6
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 17:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726595783; x=1758131783;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Oom+fMokLNgH+tP8au3OG3Xg2Tzb27TuqLambCxfVdU=;
 b=UpJdi8eivHXDyIIjYJeVQRZ6OBQEMaMi8TauaMq46Pmt0S4Q6Ewt3KvX
 JRJc7Asaw05bj24seBgz8fSsJurYkeGg68TO+79A4n2nuBpT+zt/Ra7WZ
 3GLkfq+a2JTOczBw/jB5HMEMOtreUuLo5HHbSaRDwSj6Xp/MQa82egVtW
 ENVRYrrMoPXMVwAZhaFldwXolHCUCOUaFIBFbTSIeREYTjH6MSFPoiRiL
 7UoxHiasvyVVJaRdRNKi+/tq/odyG/LrDoPSUcwxF+H4D1vC42x/eyKft
 irFBOZ5o65SCtyOXng3ei+A4zObCW7C3Mc6s7fnM1drLnBEXqOrSVF8tQ w==;
X-CSE-ConnectionGUID: 32qx7CYcQ+mZzATexanDww==
X-CSE-MsgGUID: MD7zQHvMTj6B4BRqpgGwYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="13561992"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="13561992"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 10:56:23 -0700
X-CSE-ConnectionGUID: fTdhY2l8Qvuo9cTaLH35hQ==
X-CSE-MsgGUID: 6ygn70kKQEi5l5E+EoLDCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="68926392"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa007.fm.intel.com with ESMTP; 17 Sep 2024 10:56:21 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v4 01/23] drm/xe: Error handling in xe_force_wake_get()
Date: Tue, 17 Sep 2024 23:44:03 +0530
Message-Id: <20240917181425.515871-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240917181425.515871-1-himal.prasad.ghimiray@intel.com>
References: <20240917181425.515871-1-himal.prasad.ghimiray@intel.com>
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

If an acknowledgment timeout occurs for a domain awake request, do not
increment the reference count for the domain. This ensures that
subsequent _get calls do not incorrectly assume the domain is awake. The
return value is a mask of domains whose reference counts were
incremented, and these domains need to be released using
xe_force_wake_put.

The caller needs to compare the return value with the input domains to
determine the success or failure of the operation and decide whether to
continue or return accordingly.

While at it, add simple kernel-doc for xe_force_wake_get()

v3
- Use explicit type for mask (Michal/Badal)
- Improve kernel-doc (Michal)
- Use unsigned int instead of abusing enum (Michal)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c       | 37 +++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_force_wake.h       |  4 +--
 drivers/gpu/drm/xe/xe_force_wake_types.h |  2 ++
 3 files changed, 33 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index a64c14757c84..bc0cb988e12f 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -150,26 +150,47 @@ static int domain_sleep_wait(struct xe_gt *gt,
 					 (ffs(tmp__) - 1))) && \
 					 domain__->reg_ctl.addr)
 
-int xe_force_wake_get(struct xe_force_wake *fw,
-		      enum xe_force_wake_domains domains)
+/**
+ * xe_force_wake_get() : Increase the domain refcount
+ * @fw: struct xe_force_wake
+ * @domains: forcewake domains to get refcount on
+ *
+ * This function takes references for the input @domains and wakes them if
+ * they are asleep.
+ *
+ * Return: mask of refcount increased domains. If the return value is
+ * equal to the input parameter @domains, the operation is considered
+ * successful. Otherwise, the operation is considered a failure, and
+ * the caller should handle the failure case, potentially returning
+ * -ETIMEDOUT.
+ */
+xe_wakeref_t xe_force_wake_get(struct xe_force_wake *fw,
+			       enum xe_force_wake_domains domains)
 {
 	struct xe_gt *gt = fw->gt;
 	struct xe_force_wake_domain *domain;
-	enum xe_force_wake_domains tmp, woken = 0;
+	unsigned int tmp, awake_rqst = 0, awake_ack = 0;
 	unsigned long flags;
-	int ret = 0;
+	xe_wakeref_t ret;
 
+	ret = domains;
 	spin_lock_irqsave(&fw->lock, flags);
 	for_each_fw_domain_masked(domain, domains, fw, tmp) {
 		if (!domain->ref++) {
-			woken |= BIT(domain->id);
+			awake_rqst |= BIT(domain->id);
 			domain_wake(gt, domain);
 		}
 	}
-	for_each_fw_domain_masked(domain, woken, fw, tmp) {
-		ret |= domain_wake_wait(gt, domain);
+	for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
+		if (domain_wake_wait(gt, domain) == 0) {
+			awake_ack |= BIT(domain->id);
+		} else {
+			ret &= ~BIT(domain->id);
+			--domain->ref;
+		}
 	}
-	fw->awake_domains |= woken;
+
+	fw->awake_domains |= awake_ack;
 	spin_unlock_irqrestore(&fw->lock, flags);
 
 	return ret;
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index a2577672f4e3..3ac686519a4e 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -15,8 +15,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt,
 			   struct xe_force_wake *fw);
 void xe_force_wake_init_engines(struct xe_gt *gt,
 				struct xe_force_wake *fw);
-int xe_force_wake_get(struct xe_force_wake *fw,
-		      enum xe_force_wake_domains domains);
+xe_wakeref_t xe_force_wake_get(struct xe_force_wake *fw,
+			       enum xe_force_wake_domains domains);
 int xe_force_wake_put(struct xe_force_wake *fw,
 		      enum xe_force_wake_domains domains);
 
diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
index ed0edc2cdf9f..7dc514ee9825 100644
--- a/drivers/gpu/drm/xe/xe_force_wake_types.h
+++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
@@ -11,6 +11,8 @@
 
 #include "regs/xe_reg_defs.h"
 
+typedef unsigned int xe_wakeref_t;
+
 enum xe_force_wake_domain_id {
 	XE_FW_DOMAIN_ID_GT = 0,
 	XE_FW_DOMAIN_ID_RENDER,
-- 
2.34.1

