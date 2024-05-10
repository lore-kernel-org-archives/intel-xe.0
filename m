Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016EBC25B74
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 18:12:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95CF010EF43;
	Fri, 10 May 2024 18:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iub6Wo6O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D9210E5DE
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 18:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715364762; x=1746900762;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mcJDTORo5XTMbrHmUYhVMovlHR7QrsCVzWtx8HprknU=;
 b=iub6Wo6OyVCTj3s9lCSYGrPiWDfnRbaSY9FfZenEzJmq2B/Mzc4UwmhN
 Tvc4aFM8kJ2/5uttWaLYf9jub8NF/N1iDec7nKgGOe2Xr93/kvne8yE0a
 1VRktAOBMAFT3W4GahNDVe5EB8kIeXDEhqhAPuqSgyJUwG8C9hzz/7m0U
 Fo1AU8v/40ozJ3myZ3488H1QDZzOvRM9lWp89DBxLc28Bm9ivc/vA3oOf
 aRUucamqsmmEyxGLrjeGU9LoiW+RFCCx2aGxzaPYhpG3dkvedwhSOcaJI
 fNkFDCA+FnPIlG7FnUZ6TiHsMbzFLnYAjk5q0s8GWc419SLvH64OdSQCA g==;
X-CSE-ConnectionGUID: Dnxr1KlqSYGtIsASulJI9A==
X-CSE-MsgGUID: uUqKRRScTquHYFJ/+zjddw==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="28844600"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="28844600"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:12:42 -0700
X-CSE-ConnectionGUID: BraBL3gUThGbTTt89j4fUw==
X-CSE-MsgGUID: j3G8Eq7QQC203msOeOEphg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="60544107"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.149])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:12:40 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH 12/20] drm/xe/device: move xe_device_sanitize over to devm
Date: Fri, 10 May 2024 19:12:25 +0100
Message-ID: <20240510181212.264622-34-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240510181212.264622-22-matthew.auld@intel.com>
References: <20240510181212.264622-22-matthew.auld@intel.com>
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

Disable GuC submission when removing the device.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 35d11be56840..e4c30030fc40 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -388,7 +388,7 @@ static void xe_driver_flr_fini(void *arg)
 		xe_driver_flr(xe);
 }
 
-static void xe_device_sanitize(struct drm_device *drm, void *arg)
+static void xe_device_sanitize(void *arg)
 {
 	struct xe_device *xe = arg;
 	struct xe_gt *gt;
@@ -654,7 +654,7 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_hwmon_register(xe);
 
-	return drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
+	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
 
 err_fini_display:
 	xe_display_driver_remove(xe);
-- 
2.45.0

