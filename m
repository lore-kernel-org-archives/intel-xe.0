Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BCAC3DA63
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 23:22:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86AB810E14E;
	Tue, 23 Jul 2024 23:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VXLNoKGs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7048D10E14E
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 23:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721776968; x=1753312968;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lqBPAZoLp1N2Ajbnj7ZciPMrAhtXje1s7JzUIBKZy1M=;
 b=VXLNoKGsdMd/Zm6F0nfVOUtXKOXE+J+4uxW4lrmfzX/L87PET1zRS4kx
 rwtepxzgOxazjxWmBQOsJEwSxWWIO34e1DqNcQax9sIPDT9xhYrGdQ1sG
 IFN1M4MM8vni4wH2eR6K2PKyaLYMqwtXOJ8Xb6FrDShUy8hAdE86lofSg
 dHSqeHnff9ap+5w+chGVUmHuI0OrZXHjiu/XFxujpsjxR1KhPNy3nArtg
 uqolTBAlIpp8RO7G3LHJzfZ5+P+dfp0xXhb2gPQfACA+KNM7O5qitccX4
 JvVbqetvrdqyEieminEz5fhX9hIo9ystJTQo08VXZ14UiTUi476RONwej g==;
X-CSE-ConnectionGUID: 0A1Q6njNS4yUIcl16hbgHQ==
X-CSE-MsgGUID: /45Dc1fgQk+xgwgbxvjhSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19556469"
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; d="scan'208";a="19556469"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 16:22:47 -0700
X-CSE-ConnectionGUID: N5L6Kr5ySqmuAEiee0+ugQ==
X-CSE-MsgGUID: rFyXzflQR6O5RdQCOlLS1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; d="scan'208";a="52106974"
Received: from pallavim-desk.iind.intel.com ([10.145.162.180])
 by fmviesa007.fm.intel.com with ESMTP; 23 Jul 2024 16:22:45 -0700
From: Pallavi Mishra <pallavi.mishra@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, jose.souza@intel.com, carl.zhang@intel.com,
 jonathan.cavitt@intel.com, Pallavi Mishra <pallavi.mishra@intel.com>
Subject: [Intel-xe] [PATCH v4] drm/xe/xe2: Enable Priority Mem Read
Date: Wed, 24 Jul 2024 05:01:31 +0530
Message-Id: <20240723233131.1122655-1-pallavi.mishra@intel.com>
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
data from memory.

No pattern identified in KMD that could lead to a hazard.

v2: Modify commit message, enable priority mem read feature for media,
modify version range, modify bspec detail (Matt Roper)

v3: Rebase, fix cramped line-wrapping (jcavitt)

v4: Rebase

Bspec: 60298, 60237, 60187, 60188

Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Acked-by: José Roberto de Souza <jose.souza@intel.com>
Acked-by: Carl Zhang <carl.zhang@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
 drivers/gpu/drm/xe/xe_hw_engine.c        | 11 +++++++++++
 2 files changed, 12 insertions(+)

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
index 07ed9fd28f19..5483deaab1bd 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -425,6 +425,17 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 					   0xA,
 					   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 		},
+		/* Enable Priority Mem Read */
+		{ XE_RTP_NAME("Priority_Mem_Read"),
+		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
+		  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
+				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+		},
+		{ XE_RTP_NAME("Priority_Mem_Read_For_Media"),
+		  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, XE_RTP_END_VERSION_UNDEFINED)),
+		  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
+				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+		},
 		{}
 	};
 
-- 
2.25.1

