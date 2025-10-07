Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4894BCCD185
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 11:27:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F7E610E692;
	Tue,  7 Oct 2025 11:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C+vPdm1a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0BA10E5D0
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 11:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759836413; x=1791372413;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=vqy65TM/erB+dODD3Z2jzO+3Uzmt7zG98Lqdn4wDiCc=;
 b=C+vPdm1aPwTzYij2onrD/GW3QxWKhb66W7wV76mgh9ZV0UNjfdXVRB84
 mzfG0T/srmW07n4ukGqUq+L4VIVvuEbdQzz1tQVrvxIsbqYYSX6LwFVag
 KIL3VsnB3UiI5Vs9Pqm0vjl9GixwyfgfyJzEXz2Wqyj9H10m306qcqOTJ
 wSxJ+O9HxfzKb83rks9a47wjYcoX8fsGePWV0AUfnxp2vMWpATRgBTBJ2
 9EOJkjP+rAr4BtZHfu+5qwVlJKcSzPqrmWr+HdP1ns5YJ7V1L1az+V2WA
 wWta1gm/r+AoJpanGGjE1MXLFnYtf8y7nf8IhpFlXQTZhQr3NFWYHLbrf A==;
X-CSE-ConnectionGUID: b9HGQzMlQvqknIj6kcITlA==
X-CSE-MsgGUID: RhbfWk5YRMmHtsp4IaFLIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="65660705"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="65660705"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 04:26:53 -0700
X-CSE-ConnectionGUID: bboIQfPHTpCphJoUKOCBQw==
X-CSE-MsgGUID: oNZMqb+FTASxLHh38ZiwaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180924025"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 04:26:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 32/32] drm/xe/guc: Increase wait timeout to 2sec after BUSY
 reply from GuC
Date: Tue,  7 Oct 2025 04:26:41 -0700
Message-Id: <20251007112641.2669655-33-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007112641.2669655-1-matthew.brost@intel.com>
References: <20251007112641.2669655-1-matthew.brost@intel.com>
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

