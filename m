Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5997AC369C2
	for <intel-xe@archiver.kernel.org>; Thu, 24 Apr 2025 14:31:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 208F110E814;
	Thu, 24 Apr 2025 14:31:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fbjnGCX7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA29610E82A
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Apr 2025 14:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745505064; x=1777041064;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Frf2QbBftwEzqHJHcLyip4cOLk+4oZrFOWeKkaIa8JA=;
 b=fbjnGCX7PrDEBSAzSmXX5p3kjs7J0iPS6dUkpfviqC2vnYElPXgvz64u
 nry1r7fT6xtqCWMnVbGuq2OfHK1N8NhgQEeGqlTI3uwAwMLggnqfoAlgF
 td3GrVjOWexasl/u7A50fMOUo07GRidPnbscfz7/aVfC0sh1kqWeEmTV/
 IweWvmYM2PPPZO/CgUzCFQNt+0n3Uv33B1h2aYUq63jDKMRgVawOZtk2a
 eDZa/m8Ugk/b5e7Y91glrpQB/okObmKHkAMZI3Yfpu523GDa7tyHB7GwQ
 G43jRNdMeYmgdG79f8TT0if9G092Eb4Yy8qB9pHydFl9pXenqyjAWQ4Wr g==;
X-CSE-ConnectionGUID: 7NY9R6eHSZuvkeNo53QvUw==
X-CSE-MsgGUID: 4r67aH6PQgKyO9pX9LoHkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="50805629"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="50805629"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 07:31:04 -0700
X-CSE-ConnectionGUID: 8yda3KvrRVqlHm3CzmW6lw==
X-CSE-MsgGUID: C4OA/PBmSs2BacEucYgaNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="137632769"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 07:31:03 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com, lukasz.laguna@intel.com
Subject: [PATCH 4/4] drm/xe/pf: Allow wedged_mode=2 only in debug config
Date: Thu, 24 Apr 2025 16:30:43 +0200
Message-Id: <20250424143043.937-5-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250424143043.937-1-lukasz.laguna@intel.com>
References: <20250424143043.937-1-lukasz.laguna@intel.com>
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

The GuC reset policy is global, so changing it on PF can impact running
VFs. To avoid unintended side effects, setting wedged_mode=2 on the PF
is restricted to debug builds only.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 3 ++-
 drivers/gpu/drm/xe/xe_device.c  | 7 +++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 369bb2103e4c..79a879d92845 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -169,7 +169,8 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
 	if (xe->wedged.mode == wedged_mode)
 		return size;
 
-	if (wedged_mode == 2 && IS_SRIOV_VF(xe))
+	if (wedged_mode == 2 &&
+	    (IS_SRIOV_VF(xe) || (IS_SRIOV_PF(xe) && !IS_ENABLED(CONFIG_DRM_XE_DEBUG))))
 		return -EPERM;
 
 	xe_pm_runtime_get(xe);
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 13430538f861..b42af557acb8 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -735,8 +735,11 @@ int xe_device_probe_early(struct xe_device *xe)
 
 	if (xe_modparam.wedged_mode > 2) {
 		drm_dbg(&xe->drm, "Used wedged_mode value is invalid. Setting default (1)\n");
-	} else if (xe_modparam.wedged_mode == 2 && IS_SRIOV_VF(xe)) {
-		drm_dbg(&xe->drm, "Can't set wedged_mode=2 when running as VF. Setting default (1)\n");
+	} else if (xe_modparam.wedged_mode == 2) {
+		if  (IS_SRIOV_VF(xe))
+			drm_dbg(&xe->drm, "Can't set wedged_mode=2 when running as VF. Setting default (1)\n");
+		else if (IS_SRIOV_PF(xe) && !IS_ENABLED(CONFIG_DRM_XE_DEBUG))
+			drm_dbg(&xe->drm, "Can't set wedged_mode=2 when running as PF in non-debug config. Setting default (1)\n");
 	} else {
 		xe->wedged.mode = xe_modparam.wedged_mode;
 	}
-- 
2.40.0

