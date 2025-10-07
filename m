Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958EFCCA476
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 20:49:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56DDE10E389;
	Tue,  7 Oct 2025 20:49:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TrV/AYau";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8AE710E38D
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 20:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759870130; x=1791406130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9pnOU8JtrEliZf5t2NwJ5Z1zgvoAeKYobiBHBRDDBsg=;
 b=TrV/AYauCF+j0xe5jDpnkPENx1B9tmPXolEpEtJIJjOh+sRQCyXnDfce
 kZOhIdE437cm2roXTfgJFJL0HXuFlUg4Ye7W6GIJrMXQ5N/pLzpzlL6Wo
 1JZaj5MapW0zGGvqDqr23C/xr50dRM4zCyH4BJK+oeJAK0T1vB3DdlbLy
 JGsMqGMSdB5YjfJCLYtwDXQvauzEK6e0rwCGjpZLLy+NSPhuJ7oLMKRL7
 U0uGT65FFYG50jxUckB/XxRIKTnIiZ60hy2uQ1nt88XCPPvSAxkbgW4Di
 ueiSNy2c9OADhDmDPQod/vsYZngr4YlRXhRnjpOTcBF/E4L1XJtB7bBXR g==;
X-CSE-ConnectionGUID: Dr8RXj+yRxOBHMPb07Qh3g==
X-CSE-MsgGUID: O42cqBo5Q2mbd38l6LG4zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="49616746"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="49616746"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:49 -0700
X-CSE-ConnectionGUID: GD0umgpnS+awxJwgE7A7mA==
X-CSE-MsgGUID: qDcY6cDfSc2jhKx3MLnSGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="184631084"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v4 09/23] drm/xe: Skip L2 / TDF cache flushes if primary GT is
 disabled
Date: Tue,  7 Oct 2025 13:48:39 -0700
Message-ID: <20251007204829.1468209-34-matthew.d.roper@intel.com>
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

If the primary GT is disabled via configfs, GT-side L2 and TD cache
flushes are unnecessary since nothing is using/filling these caches.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 386940323630..d42d03b8ab3a 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1062,6 +1062,8 @@ void xe_device_l2_flush(struct xe_device *xe)
 	unsigned int fw_ref;
 
 	gt = xe_root_mmio_gt(xe);
+	if (!gt)
+		return;
 
 	if (!XE_GT_WA(gt, 16023588340))
 		return;
@@ -1107,6 +1109,9 @@ void xe_device_td_flush(struct xe_device *xe)
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

