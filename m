Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67995606A325
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 05:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kZTAUX1Y
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 211A1112095;
	Fri, 20 Nov 2026 05:47:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A2210FAE7
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 05:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795153641; x=1826689641;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xTuKsyn9xlVSIGhTyAIJne7mv+ne46tFE7b4p9bgiLs=;
 b=kZTAUX1YHnO4iTvauu1sUdgq+Mz24BjgTjB/zTz9Ek0H5rVX/tDmMRag
 M5NLPow0ASmQT4V2wUwjaLIobxF8eHBlx7L6UpxYr1umcTSJoCbtBLsoL
 iK1n7bFoeQsg7ookudLbyCB1mnU0eUBB8agafK/9Ux4PHZ2Rw7W9mQe/I
 iaAMyjXh6wa1dLAQWyfpHPfbdWdya0/RF/ggW/uZfgoGsif6xFtMcZ5d9
 Co9BEhb+rYwFLUt889WuTXwc6CODvE2mjtIdlVXFJ1aMIYiKYg5IQyo6u
 Kwh6refvp+gvKxXhizBhn4KiiEf2YP20cMRoJLe0zMyjEXjnLbJLzVoll w==;
X-CSE-ConnectionGUID: A6a5QwBxQXa9knsG2dalJg==
X-CSE-MsgGUID: vN/Lg/dCTQS1mgzrIk6L0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4018524"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4018524"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 21:47:16 -0800
X-CSE-ConnectionGUID: TCSYa2CMT2S/TGTB9EdPVw==
X-CSE-MsgGUID: V25aF5FoRfy5lW01lBqkbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10617123"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 21:47:15 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: rodrigo.vivi@intel.com, riana.tauro@intel.com, anoop.c.vijay@intel.com,
 matthew.d.roper@intel.com, fei.yang@intel.com,
 intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 03/16] drm/xe/sysctrl: Restore the SoC remapper on every
 runtime resume
Date: Fri, 20 Nov 2026 05:47:14 +0000
Message-ID: <20261120054712.377573-21-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120054712.377573-18-stuart.summers@intel.com>
References: <20261120054712.377573-18-stuart.summers@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The SoC remapper configuration is lost whenever the device loses power,
and @d3cold.allowed only records the state xe asked the PCI core for.
The platform can still drop power behind our back when the bridge above
us runtime suspends, which leaves the remapper unprogrammed and any
later System Controller access pointed at nothing.

Restore it on every runtime resume instead.

Fixes: 02eca6edcb32 ("drm/xe/xe_sysctrl: Add System Controller power management support")
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c      | 9 +++++++--
 drivers/gpu/drm/xe/xe_sysctrl.c | 6 ++++--
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index f73f68bd449b..d25dbec6472e 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -654,8 +654,13 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	xe_i2c_pm_resume(xe, xe->d3cold.allowed);
 
-	if (xe->d3cold.allowed)
-		xe_sysctrl_pm_resume(xe);
+	/*
+	 * Done unconditionally: @d3cold.allowed is only the state xe asked the
+	 * PCI core for, the platform can still drop power when the bridge
+	 * above us runtime suspends, taking the SoC remapper configuration
+	 * with it.
+	 */
+	xe_sysctrl_pm_resume(xe);
 
 	xe_display_pm_runtime_resume_early(xe);
 
diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
index d362e8156fca..405d339d6a7d 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl.c
+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
@@ -129,8 +129,10 @@ void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl)
  * xe_sysctrl_pm_resume() - System Controller resume handler
  * @xe: xe device instance
  *
- * Invoked during system resume (S3/S4 to S0) and runtime resume from D3cold.
- * Restores SoC remapper configuration.
+ * Invoked during system resume (S3/S4 to S0) and on every runtime resume.
+ * Restores SoC remapper configuration, which is lost whenever the device
+ * loses power - including when the platform drops power behind our back
+ * because the bridge above us runtime suspended.
  */
 void xe_sysctrl_pm_resume(struct xe_device *xe)
 {
-- 
2.43.0

