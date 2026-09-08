Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE56C79FAB
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 06:39:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D2210E9EC;
	Tue,  8 Sep 2026 06:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Auj3dTvW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB6F10E9E1;
 Tue,  8 Sep 2026 06:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788849553; x=1820385553;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZWgSEokEIVz6apnqiITQSzGDuA2o42w76CVxq6MbKTE=;
 b=Auj3dTvWyYA2rMHPQstG38SdmqQD8plh/L7hotncJCHXDwJdWJErrwZm
 lJ29TY2YVlgXGCMx2277yDBYUPa9aGTRPpYVlz0D4HTKNk3h/1UMopaaz
 SAav1OotTodEU5GblCl1UXL9xTHryVFscnhZ0MnboV2ge3ZGbfYOkP0wF
 6pV5D1i3W1wnDJIawGQUNcYcA4WoemRHi9vAiBP2RS6lwoaGhuq88qCIl
 HvDD6CGnNAbOFxha5MwsyC5OIKSt3W9DxXL2xmmCAdEnRripUmW3iWhRS
 bs3Hf5KEC4Tmusk3ytiEEjyoYWn7PHQRJnh2GDqsqqqFZ+wcOBorCwkqF Q==;
X-CSE-ConnectionGUID: OgLwVkQoSCC5mebHv+492A==
X-CSE-MsgGUID: DBVRqDgaTdK5rlaM+KssKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93061792"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="93061792"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:39:13 -0700
X-CSE-ConnectionGUID: cAuFKKGkTK2CllHNQRR93g==
X-CSE-MsgGUID: BM/Pb7EERRGFCUlxisnqhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="264702461"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:39:11 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v5 07/12] drm/i915/dip_regs: Add register definitions for
 common SDP Transmission Line
Date: Tue,  8 Sep 2026 11:52:18 +0530
Message-ID: <20260908062224.2897987-8-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
References: <20260908062224.2897987-1-ankit.k.nautiyal@intel.com>
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

From: Arun R Murthy <arun.r.murthy@intel.com>

Add registers definitions for common SDP transmission line CMN_SDP_TL
and CMN_SDP_TL_STGR_CTL.

v2: Move all registers to intel_dip_regs.h (Ankit)

Bspec: 74384
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dip_regs.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dip_regs.h b/drivers/gpu/drm/i915/display/intel_dip_regs.h
index 85dcbf42e77d..7e69c5cf63da 100644
--- a/drivers/gpu/drm/i915/display/intel_dip_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_dip_regs.h
@@ -14,4 +14,23 @@
 #define   EMP_AS_SDP_DB_TL_MASK			REG_GENMASK(12, 0)
 #define   EMP_AS_SDP_DB_TL(db_transmit_line)	REG_FIELD_PREP(EMP_AS_SDP_DB_TL_MASK, (db_transmit_line))
 
+/* COMMON SDP TRANSMISSION LINE */
+#define _CMN_SDP_TL_A			0x6020c
+#define CMN_SDP_TL(display, trans)	_MMIO_TRANS2(display, (trans), _CMN_SDP_TL_A)
+#define  TRANSMISSION_LINE_ENABLE	REG_BIT(31)
+#define  BASE_TRANSMISSION_LINE_MASK	REG_GENMASK(12, 0)
+#define  BASE_TRANSMISSION_LINE(x)	REG_FIELD_PREP(BASE_TRANSMISSION_LINE_MASK, x)
+
+#define _CMN_SDP_TL_STGR_CTL_A			0x60214
+#define CMN_SDP_TL_STGR_CTL(display, trans)	_MMIO_TRANS2(display, (trans), _CMN_SDP_TL_STGR_CTL_A)
+#define  VSC_EXT_STAGGER_MASK			REG_GENMASK(11, 8)
+#define  VSC_EXT_STAGGER(x)			REG_FIELD_PREP(VSC_EXT_STAGGER_MASK, x)
+#define  VSC_EXT_STAGGER_DEFAULT		0x2
+#define  PPS_STAGGER_MASK			REG_GENMASK(7, 4)
+#define  PPS_STAGGER(x)				REG_FIELD_PREP(PPS_STAGGER_MASK, x)
+#define  PPS_STAGGER_DEFAULT			0x1
+#define  GMP_STAGGER_MASK			REG_GENMASK(3, 0)
+#define  GMP_STAGGER(x)				REG_FIELD_PREP(GMP_STAGGER_MASK, x)
+#define  GMP_STAGGER_DEFAULT			0x0
+
 #endif /* __INTEL_DIP_REGS_H__ */
-- 
2.50.1

