Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA70C5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 18:24:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9397210E8F8;
	Tue,  3 Jun 2025 18:24:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="InNso9M2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63EA210E74E
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 18:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748975076; x=1780511076;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0FIC44T+FwE86sV240zNv58aKnMJ+h9qEnOnfxpbQoU=;
 b=InNso9M2rT68YvcDUv8epVA9hUlxiUdtp6Dcm0G1jDGGCmMqu+OC9CLD
 PmxyzF4OGWSWY5sroNKwkwyG0hhz4C7Q3BK+ndicHZzImn2jXiru/a9AL
 nnpynJAhCdw/nLdseyGxFoOswGx4WTRqikZ60gXA1RRRRN7j0DVue9NXv
 1KYbNPd5qyO+azWnnhGmVY1sBUjS3jlKuMRQ5WC82/7aw5Dyage9DEeOI
 LcZxHMAAizG9lLbyyRmFgWzupsNODLttGodPxFSC2AJjTQ6MblB56PjEn
 eogoYfLlYEO0dkX0NrYfabeMqDYwA2X+c8BDUlLd/9uTlPD/fMbWexHMs A==;
X-CSE-ConnectionGUID: LH9DeAbFTwyxSX4CDFUbiw==
X-CSE-MsgGUID: eH+j6VExQBuELl0SMqsS3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="54693857"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="54693857"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 11:24:36 -0700
X-CSE-ConnectionGUID: ELch/v0oQzSjKCq1kvlJ0g==
X-CSE-MsgGUID: UsrQ4KAAQECAz7f3Gj/x7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="145562024"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa007.jf.intel.com with ESMTP; 03 Jun 2025 11:24:35 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH 1/6] drm/i915/xe3lpd: Add support for display version 30.02
Date: Tue,  3 Jun 2025 23:54:25 +0530
Message-Id: <20250603182430.1016734-2-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603182430.1016734-1-dnyaneshwar.bhadane@intel.com>
References: <20250603182430.1016734-1-dnyaneshwar.bhadane@intel.com>
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

From: Matt Roper <matthew.d.roper@intel.com>

Display version 30.02 should be treated the same as other Xe3 IP, but
will have a slightly different set of workarounds.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
index 90d714598664..e0db4781bdf0 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -1479,6 +1479,7 @@ static const struct {
 	{ 14,  1, &xe2_hpd_display },
 	{ 20,  0, &xe2_lpd_display },
 	{ 30,  0, &xe2_lpd_display },
+	{ 30,  2, &xe2_lpd_display },
 };
 
 static const struct intel_display_device_info *
-- 
2.34.1

