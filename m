Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6D7C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 07:55:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F30910E663;
	Mon, 25 Mar 2024 07:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fiejnw8o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9314310E663
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 07:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711353337; x=1742889337;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=A31mnvC8AQjV3h04IjgTpki9znJas0bSZ0MCFlBKlDA=;
 b=Fiejnw8om5M6uqt1gN4NLPZr8KFQZ5nh3IRgSG1Lt5Ae0Mzr5BIhOcDE
 J0r5o5Z7Q3E+QV/wEGDKCCR4EXAglQgu8efXnjKACfVD9jdVGdDIzzaV1
 PxbVHgn5ve+Kw+25VEUhiZph2grybxKvJSKjzPaCxTqjP3OoCuyrxrFqF
 IUjyOkbY+r55OT5652nz1WUQjfG4KpYVt7U4dCccpowxzPNCTRDKmoxrs
 eKW3FzftLcB1BayYilxD3CXF2loCZKT9BdssC30/BVxNHoQeC7j/r30lA
 53UZ2/xpdBBdnraeRneztn5eYm7r5Zjv5C+FcnWr6wgKGe6AELCHG3Afe A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6196092"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="6196092"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 00:55:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; d="scan'208";a="46671765"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 00:55:30 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH] drm/xe: Fix static analysis tool reported errors
Date: Mon, 25 Mar 2024 13:35:50 +0530
Message-Id: <20240325080550.3217836-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

v2: Release resources before returning error. (Riana)

v3: Update commit message. (Badal)

v4: Change drm_err to XE_WARN_ON. (Anshuman)

v5: Fix XE_WARN_ON check. (Riana)

Fixes: 09d88e3beb64 ("drm/xe/pm: Init pcode and restore vram on power lost")
Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index cc650a92c2fc..f6837bd6f9a3 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -383,6 +383,11 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	 * really lost power. Detecting primary Gt power is sufficient.
 	 */
 	gt = xe_device_get_gt(xe, 0);
+	if (XE_WARN_ON(!gt)) {
+		err = -ENXIO;
+		goto out;
+	}
+
 	xe->d3cold.power_lost = xe_guc_in_reset(&gt->uc.guc);
 
 	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
-- 
2.25.1

