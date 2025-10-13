Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B231DCCD196
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 20:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F5710E50D;
	Mon, 13 Oct 2025 20:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n5wYRSPU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E4010E500
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 20:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760386202; x=1791922202;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vtXBDDv/NP+dCHGaShGUa8GenbYECs6JwlkhezlaZyg=;
 b=n5wYRSPUSk0Y88Y3TqQqXo7uijWAGLn/73ULbN/QOV8uZRVfoeyZpmVW
 UxDRzBH2kbd/6f1X8VnToD7t0L/bOrDsxCJIgF8f60QbVl86PNwI/pCSD
 g91ZwqNrIClli4z1EG2+/enXFpOYtP2StVWJFmPbJlXSER0XQNTUwzvCd
 lAib5Qx6bq8qMLcAVy/r3UyfjhuhONQqrIZly/B7xpktMjRf5vmrdPt3t
 vf/ZHnc4+fuCd61b7+uFgevd2ZfDlEoeFIwW61QHoNVtQgiQoqtxV7L70
 C4yEzrfGr5PIHZ/mccTHdXZd5DcUagA9mfpKR4PDZA/NPYEGurUOaqSam A==;
X-CSE-ConnectionGUID: aW+VbNp7SyKNNGPWTmTl0w==
X-CSE-MsgGUID: HhY0Ck4GSRCxoq+NzkCr3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="72800537"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="72800537"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:10:02 -0700
X-CSE-ConnectionGUID: PvX4hMTMS3e6LpDW9/SfCA==
X-CSE-MsgGUID: U0atJDg2S66MovV4kkzWVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="185707552"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:10:01 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v5 09/23] drm/xe: Skip L2 / TDF cache flushes if primary GT is
 disabled
Date: Mon, 13 Oct 2025 13:09:52 -0700
Message-ID: <20251013200944.2499947-34-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013200944.2499947-25-matthew.d.roper@intel.com>
References: <20251013200944.2499947-25-matthew.d.roper@intel.com>
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
index 6f8f72fd1b13..e2aa79a78938 100644
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

