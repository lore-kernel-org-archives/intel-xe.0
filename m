Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3BEC25B77
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 10:22:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F186410EE6E;
	Wed, 22 May 2024 10:22:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IiYoUNzF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233FE10F4A8
 for <intel-xe@lists.freedesktop.org>; Wed, 22 May 2024 10:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716373328; x=1747909328;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=V6eN01xxavMyjgqEfyQi8DL4GKmsn51K2JZ+mLWk3iU=;
 b=IiYoUNzF4nWK8mYQUEcaNjBiWyT6qYuT7jgfLZUFdSUyRmiqe/IWa4sp
 BumDPZW8oj74JhEwiJNGl3Rj3kHYyhUoIUDEADCpICfOwyYp29OBbGiXt
 QDmmV29bBLL26yznXP9tUSOv4+TqQKkt9xZoZ1a8B7+xrNHalDFcbgZd7
 nhDrlAAaI5RKVwsky2bQk7z7Blmjvyp9XqrDfJ9KulYZYqAkYNj3R1AhS
 BLP8UnEvhuB7Un9/frl5ag1n8YPYyN33VnaMPmmmN9XMzOLxNUvrJHkIa
 XOLCglTSwnx+llRo5MB3NVc9vDlxScyPboEGzTD18wfk0Wh1fILK6ynr4 w==;
X-CSE-ConnectionGUID: MgYvM8i5Rci49imvvnB1oA==
X-CSE-MsgGUID: Eda1HoiWT/u+efjvhLt+LQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="15562683"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="15562683"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:22:07 -0700
X-CSE-ConnectionGUID: zKtm8PT1SgqTOxxLt1A6zg==
X-CSE-MsgGUID: zw55hqGYS7Gt4cBavY16/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="38195247"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.245.124])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:22:07 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 04/18] drm/xe/guc: move guc_fini over to devm
Date: Wed, 22 May 2024 11:21:47 +0100
Message-ID: <20240522102143.128069-22-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240522102143.128069-19-matthew.auld@intel.com>
References: <20240522102143.128069-19-matthew.auld@intel.com>
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

Make sure to actually call this when the device is removed. Currently we
only trigger it when the driver instance goes away, but that doesn't
work too well with hotunplug, since device can be removed and re-probed
with a new driver instance, where the guc_fini() is called too late.
Move the fini over to devm to ensure this is called when device is
removed.

References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1717
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index e52b544ac690..83122c2e00cd 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -241,7 +241,7 @@ static void guc_write_params(struct xe_guc *guc)
 		xe_mmio_write32(gt, SOFT_SCRATCH(1 + i), guc->params[i]);
 }
 
-static void guc_fini(struct drm_device *drm, void *arg)
+static void guc_fini(void *arg)
 {
 	struct xe_guc *guc = arg;
 	struct xe_gt *gt = guc_to_gt(guc);
@@ -325,7 +325,7 @@ int xe_guc_init(struct xe_guc *guc)
 	if (ret)
 		goto out;
 
-	ret = drmm_add_action_or_reset(&xe->drm, guc_fini, guc);
+	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini, guc);
 	if (ret)
 		goto out;
 
-- 
2.45.1

