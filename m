Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD06C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 03:43:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C2AE10E401;
	Mon, 25 Mar 2024 03:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d/Qeulfz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C6910E3E4
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 03:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711338186; x=1742874186;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iHmhVXJQDYd2Fsu61SMZNzLyBxWF7IuxKM2eWcAD/mE=;
 b=d/Qeulfz9e5CoJeSnHoVTP/pxdUDZixtD7Sd6qm1N3ZDn/tYh/7cYA6b
 9QTFCiHL5cZ3270s0T0LPDJ6wNkdMux7IyQzB3ZAU8rY8JYmEe2h39LzQ
 T0v5iieyVOIMjiyyFQYTKUhCi6vob9Ym/AWckJ3Tbj/4YDoWVFOLFmlyN
 6gdplD2wqhKH3KSDWRmy9V10X3AcF9S/kgjAFY1mccqk7NMJFkxlb+AoM
 VdrZGgeh2Ga2sTWZx2Ez32CGgwM3U7o3sQhNquW9QhMwgZED1ErgRIR4V
 5R4FM0uFe1pgCBdm/z4er24hP87U7EntgXHsyN57MNUscGUAuItmemIpy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="17716325"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; d="scan'208";a="17716325"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2024 20:43:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; d="scan'208";a="38590556"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2024 20:43:02 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH] drm/xe: Fix static analysis tool reported errors
Date: Mon, 25 Mar 2024 09:23:22 +0530
Message-Id: <20240325035322.3192576-1-karthik.poosa@intel.com>
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

v3: Change drm_err to XE_WARN_ON. (Anshuman)

Fixes: 09d88e3beb64 ("drm/xe/pm: Init pcode and restore vram on power lost")
Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index cc650a92c2fc..bbb2ec25aee4 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -383,6 +383,12 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	 * really lost power. Detecting primary Gt power is sufficient.
 	 */
 	gt = xe_device_get_gt(xe, 0);
+	if (!gt) {
+		XE_WARN_ON(gt);
+		err = -ENXIO;
+		goto out;
+	}
+
 	xe->d3cold.power_lost = xe_guc_in_reset(&gt->uc.guc);
 
 	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
-- 
2.25.1

