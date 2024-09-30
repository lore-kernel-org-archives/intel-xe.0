Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEE6CF6497
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 05:13:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F2B10E2C8;
	Mon, 30 Sep 2024 05:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TD3Cw/oq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1506610E2CA
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 05:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727673214; x=1759209214;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=55cSqsWGQ0UtnWc6HP2OoG9N2IlDSf7kRM3sid8QDjc=;
 b=TD3Cw/oq204zwCR/l7lv9lzDyWM5cJ/9vm757simPUQmnkHQK/WTNKzy
 K1Wz92AaaG/2BPEXgHiNvoFFUu7uccl50At+7O7CpBdjwBRmJZhqwqS4n
 qqkMuK/fc04ejGhdY7LIB/CozD0n5hd3MUOsUeF5wxuWxmgALaUcaLqrP
 DylG9Xf4yV7h1/Oo/GKh+fNjyGq8h9EsDjt8mu9Ur2Ku5Z9xuLVOYBBuy
 LfwyGV83V9DnnffEUsceOkhPDF+TeyFxii/9nR1grZkmcHbc9FSDm8RYs
 Ej7e+U7/bw+9bU8fmW6knvKJJGjV9xSRQBdtTpKF2lUZLKrWAHId88ui/ A==;
X-CSE-ConnectionGUID: KmQy1g+7SeS7HCCzEvR2RA==
X-CSE-MsgGUID: TzsbpwzzQB+sUVW1lnBBnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="14367955"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="14367955"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2024 22:13:34 -0700
X-CSE-ConnectionGUID: pfSRdbd3T4eIgU5j55E6Kw==
X-CSE-MsgGUID: 6HggRjgBTW+7/fVww+QHtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="72752127"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa006.fm.intel.com with ESMTP; 29 Sep 2024 22:13:31 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v6 04/25] drm/xe: Modify xe_force_wake_put to handle _get
 returned mask
Date: Mon, 30 Sep 2024 11:01:28 +0530
Message-Id: <20240930053149.1246339-5-himal.prasad.ghimiray@intel.com>
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
index 7f358e42c5d4..372ea43b0d06 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -211,26 +211,40 @@ unsigned int xe_force_wake_get(struct xe_force_wake *fw,
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
index eb638128952d..b5a75544d86a 100644
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

