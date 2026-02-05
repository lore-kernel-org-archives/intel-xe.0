Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FC6E8B364
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 23:40:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8DDD10E1A5;
	Thu,  5 Feb 2026 23:40:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nk2bkimT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12A510E1A3;
 Thu,  5 Feb 2026 23:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770334835; x=1801870835;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=3oSDfd/V1XaaFO1zg5Y7G5Rjxvmz33nQ4qPf1n0mC0A=;
 b=nk2bkimTxCSzh0J5TdOStfEC8Qwp3LUIOKSNzFeMlSRP+tnfeR+5EUKI
 X8ThLka5eHBETXd7EybtGRGBtSslImO8+6OPRDs7Opg72pX3k9iSrtO2y
 UjIPwRfo1AmCa8G7tuXdPVeCqU0HdEYvp83QbShshM+5/qdNO9BkH69ZT
 d7hqshOAml0Kxm33ZD1YY9TPSX165aISz6IiGywMwrY9dC9FNWjJ0FYmq
 +6m86DUdIL0lfDASnGjgmW71wC/Cb/+Mrtjx/WETcMxBtlUXRDLNaDVlb
 l4timMi8tizggMX0XrzJigr/Kh4UWrmAFVyNex2n98ELCzFIfOvEX1GAs A==;
X-CSE-ConnectionGUID: H4Ng5tUIRyWnIYuElMD+eA==
X-CSE-MsgGUID: BXMnS/4OTBCqJK+OKvHRow==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="82658687"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="82658687"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 15:40:34 -0800
X-CSE-ConnectionGUID: cU4K8O5iRP+zzx+DmkKoOQ==
X-CSE-MsgGUID: 77B/MrarRn20VuHy9DzKkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="210500137"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.222.82])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 15:40:29 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 05 Feb 2026 20:39:37 -0300
Subject: [PATCH v2 09/15] drm/xe/xe3p_lpg: Extend 'group ID' mask size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-nvl-p-upstreaming-v2-9-9ec14f00cc6c@intel.com>
References: <20260205-nvl-p-upstreaming-v2-0-9ec14f00cc6c@intel.com>
In-Reply-To: <20260205-nvl-p-upstreaming-v2-0-9ec14f00cc6c@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>, 
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
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

From: Matt Roper <matthew.d.roper@intel.com>

Xe3p_LPG extends the 'group ID' register mask by one bit.  Since the new
upper bit (12) was unused on previous platforms, we can safely extend
the existing mask size without worrying about adding conditional version
checks to the register programming.

Bspec: 67175
Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 55f5be7283db..f626cc584bd9 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -58,7 +58,7 @@
 #define   MCR_SLICE(slice)			REG_FIELD_PREP(MCR_SLICE_MASK, slice)
 #define   MCR_SUBSLICE_MASK			REG_GENMASK(26, 24)
 #define   MCR_SUBSLICE(subslice)		REG_FIELD_PREP(MCR_SUBSLICE_MASK, subslice)
-#define   MTL_MCR_GROUPID			REG_GENMASK(11, 8)
+#define   MTL_MCR_GROUPID			REG_GENMASK(12, 8)
 #define   MTL_MCR_INSTANCEID			REG_GENMASK(3, 0)
 
 #define PS_INVOCATION_COUNT			XE_REG(0x2348)

-- 
2.52.0

