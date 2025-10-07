Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54155CCD187
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 20:49:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15AE710E713;
	Tue,  7 Oct 2025 20:49:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EkbEiPx3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A72410E38E
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 20:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759870131; x=1791406131;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IpPVwRbs5m2CgrLfiLTrK7nVXi3jJYWQcL8Ak1QRS4Y=;
 b=EkbEiPx3cdT6PvPnDVGjkyUaJUUXfmbs3hh/HPa4vi6neH2KS1xFMnNb
 oDfx7AO+2K0mSzaC4hoTgU5Dy5NRFN92U5fAc/qePp8BxiI1vHeI+MPo5
 2k+Xny/D1rxxzTqmwz4gnBXH/eEP2vcfLnWRVfDo1nY+C0FmQ3j+pl6Ry
 V8AtJ72hKgpGqe7oX3PvHM6oHFoG2dkKiXiNv5zQ0mEgi2Ph3ZlKeyJrM
 TJvyadDdQ2We2LQDdd+icFuk6+YjhMQpsC8H90SADm90Iy6u4/SHif7JG
 wzEetOddtW42+9H74dJKdH7SGPuvXNDdbKL7W2PGz1iZycEIFdFBGcOQc g==;
X-CSE-ConnectionGUID: rMo8Bm+lTfadeYQjr5WFVQ==
X-CSE-MsgGUID: qkGNDGMuTU+XQ9ZWf3OHjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="49616759"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="49616759"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:49 -0700
X-CSE-ConnectionGUID: O2GlZqRtSLGdF6NbJAN4zg==
X-CSE-MsgGUID: 6+kJ6lQEQk2dmptJgSUm7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="184631119"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v4 20/23] drm/xe: Don't check BIOS-disabled FlatCCS if primary
 GT is disabled
Date: Tue,  7 Oct 2025 13:48:50 -0700
Message-ID: <20251007204829.1468209-45-matthew.d.roper@intel.com>
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
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
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

