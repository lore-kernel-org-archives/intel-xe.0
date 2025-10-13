Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB59CCD192
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 20:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB3610E509;
	Mon, 13 Oct 2025 20:10:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jaozljG8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E9410E503
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 20:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760386202; x=1791922202;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FTyPbQL/8B5MBpAWrY3a29agP1Rfy6NlkwX8qtBHACc=;
 b=jaozljG8w+PuZHx45nrucyNbY9nEfipOWxQ51SmLEtrjgmtdQQxwB7L9
 EFQDyAMGjgRkjj4SDE6YXjIxPCD/Xm3SIvBQDIPTU4tQwPRjUG000ED4i
 KtpoxdpGjmRPSfYc4cfRB6t4w4lirA/d2c/owYhpH9aeCW4v21tAlRD61
 itAHUNKjZ6/ktGMFtm3eHoD77m3ck+NxpfHI76Mlnq7Oh1AeKrOZP4Qhu
 M4TNjpVd2yYRfht3g0YGNfIk/lyu83G4yDITHDPnICgSg+0/7bRKDo22R
 jps6cEk+XptK3x/Cf2BPM5pJ22aB6l9D9eHpTLCsnlRNIycbXtT6h8xU/ A==;
X-CSE-ConnectionGUID: V1n2jL24QDun+EnPe68qHQ==
X-CSE-MsgGUID: ilvd9siJSVidD7z8QWxDlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="72800538"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="72800538"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:10:02 -0700
X-CSE-ConnectionGUID: cv+9d1UcTpWhOvihnFqlig==
X-CSE-MsgGUID: rbh79A/VT5+2/k5PvHkpvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="185707556"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:10:01 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v5 10/23] drm/xe/query: Report hwconfig size as 0 if primary
 GT is disabled
Date: Mon, 13 Oct 2025 13:09:53 -0700
Message-ID: <20251013200944.2499947-35-matthew.d.roper@intel.com>
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

The hwconfig table is part of the primary GT's GuC firmware.  If the
primary GT is disabled, the hwconfig is unavailable and should be
reported to userspace as having size 0.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 2e9ff33ed2fe..1c0915e2cc16 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -436,7 +436,7 @@ static int query_hwconfig(struct xe_device *xe,
 			  struct drm_xe_device_query *query)
 {
 	struct xe_gt *gt = xe_root_mmio_gt(xe);
-	size_t size = xe_guc_hwconfig_size(&gt->uc.guc);
+	size_t size = gt ? xe_guc_hwconfig_size(&gt->uc.guc) : 0;
 	void __user *query_ptr = u64_to_user_ptr(query->data);
 	void *hwconfig;
 
-- 
2.51.0

