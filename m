Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6E6EEE241
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 18:58:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DBFE10EC1B;
	Thu, 12 Sep 2024 18:58:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fpKCWsr5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A3810EC1B
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 18:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726167492; x=1757703492;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mjZKT0Afjsnylz7u0rBdmQs1RjdQqNq0Ub5F5SXPkZI=;
 b=fpKCWsr5RzUO39p/2vTT/R2oedv3QN/MYhdo8b8PhE0Urr5oO1uLfnhq
 wIf3dJXi+FL5rGC9WHb7JtY+nq25CCuCO4ByQyaoytfu0Ae90yi/BECbY
 g4A2ASnRs2spS95bURh3nS8HDT7zmHSyL1z8cum+Cmhao/EZQrWITqvHJ
 cS/cjEeO4cMqEANLhguDTajfSfIl3pDebM9jws9e65Jj55FJRmRLUix4/
 PdBmhASLo5SUNWPjwHPfhXJWZZn9uaJshSJ0hP998BwFMgsnnq02oM7tT
 mBnONiXSctqz6pvAZR+OERfV650udjNObIgxCTL5A9CxTTs+9JqKAewPT A==;
X-CSE-ConnectionGUID: XO09CJgzTeO5W/KB/9Q/tA==
X-CSE-MsgGUID: qlTTTCnMRoO2QM6pa8AGvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25202903"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="25202903"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 11:58:01 -0700
X-CSE-ConnectionGUID: JKPtFC7PSkqCoVHvl7ydTA==
X-CSE-MsgGUID: PHXqhyxkRaiYfu/s28fmRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="71910080"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa003.fm.intel.com with ESMTP; 12 Sep 2024 11:57:59 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v2 01/23] drm/xe: Error handling in xe_force_wake_get()
Date: Fri, 13 Sep 2024 00:45:41 +0530
Message-Id: <20240912191603.194964-2-himal.prasad.ghimiray@intel.com>
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

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 35 +++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index a64c14757c84..fa42d652d23f 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -150,26 +150,49 @@ static int domain_sleep_wait(struct xe_gt *gt,
 					 (ffs(tmp__) - 1))) && \
 					 domain__->reg_ctl.addr)
 
+/**
+ * xe_force_wake_get : Increase the domain refcount; if it was 0 initially, wake the domain
+ * @fw: struct xe_force_wake
+ * @domains: forcewake domains to get refcount on
+ *
+ * Increment refcount for the force-wake domain. If the domain is
+ * asleep, awaken it and wait for acknowledgment within the specified
+ * timeout. If a timeout occurs, decrement the refcount.
+ * The caller should compare the return value with the @domains to
+ * determine the success or failure of the operation.
+ *
+ * Return: mask of refcount increased domains. If the return value is
+ * equal to the input parameter @domains, the operation is considered
+ * successful. Otherwise, the operation is considered a failure, and
+ * the caller should handle the failure case, potentially returning
+ * -ETIMEDOUT.
+ */
 int xe_force_wake_get(struct xe_force_wake *fw,
 		      enum xe_force_wake_domains domains)
 {
 	struct xe_gt *gt = fw->gt;
 	struct xe_force_wake_domain *domain;
-	enum xe_force_wake_domains tmp, woken = 0;
+	enum xe_force_wake_domains tmp, awake_rqst = 0, awake_ack = 0;
 	unsigned long flags;
-	int ret = 0;
+	int ret = domains;
 
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
-- 
2.34.1

