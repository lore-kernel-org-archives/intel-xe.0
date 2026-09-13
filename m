Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A241C88E66
	for <intel-xe@archiver.kernel.org>; Sun, 13 Sep 2026 15:13:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C98C010E94C;
	Sun, 13 Sep 2026 15:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g8oMd5Dp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C8F810E2A8;
 Sun, 13 Sep 2026 15:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789312414; x=1820848414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c9ijKdkqSsqpc2px42nzKQ1keUmo48HKJmTglOfKDEk=;
 b=g8oMd5DpzKlYRpVGLk3gPf+C2G5BFO0Bds+DYnj/uUa/f/x/yaVHXkix
 apjEE/N3+mBLd9ywXcV6S7SVknNMzon2HV9eGUp7McNYaTg/3QskSXIdK
 VWUvj9JOifgLsfDLCXH43z5VUNcH40EmcMNDWGF1MoqZsZOuEp3CcKdgJ
 7dTb3RszCl0lfh4Rg4Nsbn/HvcI8VfsyTdCFvyFp+bO9PaBpLQy6dINML
 3lEV4KDNOjSTV9fTAjCVYVQbgckFF9JTMi4gdgQJ891qOM0wnOlxcg/xo
 Crkdd4vzG9MMx9goI05XXYWbAETW33A+gqVyls8yQWLWqhPHjt6UAfVrn A==;
X-CSE-ConnectionGUID: J2VZyoGmRdyQYuJuF14j2w==
X-CSE-MsgGUID: jRJ1zwpVReGa5ZCm7ON4iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="93388773"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; d="scan'208";a="93388773"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2026 08:13:33 -0700
X-CSE-ConnectionGUID: 0AoZaAFbT5ObTCB4com/sA==
X-CSE-MsgGUID: UqLcmgG/Ty67nIgFtfbU9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; d="scan'208";a="310694164"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2026 08:13:31 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, arun.r.murthy@intel.com,
 jani.nikula@linux.intel.com, suraj.kandpal@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v6 07/13] drm/i915/dip_regs: Add register definitions for
 common SDP Transmission Line
Date: Sun, 13 Sep 2026 20:26:42 +0530
Message-ID: <20260913145649.3240904-8-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
References: <20260913145649.3240904-1-ankit.k.nautiyal@intel.com>
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
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
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

