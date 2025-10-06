Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CBACCD185
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 10:45:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA5310E40C;
	Mon,  6 Oct 2025 10:45:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CfJABsGZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B31410E3FE
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 10:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759747495; x=1791283495;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=L8+A6Uau+/2K5YadtuewVSudAlCxYXWhd3gl0ho9e4A=;
 b=CfJABsGZI8zRsHVcCTIhVemlBD2fVjr+WMig3qAIbMrozEXzjIdaLnjN
 ifuUwjpLfCDumuj281t0kR7vSELYZpGoAvhCy3SxbvSwVbzzNe54FIPh2
 eKHfsm8Epl9q9e/1BilfoAiSzQa5t0kyo9K6qu94CQiDpJwc2Jothgwsc
 aaTf5zsm3dnY8mQDsZNYRF5JW4t32Z1ENMvSJPMfCKxDMufERQU0lPdPC
 NIt2HkyY3JOx50DFpZl47Y0QvhQvv0z96MLiZAYCbstdM0WJfSBcIglfm
 3EU5jRDu5gOuPkJpFIT4JkkZnAK4x9ROrGXRMP9GF5Fa+hng5ZHaU0s8D A==;
X-CSE-ConnectionGUID: 7Zn9aRZWTtOIdhCzpe5K3Q==
X-CSE-MsgGUID: 0hLxqTdhSO+uMLPzM6JluA==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="84546344"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="84546344"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 03:44:54 -0700
X-CSE-ConnectionGUID: XjsZGqn6QsqaGQ7sybSg6Q==
X-CSE-MsgGUID: kb9tGjJOS9iXY80CunU8zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="203589347"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 03:44:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 30/30] drm/xe/guc: Increase wait timeout to 2sec after BUSY
 reply from GuC
Date: Mon,  6 Oct 2025 03:44:45 -0700
Message-Id: <20251006104445.2210624-31-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006104445.2210624-1-matthew.brost@intel.com>
References: <20251006104445.2210624-1-matthew.brost@intel.com>
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

From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

Some VF2GUC actions may take longer to process. Increase default timeout
after received BUSY indication to 2sec to cover all worst case scenarios.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index c016a11b6ab1..f0de1fa61898 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1439,7 +1439,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 		BUILD_BUG_ON((GUC_HXG_TYPE_RESPONSE_SUCCESS ^ GUC_HXG_TYPE_RESPONSE_FAILURE) != 1);
 
 		ret = xe_mmio_wait32(mmio, reply_reg, resp_mask, resp_mask,
-				     1000000, &header, false);
+				     2000000, &header, false);
 
 		if (unlikely(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, header) !=
 			     GUC_HXG_ORIGIN_GUC))
-- 
2.34.1

