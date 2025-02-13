Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2D4C021A0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 23:07:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C704610E16F;
	Thu, 13 Feb 2025 23:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="agVg3YdU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB7A10E16F
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 23:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739488070; x=1771024070;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lpDeH/i3McLiO05w+NLH7oJoIO4rkQXD565RJO33SfE=;
 b=agVg3YdU/Ydb1UGQU5EBOvP8MDmDCInBtFLNHEYnI9AhtE41AAESgrmX
 N/jjmOntqINpe3qkYwkMqBnZSUVryP+jveAADSVf+mqBj9PyYBmZajBuP
 hAgGa3Q2foRuGXJ8LxwKKQjDEMEAAajoJF+wcz/RlgYVPpP/2raIxfOUu
 rf2juMYpkS69fXFL+3NSyPwZdRquXgtan8u2Xpdb5j77End+oorOgrtuk
 lGduntDA27Vfyo2lpe14KQ2OZgMZYzm8K1TR1tSsOqde8qpcXkeSSdiLN
 Hz4K6wEO0euoo15Xn3KiKpD6Sx5pJA7MWh/1DNS/7n44ynx1LfnM1gtC6 g==;
X-CSE-ConnectionGUID: oajmaRAoSMiDVwZjek9sDw==
X-CSE-MsgGUID: 2Cx4XIfKR7GvZ8yOJbPnAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="27819702"
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; d="scan'208";a="27819702"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 15:07:50 -0800
X-CSE-ConnectionGUID: cKo+fi1oTL2AxaqwtPRwgQ==
X-CSE-MsgGUID: 8IcGvtsiRZujLYTTVv0eiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117907507"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.96])
 by fmviesa005.fm.intel.com with ESMTP; 13 Feb 2025 15:07:49 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH] drm/xe/debugfs: Add missing xe_pm_runtime_put in
 wedge_mode_set
Date: Thu, 13 Feb 2025 23:03:22 +0000
Message-Id: <20250213230322.1180621-1-shuicheng.lin@intel.com>
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

xe_pm_runtime_put is missed in the failure path.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 56cb3788e752..761e00cb6437 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -176,6 +176,7 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
 		ret = xe_guc_ads_scheduler_policy_toggle_reset(&gt->uc.guc.ads);
 		if (ret) {
 			xe_gt_err(gt, "Failed to update GuC ADS scheduler policy. GuC may still cause engine reset even with wedged_mode=2\n");
+			xe_pm_runtime_put(xe);
 			return -EIO;
 		}
 	}
-- 
2.25.1

