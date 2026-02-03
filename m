Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E19E8783A
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 14:13:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB49710E694;
	Tue,  3 Feb 2026 14:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SyTFD8uo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97C410E695;
 Tue,  3 Feb 2026 14:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770128016; x=1801664016;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DX+X2Hozta83o8SpBXDAw0vk/IEs7eC0BumJgMeTqCM=;
 b=SyTFD8uodyZH1Fhb/GvZANT9QdBTaIkjXyk3Acz0Hz91DIlxwnGkqRfz
 JaxVLLppJI7vOdJtojfQYC97rqg9v1vfe5Zfy54F+nZu8eLCrGupCbPXi
 BGNPfl0kVKO5tHWd88t3h3hrtUnuc4fMRzUUry1qTSAaLqYKBfGgLM2cZ
 UHc8Mk+FkZu+quYeFUDOsRGK/9uAxENNIHhRLwwDEmJi0S6FN7j8iCIET
 w0Q2wyJUu8fN/3rgKEnFFrCnp+BsnQCDv5ALRoQjWvN7xBpAbUDkOHd6m
 Xb9V+Oi2wVf0koICEMtl8d69e6Vt1mUPk2eRXin+ZPyGMhTRG4Lh+MPvs A==;
X-CSE-ConnectionGUID: uWCrTzTIRPWCW2K0+dYjBw==
X-CSE-MsgGUID: sHFTvPLfQD+aS+jRbmZmMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="75156448"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="75156448"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 06:13:35 -0800
X-CSE-ConnectionGUID: DZsXTVTVQcGsl8wsqllHng==
X-CSE-MsgGUID: oEnIYuRNQo2qtskpAZWp8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="208956313"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa006.jf.intel.com with ESMTP; 03 Feb 2026 06:13:33 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dibin.moolakadan.subrahmanian@intel.com, jani.nikula@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v2 07/10] drm/i915/cmtg: program sync to port for cmtg
Date: Tue,  3 Feb 2026 19:14:04 +0530
Message-Id: <20260203134407.2823406-8-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260203134407.2823406-1-animesh.manna@intel.com>
References: <20260203134407.2823406-1-animesh.manna@intel.com>
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

Program Cmtg Sync to Port Sync. Set before enabling the timing generator.
While cmtg start running this bit will be cleared.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c      | 3 +++
 drivers/gpu/drm/i915/display/intel_cmtg_regs.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index 12a081dd7e4d..3af4aefc760e 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.c
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
@@ -258,4 +258,7 @@ void intel_cmtg_enable(const struct intel_crtc_state *crtc_state)
 		       intel_de_read(display, TRANS_SET_CONTEXT_LATENCY(display, cpu_transcoder)));
 
 	intel_cpu_cmtg_transcoder_set_m_n(crtc_state);
+
+	/* Program Cmtg Sync to Port Sync, TRANS_CMTG_CTL */
+	intel_de_rmw(display, TRANS_CMTG_CTL(cpu_transcoder), CMTG_SYNC_TO_PORT, CMTG_SYNC_TO_PORT);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_cmtg_regs.h b/drivers/gpu/drm/i915/display/intel_cmtg_regs.h
index b766ded8686c..0ed767a797c0 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_cmtg_regs.h
@@ -18,7 +18,9 @@
 
 #define TRANS_CMTG_CTL_A		_MMIO(0x6fa88)
 #define TRANS_CMTG_CTL_B		_MMIO(0x6fb88)
+#define TRANS_CMTG_CTL(id)		_MMIO(0x6fa88 + (id) * 0x100)
 #define  CMTG_ENABLE			REG_BIT(31)
+#define  CMTG_SYNC_TO_PORT		REG_BIT(29)
 
 #define TRANS_HTOTAL_CMTG(id)		_MMIO(0x6F000 + (id) * 0x100)
 #define TRANS_HBLANK_CMTG(id)		_MMIO(0x6F004 + (id) * 0x100)
-- 
2.29.0

