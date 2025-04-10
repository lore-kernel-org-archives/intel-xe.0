Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C047DC3601E
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 11:01:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8606810E951;
	Thu, 10 Apr 2025 11:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h7H5H4/7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849B810E951
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 11:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744282872; x=1775818872;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FshT63QMzPMDBJakArvt/7y3YvS1qlc8r37+VPdid0E=;
 b=h7H5H4/7lD4Wc4QQAdNa9PnDFDZ0gyD42Urkt4nt8+vDMvptRSMgHRoF
 vuXK4O0yKgczY4vj4Xn1wUWsfO1OiDRl4ED8TzFm7Tx9oO4Dg+CFI7V3t
 BfxXYPsR4fPqI7H5gURRO5wZaAftYkdYyBBURIrPMo7pkDQzplDH6h66t
 qdZG71q8IZPKbQwCot5cqsO0q4YUpc06unk+T8QpXN8itJFid+ji1SzNS
 68wK0+qNI2Le6RvXfhzxUlEwEE7onncSUGdKUsBq/LhQGsJAB3NkAPF0e
 S7eO/Jp0XWac6vce+6oCFe+vmlX5mgV7AWP9Jan9M7qWevjcslgiiAhfb g==;
X-CSE-ConnectionGUID: t+kv95APTkSi8HjznXPkkQ==
X-CSE-MsgGUID: saV67IMmQuuQ9Ev2liBuUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="71175421"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="71175421"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 04:01:11 -0700
X-CSE-ConnectionGUID: 6Fbjke87QAqXktPHkiri7w==
X-CSE-MsgGUID: qTniHyenT3u2T9ecZ7eOWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="166070308"
Received: from unknown (HELO sinjan-Super-Server.iind.intel.com)
 ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 04:01:09 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v1] drm/xe/pm: Wait for lmem ready in resume
Date: Thu, 10 Apr 2025 16:30:57 +0530
Message-Id: <20250410110057.2497056-1-karthik.poosa@intel.com>
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

Add wait for LMEM ready during system and runtime resume.
This wait is there in probe and is missing during resume.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 +-
 drivers/gpu/drm/xe/xe_device.h | 1 +
 drivers/gpu/drm/xe/xe_pm.c     | 8 ++++++++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 75e753e0a682..4c0d9eb51d1f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -630,7 +630,7 @@ static bool verify_lmem_ready(struct xe_device *xe)
 	return !!val;
 }
 
-static int wait_for_lmem_ready(struct xe_device *xe)
+int wait_for_lmem_ready(struct xe_device *xe)
 {
 	unsigned long timeout, start;
 
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 0bc3bc8e6803..60bc92f9ab22 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -47,6 +47,7 @@ int xe_device_probe_early(struct xe_device *xe);
 int xe_device_probe(struct xe_device *xe);
 void xe_device_remove(struct xe_device *xe);
 void xe_device_shutdown(struct xe_device *xe);
+int wait_for_lmem_ready(struct xe_device *xe);
 
 void xe_device_wmb(struct xe_device *xe);
 
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 4e112fbacada..2e59670660c1 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -182,6 +182,10 @@ int xe_pm_resume(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = wait_for_lmem_ready(xe);
+	if (err)
+		goto err;
+
 	xe_display_pm_resume_early(xe);
 
 	/*
@@ -478,6 +482,10 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 		if (err)
 			goto out;
 
+		err = wait_for_lmem_ready(xe);
+		if (err)
+			goto out;
+
 		xe_display_pm_resume_early(xe);
 
 		/*
-- 
2.25.1

