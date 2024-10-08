Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049ACCED24D
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 01:35:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42DB10E44A;
	Tue,  8 Oct 2024 01:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C7XSPUgv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336BB10E352
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 01:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728351319; x=1759887319;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wxjrI/fxNpE87xBESZE7rtq36hu3UztIm6VD4oqXezw=;
 b=C7XSPUgvDdlOExqVUBywcMDXPXxXN2poeuOzOCyirV9sEm8qUyqvjMdX
 S5qtSop4kwYCnaLEvzJHq9fktmMuc/Dkamqc13A4BliVGKwZpwJBGNTn+
 ipWCYGH3mcz2q36kBIab5mp1crsHf3ypCR7BfKyPws4E2Jo2d1PTwwuyB
 jaYCAoT+4YVPDQvlvPB4uhdVv5lIoS5LR6ZVtBpw1E9MJ4N0KAA7VoeZe
 OAG4roPSVO+rdUed5kyeMoEPnTUQRfKATtLJhrKnX/9c6u7MROik08Muw
 jFH5piVyuYg78j5GIp6dDmVkISwFl+8QrbgZ3vx4f5HvuamgQpLxEsvNF Q==;
X-CSE-ConnectionGUID: eQ03i6hhTSKlIML/GEGGEw==
X-CSE-MsgGUID: OuGbIQjSSFykqPFcrdpUNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38652976"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="38652976"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 18:35:18 -0700
X-CSE-ConnectionGUID: N9wrHUnbSYCaMj/jamrzmg==
X-CSE-MsgGUID: Y0tPiJIzSrC/v/3q938yuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="80454314"
Received: from msatwood-mobl.amr.corp.intel.com (HELO
 msatwood-mobl.hsd1.or.comcast.net) ([10.125.110.117])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 18:35:17 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Haridhar Kalvala <haridhar.kalvala@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH 4/6] drm/xe/ptl: PTL re-uses Xe2 MOCS table
Date: Mon,  7 Oct 2024 18:35:07 -0700
Message-ID: <20241008013509.61233-5-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241008013509.61233-1-matthew.s.atwood@intel.com>
References: <20241008013509.61233-1-matthew.s.atwood@intel.com>
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

From: Haridhar Kalvala <haridhar.kalvala@intel.com>

PTL is Xe3 architecture but there is no difference between LNL and PTL
in MOCS table.  So, PTL uses the same MOCS table as LNL.

Bpsec: 71582

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>
Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index 8df41cd12d51..231d0e86ed83 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -576,6 +576,7 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
 	memset(info, 0, sizeof(struct xe_mocs_info));
 
 	switch (xe->info.platform) {
+	case XE_PANTHERLAKE:
 	case XE_LUNARLAKE:
 	case XE_BATTLEMAGE:
 		info->ops = &xe2_mocs_ops;
-- 
2.45.0

