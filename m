Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C0B6C83F03
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 20:13:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C2110E63C;
	Tue,  1 Jul 2025 20:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RKCyhDhh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A9410E135
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 20:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751400812; x=1782936812;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2pgA/J1IP3fC2613zgDIbV2L6uaXM6vhH7kWQSbuxiw=;
 b=RKCyhDhhRV87V3BS6yI6gd/CqyAhMek5/rsijZtlQAz62+SOufze9SGJ
 pspW2n0/EqMSg0wPjRejhEo2jlmlOPp38ceflbG9Hxm1bxA+5QyRIQjX6
 uWhikaVeuBVDw3bCmNTpVNJEvbG8cwD5k4unoV7wuLuIa3GnH+H4qVKyE
 AFfUMWZcf/UKx1MCUg5PX2RZTf2qKGNnaWZod6aVh12j31fgByQKBV49g
 oAGUyD5PFzejLz0uwg7ECiULvdaYptQpts4uVON59PV1vpBM8iOeTo28s
 T3c8NWilXIWzRy9dIBjmigbnpO7KHIOzKr7YoOGIC728HOafxTiH2txS8 Q==;
X-CSE-ConnectionGUID: NDZKbBCQQPiF8vrgWs7DUA==
X-CSE-MsgGUID: t2mZYzheQ/+L7R3oKk8KvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53545992"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53545992"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 13:13:31 -0700
X-CSE-ConnectionGUID: 8YUeaOTlRC2h9HcFAhD9sQ==
X-CSE-MsgGUID: 6LrqoLpdRcuxm5A4hMhKTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="177539667"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 13:13:31 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH v4 1/7] drm/xe/pmu: Fix GT sanity check in event_supported()
Date: Tue,  1 Jul 2025 13:13:22 -0700
Message-ID: <20250701201320.2514369-10-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701201320.2514369-9-matthew.d.roper@intel.com>
References: <20250701201320.2514369-9-matthew.d.roper@intel.com>
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

event_supported() tries to ensure that the GT ID passed is valid by
comparing against XE_MAX_GT_PER_TILE.  However this does not account
for cases where a GT ID is within the proper range, but still references
a non-existent / fused-off GT (e.g., GT ID = 1 on a PVC platform with
only a single tile).  Switch the check to an actual GT lookup
so that EINVAL will be returned properly for all non-existent GTs.

Cc: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 69df0e3520a5..cab51d826345 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -157,10 +157,13 @@ static bool event_gt_forcewake(struct perf_event *event)
 	return true;
 }
 
-static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
+static bool event_supported(struct xe_pmu *pmu, unsigned int gt_id,
 			    unsigned int id)
 {
-	if (gt >= XE_MAX_GT_PER_TILE)
+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
+	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
+
+	if (!gt)
 		return false;
 
 	return id < sizeof(pmu->supported_events) * BITS_PER_BYTE &&
-- 
2.49.0

