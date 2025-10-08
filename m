Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DA0CCD1AA
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 18:05:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A3710E8AB;
	Wed,  8 Oct 2025 18:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jq0wPuvZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1616110E894
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 18:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759946710; x=1791482710;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=vqy65TM/erB+dODD3Z2jzO+3Uzmt7zG98Lqdn4wDiCc=;
 b=Jq0wPuvZq2E9vgA0gRW2JbjSjgXBdnFC2SGgG5pLSVbwCzKCf7VX5yOd
 BsYMcyVb4OjrxywxbodrpkX4lnibO7xzmwf92Qp1Lz+uuRZVQE1G3nDeU
 UfzhQlQl6AQesUa2LjDbp9+G6IWBFBMFdzeX7c8ej8E5JNDwpbaPgu87B
 AbLj7zXuGqHG37AYvxulrTNYh79MEO3O9Y+o90zrWM3fnr6aQrE7BSH5g
 FolXOJ9IGgLfaCrQ/jCH+WzoVKiDi2GpHjj2O2KnnYdUtgvTBRK7TLoFB
 2bP7IVuowlTxsGu4UAP2V3ENdFI3GOl8etcRFo9DLKbRYVOqQ7J6uF5r7 w==;
X-CSE-ConnectionGUID: Iv1bD0F3TSWgCTFnRlSGEA==
X-CSE-MsgGUID: j/r0jmM1SAqjKvbnopohSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62067544"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62067544"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 11:05:07 -0700
X-CSE-ConnectionGUID: +8kxzrt4SOem7ZOEIsX6Sw==
X-CSE-MsgGUID: AYqORwXoR76CgRDPSJua4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="217593752"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 11:05:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v9 34/34] drm/xe/guc: Increase wait timeout to 2sec after BUSY
 reply from GuC
Date: Wed,  8 Oct 2025 11:05:00 -0700
Message-Id: <20251008180500.3261209-35-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251008180500.3261209-1-matthew.brost@intel.com>
References: <20251008180500.3261209-1-matthew.brost@intel.com>
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
index d5adbbb013ec..d94490979adc 100644
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

