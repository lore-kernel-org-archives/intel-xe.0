Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB261CED270
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 06:52:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C00310E476;
	Tue,  8 Oct 2024 06:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iVdJtAya";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233D510E476
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 06:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728370375; x=1759906375;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nIJSyusOOlwO0qXXVjdMisgivS+tMZ/euRFj3b9XFgM=;
 b=iVdJtAyaKoY/548K6MCnzhTbXroxFjvojy7Lou5U4vo+64Us+E6mJX61
 v1uCWwjcybde8qsvSf4IeQ7WX+OhhYYKlC0nwj0F7AMb05L8Z3Lp3mg7z
 qA4euRmtI2TIui9fry+6tudfPnBa6ZuFXVftfkN+W+PVzoWGxb59wD12G
 SL5UgyHhrTT5o5o5dX2DoLB/YjN70YMtAtptGHSI8JGIl5LXPc2lVaRru
 R+SU611fFUvOihxLmcdSfaxofeL3wxL6NMFQ4MuMzmnXF7zi0FRi0p868
 JUHIPvz2ch1UtifG+7ZhntUiLqLVYkDUP8x6WrogDRkY7M48lqGvFaFwG A==;
X-CSE-ConnectionGUID: tbtFjv18RQGIsMILHvLjIA==
X-CSE-MsgGUID: 3GAPEUBgRmm/VP76ta+7RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="31430394"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="31430394"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 23:52:55 -0700
X-CSE-ConnectionGUID: yH1ry6OtQwWZwpXwjERwhg==
X-CSE-MsgGUID: mAxt362oTYSeLvi92sFE0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="106577680"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa002.jf.intel.com with ESMTP; 07 Oct 2024 23:52:53 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v8 05/26] drm/xe: Modify xe_force_wake_put to handle _get
 returned mask
Date: Tue,  8 Oct 2024 12:40:54 +0530
Message-Id: <20241008071115.1862704-6-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
References: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
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

Instead of calling xe_force_wake_put on all domains that were input to
xe_force_wake_get, call _put only on the domains whose reference counts
were successfully incremented by the _get call. Since the return value
of _get can be a mask that does not match any specific value in the enum
xe_force_wake_domains, change the input parameter of _put to unsigned int.

v3
- Move WARN to this patch (Badal)
- use xe_gt_WARN instead of XE_WARN (Michal)
- Stop using xe_force_wake_domains for non enum values.
- Remove kernel-doc from this patch (Badal)

-v5
- Fix global awake_domain

-v6
- put all initialized domains in case of FORCEWAKE_ALL.
- Modify ret variable name (Michal)
- Modify input var name (Michal)
- Modify commit message and warn (Badal)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 28 +++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_force_wake.h |  2 +-
 2 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index bfba276c48ac..7ff2588a8c47 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -213,26 +213,40 @@ unsigned int xe_force_wake_get(struct xe_force_wake *fw,
 }
 
 int xe_force_wake_put(struct xe_force_wake *fw,
-		      enum xe_force_wake_domains domains)
+		      unsigned int fw_ref)
 {
 	struct xe_gt *gt = fw->gt;
 	struct xe_force_wake_domain *domain;
-	enum xe_force_wake_domains tmp, sleep = 0;
+	unsigned int tmp, sleep = 0;
 	unsigned long flags;
-	int ret = 0;
+	int ack_fail = 0;
+
+	/*
+	 * Avoid unnecessary lock and unlock when the function is called
+	 * in error path of individual domains.
+	 */
+	if (!fw_ref)
+		return 0;
+
+	if (fw_ref == XE_FORCEWAKE_ALL)
+		fw_ref = fw->initialized_domains;
 
 	spin_lock_irqsave(&fw->lock, flags);
-	for_each_fw_domain_masked(domain, domains, fw, tmp) {
+	for_each_fw_domain_masked(domain, fw_ref, fw, tmp) {
 		if (!--domain->ref) {
 			sleep |= BIT(domain->id);
 			domain_sleep(gt, domain);
 		}
 	}
 	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
-		ret |= domain_sleep_wait(gt, domain);
+		if (domain_sleep_wait(gt, domain) == 0)
+			fw->awake_domains &= ~BIT(domain->id);
+		else
+			ack_fail |= BIT(domain->id);
 	}
-	fw->awake_domains &= ~sleep;
 	spin_unlock_irqrestore(&fw->lock, flags);
 
-	return ret;
+	xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to acknowledge sleep request\n",
+		   str_plural(hweight_long(ack_fail)), ack_fail);
+	return ack_fail;
 }
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 75fa1a19797c..f0b27dbe7581 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -18,7 +18,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
 unsigned int xe_force_wake_get(struct xe_force_wake *fw,
 			       enum xe_force_wake_domains domains);
 int xe_force_wake_put(struct xe_force_wake *fw,
-		      enum xe_force_wake_domains domains);
+		      unsigned int fw_ref);
 
 static inline int
 xe_force_wake_ref(struct xe_force_wake *fw,
-- 
2.34.1

