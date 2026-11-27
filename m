Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A6D606A321
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 06:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hZbjEWGR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41826112125;
	Fri, 27 Nov 2026 06:09:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98871120FC;
 Fri, 27 Nov 2026 06:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795759783; x=1827295783;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ThBmTZYtRfF0+mCEBNdbsNydjiVPWEawby94rhxw2qQ=;
 b=hZbjEWGRMV2993jh7xT2ruSEnartOSeM4GfIex/2shfDi1lXWckou+9o
 zCI7dRupIGtvyrDv48X9KTHrrgqSZKjLd2GPqhzWCTAM2PZtcf4o1ftZr
 MD+MHRnpRX/Nh38cQeF8UY2Mu5sCj3Avb1CRfxGRDF/VCwXnDOsomoJe+
 jFhVX54z3NCJa+mNWG/+vu/0O8vYxQpn3waI4EeteY8ODJsao0QgfhscT
 sCju9vQ7HXkKFRYonHt9tT6491Pgzno20M0K2wL20rfzMk/hddc6bc/ru
 OvBncC0cRAst3diMLzykPW4zOpbJlDDaP+7dC7tcIN5PVDbScT+ekmVu4 w==;
X-CSE-ConnectionGUID: sRcfFqGjSdelfsu/cFvSjg==
X-CSE-MsgGUID: 96G1yt2fQtSEku60Z4k8Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4578245"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4578245"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 22:09:43 -0800
X-CSE-ConnectionGUID: pjQo0APXTFq+Rf5EaBgG+w==
X-CSE-MsgGUID: QSpYrJLrRViLHrVpiuJ6nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="14361914"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa013.fm.intel.com with ESMTP; 26 Nov 2026 22:09:40 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, jani.nikula@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 03/18] drm/i915/display: Add pipelock bits to
 TRANS_DDI_FUNC_CTL2
Date: Fri, 27 Nov 2026 11:39:09 +0530
Message-Id: <20261127060924.1648295-4-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127060924.1648295-1-suraj.kandpal@intel.com>
References: <20261127060924.1648295-1-suraj.kandpal@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the genlock enable, genlock mode, per-frame sync and timing
generator start delay fields used to set up a pipelock secondary.
The primary select field is shared with port sync.

Bspec: 73521, 69965
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
v1 -> v2:
- Annotate the new bits with xe3+ (Jani)

 drivers/gpu/drm/i915/display/intel_display_regs.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index f213bdffcc8d..679ec7bb595a 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -2558,6 +2558,12 @@ enum skl_power_gate {
 #define _TRANS_DDI_FUNC_CTL2_DSI0	0x6b404
 #define _TRANS_DDI_FUNC_CTL2_DSI1	0x6bc04
 #define TRANS_DDI_FUNC_CTL2(dev_priv, tran)	_MMIO_TRANS2(dev_priv, tran, _TRANS_DDI_FUNC_CTL2_A)
+#define  GENLOCK_ENABLE				REG_BIT(31) /* xe3+ */
+#define  GENLOCK_MODE_MASK			REG_GENMASK(30, 29) /* xe3+ */
+#define  GENLOCK_MODE_LOCAL_SECONDARY		REG_FIELD_PREP(GENLOCK_MODE_MASK, 0) /* xe3+ */
+#define  PIPELOCK_PER_FRAME_SYNC		REG_BIT(28) /* xe3+ */
+#define  TG_START_DELAY_MASK			REG_GENMASK(27, 16) /* xe3+ */
+#define  TG_START_DELAY(x)			REG_FIELD_PREP(TG_START_DELAY_MASK, (x)) /* xe3+ */
 #define  PORT_SYNC_MODE_ENABLE			REG_BIT(4)
 #define  CMTG_SECONDARY_MODE			REG_BIT(3)
 #define  PORT_SYNC_MODE_MASTER_SELECT_MASK	REG_GENMASK(2, 0)
-- 
2.34.1

