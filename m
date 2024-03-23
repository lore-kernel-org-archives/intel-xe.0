Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F09C54E67
	for <intel-xe@archiver.kernel.org>; Sat, 23 Mar 2024 10:43:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3ED510E2AA;
	Sat, 23 Mar 2024 10:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Og9eLofM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604C010E2AA
 for <intel-xe@lists.freedesktop.org>; Sat, 23 Mar 2024 10:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711190592; x=1742726592;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LQzfrwlbPZFlzH0EwBGmoCqwhl6z2RQ33MIkAF/S6EE=;
 b=Og9eLofMWqhvjTvWxfmIH67XDXyWTDLKcrKaP8ZN80QmBGwDbn3KAYsq
 /n/bJpLQ08tQ1rnI/nXhGr8AKHWy5axc8SE0k9n5wuzzQY5OJ0nORMf8G
 yFiN4fw5EjafikMdjPjuzinYAhTBisrfTmONyPuNp7WpKpehWqPlcOPj+
 0kLMFCKFoKauYpDxjzVkDbTJ0vtw3X/+sey0/iLoAnZbEgCVw2dYknV+J
 uqZ/gI9Wc+tCXdp2Pzrvk7oDMMiTsB1plrnmhD+O1UQAUzag3n+6rVOEE
 PcOKLmXBJbc504tSCK5p/sexeFR1UISWYWKpC4YmweNP01/td7QXS5Krq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6430124"
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="6430124"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2024 03:43:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; d="scan'208";a="46149989"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2024 03:43:11 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH] drm/xe: Fix static analysis tool reported errors
Date: Sat, 23 Mar 2024 16:23:25 +0530
Message-Id: <20240323105325.2904824-1-karthik.poosa@intel.com>
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

v2: Release resources before returning error. (Riana).

Fixes: 09d88e3beb64 ("drm/xe/pm: Init pcode and restore vram on power lost")
Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index cc650a92c2fc..46abf63bc37b 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -383,6 +383,12 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	 * really lost power. Detecting primary Gt power is sufficient.
 	 */
 	gt = xe_device_get_gt(xe, 0);
+	if (!gt) {
+		drm_err(&xe->drm, "xe_gt pointer NULL in xe_device\n");
+		err = -ENXIO;
+		goto out;
+	}
+
 	xe->d3cold.power_lost = xe_guc_in_reset(&gt->uc.guc);
 
 	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
-- 
2.25.1

