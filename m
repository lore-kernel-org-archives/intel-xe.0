Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC75C35FFF
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 12:03:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F316210E207;
	Tue, 17 Sep 2024 12:03:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dAbWMfu8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F7C210E207
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 12:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726574600; x=1758110600;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Oom+fMokLNgH+tP8au3OG3Xg2Tzb27TuqLambCxfVdU=;
 b=dAbWMfu8wlL645srTqGNZpCTH5anC9LX1spLtHuiJrbO6jMRl63XJaow
 A1oLARPP6gcr3EtsZFyZ3/GLozRCLzEIlmAuVSNAIdGC/9qhP9t2yB4dR
 o2dxhHAeF4rZO0fzuou2NxmF3eS4x9/upE3tkwUMPZqpmhvD54+9sMB2d
 Z1ouMU9OanNKewjo77BuwK83rQgR3UOMbxe68PDoGzeW1BelXxJH5P1Ok
 wTF5pNVwZoRRV+jmAjWxlojhK3tUnGXhp//kZCXw6WJ8tRGnA2Q9BP7rV
 xdI0L76YgrF/VmS/J7f1xyHQq5+Iib4zqJDqS3OZO7mXZodslw452Vvc2 Q==;
X-CSE-ConnectionGUID: xezAgTz9ShSKsJvSC8J5/g==
X-CSE-MsgGUID: S3DPfh+5QqqDzpAbURwNuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="29210541"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="29210541"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 05:03:20 -0700
X-CSE-ConnectionGUID: SChdffDLRDOSuaCYna4x2Q==
X-CSE-MsgGUID: P6d9kxteSqe2jEEZYfG82A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="69388347"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa010.fm.intel.com with ESMTP; 17 Sep 2024 05:03:17 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v3 01/23] drm/xe: Error handling in xe_force_wake_get()
Date: Tue, 17 Sep 2024 17:51:04 +0530
Message-Id: <20240917122126.438448-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240917122126.438448-1-himal.prasad.ghimiray@intel.com>
References: <20240917122126.438448-1-himal.prasad.ghimiray@intel.com>
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

