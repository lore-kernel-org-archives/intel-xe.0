Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9151CEEE245
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 18:58:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A4D210EC1D;
	Thu, 12 Sep 2024 18:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UgfpsFKv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551EB10EC1B
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 18:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726167493; x=1757703493;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lanb4u1cX0aqWD5j5PKwDB0xQYsjKIvSCNHwKAI4aHE=;
 b=UgfpsFKvJ1Y+ugAonpolINCz21FUMayxazjPi0TRpQ/ordOP2mMykjfE
 xF1st88U0eiDbYAgQAH+G1b7CPtYQQSrRlelClmJ+rdpOyOIIGduFSG9y
 /dH0MhSFLB1PDxt7kxaEaibyOD+USx780UwKjlXuPvBNvUGUlDoXZ3S6U
 QAGIkksTWeQv478JG/WXlRY3l5n54lxSlOsAah0yR88R5SGPMgXiRAtyL
 gTI3yQzizb3Snui1NsEK3ApIBIDPoc6yRDSkVUbq88AOt5GL1NmVQW95u
 QaB4QZH4CvcopQ8XiK7RIemNysOSrKNdPw0+QD2+Gb82VvJ14G1nHmy45 w==;
X-CSE-ConnectionGUID: 0AIFg4ySSoiIN5Rpcd01EQ==
X-CSE-MsgGUID: JmI8iL7qSvabC8PFp/HTjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25202911"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="25202911"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 11:58:04 -0700
X-CSE-ConnectionGUID: Q7hRORouRfWayB4SrG+4xQ==
X-CSE-MsgGUID: 5O2n8LV0SUqwgaf33qD8Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="71910091"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa003.fm.intel.com with ESMTP; 12 Sep 2024 11:58:01 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v2 02/23] drm/xe: Modify xe_force_wake_put to handle _get
 returned mask
Date: Fri, 13 Sep 2024 00:45:42 +0530
Message-Id: <20240912191603.194964-3-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
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
xe_force_wake_domains, change the input parameter of _put to int.

Add kernel-doc for the xe_force_wake_put()

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 24 ++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_force_wake.h |  2 +-
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index fa42d652d23f..e91bbcbddb8b 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -198,8 +198,21 @@ int xe_force_wake_get(struct xe_force_wake *fw,
 	return ret;
 }
 
+/**
+ * xe_force_wake_put - Decrement the refcount and put domain to sleep if refcount becomes 0
+ * @fw: Pointer to the force wake structure
+ * @domains_mask: forcewake domain mask to put reference
+ *
+ * This function reduces the reference counts for specified domain mask. If
+ * refcount for any of the specified domain reaches 0, it puts the domain to sleep
+ * and waits for acknowledgment for domain to sleep within specified timeout.
+ * Ensure this function is always called with return of xe_force_wake_get() as
+ * @domains_mask.
+ *
+ * Returns 0 in case of success or non-zero in case of timeout of ack
+ */
 int xe_force_wake_put(struct xe_force_wake *fw,
-		      enum xe_force_wake_domains domains)
+		      int domains_mask)
 {
 	struct xe_gt *gt = fw->gt;
 	struct xe_force_wake_domain *domain;
@@ -207,8 +220,15 @@ int xe_force_wake_put(struct xe_force_wake *fw,
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
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index a2577672f4e3..e2bb6b03e495 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -18,7 +18,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
 int xe_force_wake_get(struct xe_force_wake *fw,
 		      enum xe_force_wake_domains domains);
 int xe_force_wake_put(struct xe_force_wake *fw,
-		      enum xe_force_wake_domains domains);
+		      int domains_mask);
 
 static inline int
 xe_force_wake_ref(struct xe_force_wake *fw,
-- 
2.34.1

