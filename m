Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B153CC3ABC0
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 09:08:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D5F10E378;
	Thu,  8 May 2025 09:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X/1060l7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EEC810E36A
 for <intel-xe@lists.freedesktop.org>; Thu,  8 May 2025 09:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746695315; x=1778231315;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cRqv0/hrhoHPZd4lcELYRlX2c0CkzGZqeFifNES7xE8=;
 b=X/1060l7sTrZIBJGjZhCFGb0foyTYqRfBas8uqukYbsf4PWMjVAATpns
 bPNZkhkmrgBV4+tuDj405nf0P6Y0J0qLWk8yvIbHxiSoNnDNLfX1yoFJX
 dWZCDlQwmXGSRItc9RTyYRCGRLHuiSQ03twMxPxBueTweQ3OSgnect8BX
 ROrbooPQ93n/RJTfDiw5JL2tQzomgpKpNxAfpJEeLoSkf45RgHEyZ58Q0
 ruP4H3ArQVYh9PAwyhRny6B/gQ9cTyS65beC06qEeqUiBsSkBJQ0arIbC
 Q/A3eTc5pNl0du+cTxb+COeQ7KHa+uBZQaC8f6jvnb9YU8ROMGZu6bQ34 g==;
X-CSE-ConnectionGUID: LH1qchG6SLKvak5EHj/PAQ==
X-CSE-MsgGUID: MTK+IcC/Tz2Lm8dGN6LGzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52276411"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="52276411"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 02:08:35 -0700
X-CSE-ConnectionGUID: pscG2WNUQMSSZ9i1uW7v+g==
X-CSE-MsgGUID: 9U5iLb90S3+CpyvLw6eP+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; d="scan'208";a="136730482"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 02:08:33 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 2/2] drm/xe/pm: Wait for vram ready in resume
Date: Thu,  8 May 2025 14:38:16 +0530
Message-Id: <20250508090816.216176-3-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250508090816.216176-1-karthik.poosa@intel.com>
References: <20250508090816.216176-1-karthik.poosa@intel.com>
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

Add wait for vram ready during system and runtime resume.
This wait is there in probe and is missing during resume.
While there are no issues today without this check, it's
a prudent measure to prevent any future issues.

v2:
 - Use xe_device_wait_for_vram_ready function.
 - Improve commit message. (Lucas)

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 693866def183..5aa7b006b50d 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -181,6 +181,10 @@ int xe_pm_resume(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_device_wait_for_vram_ready(xe);
+	if (err)
+		goto err;
+
 	xe_display_pm_resume_early(xe);
 
 	/*
@@ -524,6 +528,10 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 		if (err)
 			goto out;
 
+		err = xe_device_wait_for_vram_ready(xe);
+		if (err)
+			goto out;
+
 		xe_display_pm_resume_early(xe);
 
 		/*
-- 
2.25.1

