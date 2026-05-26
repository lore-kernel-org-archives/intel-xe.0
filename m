Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257CBCD5BD2
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 14:19:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F2D10E6A9;
	Tue, 26 May 2026 14:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y+MiDqxN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E0F10E6A2
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 14:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779805159; x=1811341159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eUsyElcVWDskUDaf4ujVaffMNVBWr5l9DjBkPbkLJYM=;
 b=Y+MiDqxNDIUf8OVpJKPU5q/6DGam9jYPBF4WdRCCLm1eHFIvfnRW21Xc
 2NqIcS7hq2HxSI8uGzBkrTUJNgCnkysWtAODemyZ0fOLPK83kCbukwt7e
 KPhhkG7ZuBNb/eoLTb/BdD04+pMnsA1PmzkN512UeMJOcZCr+T24kzmYn
 rd5Q70cqL0Au+khoBtNS3ZPx7GR0qCl4O+qXviGbZODJauBh7q4lryEgy
 0JXWE35pMmyZ5sIoXY8hVZS8t84CaPsC/K6A6NV5Uf9HUUbk3aRebUPxM
 RtpqF3ffdBQZaI3mEgW1vNlPbcgR6w+vHl9ddpURlqYFDJ0Guu6K5tTMF A==;
X-CSE-ConnectionGUID: 50vlHXoGRxCMBRVf26Eg5g==
X-CSE-MsgGUID: yI/aI9KdQWiMcJCrLJrVRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="84505745"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="84505745"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 07:19:19 -0700
X-CSE-ConnectionGUID: JAoz88zyT1ma2GC1t+5XaA==
X-CSE-MsgGUID: e7fJHHeyS0awaiyrGDOfBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="247015731"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.128])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 07:19:18 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v3 04/10] drm/xe/hw_engine: don't open code is_usm_hwe()
Date: Tue, 26 May 2026 15:19:06 +0100
Message-ID: <20260526141901.62207-16-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526141901.62207-12-matthew.auld@intel.com>
References: <20260526141901.62207-12-matthew.auld@intel.com>
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

Prefer is_usm_hwe() here.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 8c66ff6f3d3c..768b0cd4c16a 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -1037,8 +1037,7 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
 	    hwe->logical_instance >= gt->ccs_mode)
 		return true;
 
-	return xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
-		hwe->instance == gt->usm.reserved_bcs_instance;
+	return xe_gt_is_usm_hwe(gt, hwe);
 }
 
 const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
-- 
2.54.0

