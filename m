Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE54CCA476
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 22:57:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A858710E2FE;
	Tue, 30 Sep 2025 22:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ENDuMhvT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE5510E2E1
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 22:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759272994; x=1790808994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XD0xPgLl+SywKOUiFsAi61yH1dNAfHHcCj8RD+KTqkI=;
 b=ENDuMhvTKvesT6F6Oe43N5jhJnsJVspIo+Ao7Cyn3HDaRtzY/FqTwtPu
 jS4/p4IFehVR6/egEvMcWEVFUlrhtHPDNlEs/QBDZG7wTJfOaIVMXl/jw
 Xql960r/NxvbT1bgEr44utvpzNd5A/ga96W9j0PmjfSrZyk9oOrMssfa+
 wjvEwygtPi3v0D2VICyblYEfcVrlM11odzcutrM7nEk/QE7fswPEaC/3G
 gEZvqO3wmR94M1tfawn9RlcEbR6ptUDuHvohwBE9lDoM6sdRXUmK9IcNO
 Q5RJtKT4pBAKVV9Mvpq9i8SzM7IscR1ftGQr07mGuIvnO2NKFzr+jtb7I Q==;
X-CSE-ConnectionGUID: rxRWibWvQsGvShsQ9mPBJg==
X-CSE-MsgGUID: UL3Ep7oHR6ispPOb72D8cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65397761"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="65397761"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 15:56:33 -0700
X-CSE-ConnectionGUID: k9ykwh9NQ1OPKUgzWtvtYw==
X-CSE-MsgGUID: IGWhBqtWTU2DaVKlULBrlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="178229492"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 15:56:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v3 20/23] drm/xe: Don't check BIOS-disabled FlatCCS if primary
 GT is disabled
Date: Tue, 30 Sep 2025 15:56:37 -0700
Message-ID: <20250930225618.140071-45-matthew.d.roper@intel.com>
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

If the primary is GT is disabled via configfs, we can't read the GT
registers that would tell us whether the BIOS has disabled FlatCCS on a
platform that would otherwise have it; we'll just proceed as if the
FlatCCS is still enabled.  This is similar to the situation seen by
SRIOV VFs and doesn't cause any functional problems since the hardware
will simply drop writes to the CCS region and reads will always come
back as 0 (indicating uncompressed data).  We'll simply miss out on the
chance to avoid some unnecessary overhead during BO creation and
migration.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d42d03b8ab3a..82921d72ebfa 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -782,6 +782,8 @@ static int probe_has_flat_ccs(struct xe_device *xe)
 		return 0;
 
 	gt = xe_root_mmio_gt(xe);
+	if (!gt)
+		return 0;
 
 	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (!fw_ref)
-- 
2.51.0

