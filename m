Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E2EC54E68
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 10:36:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC24010E618;
	Thu, 21 Mar 2024 10:36:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U1WQYhKc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA6510E618
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 10:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711017405; x=1742553405;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C0egWTx0NsgPsND9QiDKQfXIRPPUN6Aq7eux5jL6ia0=;
 b=U1WQYhKcHQEVo9uS8JkQWfPHduG6FjH/ZLB82eWzBag+2XVSs0fNw2Gq
 h/xy/GArMakPhg2zn5ekCD+XpwoqCeCfLWtsGPnQyL46oiapmxi5m7hRz
 xa8YOxUAInq9K/JNHEwWXZhC24UpdfSkP5p1tMLSGxf5pzed66WbV91ZZ
 iFIil7VHbyr4JBVK7xwwCjLhgRjJBugKSvjs59JzDh9G0LKIIghTIyL00
 iVT3UDrX6+xIjf0P+VcoVZ6gtyphJGk2xTFSzJ+mwDeCDjoGsBi8KWSDB
 +rfgvy6mA967c/N40ueTYhZKood4CpepjaOiPV+95JNe0pPKy8KuXT3ri g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="16543282"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="16543282"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 03:36:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="14523853"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 03:36:42 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH 1/2] drm/xe: Fix static analysis tool reported errors
Date: Thu, 21 Mar 2024 16:16:23 +0530
Message-Id: <20240321104624.2205317-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240321104624.2205317-1-karthik.poosa@intel.com>
References: <20240321104624.2205317-1-karthik.poosa@intel.com>
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

Add a NULL pointer check.

Fixes: 09d88e3beb64 ("drm/xe/pm: Init pcode and restore vram on power lost")
Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index cc650a92c2fc..5cb5aef16823 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -383,6 +383,11 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	 * really lost power. Detecting primary Gt power is sufficient.
 	 */
 	gt = xe_device_get_gt(xe, 0);
+	if (!gt) {
+		drm_err(&xe->drm, "xe_gt pointer NULL in xe_device\n");
+		return -ENXIO;
+	}
+
 	xe->d3cold.power_lost = xe_guc_in_reset(&gt->uc.guc);
 
 	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
-- 
2.25.1

