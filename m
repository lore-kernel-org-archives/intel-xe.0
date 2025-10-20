Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD0FCCD184
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 02:06:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6E910E238;
	Mon, 20 Oct 2025 02:06:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e7EhmZY1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C305510E238
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 02:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760925985; x=1792461985;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mnJ7TRP8rOtz4ySdAq5KerAY//+ORMXg/Fs7XI29FUM=;
 b=e7EhmZY1fYk4FVHmJxeU5ha64dHGwZi2hYX/nemc/j8niX40V7TejvG3
 tb3qfKoSG08LW+4ycw/11vrFMUNdlTYXGTfMjtBxXUXjc6zTQFjsXX8mi
 r4NxY2hCpQtgPiBRbg5A7Y8dTaQXbF92I/npgE8f9LYi3xNgMSaU59nRv
 cfFenOY55RlbjUpk6sPr0gobDNXlDzYCj9+IKw1ywQfC1C4dSYIj6OkNf
 O2Sku9Lls8OMuSUSgKO2k2GttIS8ybsYOmadbqqPGohsWZFQeqam24Vu6
 EqW0cwb9x24bI4KX5mhx0g2Lno5GcRuc7eC6iOEYwrNJZLsTZhKYvHJzS A==;
X-CSE-ConnectionGUID: 39DdygqjQa6kNUBxiwC/SA==
X-CSE-MsgGUID: lDhps7o5Tg+CXDUmU8JpQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="66909992"
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; d="scan'208";a="66909992"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2025 19:06:24 -0700
X-CSE-ConnectionGUID: QfCFqqEcRxi7oz74fTyURA==
X-CSE-MsgGUID: 2y5QVYV4Rt61y8eNGSEYEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; d="scan'208";a="183705657"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2025 19:06:25 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH 2/2] drm/xe/xe3p_lpm: Add special check in Media GT for Main
 GAMCTRL
Date: Sun, 19 Oct 2025 19:05:47 -0700
Message-ID: <20251019-xe3p-gamctrl-v1-2-ad66d3c1908f@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251019-xe3p-gamctrl-v1-0-ad66d3c1908f@intel.com>
References: <20251019-xe3p-gamctrl-v1-0-ad66d3c1908f@intel.com>
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
index 1876f2957c6df..3545e0be06dae 100644
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

