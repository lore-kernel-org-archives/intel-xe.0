Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791A6E9A04D
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 00:26:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1099C10E642;
	Thu, 19 Feb 2026 00:26:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QKDC1r7i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C14B10E156
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 00:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771460802; x=1802996802;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v2/qViNqAyyEeT4Id6K5TgrB8XGpDG/dhDFWWrOYIa4=;
 b=QKDC1r7iPBMVpmRrH+0AyX0cjFzcDJgKk+IDxrUZZLoSE8d1RcL0J8WC
 ESKjfoIrEJtxHthKDVJPKLvSGG9l3c8fmU3L6QH10EPhFCtMBVxMhvnB0
 aVvAyy0EyN9/Z54YZWMexp7fLMO8dsKUkDAYTTpH1PyiGG1qY5Y/MmTZf
 VLyhgrZFC7EnoUJ2S8GtV5lUmtKw6kgKCIm+UvH5sB7KE42bC0xZN88eQ
 VMZFeRQzH5ThheQHeHP+5HaWytt20jfIShVmwa5OYV8gukbgy5IEebR56
 dS5bIKQNXxkspTjyIXq7QaySJxbUFF1aA7VDTVKoWdhijmTQyn3kBy/e5 Q==;
X-CSE-ConnectionGUID: 1SakM2GwTLiO+lV+n0TXIg==
X-CSE-MsgGUID: DnooYD+ESv6Os+p/RvCmLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72449410"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72449410"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 16:26:42 -0800
X-CSE-ConnectionGUID: 13dzo3pRQWma4O2vDkpT8g==
X-CSE-MsgGUID: c9UFo5x5R5yEt57xKT70Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="218499632"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 16:26:43 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 2/3] drm/xe/pxp: Remove incorrect handling of impossible state
 during suspend
Date: Wed, 18 Feb 2026 16:26:30 -0800
Message-ID: <20260219002627.1208210-7-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219002627.1208210-5-daniele.ceraolospurio@intel.com>
References: <20260219002627.1208210-5-daniele.ceraolospurio@intel.com>
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

The default case of the PXP suspend switch is incorrectly exiting
without releasing the lock. However, this case is impossible to hit
because we're switching on an enum and all the valid enum values have
their own cases. Therefore, we can just get rid of the default case
and rely on the compiler to warn us if a new enum value is added and
we forget to add it to the switch.

Fixes: 51462211f4a9 ("drm/xe/pxp: add PXP PM support")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_pxp.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
index 782281dbe9e0..fa82d606953e 100644
--- a/drivers/gpu/drm/xe/xe_pxp.c
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -871,11 +871,6 @@ int xe_pxp_pm_suspend(struct xe_pxp *pxp)
 		pxp->key_instance++;
 		needs_queue_inval = true;
 		break;
-	default:
-		drm_err(&pxp->xe->drm, "unexpected state during PXP suspend: %u",
-			pxp->status);
-		ret = -EIO;
-		goto out;
 	}
 
 	/*
@@ -900,7 +895,6 @@ int xe_pxp_pm_suspend(struct xe_pxp *pxp)
 
 	pxp->last_suspend_key_instance = pxp->key_instance;
 
-out:
 	return ret;
 }
 
-- 
2.43.0

