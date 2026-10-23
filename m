Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5736B606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 05:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h+reqixM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF8B10E552;
	Fri, 23 Oct 2026 05:02:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF1C011296B;
 Fri, 23 Oct 2026 05:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792731766; x=1824267766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5G6BIILeC2NUoii2/H01Y5K61N7XNnSX5TUTiaK98CQ=;
 b=h+reqixMhTh6AX1AvRZi7py8h4Yrs5WdeRHBeEaHiNQmZcQmVm7mp0U6
 bCBBKOx0BiAJltYul3oU2WKGK4dh0Dgh9B3hx0bajcbSZyf5MuDgYSEry
 1Kvku5fKZWue0zhL3JVbD1mRj3swUrc8TW+nhLGdnxhEzb5C4hWXFzRu9
 FRjNalalw8On11lIAZEeWj34JmwQuqVaQTnFPYAQmbtTBdAuFk1xYWn4u
 k/Axl3Tzo8T7qM9kE4CGygljga/kOACZXdopNojdtQ/6l5HpLbR4JZ6N3
 N9AM/gGVkmAHixoEjF0UDaftahlHP4jJVqw9FBduJPDf8/RgrumZXPb5H Q==;
X-CSE-ConnectionGUID: itcpzPZrRUWvbE3j6vU7ww==
X-CSE-MsgGUID: 5BOvq+m1SzaMyWEtNpdPdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1499165"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1499165"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 22:02:46 -0700
X-CSE-ConnectionGUID: d/L6TeTPQrqjYVQdD1PLMA==
X-CSE-MsgGUID: x5ZswZ1ETQ67tugoVUlaCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3926632"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa006.fm.intel.com with ESMTP; 22 Oct 2026 22:02:44 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v8 08/14] drm/i915/display: Add bits for Wa_14021768792 for
 linkm/n ratio > 10
Date: Fri, 23 Oct 2026 10:32:21 +0530
Message-Id: <20261023050227.2068466-9-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023050227.2068466-1-suraj.kandpal@intel.com>
References: <20261023050227.2068466-1-suraj.kandpal@intel.com>
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the register definitions for the WA: the INT and CEIL nibbles of the
extended LINK_N field, the Link M fraction field of HDMI_EMP_DATA and
the enhanced TGDDA bit of CHICKEN_TRANS.
Per Bspec the extended LINK_N field is two nibbles: bits 27:24 hold
INT(Link M / Link N) and bits 31:28 hold CEIL(Link M / Link N).

Bspec: 49266
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_regs.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index 983a0d9dcb9c..bbdbc27629d7 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -550,6 +550,11 @@
 #define _TRANS_MULT_B		0x6102c
 #define TRANS_MULT(dev_priv, trans)	_MMIO_TRANS2(dev_priv, (trans), _TRANS_MULT_A)
 
+#define _HDMI_EMP_DATA_A	0x600d8
+#define _HDMI_EMP_DATA_B	0x610d8
+#define  HDMI_EMP_DATA_LINK_M_FRAC_MASK	REG_GENMASK(23, 0)
+#define HDMI_EMP_DATA(display, trans)	_MMIO_TRANS2((display), (trans), _HDMI_EMP_DATA_A)
+
 /* Hotplug control (945+ only) */
 #define PORT_HOTPLUG_EN(dev_priv)		_MMIO(DISPLAY_MMIO_BASE(dev_priv) + 0x61110)
 #define   PORTB_HOTPLUG_INT_EN			(1 << 29)
@@ -1192,6 +1197,10 @@
 #define _PIPEB_LINK_N1		0x61044
 #define  PIPE_LINK_N1_EXTENDED_MASK	REG_GENMASK(31, 24)
 #define  PIPE_LINK_N1_EXTENDED(val)	REG_FIELD_PREP(PIPE_LINK_N1_EXTENDED_MASK, (val))
+#define  PIPE_LINK_N1_EXT_CEIL_MASK	REG_GENMASK(7, 4)
+#define  PIPE_LINK_N1_EXT_CEIL(val)	REG_FIELD_PREP(PIPE_LINK_N1_EXT_CEIL_MASK, (val))
+#define  PIPE_LINK_N1_EXT_INT_MASK	REG_GENMASK(3, 0)
+#define  PIPE_LINK_N1_EXT_INT(val)	REG_FIELD_PREP(PIPE_LINK_N1_EXT_INT_MASK, (val))
 #define PIPE_LINK_N1(dev_priv, tran) _MMIO_TRANS2(dev_priv, tran, _PIPEA_LINK_N1)
 
 #define _PIPEA_LINK_M2		0x60048
@@ -1710,6 +1719,7 @@
 #define   PSR2_ADD_VERTICAL_LINE_COUNT	REG_BIT(15)
 #define   DP_FEC_BS_JITTER_WA		REG_BIT(15)
 #define   PSR2_VSC_ENABLE_PROG_HEADER	REG_BIT(12)
+#define   DP_ENHANCED_TGDDA_ENABLE	REG_BIT(11)
 #define   DP_DSC_INSERT_SF_AT_EOL_WA	REG_BIT(4)
 #define   HDCP_LINE_REKEY_DISABLE	REG_BIT(0)
 
-- 
2.34.1

