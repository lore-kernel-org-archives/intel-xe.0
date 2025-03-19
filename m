Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B086DC36000
	for <intel-xe@archiver.kernel.org>; Wed, 19 Mar 2025 17:28:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A937310E560;
	Wed, 19 Mar 2025 17:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NU5TDOm8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5137C10E560
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Mar 2025 17:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742405309; x=1773941309;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EA5x48x4cAigf3voPw6zkQ6zOEf5+PYPmo//4SSoCJY=;
 b=NU5TDOm835YaWR/Vm6gTp8eJI5IrYrCvIe9GIgbQKOzq51xz1V8t8ajB
 IYtpad6onjQ7SrHyG6jYRfaF2cvxvfnoRweEdvGbk9uk/bKtGEvx7lPNk
 q5Aj/AuxMK9X7+xlkboCyDde4WNHfjfcQ8vWZfQUgmg+bS3Osvic7tckR
 woUl9Z2V/t/yUX9Zi6SIA1LOJG9kc5j9G6s5GCL3mFwJoGZ8I2jOVg2yt
 ZGhRJpODwSTDPXu3LVBJ6x3zeayjWTEVczL6Me643jDubGA9UpRNA0OmJ
 obxJNS8lJ47hOhaKsqzXBFMXOlieCxYXXN2rQeWcvfMCJELReRiCJnIEl Q==;
X-CSE-ConnectionGUID: 0wsN2bVVRIG2rgx5yhEAzg==
X-CSE-MsgGUID: Sit6etNPRSysArO6G5KgkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43714536"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="43714536"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 10:28:28 -0700
X-CSE-ConnectionGUID: GHa5rk3XT3yhwWlpVk8Sig==
X-CSE-MsgGUID: NhaqW4lyRlePPfls/HR1xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="122538549"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa006.fm.intel.com with ESMTP; 19 Mar 2025 10:28:27 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v2] drm/xe/guc: Disable lite restore for MTL
Date: Wed, 19 Mar 2025 10:28:25 -0700
Message-Id: <20250319172825.3334036-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

Lite restore for MTL is not POR for Xe, then disable it for MTL.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
Changes from prior revs:
  v2:- Changed long conditional initialization to simple if statement.

 drivers/gpu/drm/xe/xe_guc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index bc5714a5b36b..d9a0daf584b4 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -80,9 +80,13 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
 
 static u32 guc_ctl_feature_flags(struct xe_guc *guc)
 {
+	struct xe_device *xe = guc_to_xe(guc);
 	u32 flags = GUC_CTL_ENABLE_LITE_RESTORE;
 
-	if (!guc_to_xe(guc)->info.skip_guc_pc)
+	if (xe->info.platform == XE_METEORLAKE)
+		flags &= ~GUC_CTL_ENABLE_LITE_RESTORE;
+
+	if (!xe->info.skip_guc_pc)
 		flags |= GUC_CTL_ENABLE_SLPC;
 
 	return flags;
-- 
2.34.1

