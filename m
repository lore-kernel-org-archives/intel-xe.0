Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96F4606A32C
	for <intel-xe@archiver.kernel.org>; Sat, 21 Nov 2026 18:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j3uJZeOG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7564410E9EF;
	Sat, 21 Nov 2026 18:23:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6803D10E291
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 18:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795285406; x=1826821406;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xTuKsyn9xlVSIGhTyAIJne7mv+ne46tFE7b4p9bgiLs=;
 b=j3uJZeOGAcl09NFsbkbqyEFKyUu/kfYUxe4fDY/WFvhhMIgssCc+ROZj
 qpfpPqt/+0u+ro2ytcAqaKpLIaArOu7eoMLV9z6WZiCjz+ErDQZfPJG8X
 FPJelNwtwyl0q4jlDnLb97rcFmN1OrNdO30dM4L/DBF9ajPK7k+sJK96T
 DNT/NN4z6YXFQ+D2YTRn1vWSXTomGWPmaDK3AdXifw/aSTcaaCG0RPrco
 C0QG+zALJnaRF4RnKW5hqn8Zr/VUTvz8HXC1bO/u2P93wVapFrSdBNyJw
 lOwu61gDs5wVnouwi7bKZQYLIENj+UiIBOHgWPuYRWy/F8BSXItuiqGvK Q==;
X-CSE-ConnectionGUID: TcllJ7MFSfO55/Fmhzt8TQ==
X-CSE-MsgGUID: 8DA4hTP2Q0CtaBgV/R7Vsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4034058"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4034058"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 10:23:20 -0800
X-CSE-ConnectionGUID: Q4p/FsuRRw+zkaAgHW9DRg==
X-CSE-MsgGUID: 0ZqXAL47Q9uZItBSbCCo+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; d="scan'208";a="10934409"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 10:23:20 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: rodrigo.vivi@intel.com, riana.tauro@intel.com, anoop.c.vijay@intel.com,
 matthew.d.roper@intel.com, fei.yang@intel.com,
 intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 03/17] drm/xe/sysctrl: Restore the SoC remapper on every
 runtime resume
Date: Sat, 21 Nov 2026 18:23:19 +0000
Message-ID: <20261121182317.48981-22-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121182317.48981-19-stuart.summers@intel.com>
References: <20261121182317.48981-19-stuart.summers@intel.com>
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

