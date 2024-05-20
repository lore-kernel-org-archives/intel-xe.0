Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504B0C25B7A
	for <intel-xe@archiver.kernel.org>; Mon, 20 May 2024 15:45:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B67D210E379;
	Mon, 20 May 2024 15:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a9dzENSR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C37910E43F
 for <intel-xe@lists.freedesktop.org>; Mon, 20 May 2024 15:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716219939; x=1747755939;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V6eN01xxavMyjgqEfyQi8DL4GKmsn51K2JZ+mLWk3iU=;
 b=a9dzENSRuHyb65aNyIiY5JdNhlBQ8fflaeQYkjh+bSxrJgBTQl7Q8GNo
 4vGAmi2y3BiwMCdsSuhlGgszW9yWjsST5cHsdpzCch+ZaA0Qsg41izMPS
 OIXdzUqnWxh8Q2cOBsr0i59l5kOrYUURTl1buu8dqujc8tU0uQ8nSz1D+
 zC3tut+topU+AYGXqswWy5r86YQ9A5Jxj3FOkqDFyeZHBD5gqcGoYvFLO
 nTHJVz7tki5o0+X/H8dgJXXgijtbXgQZkTBJCK4eyk4zq+bTyT7cQqDUS
 lCTG3Q3OlALsxykqcfTmzn5o0+u720PQc0xL5rZ25zGDmSnVDOFjpoO2G A==;
X-CSE-ConnectionGUID: dlX4MZ/jRS+Qq0DDrrgd8w==
X-CSE-MsgGUID: tCUGZo1ITNGCszeu48vWAA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="34873124"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="34873124"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 08:45:39 -0700
X-CSE-ConnectionGUID: PrkPmMReQoS0/hdNGKyf3w==
X-CSE-MsgGUID: yMrDO6AFTQmYmqJ168vPLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="32610439"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.244.203])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 08:45:38 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [CI v2 04/18] drm/xe/guc: move guc_fini over to devm
Date: Mon, 20 May 2024 16:42:53 +0100
Message-ID: <20240520154249.52888-22-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240520154249.52888-19-matthew.auld@intel.com>
References: <20240520154249.52888-19-matthew.auld@intel.com>
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

