Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D150CCD195
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 03:25:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C6D810E52C;
	Tue, 14 Oct 2025 03:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CFCqEFPn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2EC310E129
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 03:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760412329; x=1791948329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0o0o27FEDQbdU78SUVU65OqNK+x4WYWZu7VG8PZw72E=;
 b=CFCqEFPndESbEstCckRKYZSW+jsLFy4lVjc/NeF+AaAb9UbgonzsrvTS
 2MLsNLIZEog/hxHzQ1zMBRoKB6LmsK+XJKRJDhcnS0b+XNddLMt/04VaJ
 ot/vWqPN5a2zLkHk0GoIrRNXUwBO49wjzuDXv+ftFh0ONtHeMfgcsVEYZ
 2zlQvPODUV3281cGfZGA+6KS1FtgcSuJ4UK6ZW6rsXPizaml5mHpNZfU9
 NGCpbmqxE+3+oJtkFRCzxGKn6hwsRwKmCN/0HCQlAYhvZlOrVfvktgcmW
 v4//xnwfmtAHwgN+Wa+7oYVAYpfyUNmg2Ff1sd3fLGjidvRdfE68plWLQ A==;
X-CSE-ConnectionGUID: aIIdOAPaQ9Kbtfi25kKCfA==
X-CSE-MsgGUID: Gx7goVriSS+6gFIm4gNBHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66414868"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="66414868"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:29 -0700
X-CSE-ConnectionGUID: 1pVGcfBJTJqeJbN6m4YCAw==
X-CSE-MsgGUID: dS/AnqdyRRmyUrafRMYr5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181567274"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 20:25:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH 04/23] drm/xe/xe3p_lpm: Add special check in Media GT for Main
 GAMCTRL
Date: Mon, 13 Oct 2025 20:24:36 -0700
Message-ID: <20251013-xe3p-v1-4-bfb74f038215@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-bd47d
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

From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

For Xe3p arch some subunits of an IP may be different. The GMD_ID
register returns the Xe3p arch and dedicates the reserved field to mark
possible subunit differences. Generally this is an under-the-hood
implementation detail that drivers don't need to worry about, but the
new Main_GAMCTRL may be enabled or not depending on those.

Those reserved bits are described for Xe3p as: "If Zero, No special case
to be handled. If Non-Zero, special case to be handled by Software
agent.". That special case is defined per Arch. So if media version is
35, also check the additional reserved bits. To avoid confusion with the
usual meaning of "reserved", define them as GMD_ID_SUBIP_FLAG_MASK.

Bspec: 74201
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  6 ++++++
 drivers/gpu/drm/xe/xe_guc.c          | 19 +++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 47e13a3fb9072..937dc341abe5e 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -37,6 +37,12 @@
 #define GMD_ID					XE_REG(0xd8c)
 #define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
 #define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
+/*
+ * Spec defines these bits as "Reserved", but then make them assume some
+ * meaning that depends on the ARCH. To avoid any confusion, call them
+ * SUBIP_FLAG_MASK.
+ */
+#define   GMD_ID_SUBIP_FLAG_MASK		REG_GENMASK(13, 6)
 #define   GMD_ID_REVID				REG_GENMASK(5, 0)
 
 #define FORCEWAKE_ACK_GSC			XE_REG(0xdf8)
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 37e3735f34e63..ecc3e091b89e6 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1681,6 +1681,25 @@ bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
 
+	/*
+	 * For Xe3p media gt (35), the GuC and the CS subunits may be still Xe3
+	 * that lacks the Main GAMCTRL support. Reserved bits from the GMD_ID
+	 * inform the IP version of the subunits.
+	 */
+	if (xe_gt_is_media_type(gt) && MEDIA_VER(gt_to_xe(gt)) == 35) {
+		u32 val = xe_mmio_read32(&gt->mmio, GMD_ID);
+		u32 subip = REG_FIELD_GET(GMD_ID_SUBIP_FLAG_MASK, val);
+
+		if (!subip)
+			return true;
+
+		xe_gt_WARN(gt, subip != 1,
+			   "GMD_ID has unknown value in the SUBIP_FLAG field - 0x%x\n",
+			   subip);
+
+		return false;
+	}
+
 	return GT_VER(gt) >= 35;
 }
 

-- 
2.51.0

