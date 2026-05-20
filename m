Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661D9CD4F3C
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 11:39:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2881010F034;
	Wed, 20 May 2026 11:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yhm8hxf5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3760E10F034
 for <intel-xe@lists.freedesktop.org>; Wed, 20 May 2026 11:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779277182; x=1810813182;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=shG41k2k9oHXkeK9R+SPYhyM6ErN0stDUr4Oh/11s7U=;
 b=Yhm8hxf5zrpVfMyXkwZJVcvXvpdhIvYSLZPEkxkmhZQWw1wau5lKkTXu
 QturF4e23GQD8GxQXS08jt+9C86La2/Yi+p4yXFdC/LzgNQ/JboS40oO5
 TzKNLrJO6+nPbvqCSQQEOa0X1UAu5c5wahg9TreTynkMP9I02N4a2BkBM
 IsnJqP5pJdfwlYMflKiNHojuVlwF+q7qMwXwHfVBi6snX3j/2My6RMZzq
 60HsGtLt+K3ZDJiA/Dvxm6simiOZPktcEguZwRi0UZfxBjbdOElapWjmm
 N8K3PzDoiawNSKyOFv2sh5UVGvMeA3/IkSNTV2U8OTg6PgB0CJB3y6AtQ Q==;
X-CSE-ConnectionGUID: lqG14t5lRPiqOI4++w8PnA==
X-CSE-MsgGUID: ZdQ0XwAYTBCCl7swAdPHAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80023169"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="80023169"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 04:39:42 -0700
X-CSE-ConnectionGUID: cXUj3YcjSDaiLdVwMwRr3g==
X-CSE-MsgGUID: RsZMIoKnSZSjiw8YEoY30Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="233792246"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa009.fm.intel.com with ESMTP; 20 May 2026 04:39:39 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 umesh.nerlige.ramappa@intel.com, mallesh.koujalagi@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 2/5] drm/xe/hw_error: Initialize hw_error_work per tile
Date: Wed, 20 May 2026 17:04:07 +0530
Message-ID: <20260520113622.171462-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520113622.171462-1-raag.jadav@intel.com>
References: <20260520113622.171462-1-raag.jadav@intel.com>
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

Since hw_error_work is now being reused generically, initialize it per tile
so that we don't hit uninitialized work for non-root tile. While at it,
disable hw_error_work on fini to prevent UAF during unwind.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_error.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
index 016e15d2723c..8faed870aade 100644
--- a/drivers/gpu/drm/xe/xe_hw_error.c
+++ b/drivers/gpu/drm/xe/xe_hw_error.c
@@ -540,6 +540,16 @@ static void process_hw_errors(struct xe_device *xe)
 	}
 }
 
+static void hw_error_fini(void *arg)
+{
+	struct xe_device *xe = arg;
+	struct xe_tile *tile;
+	u8 id;
+
+	for_each_tile(tile, xe, id)
+		disable_work_sync(&tile->hw_error_work);
+}
+
 /**
  * xe_hw_error_init - Initialize hw errors
  * @xe: xe device instance
@@ -549,17 +559,20 @@ static void process_hw_errors(struct xe_device *xe)
  */
 void xe_hw_error_init(struct xe_device *xe)
 {
-	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_tile *tile;
+	u8 id;
 	int ret;
 
 	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
 		return;
 
-	INIT_WORK(&tile->hw_error_work, hw_error_work);
+	for_each_tile(tile, xe, id)
+		INIT_WORK(&tile->hw_error_work, hw_error_work);
 
 	ret = hw_error_info_init(xe);
 	if (ret)
 		drm_err(&xe->drm, "Failed to initialize XE DRM RAS (%pe)\n", ERR_PTR(ret));
 
 	process_hw_errors(xe);
+	devm_add_action_or_reset(xe->drm.dev, hw_error_fini, xe);
 }
-- 
2.43.0

