Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD03C021BB
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 15:07:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ABA210E09A;
	Mon, 24 Feb 2025 15:07:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QYK6t7mZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E34610E09A
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 15:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740409638; x=1771945638;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AsZr0jXldEmocesNku/rxIMtKs6E2lqVmdhwZPur8RI=;
 b=QYK6t7mZUvaYwpH2r77SSeMOmMtVBh8Dvwa5ZbRepD6M7OGCqFMGTTo7
 lf1DCLJ5eeJN3UqSVV8YO2l8gjFz6GCi40Av60M8Q3XwzEK4XNFVeQKWu
 13DW8PhxK/PFb6xDFKGhqUCcH/5NjIIOpdNzese7OdLfC2AgdnjFktiKw
 ep+t+n+nkMr1ibP1LGgjcnRP07tBxtJQ6zonLCWoqrekfd7HBRsRwYTTO
 1XR+13Z4Vkaek3FgH/t+YygTm0mnvjRZDA6Y1U6i08zZo0uVwQ12FhQux
 r1rHwYnC9Tkp99fr0/ZOXE5SqDShTMEjxZ+wRXk/fAQjNo/yfzN0stAqp g==;
X-CSE-ConnectionGUID: +m/kWa3mRbyH8K+wRhpI0g==
X-CSE-MsgGUID: PFObfkJCRD2I3BLJm6QyeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="28763879"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="28763879"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 07:07:17 -0800
X-CSE-ConnectionGUID: xFswt+NzTrSv5pnZzkkN+A==
X-CSE-MsgGUID: OtrVqTe1R2aehrvdUVT4OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121349489"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.80.79])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 07:07:16 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 2/5] drm/xe/sriov: Prepare IS_SRIOV_PF to accept const
 pointer
Date: Mon, 24 Feb 2025 16:06:57 +0100
Message-Id: <20250224150700.1778-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250224150700.1778-1-michal.wajdeczko@intel.com>
References: <20250224150700.1778-1-michal.wajdeczko@intel.com>
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

For builds without CONFIG_PCI_IOV we have an optimized variant
of the IS_SRIOV_PF(xe) macro that always evaluates to false,
but we still try to validate corectness of the xe argument.
Unfortunately typecheck() alone doesn't work well for cases
where xe could be a const pointer. Try use _Generic() instead.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
index 688fbabf08f1..cba6a608bf27 100644
--- a/drivers/gpu/drm/xe/xe_sriov.h
+++ b/drivers/gpu/drm/xe/xe_sriov.h
@@ -38,7 +38,7 @@ static inline bool xe_device_is_sriov_vf(const struct xe_device *xe)
 #ifdef CONFIG_PCI_IOV
 #define IS_SRIOV_PF(xe) xe_device_is_sriov_pf(xe)
 #else
-#define IS_SRIOV_PF(xe) (typecheck(struct xe_device *, (xe)) && false)
+#define IS_SRIOV_PF(xe) _Generic((xe), const struct xe_device * : false, struct xe_device * : false)
 #endif
 #define IS_SRIOV_VF(xe) xe_device_is_sriov_vf(xe)
 
-- 
2.47.1

