Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E01CCD187
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 22:56:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A56110E63F;
	Tue, 30 Sep 2025 22:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mEdibhO4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5D010E2E1
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 22:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759272993; x=1790808993;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6xzIBeEAICG7ZDM9XXHJrDE9Xqd7aXrdF6Pz8goqeyo=;
 b=mEdibhO4Ysaf25PyAJj2qhYK+lEzcVLGnlBopBWWfdDVmfZ7L/rexGSF
 Lp6/L2vMa12EIMmyq3gyVICot6i0tuwN6pzbtSHQPz9jCgEXI1ptOa3EH
 /D+N7NB8eWyd0fYtpqQT+kHtK6PsyFARjc4ar++pUyckwHRSeGPSGvVg6
 s7lwYVDADv+x4D0VtUQzYNCr9KO4bayCQh8qk+A2oZCMRdyDK55ZX0oNO
 Wki0pJD7bH+3Owh/ZntHPPphK/ROkfqT4J4RJjj7L89JcMJfbZBK886Tw
 t65Q2/7saZzf6DJd/HJW17KaoOMYt4/Iox7mOrZ611fVK1wUexhcVEvL2 Q==;
X-CSE-ConnectionGUID: BQm2MbXPRsCaLTwLqfaskw==
X-CSE-MsgGUID: LFfpagZFROqdX8ytRRFh4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65397750"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="65397750"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 15:56:32 -0700
X-CSE-ConnectionGUID: f43qowDTTAO6vHuTWJRgmg==
X-CSE-MsgGUID: HrGo/yOSTq6uQgXiXUfqFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="178229459"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 15:56:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v3 09/23] drm/xe: Skip L2 / TDF cache flushes if primary GT is
 disabled
Date: Tue, 30 Sep 2025 15:56:26 -0700
Message-ID: <20250930225618.140071-34-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930225618.140071-25-matthew.d.roper@intel.com>
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
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

