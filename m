Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05428CEE342
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 16:44:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD18D10E508;
	Tue, 18 Nov 2025 16:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dL7CcGZH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E6FF10E4F6
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 16:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763484231; x=1795020231;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9OnlIDHyLJzo8H6dAUlM/AIfS/k1/MyIzpJxjavaT1M=;
 b=dL7CcGZHijncviAjeXy1vok5zBYMGyYdEkXrNa/I60xJCufObaOfDPUr
 7v5a3doXHd+AgAxhe5kov8cPi/HJ2gZUuKZc49iAHnKcTSiwvwrfbHkMs
 cQ5Ld5MWrD4vbA1XNk1Ez3Q75x4L5gBs4rUpbPUqzB6r45xJKPlSFoShw
 wQv5of+4JQp7uVwhMEQt9sxxgcUYrPi1y2yWTKGHS7B8P7GjMTqKilkaq
 9tf0VRik6/xVuT5KMzT7Pp8BB4fK7OogDDH7ftv1+q0XqcntXRP3Pwv4B
 69D9cdvU0CWjUaz6dzuj6CzRsuSzAzdAUfnWGoVcg7gvaA9T5OohO6cnn w==;
X-CSE-ConnectionGUID: iToLwBduSFyzJgoCRoUFUg==
X-CSE-MsgGUID: E6+EZM9eQ7WOmeGNZHKNmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65544785"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65544785"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:51 -0800
X-CSE-ConnectionGUID: KXl+XQHpSDePcQktKPhWTw==
X-CSE-MsgGUID: 6wq0SfJuSuCgEZkoOH+ovg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190952261"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 08:43:51 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [CI 21/27] drm/xe/bo: Use scope-based runtime PM
Date: Tue, 18 Nov 2025 08:44:00 -0800
Message-ID: <20251118164338.3572146-50-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251118164338.3572146-29-matthew.d.roper@intel.com>
References: <20251118164338.3572146-29-matthew.d.roper@intel.com>
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

Use scope-based runtime power management in the BO code for consistency
with other parts of the driver.

v2:
 - Drop unnecessary 'ret' variable.  (Gustavo)

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index b0bd31d14bb9..6fd6ce6c6586 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2033,13 +2033,9 @@ static int xe_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 	struct ttm_buffer_object *ttm_bo = vma->vm_private_data;
 	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
 	struct xe_device *xe = xe_bo_device(bo);
-	int ret;
 
-	xe_pm_runtime_get(xe);
-	ret = ttm_bo_vm_access(vma, addr, buf, len, write);
-	xe_pm_runtime_put(xe);
-
-	return ret;
+	guard(xe_pm_runtime)(xe);
+	return ttm_bo_vm_access(vma, addr, buf, len, write);
 }
 
 /**
-- 
2.51.1

