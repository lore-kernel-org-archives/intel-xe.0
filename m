Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89E9CCA476
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 20:49:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE3A10E70B;
	Tue,  7 Oct 2025 20:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GN7kE2b9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED1C10E38D
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 20:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759870130; x=1791406130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tyxLl+ijl0BKlq/pr2uYEsVHvC8UsbQB4ucvCrZLkso=;
 b=GN7kE2b9eP/TslzPjTu4j0dXuoJJ9v7rds4r5nk3otf67v1CN2gKGNm2
 Hg3oKw9m5W+jYnA4xJCNmaGo5aYbKTJ6hCd5XMFt9t2XAFEspBbzBplpw
 MOwRS/9AKxQLT57omGnH/eGO4ZvEiUZzMI3wmvtVgfjeuEuYHlLXJ3KbU
 TeJ1CWhHM4lJSFgpywi+AxeZcIARleM/n2HqQcnWrsA48n8NCat6FzV7v
 ZLvoSc/wJDmckgZJwX8+nKhGxu78zw+5B7m8K/OsuH6u6ZvUo4pvAnPvV
 +y6wgMM0omjtq4VnW+7PLEhmAWK3OFpXM2DKU2lzNc+/k6hWGKDuMMPPw g==;
X-CSE-ConnectionGUID: PLCms+qETm+cfxgpA+VbNg==
X-CSE-MsgGUID: NrktY+TfQ3uvHv16VlHFAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="49616758"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="49616758"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:49 -0700
X-CSE-ConnectionGUID: OYmHFOfQRy+/7+Lf1oKP6A==
X-CSE-MsgGUID: Cb+MYIE2STGElIrV6dp2Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="184631116"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v4 19/23] drm/xe: Check that GT is not NULL before testing
 Wa_16023588340
Date: Tue,  7 Oct 2025 13:48:49 -0700
Message-ID: <20251007204829.1468209-44-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007204829.1468209-25-matthew.d.roper@intel.com>
References: <20251007204829.1468209-25-matthew.d.roper@intel.com>
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

If the primary GT is disabled, skip the check for this workaround (which
only applies to dgpu platforms where the primary GT cannot be NULL).

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display_wa.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display_wa.c b/drivers/gpu/drm/xe/display/xe_display_wa.c
index 8ada1cbcb16c..2aa1b8c03411 100644
--- a/drivers/gpu/drm/xe/display/xe_display_wa.c
+++ b/drivers/gpu/drm/xe/display/xe_display_wa.c
@@ -13,6 +13,7 @@
 bool intel_display_needs_wa_16023588340(struct intel_display *display)
 {
 	struct xe_device *xe = to_xe_device(display->drm);
+	struct xe_gt *wa_gt = xe_root_mmio_gt(xe);
 
-	return XE_GT_WA(xe_root_mmio_gt(xe), 16023588340);
+	return wa_gt && XE_GT_WA(wa_gt, 16023588340);
 }
-- 
2.51.0

