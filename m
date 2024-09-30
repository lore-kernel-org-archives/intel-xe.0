Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0491BCF649D
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 05:14:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C365610E2C7;
	Mon, 30 Sep 2024 05:14:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FxpG406Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321C610E2CC
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 05:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727673255; x=1759209255;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ngoSLo3IHBMmzVsctStc2Jk6Wz/vHTAw3tTnf07AynY=;
 b=FxpG406Qgg+n22iCex/+aLwc3pMCbtXOVddR8TSrooPx/KjoGiYbwNBr
 uvGliESw515xJkHdvsgGnW13nJRUJRtkW63zweVoSYeGDyeCyY2OgQFFz
 iIvI28yaDl41pSbcH0T+vGgTLh2z2RsATnHM7aArLkkfJHrIg2WGjLQNq
 TBjja1iEWRyUKpWZ//jd2nPWkMYApbQ28aFbivFBKYWwPDo2QfC2itsu3
 +yY+tKmdi4yb4bs45SzNFrDfHmYoaFn32Ht90DiEXwkLE0fEPdpGkZwQ5
 e2Gg06Gp96DBdT/OKb+Zqyyt8mpHI/OlyceaVG4trA3X+pbgSRGia6NrW w==;
X-CSE-ConnectionGUID: O7mIzvBASO6p2LHw+yOEJg==
X-CSE-MsgGUID: l/KkDDspSPyFi0Rc6gNgZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="14368006"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="14368006"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2024 22:14:15 -0700
X-CSE-ConnectionGUID: f6viAIbySAWuI82jn4S6TA==
X-CSE-MsgGUID: WVmqqQvpSBe1dXsPCjkylw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; d="scan'208";a="72752290"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa006.fm.intel.com with ESMTP; 29 Sep 2024 22:14:13 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v6 25/25] drm/xe: Change return type to void for
 xe_force_wake_put
Date: Mon, 30 Sep 2024 11:01:49 +0530
Message-Id: <20240930053149.1246339-26-himal.prasad.ghimiray@intel.com>
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

There is no need to return an error from xe_force_wake_put(), as a
failure implicitly indicates that the domain failed to sleep.

v3
- Move kernel-doc to this patch (Badal)

v5
- change parameter to unsigned int in xe_force_wake_put()

v6
- Remove unneccsary wrapping (Michal)
- Remove non required header (Michal)
- Mention timeout(Michal)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 18 ++++++++++++++----
 drivers/gpu/drm/xe/xe_force_wake.h |  3 +--
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 6a89d3c7929d..1837089c5944 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -210,8 +210,19 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
 	return (ref_incr == fw->initialized_domains) ? ref_incr | XE_FORCEWAKE_ALL : ref_incr;
 }
 
-int xe_force_wake_put(struct xe_force_wake *fw,
-		      unsigned int fw_ref)
+/**
+ * xe_force_wake_put - Decrement the refcount and put domain to sleep if refcount becomes 0
+ * @fw: Pointer to the force wake structure
+ * @domains_mask: forcewake domain mask to put reference
+ *
+ * This function reduces the reference counts for specified domain mask. If
+ * refcount for any of the specified domain reaches 0, it puts the domain to sleep
+ * and waits for acknowledgment for domain to sleep within 50 milisec timeout.
+ * Ensure this function is always called with return of xe_force_wake_get() as
+ * @domains_mask.
+ * Warns in case of timeout of ack from domain.
+ */
+void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
 {
 	struct xe_gt *gt = fw->gt;
 	struct xe_force_wake_domain *domain;
@@ -224,7 +235,7 @@ int xe_force_wake_put(struct xe_force_wake *fw,
 	 * in error path of individual domains.
 	 */
 	if (!fw_ref)
-		return 0;
+		return;
 
 	if (fw_ref == XE_FORCEWAKE_ALL)
 		fw_ref = fw->initialized_domains;
@@ -246,5 +257,4 @@ int xe_force_wake_put(struct xe_force_wake *fw,
 
 	xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to acknowledge sleep request\n",
 		   str_plural(hweight_long(ack_fail)), ack_fail);
-	return ack_fail;
 }
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 9026d17a751d..b310dd1bffb5 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -17,8 +17,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
 				struct xe_force_wake *fw);
 unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
 					    enum xe_force_wake_domains domains);
-int xe_force_wake_put(struct xe_force_wake *fw,
-		      unsigned int fw_ref);
+void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref);
 
 static inline int
 xe_force_wake_ref(struct xe_force_wake *fw,
-- 
2.34.1

