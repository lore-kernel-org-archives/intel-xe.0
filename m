Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327D4C021AA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Feb 2025 20:06:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B0910E079;
	Wed, 19 Feb 2025 20:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EfHxxDS7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D5B10E079
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Feb 2025 20:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739995573; x=1771531573;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LP2VDpCkCxRKIgiSc3+xzSKcdKAe+v1L+HMUYkDT+B8=;
 b=EfHxxDS7A3fGoLHRyTNnIsph6CBJCVHHLVwZcnf15P+yWs/HTqsDhk67
 8NH0dsJ1yNHVNpp/v44r8XD0PdegbuX5qZvKYDRmD/UgeXA8PqJAWiA8I
 EMwOs9P701xeCxjj5yhgLsOeG0vowwwbipzM9UC986JdAV0GRPjQ3IAA3
 Kmy+M+o2dHzBaOMOZcP5j+zD/5eRgyAPt5+9/Z7NBQGu1ovXUBD/loljB
 M15RQ4M2/DyLRfBfZGjGJn/55DPGvxTeS8F8jla69H/w98TSi7+e/yRCz
 2y3jOSIideaTS5lCKNefWKSYDkk7rEN8qzl9DquXWd346ZAcIoIUwsk/U A==;
X-CSE-ConnectionGUID: DC0Zh9FIT8a/PwBq6b+F+A==
X-CSE-MsgGUID: 5ZB/3YkbTpK0JntiL1EG9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="39938485"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="39938485"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 12:06:08 -0800
X-CSE-ConnectionGUID: A6xA0lpPSwyK1d6w1sqgNg==
X-CSE-MsgGUID: gkuYeugsThGNEYh82AXYfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="114770291"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.215])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 11:27:38 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/guc: Check response data of CLIENT_SOFT_RESET action
Date: Wed, 19 Feb 2025 20:27:10 +0100
Message-Id: <20250219192710.281-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Treat unexpected non-zero response data from GuC as -EPROTO error.
This will also prevent passing positive value to ERR_PTR().

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/intel-xe/5fd5a4b9-88ee-47f1-ac3e-32a20960c5b0@stanley.mountain/
Fixes: 12f95f9900c0 ("drm/xe/guc: Prefer GT oriented logs for GuC messages")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 1619c0a52db9..bb03db361512 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1238,6 +1238,8 @@ int xe_guc_suspend(struct xe_guc *guc)
 
 	ret = xe_guc_mmio_send(guc, action, ARRAY_SIZE(action));
 	if (ret) {
+		if (ret > 0)
+			ret = -EPROTO;
 		xe_gt_err(gt, "GuC suspend failed: %pe\n", ERR_PTR(ret));
 		return ret;
 	}
-- 
2.47.1

