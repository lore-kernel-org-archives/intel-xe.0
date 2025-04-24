Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BC4C369AB
	for <intel-xe@archiver.kernel.org>; Thu, 24 Apr 2025 14:31:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001D410E81A;
	Thu, 24 Apr 2025 14:31:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CsSpo2Jp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A8110E82A
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Apr 2025 14:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745505060; x=1777041060;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9dMI4Jn3MeQVKKqbRnRdoczA4YZ/d0sUhH4L9F6BbhA=;
 b=CsSpo2Jp6S/TzM2IuvksrEBokbD/l8aJ4EpMH+Kx9tAlfeKwphCLx+at
 9yLeQXYN0c8dgSwOkdwIwXJhzxbFFk2awI7/86ds+U+HtMjXq9NT8w1sN
 N9z9ALPX2zK2nWcTBydqExHLsdQ7OzTBs8RCEQdBulf1vXk+N9JJik1TP
 SekQKgGtxhPAEcydkgRbOoTJEoBH6BydpnbRmEHSE0ysyrBrbn1la7s6e
 hlD2VCWkcAshS8CT3f4nUR0eAlOAGzGrxoy0oIVt5Jjv/qv8o0LbPzHcO
 X6sgPbUQ/DfRDAFD3ipp5uTN7uhmzsN7g5q464RfNj9Saje/+av26VXoB A==;
X-CSE-ConnectionGUID: 0MamKMabS0K+Xd819Qqp3Q==
X-CSE-MsgGUID: g+EMNeamSj6MEHg8poHhKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="50805621"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="50805621"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 07:31:00 -0700
X-CSE-ConnectionGUID: 7YCuDwKOQVuxwHcGez5eCA==
X-CSE-MsgGUID: BDoW3AU2Tom2K4NXiv5HyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="137632747"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 07:30:59 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com, lukasz.laguna@intel.com
Subject: [PATCH 3/4] drm/xe/vf: Disallow setting wedged_mode=2
Date: Thu, 24 Apr 2025 16:30:42 +0200
Message-Id: <20250424143043.937-4-lukasz.laguna@intel.com>
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

In wedged_mode=2, engine resets need to be disabled, which requires
changing the GuC reset policy. VFs are not permitted to do that.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 3 +++
 drivers/gpu/drm/xe/xe_device.c  | 5 ++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 2e6d8744003b..369bb2103e4c 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -169,6 +169,9 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
 	if (xe->wedged.mode == wedged_mode)
 		return size;
 
+	if (wedged_mode == 2 && IS_SRIOV_VF(xe))
+		return -EPERM;
+
 	xe_pm_runtime_get(xe);
 	for_each_gt(gt, xe, id) {
 		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d2de6936cc20..13430538f861 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -731,9 +731,12 @@ int xe_device_probe_early(struct xe_device *xe)
 	if (err)
 		return err;
 
+	xe->wedged.mode = 1; /* default */
+
 	if (xe_modparam.wedged_mode > 2) {
 		drm_dbg(&xe->drm, "Used wedged_mode value is invalid. Setting default (1)\n");
-		xe->wedged.mode = 1; /* default */
+	} else if (xe_modparam.wedged_mode == 2 && IS_SRIOV_VF(xe)) {
+		drm_dbg(&xe->drm, "Can't set wedged_mode=2 when running as VF. Setting default (1)\n");
 	} else {
 		xe->wedged.mode = xe_modparam.wedged_mode;
 	}
-- 
2.40.0

