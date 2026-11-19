Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5295606A332
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 15:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JKmMCZby
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C6E10EFED;
	Thu, 19 Nov 2026 15:17:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 757F010EEFE;
 Thu, 19 Nov 2026 15:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795101423; x=1826637423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PJJ2z8PsNir0p5kUoTuXro0xpha39FbKs5XXCkDRkJs=;
 b=JKmMCZbyyY7IX8duXotdUEOPrlCo0tThD/oQWOqx3P4WXgGLnJUfBkDD
 dFUJtSp+p7Ssds3M9Bw5/DYHhySAp5ST4NAFPGXDSx/TNxkWeYq5UYD7n
 vNVL7jBJynx5M+OEPK3aI5H6zN/uKAgqyozkqQRY2ocCbdSLW0S/DM3TF
 uL9UsIWtfKhr2EkDbmU6WcoThCuWRXofCdIKOoMpVxRPVtksJVQmOOqmz
 1LvR2builV1DCuqcIgkdBGNjhvU9JDNSg7SC/W07FUrHFrrSWnrx3y+9U
 vHgbmfetErp8Tb17IIBsM38fSbjXwYWiRppmy4sel/Ti7HAzovfdQgkFg Q==;
X-CSE-ConnectionGUID: NRHLBB6sQu+AxQpPwaQCMQ==
X-CSE-MsgGUID: 1Uacn2siS+GZc1EJ/ijn7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3841120"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3841120"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 07:16:57 -0800
X-CSE-ConnectionGUID: 3ldCuiRKQc2gMp1DDCu5aA==
X-CSE-MsgGUID: De2empNXSSW9O3RBRA0/NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10543441"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.162])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 07:16:53 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 2/2] drm/i915: move FBC_RT_BASE register macros to
 intel_gt_regs.h
Date: Thu, 19 Nov 2026 17:16:44 +0200
Message-ID: <20261119151644.4097956-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119151644.4097956-1-jani.nikula@intel.com>
References: <20261119151644.4097956-1-jani.nikula@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The FBC_RT_BASE registers are in the SVL unit, not display. Move them to
intel_gt_regs.h, and reducing display includes from i915 core in the
process.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc_regs.h | 7 -------
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       | 7 +++++++
 drivers/gpu/drm/i915/gt/intel_workarounds.c   | 2 --
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc_regs.h b/drivers/gpu/drm/i915/display/intel_fbc_regs.h
index 4178e602d7d7..3ce018ebb27c 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_fbc_regs.h
@@ -111,19 +111,12 @@
 #define XE3_FBC_DIRTY_CTL(fbc_id)	_MMIO_PIPE((fbc_id), 0x43234, 0x43274)
 #define   FBC_DIRTY_RECT_EN		REG_BIT(31)
 
-#define ILK_FBC_RT_BASE		_MMIO(0x2128)
-#define   ILK_FBC_RT_VALID	REG_BIT(0)
-#define   SNB_FBC_FRONT_BUFFER	REG_BIT(1)
-
 #define SNB_DPFC_CTL_SA		_MMIO(0x100100)
 #define   SNB_DPFC_FENCE_EN		REG_BIT(29)
 #define   SNB_DPFC_FENCENO_MASK		REG_GENMASK(4, 0)
 #define   SNB_DPFC_FENCENO(fence)	REG_FIELD_PREP(SNB_DPFC_FENCENO_MASK, (fence))
 #define SNB_DPFC_CPU_FENCE_OFFSET	_MMIO(0x100104)
 
-#define IVB_FBC_RT_BASE			_MMIO(0x7020)
-#define IVB_FBC_RT_BASE_UPPER		_MMIO(0x7024)
-
 #define MSG_FBC_REND_STATE(fbc_id)	_MMIO_PIPE((fbc_id), 0x50380, 0x50384)
 #define   FBC_REND_NUKE			REG_BIT(2)
 #define   FBC_REND_CACHE_CLEAN		REG_BIT(1)
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 3ba9b2206b79..7b892fa50088 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -202,6 +202,10 @@
 #define   CM0_DEPTH_WRITE_DISABLE		(1 << 1)
 #define   CM0_RC_OP_FLUSH_DISABLE		(1 << 0)
 
+#define ILK_FBC_RT_BASE				_MMIO(0x2128)
+#define   ILK_FBC_RT_VALID			REG_BIT(0)
+#define   SNB_FBC_FRONT_BUFFER			REG_BIT(1)
+
 #define GFX_FLSH_CNTL				_MMIO(0x2170) /* 915+ only */
 
 /*
@@ -471,6 +475,9 @@
 #define   HZ_DEPTH_TEST_LE_GE_OPT_DISABLE	REG_BIT(13)
 #define   BDW_HIZ_POWER_COMPILER_CLOCK_GATING_DISABLE	REG_BIT(3)
 
+#define IVB_FBC_RT_BASE				_MMIO(0x7020)
+#define IVB_FBC_RT_BASE_UPPER			_MMIO(0x7024)
+
 #define XEHP_CULLBIT2				MCR_REG(0x7030)
 
 #define GEN8_L3CNTLREG				_MMIO(0x7034)
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 24ea5d8d529c..a2f00fc8589d 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -20,8 +20,6 @@
 #include "intel_ring.h"
 #include "intel_workarounds.h"
 
-#include "display/intel_fbc_regs.h"
-
 /**
  * DOC: Hardware workarounds
  *
-- 
2.47.3

