Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DD4CEACDE
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 21:43:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC90610EB33;
	Fri, 14 Nov 2025 21:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XP1qPhIw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9274110EB2A
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 21:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763156630; x=1794692630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9OnlIDHyLJzo8H6dAUlM/AIfS/k1/MyIzpJxjavaT1M=;
 b=XP1qPhIwn9I/bljkR4vcYLsuXpSY825/BcnVwSyxz2Ms1W89NGScQdB6
 K5sGxM1NTJP+0anMW11Q6PRpOf5xU+/PSdD1mJ14ZhUuBXn0vUGyNwcnF
 29/c8D+a3vGctOMLBotowpdVfCT0mBHWldsCSrsz/BuiVd7g1xGbFHWTt
 DUx16EkfAQEdLXWrcMu8ecpzgZxlg3m7v0By5raWbVq54wSw5jDAkW/9E
 OVWJKiQ0YZW5Wfv22X5QG7e1lkrNLoweohr20HZ4DowlqiU/vCbdSC7uR
 LMKfeSyzearxEVYv9liXsIKIRLRer3cglF9d+o46KVEyRoS/ErkUvybYZ g==;
X-CSE-ConnectionGUID: kjIQKkqwT76RZ2COOygiQA==
X-CSE-MsgGUID: JG/95yZrSIeJu2Q7h8CJ3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82648325"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82648325"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:43:50 -0800
X-CSE-ConnectionGUID: SvHdPcUARAiJwMRz3BR26w==
X-CSE-MsgGUID: Pnb7bYUjRzK5v79uZewhUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="190308336"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 13:43:48 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v3 21/27] drm/xe/bo: Use scope-based runtime PM
Date: Fri, 14 Nov 2025 13:43:57 -0800
Message-ID: <20251114214335.2388972-50-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251114214335.2388972-29-matthew.d.roper@intel.com>
References: <20251114214335.2388972-29-matthew.d.roper@intel.com>
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

