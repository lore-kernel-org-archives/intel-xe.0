Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273C9CAC5B0
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 23:46:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D662210E9C6;
	Thu, 25 Sep 2025 23:46:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mq4dGuDA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FDC10E30A
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 23:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758844007; x=1790380007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9Ljo8E3Z3C+FI2SrW25MIIdAVLsKMjYavHqVwhc9Sxg=;
 b=Mq4dGuDAK/pTkRpx3Lw03ZKl8YdruV8TOeaX9f3FrmIFRdcF35jwMUx0
 ZSUcxKMsf26QJ22jeABE1aHfQbSCno98uxOQlE7boI9UESAo6ENPVhHF7
 KmUUYAEnpgkK8EW6m6c9mRyTT9piL2qqLmDOr1jQHUKygp5WHzlel7weM
 XUYWNfbK6siPC41d875z12NUuwxBs+iH6+c2e/QDJC7ZOYhHmu64QqvPe
 VnS0MlkS0uzGEiPb5ZzRvHKwBkLMESvmUPR3jRq2IVqkN3Vv5bwX4XEPK
 elJ8ahDMH4moQiCGQT1I+rN96cUyIg218URqBK0IJI7g1EnT4Q/Oj5aoE A==;
X-CSE-ConnectionGUID: fRdiVnAqSmCI9bwDnbF65w==
X-CSE-MsgGUID: p9Im2F24Qq66UWWFl5m1ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="78817670"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="78817670"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
X-CSE-ConnectionGUID: RU/1l+/mSR+s8quFAKHTJw==
X-CSE-MsgGUID: tBJnZ5itQ7OkT4mqrPI9Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; d="scan'208";a="181852968"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 16:46:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 08/22] drm/xe: Skip L2 / TDF cache flushes if primary GT is
 disabled
Date: Thu, 25 Sep 2025 16:46:36 -0700
Message-ID: <20250925234628.2112163-32-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925234628.2112163-24-matthew.d.roper@intel.com>
References: <20250925234628.2112163-24-matthew.d.roper@intel.com>
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

If the primary GT is disabled via configfs, GT-side L2 and TD cache
flushes are unnecessary since nothing is using/filling these caches.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 09f8a66c9728..bf99792e772c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1061,6 +1061,8 @@ void xe_device_l2_flush(struct xe_device *xe)
 	unsigned int fw_ref;
 
 	gt = xe_root_mmio_gt(xe);
+	if (!gt)
+		return;
 
 	if (!XE_GT_WA(gt, 16023588340))
 		return;
@@ -1106,6 +1108,9 @@ void xe_device_td_flush(struct xe_device *xe)
 		return;
 
 	root_gt = xe_root_mmio_gt(xe);
+	if (!root_gt)
+		return;
+
 	if (XE_GT_WA(root_gt, 16023588340)) {
 		/* A transient flush is not sufficient: flush the L2 */
 		xe_device_l2_flush(xe);
-- 
2.51.0

