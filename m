Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC580EE6B46
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 18:36:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96FCD10E8CB;
	Fri,  6 Feb 2026 18:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ajH3zLTv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A38010E8CB;
 Fri,  6 Feb 2026 18:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770403003; x=1801939003;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=yYPA80I0CRycZ5cnPZYI4a2DMpQOzza6Qq7co2OihVw=;
 b=ajH3zLTvn0xUm4TZurtSFPx8ELJclgwjfLbnqYm1JsfNTtBHx/4Masyg
 5AQvT0m4tcseiVxhddT8LxyfyzR2zJlsZmP4YiUI08zklQfnAtQhrqH6E
 J9DjJ0IQqbzBumbyn10EUV9NpdEkuVHskQVygsRciRnMl+XuUlDPakM0x
 6/pJKtyggvIpieQo/KZNoTSwj81TWOmb0dz6JZ3eJ0SPNtJQs0v1p79aM
 newD7pin+Iqp0zhuggvF4zQIQD5SgqROooYtGuXDnaiYgmulwX+0PZYyj
 BlHpbe4mpaegzjm0ckk1SMyjpinOQ2x94uyplTzvxXODug6Cy5UFsp97n g==;
X-CSE-ConnectionGUID: 0zKn/kCyQnSlGYATlpah9A==
X-CSE-MsgGUID: O2iiNvutQACdvlrkTtZDSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71516949"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="71516949"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 10:36:43 -0800
X-CSE-ConnectionGUID: mGVsRBSrQrCJPUdRGUtbbw==
X-CSE-MsgGUID: iIhoPTrTQc+ezK9DVxINWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="210224758"
Received: from vverma7-mobl3.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.222.159])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 10:36:41 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 06 Feb 2026 15:36:05 -0300
Subject: [PATCH v3 09/15] drm/xe/xe3p_lpg: Extend 'group ID' mask size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-nvl-p-upstreaming-v3-9-636e1ad32688@intel.com>
References: <20260206-nvl-p-upstreaming-v3-0-636e1ad32688@intel.com>
In-Reply-To: <20260206-nvl-p-upstreaming-v3-0-636e1ad32688@intel.com>
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
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index d593331202e8..ff77523e823e 100644
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

