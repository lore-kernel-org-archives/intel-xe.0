Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E3BCD4F39
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 21:45:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F8D10E5FC;
	Thu, 14 May 2026 21:45:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M8i9Git1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73AEA10E5F7
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 21:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778795114; x=1810331114;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=wi2ksnzSjX7mxynZSA5EdITNJek6Un3bI78IqW6FWjQ=;
 b=M8i9Git1Ms7fGD9PVXfgm0TyThiizroXq6OzZavh73VFNtLkMt39LJWR
 wRERKKzvQUfIwbXBAhQELofd26dnP3sIzNQ9SFIwrwh14zBNsBLxQn7tf
 KzF/IZ5kAZ/AY3rWlK8HC9f+9vYM/Sn4tGzADkxp/stpaWdTnemWyoTrG
 29H8Nxfsg07IzO0ZcqjNWcQopxKm+kXDfKovdMhGcZ9ToF2zbLULEhHpN
 Hx6i1zn31L/c3zXObqG11ux6BZE2Sa3k52+A1HnMH9QoOqzFozUtDj0wC
 wONBgrd6Eo9nPqnnovH9yTVtfTaZMYbAZ2RfuJjUkReu7y81Ho8NLX99L A==;
X-CSE-ConnectionGUID: ZXB6bDdHRDeb6FZDBXZapQ==
X-CSE-MsgGUID: NTgqO3XSRJaVFuYrGnjkPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="67277254"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="67277254"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 14:45:14 -0700
X-CSE-ConnectionGUID: S2mr3k26SfCRFP/a7bRo1Q==
X-CSE-MsgGUID: Mx+uMAKrRPKuf6FK8w8hzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="238613181"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.189])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 14:45:13 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 14 May 2026 18:44:44 -0300
Subject: [PATCH v3 1/7] drm/xe: Define CACHE_MODE_1 as MCR register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-rtp-mcr-check-v3-1-30dd47855fee@intel.com>
References: <20260514-rtp-mcr-check-v3-0-30dd47855fee@intel.com>
In-Reply-To: <20260514-rtp-mcr-check-v3-0-30dd47855fee@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.15-dev
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

CACHE_MODE_1 is a MCR register for all platforms that currently use it
in the Xe driver.  Use XE_REG_MCR() when defining it.

Fixes: 8cd7e9759766 ("drm/xe: Add missing DG2 lrc workarounds")
Fixes: ff063430caa8 ("drm/xe/mtl: Add some initial MTL workarounds")
Bspec: 66534, 67788
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 16c87ce3f614..408933aee08a 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -152,7 +152,7 @@
 
 #define XEHPG_INSTDONE_GEOM_SVGUNIT		XE_REG_MCR(0x666c)
 
-#define CACHE_MODE_1				XE_REG(0x7004, XE_REG_OPTION_MASKED)
+#define CACHE_MODE_1				XE_REG_MCR(0x7004, XE_REG_OPTION_MASKED)
 #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
 
 #define COMMON_SLICE_CHICKEN1			XE_REG(0x7010, XE_REG_OPTION_MASKED)

-- 
2.53.0

