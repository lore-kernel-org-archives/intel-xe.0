Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39EBCF9C6B
	for <intel-xe@archiver.kernel.org>; Tue, 24 Sep 2024 11:58:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8508110E8AA;
	Tue, 24 Sep 2024 11:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J5Z5l6SY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A140610E898
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Sep 2024 11:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727179108; x=1758715108;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LrZC7M63v+xMpdVp2Edh3sp8q2L5It21drKSQT/Hmoo=;
 b=J5Z5l6SYM910e5USJqkU2hax+ghUWXrJ/4gXwmDwAHLYrDpjg0v9+A6a
 PoUT7i/rQxhOI1opsIZDbKgJmNR+L7PO1vBnT2Iw5YTQzHjChfYDH//UC
 Q306iS0vf8weCff28GWq9nILRN9rfxeUu0/WXfWqTHFFFPrTadKVjfvQq
 P/g7z+5428v/e+6xgTqAPBSIVlyU5P0Yp9ulvanOTyqPHh4E1+bZt/6Hz
 qRlKkthUTDAJ0PzEmxhoOmfGMkvNn8OrJDGWI1XSbtuDdt6HlVuS7FrtN
 WR52CuIEglD7WQJP5145ebd3EmFiHPeETAiibFGDSM96N8hG+5005vyI7 w==;
X-CSE-ConnectionGUID: gauzZsHhRPihDO8WfatxKw==
X-CSE-MsgGUID: E+Q4tjQZRP6jl2CMv1rPFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="29957007"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="29957007"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 04:58:28 -0700
X-CSE-ConnectionGUID: Ckq/1FGqTja+gRwrPBy3ww==
X-CSE-MsgGUID: B93siLhiTQCFDkUPfgLb1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="76319078"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa004.jf.intel.com with ESMTP; 24 Sep 2024 04:58:25 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v5 01/23] drm/xe: Error handling in xe_force_wake_get()
Date: Tue, 24 Sep 2024 17:46:19 +0530
Message-Id: <20240924121641.1045763-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240924121641.1045763-1-himal.prasad.ghimiray@intel.com>
References: <20240924121641.1045763-1-himal.prasad.ghimiray@intel.com>
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

v5
- Use unsigned int for return (MattB/Badal/Rodrigo)
- use xe_gt_WARN for domain awake ack failure (Badal/Rodrigo)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 37 +++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_force_wake.h |  4 ++--
 2 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index a64c14757c84..d190aa93be90 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -150,28 +150,49 @@ static int domain_sleep_wait(struct xe_gt *gt,
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
+unsigned int xe_force_wake_get(struct xe_force_wake *fw,
+			       enum xe_force_wake_domains domains)
 {
 	struct xe_gt *gt = fw->gt;
 	struct xe_force_wake_domain *domain;
-	enum xe_force_wake_domains tmp, woken = 0;
+	unsigned int tmp, ret, awake_rqst = 0, awake_failed = 0;
 	unsigned long flags;
-	int ret = 0;
 
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
+			fw->awake_domains |= BIT(domain->id);
+		} else {
+			awake_failed |= BIT(domain->id);
+			--domain->ref;
+		}
 	}
-	fw->awake_domains |= woken;
+	ret = (domains & ~awake_failed);
 	spin_unlock_irqrestore(&fw->lock, flags);
 
+	xe_gt_WARN(gt, awake_failed, "domain%s %#x failed to acknowledgment awake\n",
+		   str_plural(hweight_long(awake_failed)), awake_failed);
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index a2577672f4e3..6c1ade39139b 100644
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
 
-- 
2.34.1

