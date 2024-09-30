Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764C7CF6497
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 05:13:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412A010E2C7;
	Mon, 30 Sep 2024 05:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CCU4uR3p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809CF10E2C7
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 05:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727673212; x=1759209212;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RmNDGSn8nMKi1dNmIvIW5C7siYdwrwfEHmrr5R3wgSE=;
 b=CCU4uR3pjHme2V6N14XsTSM4rzyFkvmn8cjjExTESyROFSz1G0LYzjyy
 sq4TpaWHCW/lg4NU6aM7g7Ks/HgakyP+5X/+nBKoCZ7N3yJFxUX4Hj8wy
 gWIvkB68H5aN93x+lTdoKqLGIf/H2PC/BRiN2J9u6irg2NpKcX3bnL+9T
 p93wLJlspWLn+jmi5RH2kiHLiHPnSLallz0A930Yh72tZu1N+1Xfl628i
 Im61hCp1io0V4XvXojq4RYVmzKlpLSHhBVtqHoNA9/yD+KRcWZMkmv28G
 g09UvjJogqIdSClQUs7Bn4QmJjYTB5AzlEaDHmOTahkif3DxZFj0VSKvv Q==;
X-CSE-ConnectionGUID: ZUmTrx6RRj22GqpKaH5oLA==
X-CSE-MsgGUID: N399g9oXQHqpd8R/qkhAgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="14367953"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="14367953"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2024 22:13:32 -0700
X-CSE-ConnectionGUID: IsZeqloORiKaKNrQKDdejg==
X-CSE-MsgGUID: 4ZZOyUmoQV6Qbuis05S7RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="72752110"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa006.fm.intel.com with ESMTP; 29 Sep 2024 22:13:29 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v6 03/25] drm/xe: Error handling in xe_force_wake_get()
Date: Mon, 30 Sep 2024 11:01:27 +0530
Message-Id: <20240930053149.1246339-4-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
References: <20240930053149.1246339-1-himal.prasad.ghimiray@intel.com>
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

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c       | 45 ++++++++++++++++++------
 drivers/gpu/drm/xe/xe_force_wake.h       |  4 +--
 drivers/gpu/drm/xe/xe_force_wake_types.h |  2 +-
 3 files changed, 38 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 5ce9e912818a..7f358e42c5d4 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -160,29 +160,54 @@ static int domain_sleep_wait(struct xe_gt *gt,
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
+ * they are asleep.If requested domain is ALL then only
+ * applicable/initialized domains will be considered for refcount and it is
+ * a caller responsibilty to check returned ref if it includes any specific
+ * domain by using xe_force_wake_ref_has_domain() function. caller must call
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
+	return (ref_incr == fw->initialized_domains) ? ref_incr | XE_FORCEWAKE_ALL : ref_incr;
 }
 
 int xe_force_wake_put(struct xe_force_wake *fw,
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index de720881a300..eb638128952d 100644
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

