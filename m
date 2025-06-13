Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B40C7114A
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 19:31:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3069610E5F9;
	Fri, 13 Jun 2025 19:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GHjAml6t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D62010E4AC
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 19:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749843111; x=1781379111;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u+A4djWyxul/7aUftPaPaTVrtFp/KVcNv7uVgzQeTx4=;
 b=GHjAml6tjk/UgPWFDDjeqVLCgOyxoOAZP2v1OGBImyYbg3K65eVgjQcU
 zR/HoD3eezwYg/nwyTevH1S5FQWuu7kQUlwHg722FMb//qc49DGiDPYQt
 Vk959enidR+9/oPexc+kSamSdYyXNBeirSW4oJcGV+iVCkGz6rLI9oz2e
 jpU2EF73ybMTmj63QA3M0t4VZ53oKBeVM0WDzE1bPvzjJnPuYyizq5Y4P
 /PMGJtPYAdtdt9+groEngcx3bv3GEExIjc1dQVhLH430eBxkY/JBV7Zg+
 OxsFUpC76aehfJpQjfVChFJdCm3AzHX102ES/Yv4x7ctg2r5bSUg5PKsH Q==;
X-CSE-ConnectionGUID: 3zwq0dXSQkmsaDQiD1ATSA==
X-CSE-MsgGUID: ZRJIEa8ZTJydEh0iUk2+ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69510502"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="69510502"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 12:31:51 -0700
X-CSE-ConnectionGUID: XvALmhdUREe+bPAYNS153A==
X-CSE-MsgGUID: XU6jSkfhQSmeNy9ASQjxDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="151722641"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by fmviesa003.fm.intel.com with ESMTP; 13 Jun 2025 12:31:49 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v6 1/9] drm/i915/xe3lpd: Add support for display version 30.02
Date: Sat, 14 Jun 2025 01:01:38 +0530
Message-Id: <20250613193146.3549862-2-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613193146.3549862-1-dnyaneshwar.bhadane@intel.com>
References: <20250613193146.3549862-1-dnyaneshwar.bhadane@intel.com>
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
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
index a4070f40e26f..089cffabbad5 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -1480,6 +1480,7 @@ static const struct {
 	{ 14,  1, &xe2_hpd_display },
 	{ 20,  0, &xe2_lpd_display },
 	{ 30,  0, &xe2_lpd_display },
+	{ 30,  2, &xe2_lpd_display },
 };
 
 static const struct intel_display_device_info *
-- 
2.34.1

