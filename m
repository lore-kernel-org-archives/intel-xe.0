Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C38FCAC595
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 17:56:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D00B10E4E6;
	Tue, 17 Sep 2024 17:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K8/UQCdC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBD010E4E6
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 17:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726595786; x=1758131786;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uLLzof7wJbX0Scgab6FYVGlIHKKo7wUSRBZ8/ZzM46E=;
 b=K8/UQCdCchu+ZidN598fXIl8aDGOF6EcF6YSDcU7FULixor3qj0Ho20E
 hFLYLKG7hKh4C3Q7rly0FFyTFZZQZhV95btMbJY5DFLVC4AWD70oZSlP2
 7rPswncxetnjQl3J3dg5ossyONlVArJStevz4GYgsyJtGfNbtUB62/7Yr
 mTlJemZCVOFZq/rVhHN+XmRIeMEroT9cAtR1pfNgSGaqKNuuPP/cvGkK6
 BLHd9VccwkCR+a0Q/O08iye+ElVRo0ypMqMKy8Z/r4QEKaK7vwUveHKzj
 N1RtwWovyFBpmmNKjE4trrbmdZUE1bQW+YQHV6OVqtBAiURUiyzNtlsIR g==;
X-CSE-ConnectionGUID: IhsvtfMqQDioyLZKKw2MgA==
X-CSE-MsgGUID: GsFrrppSQEW4TDxncoHhsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="13561993"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="13561993"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 10:56:26 -0700
X-CSE-ConnectionGUID: 7Zzsj2UzSh2UbfuZrA6lNA==
X-CSE-MsgGUID: LBS04OI/RY6nFD7Q1ZeS2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="68926403"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa007.fm.intel.com with ESMTP; 17 Sep 2024 10:56:23 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v4 02/23] drm/xe: Modify xe_force_wake_put to handle _get
 returned mask
Date: Tue, 17 Sep 2024 23:44:04 +0530
Message-Id: <20240917181425.515871-3-himal.prasad.ghimiray@intel.com>
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

Instead of calling xe_force_wake_put on all domains that were input to
xe_force_wake_get, call _put only on the domains whose reference counts
were successfully incremented by the _get call. Since the return value
of _get can be a mask that does not match any specific value in the enum
xe_force_wake_domains, change the input parameter of _put to xe_wakeref_t.

v3
- Move WARN to this patch (Badal)
- use xe_gt_WARN instead of XE_WARN (Michal)
- Stop using xe_force_wake_domains for non enum values.
- Remove kernel-doc from this patch (Badal)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 18 ++++++++++++++----
 drivers/gpu/drm/xe/xe_force_wake.h |  2 +-
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index bc0cb988e12f..802e5927dd81 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -197,26 +197,36 @@ xe_wakeref_t xe_force_wake_get(struct xe_force_wake *fw,
 }
 
 int xe_force_wake_put(struct xe_force_wake *fw,
-		      enum xe_force_wake_domains domains)
+		      xe_wakeref_t domains_mask)
 {
 	struct xe_gt *gt = fw->gt;
 	struct xe_force_wake_domain *domain;
-	enum xe_force_wake_domains tmp, sleep = 0;
+	unsigned int tmp, sleep = 0;
 	unsigned long flags;
 	int ret = 0;
 
+	/*
+	 * Avoid unnecessary lock and unlock when the function is called
+	 * in error path of individual domains.
+	 */
+	if (!domains_mask)
+		return 0;
+
 	spin_lock_irqsave(&fw->lock, flags);
-	for_each_fw_domain_masked(domain, domains, fw, tmp) {
+	for_each_fw_domain_masked(domain, domains_mask, fw, tmp) {
 		if (!--domain->ref) {
 			sleep |= BIT(domain->id);
 			domain_sleep(gt, domain);
 		}
 	}
 	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
-		ret |= domain_sleep_wait(gt, domain);
+		if (domain_sleep_wait(gt, domain))
+			ret |= BIT(domain->id);
 	}
 	fw->awake_domains &= ~sleep;
 	spin_unlock_irqrestore(&fw->lock, flags);
 
+	xe_gt_WARN(gt, ret, "domain%s %#x failed to acknowledgment sleep\n",
+		   str_plural(hweight_long(ret)), ret);
 	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 3ac686519a4e..6c8c46777b79 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -18,7 +18,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
 xe_wakeref_t xe_force_wake_get(struct xe_force_wake *fw,
 			       enum xe_force_wake_domains domains);
 int xe_force_wake_put(struct xe_force_wake *fw,
-		      enum xe_force_wake_domains domains);
+		      xe_wakeref_t domains_mask);
 
 static inline int
 xe_force_wake_ref(struct xe_force_wake *fw,
-- 
2.34.1

