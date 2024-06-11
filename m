Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EF8C27C7B
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 16:35:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4752C10E6BC;
	Tue, 11 Jun 2024 16:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HU/Fhlqn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8B910E215
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 16:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718123758; x=1749659758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uYgjjSsfFFexdWvJ1JE+RgioNXOuHVbdgBOI6kM5dx0=;
 b=HU/Fhlqn4f53sKl0u/pLLZ3hrGvNvVBqYi2wA7usoG/Myrd3WPFOtBK7
 l59MBPtZdrjGBdnQta10LIvsKCYl3D26Bj+buby+TEQt5ozlCgj/dmlSy
 WfOdKp3sxF3SBSPH3nYQ5u8z09M47ABGQRd+EUUzxiTQ1yQjHfxnYBfYb
 sdVEstfopmBjWwvF+nxOPXvCu4yhTmoJlGSivVkoUWTgq8EEMkDD2KnRx
 +ZZOiKWfGQMNPhueHAkp3y5MaQUGa0B+g3YzsyVF+GSi+GVm9acMlpASs
 NdTQz4K9xrB7nFm0VK+7APqvoMu9Edw6Zwvg7FOD1KPqxAw/y5XiAgnWL g==;
X-CSE-ConnectionGUID: Nrxfk0MERS+JRCjSQmhahA==
X-CSE-MsgGUID: pw2A86ZYQZSrDrp8EDXVfQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="40247883"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="40247883"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 09:35:57 -0700
X-CSE-ConnectionGUID: TCued/63QEeIVgWTfimZ0A==
X-CSE-MsgGUID: 9zGgX0mQRpWr8p4uTEM6TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="44388689"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.94.248.185])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 09:35:56 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 4/5] drm/xe: Combine common force-wake code into helpers
Date: Tue, 11 Jun 2024 18:35:36 +0200
Message-Id: <20240611163537.1944-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240611163537.1944-1-michal.wajdeczko@intel.com>
References: <20240611163537.1944-1-michal.wajdeczko@intel.com>
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

The code of 'control' and 'wait' force-wake operations are very
similar for both 'wake' and 'sleep' cases. Add helpers to maximize
code reuse.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
v2: rename str_wake_sleep helper param (Rodrigo)
    drop inline from str_wake_sleep helper (Michal)
---
 drivers/gpu/drm/xe/xe_force_wake.c | 54 +++++++++++++++++-------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index afbca81c12dd..468aabd72d6b 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -15,6 +15,11 @@
 
 #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
 
+static const char *str_wake_sleep(bool wake)
+{
+	return wake ? "wake" : "sleep";
+}
+
 static void domain_init(struct xe_force_wake_domain *domain,
 			enum xe_force_wake_domain_id id,
 			struct xe_reg reg, struct xe_reg ack)
@@ -89,46 +94,47 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 			    FORCEWAKE_ACK_GSC);
 }
 
+static void __domain_ctl(struct xe_gt *gt, struct xe_force_wake_domain *domain, bool wake)
+{
+	xe_mmio_write32(gt, domain->reg_ctl, domain->mask | (wake ? domain->val : 0));
+}
+
+static int __domain_wait(struct xe_gt *gt, struct xe_force_wake_domain *domain, bool wake)
+{
+	u32 value;
+	int ret;
+
+	ret = xe_mmio_wait32(gt, domain->reg_ack, domain->val, wake ? domain->val : 0,
+			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
+			     &value, true);
+	if (ret)
+		xe_gt_notice(gt, "Force wake domain %d failed to ack %s (%pe) reg[%#x] = %#x\n",
+			     domain->id, str_wake_sleep(wake), ERR_PTR(ret),
+			     domain->reg_ack.addr, value);
+
+	return ret;
+}
+
 static void domain_wake(struct xe_gt *gt, struct xe_force_wake_domain *domain)
 {
-	xe_mmio_write32(gt, domain->reg_ctl, domain->mask | domain->val);
+	__domain_ctl(gt, domain, true);
 }
 
 static int domain_wake_wait(struct xe_gt *gt,
 			    struct xe_force_wake_domain *domain)
 {
-	u32 value;
-	int ret;
-
-	ret = xe_mmio_wait32(gt, domain->reg_ack, domain->val, domain->val,
-			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
-			     &value, true);
-	if (ret)
-		xe_gt_notice(gt, "Force wake domain %d failed to ack wake (%pe) reg[%#x] = %#x\n",
-			     domain->id, ERR_PTR(ret), domain->reg_ack.addr, value);
-
-	return ret;
+	return __domain_wait(gt, domain, true);
 }
 
 static void domain_sleep(struct xe_gt *gt, struct xe_force_wake_domain *domain)
 {
-	xe_mmio_write32(gt, domain->reg_ctl, domain->mask);
+	__domain_ctl(gt, domain, false);
 }
 
 static int domain_sleep_wait(struct xe_gt *gt,
 			     struct xe_force_wake_domain *domain)
 {
-	u32 value;
-	int ret;
-
-	ret = xe_mmio_wait32(gt, domain->reg_ack, domain->val, 0,
-			     XE_FORCE_WAKE_ACK_TIMEOUT_MS * USEC_PER_MSEC,
-			     &value, true);
-	if (ret)
-		xe_gt_notice(gt, "Force wake domain %d failed to ack sleep (%pe) reg[%#x] = %#x\n",
-			     domain->id, ERR_PTR(ret), domain->reg_ack.addr, value);
-
-	return ret;
+	return __domain_wait(gt, domain, false);
 }
 
 #define for_each_fw_domain_masked(domain__, mask__, fw__, tmp__) \
-- 
2.43.0

