Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B88C7618D
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 00:30:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E6810E6AA;
	Tue, 14 Mar 2023 00:30:54 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BBE10E6B2
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 00:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678753847; x=1710289847;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ir2SYRUPC5Mj6JgXO994xYXWoItgRqvuVZ6N62cvekQ=;
 b=cTo4cR62mYzIbQlqxxa0eNpswt+qj7vaBlG1YCSbSRklDdA3fhoD4zkQ
 wXBXgjlZxWfdQqKpy6jZsT6rKOyz/zYalm2uzDGD7zDjx7hV6jgJ42yL5
 kKw2wYvDdS4Erou3v+qlv8tkAHjcwzx5tEB5ejCLoFZIPBOY5iv4QGa2i
 E52HeyEETPzmszfokvWAq8/MI/Rua+UFj2NRxop0LuAwXvLsWJrXk8qiN
 L6M71XJDKBdJO4Hus/gaV3WHnJ0p/NvugJMI1AGW9wTWZsPev9Lq/7qgj
 /nIiNhkdxpIsDOceBH2mzkPqHXximPPBltDSeHn2mgAHu6B3Iy92HukSq g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="402168037"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="402168037"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 17:30:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="789116717"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="789116717"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 17:30:46 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Mar 2023 17:30:11 -0700
Message-Id: <20230314003012.2600353-14-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230314003012.2600353-1-lucas.demarchi@intel.com>
References: <20230314003012.2600353-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 13/14] drm/xe: Add missing LRC workarounds for
 graphics 1200
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Synchronize LRC workarounds for graphics version 1200 with i915 up to
commit 7cdae9e9ee5e ("drm/i915: Move DG2 tuning to the right function").
These were probably missed for TGL/RKL before because in i915 it uses a
!IS_DG1() condition.  Avoid a similar issue by just checking the
graphics version 1200 since DG1 is 1210.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  4 ++++
 drivers/gpu/drm/xe/xe_wa.c           | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 4a7ce09d6b60..4ab7860db9f2 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -98,10 +98,14 @@
 
 #define HIZ_CHICKEN				_MMIO(0x7018)
 #define   DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE	REG_BIT(14)
+#define   HZ_DEPTH_TEST_LE_GE_OPT_DISABLE	REG_BIT(13)
 
 /* GEN7 chicken */
 #define GEN7_COMMON_SLICE_CHICKEN1		_MMIO(0x7010)
 
+#define COMMON_SLICE_CHICKEN4			_MMIO(0x7300)
+#define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
+
 #define GEN11_COMMON_SLICE_CHICKEN3		_MMIO(0x7304)
 #define XEHP_COMMON_SLICE_CHICKEN3		MCR_REG(0x7304)
 #define   DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN	REG_BIT(12)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index e21c7ec53b2f..59d2daab5929 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -536,6 +536,16 @@ static const struct xe_rtp_entry lrc_was[] = {
 				   GEN9_PREEMPT_GPGPU_THREAD_GROUP_LEVEL,
 				   XE_RTP_ACTION_FLAG(MASKED_REG)))
 	},
+	{ XE_RTP_NAME("1806527549"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(1200)),
+	  XE_RTP_ACTIONS(SET(HIZ_CHICKEN, HZ_DEPTH_TEST_LE_GE_OPT_DISABLE,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
+	{ XE_RTP_NAME("1606376872"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(1200)),
+	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, DISABLE_TDC_LOAD_BALANCING_CALC,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
 
 	/* DG1 */
 
-- 
2.39.0

