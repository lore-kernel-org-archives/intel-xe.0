Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAE7E8B365
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 21:13:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5FE10E315;
	Tue,  3 Feb 2026 21:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h7OLjvmb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB27A10E315
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 21:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770153194; x=1801689194;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DFBT88EHaKtCtLYtIda0dZcJx/cXnyvUxz2YzwbZPxE=;
 b=h7OLjvmb/a232C8VBoF3rV8PBYc4ICZxlL0s418lyy/44LowF+5FjKxy
 vIjLGsdSyXmMIsce9/0LgaTIsDGZnKVK/gE8P8H4obtIXpeirRd5VVSOP
 Jb6MFH9SDfhspV9Ijf+7LLqz00vbfHNvb9O8rziPnsVGprzwbHyxop/sm
 XtK7wgIkTPVwTT/IoJZY4ZyocJGDXOS1E8JjFX2GX+vU5ngLrbP911e9k
 xl7Hp69oBxPxh9OrT2KGfYhAO5WYXocMDn24NrP83JV1smwI5zaOX0kP1
 tHs0q637IEQ/u0x7Gntk+GxLqE6DDf8G+rBWv/JJow+KE5qBIYBGPQkHk g==;
X-CSE-ConnectionGUID: 8dLnTRDiS0Gw+wRRuaLq9g==
X-CSE-MsgGUID: jPZfDHRCSd+vQxBi/CTIww==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="58913914"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="58913914"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 13:13:13 -0800
X-CSE-ConnectionGUID: yCIdRI2RQ/ecJK/BT/CjZQ==
X-CSE-MsgGUID: ZVz55DInRkueza4yku6RAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="210079758"
Received: from unknown (HELO mwajdecz-hp.clients.intel.com) ([10.246.19.151])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 13:13:10 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v2 4/4] drm/xe: Drop unnecessary include from xe_tile.h
Date: Tue,  3 Feb 2026 22:12:39 +0100
Message-ID: <20260203211240.745-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203211240.745-1-michal.wajdeczko@intel.com>
References: <20260203211240.745-1-michal.wajdeczko@intel.com>
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

We don't need to include xe_device_types.h there.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
v1: https://patchwork.freedesktop.org/patch/656887/?series=149807&rev=1
v2: rebased
---
 drivers/gpu/drm/xe/xe_tile.h       | 4 ++--
 drivers/gpu/drm/xe/xe_tile_sysfs.c | 2 +-
 drivers/gpu/drm/xe/xe_vram_freq.c  | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index 734132eddda5..a2a2c0e936b8 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -6,10 +6,10 @@
 #ifndef _XE_TILE_H_
 #define _XE_TILE_H_
 
-#include "xe_device_types.h"
+#include "xe_tile_types.h"
 
+struct xe_device;
 struct xe_pagemap;
-struct xe_tile;
 
 int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id);
 int xe_tile_init_noalloc(struct xe_tile *tile);
diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
index 9e1236a9ec67..f2bf7314954d 100644
--- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
@@ -7,8 +7,8 @@
 #include <linux/sysfs.h>
 #include <drm/drm_managed.h>
 
+#include "xe_device_types.h"
 #include "xe_pm.h"
-#include "xe_tile.h"
 #include "xe_tile_sysfs.h"
 #include "xe_vram_freq.h"
 
diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c b/drivers/gpu/drm/xe/xe_vram_freq.c
index 6f8281e0b96a..8717367ccd4c 100644
--- a/drivers/gpu/drm/xe/xe_vram_freq.c
+++ b/drivers/gpu/drm/xe/xe_vram_freq.c
@@ -5,9 +5,9 @@
 #include <linux/sysfs.h>
 #include <drm/drm_managed.h>
 
+#include "xe_device_types.h"
 #include "xe_pcode.h"
 #include "xe_pcode_api.h"
-#include "xe_tile.h"
 #include "xe_tile_sysfs.h"
 #include "xe_vram_freq.h"
 
-- 
2.47.1

