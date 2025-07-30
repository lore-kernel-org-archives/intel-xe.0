Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60EFC87FC9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 05:49:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5635F10E36B;
	Wed, 30 Jul 2025 05:49:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NwUetcw7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87E210E35F
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 05:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753854576; x=1785390576;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1MvsF7TjeeHUAFKjJuN8x4PHgTF0fOeJKL7+HUdCkl4=;
 b=NwUetcw7sB5ln27ix0Le42woy2q+14G5W90O+8HC4M33CrwFhJT1uXmG
 A6qpP0E4Mdew9iFD/mMZxJIn1NqY5lfLEjkTiM9yU426arfOrBINvRuvE
 YTOCbfW4KlmYH9IWEESDYmwNsj4Zahk4+FPK+cEIB99E54EXqWYj4pWCM
 EW4UKmEB+8etXR8a3sjXG+/nvv+2oQzi1h9+5GiwsQ8BBLBBbK9TjX8vo
 nmE3KS0chCTbeSncIB/2NYQUqStJcd1WmTvsDi9bA4wR69kUrCw0xUo0M
 Xm6yhn15XvXT8gCv/IAlq01bg30E+4wHWVF98d5VSmDUil2CpAFf6Yfu5 g==;
X-CSE-ConnectionGUID: I1Sd7iJQQsaja2D6HbN3zg==
X-CSE-MsgGUID: sezvXztuTz+ST1MGAm3Pzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="55215606"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="55215606"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 22:49:36 -0700
X-CSE-ConnectionGUID: uyxcCBeMRxmSeyFmA5P3BQ==
X-CSE-MsgGUID: V73H0crhTG2js81IeWtkPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="163240221"
Received: from aravind-dev.iind.intel.com ([10.190.239.36])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 22:49:29 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, rodrigo.vivi@intel.com,
 himal.prasad.ghimiray@intel.com, anshuman.gupta@intel.com
Subject: [PATCH 02/10] drm/xe: Add new helpers to log hardware errrors.
Date: Wed, 30 Jul 2025 11:18:06 +0530
Message-Id: <20250730054814.1376770-3-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250730054814.1376770-1-aravind.iddamsetty@linux.intel.com>
References: <20250730054814.1376770-1-aravind.iddamsetty@linux.intel.com>
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

From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Introducing xe_gt_log_hw_err and xe_gt_log_hw_err helper to
report gt specific hardware errors.

v2
- use _gt and _fmt instead of gt and fmt.
- Messages should be same.

Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_printk.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
index 11da0228cea7..2f9baf7d191b 100644
--- a/drivers/gpu/drm/xe/xe_gt_printk.h
+++ b/drivers/gpu/drm/xe/xe_gt_printk.h
@@ -46,6 +46,13 @@
 #define xe_gt_WARN_ON_ONCE(_gt, _condition) \
 	xe_gt_WARN_ONCE((_gt), _condition, "%s(%s)", "gt_WARN_ON_ONCE", __stringify(_condition))
 
+#define xe_gt_log_hw_err(_gt, _fmt, ...) \
+	drm_err_ratelimited(&gt_to_xe(_gt)->drm, HW_ERR "GT%d reported " _fmt, \
+			    (_gt)->info.id, ##__VA_ARGS__)
+
+#define xe_gt_log_hw_warn(_gt, _fmt, ...) \
+	drm_warn(&gt_to_xe(_gt)->drm, HW_ERR "GT%d reported " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+
 static inline void __xe_gt_printfn_err(struct drm_printer *p, struct va_format *vaf)
 {
 	struct xe_gt *gt = p->arg;
-- 
2.25.1

