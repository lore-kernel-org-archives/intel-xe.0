Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8452FC3DA5D
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 20:30:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F65E10E30D;
	Thu, 25 Jul 2024 20:30:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WXyreHFY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41E710E30D
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 20:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721939435; x=1753475435;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Tz1VG8Jw0FDhT8FVMfHGW8NDydMbzPfcIyFXBUjuX4A=;
 b=WXyreHFYWc8IctbfCRl/fwH5ecITy0lunczBoSkg8o0wGUfC+Wktbf+S
 cDH7lHPxz+JfBDR3k+j/9+Toux2qiAYU+nQKdENB7QW3VdTVL4+KM8HS/
 p9sZsSqT6GcMvl29ii+KuN7CwUfNK9a5CyMt1KdIPValWjvIINMTwMVAu
 emeuKn7/20MCtPx6265RMVHkayRLxEMltfo8daqNRqAMF+d/bC6hjQ6ks
 JKrt6kLtX/ET9IKUXpbF0qxOKjYViDal/9b+9xI40HDgqhXRS313Ntoxp
 StZPl5xOm6dck7zxRIBf940ZpkR2dAbCduepQ3faA2xOC/F4u2SfYO4EG g==;
X-CSE-ConnectionGUID: Q/+bpq8PQmGmOEytPVZz6A==
X-CSE-MsgGUID: jWlANE6LSOya10JEB2nBVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="37171525"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="37171525"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 13:30:35 -0700
X-CSE-ConnectionGUID: 7072m09wRZSsnntkvhnLsA==
X-CSE-MsgGUID: xf7vWgDPQuycweuAda+ZbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="57861600"
Received: from pallavim-desk.iind.intel.com ([10.145.162.180])
 by orviesa003.jf.intel.com with ESMTP; 25 Jul 2024 13:30:33 -0700
From: Pallavi Mishra <pallavi.mishra@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, jose.souza@intel.com, carl.zhang@intel.com,
 jonathan.cavitt@intel.com, Pallavi Mishra <pallavi.mishra@intel.com>
Subject: [Intel-xe] [PATCH v5] drm/xe/xe2: Enable Priority Mem Read
Date: Fri, 26 Jul 2024 02:09:37 +0530
Message-Id: <20240725203937.1296582-1-pallavi.mishra@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Enable feature to allow memory reads to take a priority memory path.
This will reduce latency on the read path, but may introduce read after
write (RAW) hazards as read and writes will no longer be ordered.

To avoid RAW hazards, SW can use the MI_MEM_FENCE command or any other
MI command that generates non posted memory writes.  This will ensure
data is coherent in memory prior to execution of commands which read
data from memory. RCS,BCS and CCS support this feature.

No pattern identified in KMD that could lead to a hazard.

v2: Modify commit message, enable priority mem read feature for media,
modify version range, modify bspec detail (Matt Roper)

v3: Rebase, fix cramped line-wrapping (jcavitt)

v4: Rebase

v5: Media does not support Priority Mem Read. Modify commit
to reflect the same.

Bspec: 60298, 60237, 60187, 60188

Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Acked-by: José Roberto de Souza <jose.souza@intel.com>
Acked-by: Carl Zhang <carl.zhang@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 1 +
 drivers/gpu/drm/xe/xe_hw_engine.c        | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index c38db2a74614..81b71903675e 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -104,6 +104,7 @@
 #define CSFE_CHICKEN1(base)			XE_REG((base) + 0xd4, XE_REG_OPTION_MASKED)
 #define   GHWSP_CSB_REPORT_DIS			REG_BIT(15)
 #define   PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS	REG_BIT(14)
+#define   CS_PRIORITY_MEM_READ			REG_BIT(7)
 
 #define FF_SLICE_CS_CHICKEN1(base)		XE_REG((base) + 0xe0, XE_REG_OPTION_MASKED)
 #define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 07ed9fd28f19..f8c9e439f2c6 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -425,6 +425,12 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 					   0xA,
 					   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 		},
+		/* Enable Priority Mem Read */
+		{ XE_RTP_NAME("Priority_Mem_Read"),
+		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
+		  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
+				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+		},
 		{}
 	};
 
-- 
2.25.1

