Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B3C6073536
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 21:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gJNcjDMI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E976810FF24;
	Wed,  4 Nov 2026 21:54:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E997710FF24
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 21:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793829246; x=1825365246;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c0VX7RroDU43MafKmO5ghSm0hMllWGiwJmRvdOx2RKg=;
 b=gJNcjDMITM9+cgihjub6yFoQ/Tmg0RhmPOAGe4RWS9VmVnYJApWyw59D
 Cbp+D9Tb2oZvcO8a+4OZhqqS4YsxtI1RCsMySU70E1NGBBbr6jxM6NL2M
 LujkC5BQ7iweqMmc5Ym37Pk0RDtQDq3ThdoR040KrFry5S0qnHlkgBSUw
 C3PUU7tJ/woQbDv8TLX9JhUKW7oPOY48nLw+1F2UzFetFCW4wP3XdxOff
 hvYydBjF/v2VtvpZDIUCyMIIsH7o6fwWpPkMK9lDs5tcfhaajAZz2N5cf
 0vU7WzEU6lh5ZlSg/7UI7AefZ1X1sr7wXSIfjz+zUjF6hoOQHoWcBX7FH A==;
X-CSE-ConnectionGUID: flFYz6Q3T2SSTgi6RDbOaA==
X-CSE-MsgGUID: pvENrUWKSYKUgr7hhI94xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2502151"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2502151"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 13:53:56 -0800
X-CSE-ConnectionGUID: 161z/Iq/Sd6FicU7TuLsMQ==
X-CSE-MsgGUID: 2pXuKQ38TgmXuTAG0weJRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6831389"
Received: from dut4425arlh.fm.intel.com ([10.1.80.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 13:53:55 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 riana.tauro@intel.com, anoop.c.vijay@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 3/3] drm/xe/sysctrl: Restore the SoC remapper on every runtime
 resume
Date: Wed,  4 Nov 2026 21:53:56 +0000
Message-ID: <20261104215353.234314-8-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104215353.234314-5-stuart.summers@intel.com>
References: <20261104215353.234314-5-stuart.summers@intel.com>
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
index f483b565d323..e9bebc2ff29d 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -718,8 +718,13 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
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
index 27a59e8e4487..a3fff95d16ea 100644
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

