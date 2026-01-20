Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF9FCA5FB8
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 18:03:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB1910E641;
	Tue, 20 Jan 2026 18:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EQm/02RZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC0910E641
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 18:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768932185; x=1800468185;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zjA7wGLjOZBMC+gb5ydnY0+mvkTbx2XnXlTMA+0ReEE=;
 b=EQm/02RZadqJAn6XPEE6qJlIeAl8mWDx1ZVNr1byTJtqqMh7Frw7+1B0
 ce0UHy4Bqy6Ny1510tIRIJULeYvFLqIXUwRWPAnAy3NQ0h4KiARSoC+MJ
 gQxtnzuqOhGXqeKDhDy7gy2UMLqFGxxAmWlGuokX9k92hVEi0ajzQ+t07
 fN6gjm+LckiO0+/7bxNV+vCa3OOraRHb/0PpHZezChUwwusACYSlin7IC
 wQIUs6gUsacBfphHodrlPz4NVauJrb1ZgCQCGikyqS53VbRYtl93wyqgG
 88M1IJrx2C1fpC002DQEtSkui6CjTodL5DNX1V3axESryfyY0dtpCFwW+ g==;
X-CSE-ConnectionGUID: b+r0JcSYQR6n6qwRx6olgQ==
X-CSE-MsgGUID: MC3sKqu2S0OU8mb66AegBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="80454004"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="80454004"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 10:03:05 -0800
X-CSE-ConnectionGUID: 0I2BrSh5Q3qc++xguGoL2w==
X-CSE-MsgGUID: iYYzUnNeQQyITJ0XybRDjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="206103960"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa006.fm.intel.com with ESMTP; 20 Jan 2026 10:03:03 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Brian Nguyen <brian3.nguyen@intel.com>
Subject: [PATCH v3 3/3] drm/xe/nvm: Defer xe->nvm assignment until init
 succeeds
Date: Tue, 20 Jan 2026 17:59:26 +0000
Message-ID: <20260120175922.2961847-8-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260120175922.2961847-5-shuicheng.lin@intel.com>
References: <20260109220026.2468067-2-shuicheng.lin@intel.com>
 <20260120175922.2961847-5-shuicheng.lin@intel.com>
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

Allocate and initialize the NVM structure using a local pointer and
assign it to xe->nvm only after all initialization steps succeed.

This avoids exposing a partially initialized xe->nvm and removes the
need to explicitly clear xe->nvm on error paths, simplifying error
handling and making the lifetime rules clearer.

Cc: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Brian Nguyen <brian3.nguyen@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_nvm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
index 6f9dd519371c..bc88804de514 100644
--- a/drivers/gpu/drm/xe/xe_nvm.c
+++ b/drivers/gpu/drm/xe/xe_nvm.c
@@ -133,12 +133,10 @@ int xe_nvm_init(struct xe_device *xe)
 	if (WARN_ON(xe->nvm))
 		return -EFAULT;
 
-	xe->nvm = kzalloc(sizeof(*nvm), GFP_KERNEL);
-	if (!xe->nvm)
+	nvm = kzalloc(sizeof(*nvm), GFP_KERNEL);
+	if (!nvm)
 		return -ENOMEM;
 
-	nvm = xe->nvm;
-
 	nvm->writable_override = xe_nvm_writable_override(xe);
 	nvm->non_posted_erase = xe_nvm_non_posted_erase(xe);
 	nvm->bar.parent = &pdev->resource[0];
@@ -165,7 +163,6 @@ int xe_nvm_init(struct xe_device *xe)
 	if (ret) {
 		drm_err(&xe->drm, "xe-nvm aux init failed %d\n", ret);
 		kfree(nvm);
-		xe->nvm = NULL;
 		return ret;
 	}
 
@@ -173,8 +170,9 @@ int xe_nvm_init(struct xe_device *xe)
 	if (ret) {
 		drm_err(&xe->drm, "xe-nvm aux add failed %d\n", ret);
 		auxiliary_device_uninit(aux_dev);
-		xe->nvm = NULL;
 		return ret;
 	}
+
+	xe->nvm = nvm;
 	return devm_add_action_or_reset(xe->drm.dev, xe_nvm_fini, xe);
 }
-- 
2.50.1

