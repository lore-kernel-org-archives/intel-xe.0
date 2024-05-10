Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F517C25B10
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 18:12:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321FE10E5DE;
	Fri, 10 May 2024 18:12:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M+BuSHWV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6D510E5DE
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 18:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715364761; x=1746900761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lcB/Hx+BJXYXzvRaA5zRNQQzcjYijqOZh3Z0hkKhUZ4=;
 b=M+BuSHWV9xubLMNBqFf9KNWBXjcUZxSg1QWDsgaCJKqhAvDA6lkNgmm7
 1upe06mfTute6s28X96aOD4xgjKaBLKX5D8mE4N21+7oBoamtEn/UDbVX
 0U9FPAU1cwwsYCGih66Y5P6fS56YFhHOucti7gbxt77iezKpd15c+qNiR
 7eqqoorNZ71zSDyoTrtVDedCCVaitRZ9Zt8r2BCgQxY/6+BO6uRXEwe0o
 rV/1FP0nGkcImsKlSClE6a85AIMPLZAdXMcBrn8koqtKqem3FG5Ozsx5z
 sG3C1FMQ640LeCfS1BqmZ+CLDGrnBSOZhwEGjgrBzeOrkkRUgQvI82VG1 g==;
X-CSE-ConnectionGUID: xs1X/wFLSs6uqNE0pm/D/A==
X-CSE-MsgGUID: p60A/sLVR4Wantw4bpfhGA==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="28844599"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="28844599"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:12:41 -0700
X-CSE-ConnectionGUID: zW1j+ks4QwOKgncHETPqfg==
X-CSE-MsgGUID: Rn5TQGKkTkmqmUYIXpNmCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="60544104"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.149])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:12:39 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH 11/20] drm/xe/device: move flr to devm
Date: Fri, 10 May 2024 19:12:24 +0100
Message-ID: <20240510181212.264622-33-matthew.auld@intel.com>
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

Should be called when driver is removed, not when this particular driver
instance is destroyed.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d6f9880a15fd..35d11be56840 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -380,7 +380,7 @@ static void xe_driver_flr(struct xe_device *xe)
 	xe_mmio_write32(gt, GU_DEBUG, DRIVERFLR_STATUS);
 }
 
-static void xe_driver_flr_fini(struct drm_device *drm, void *arg)
+static void xe_driver_flr_fini(void *arg)
 {
 	struct xe_device *xe = arg;
 
@@ -582,7 +582,7 @@ int xe_device_probe(struct xe_device *xe)
 	err = xe_devcoredump_init(xe);
 	if (err)
 		return err;
-	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
+	err = devm_add_action_or_reset(xe->drm.dev, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
 
-- 
2.45.0

