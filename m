Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999DB606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 07:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MUGDXWF+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF3F10F99B;
	Wed, 21 Oct 2026 07:07:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF8A10F990;
 Wed, 21 Oct 2026 07:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792566413; x=1824102413;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BHqSpiFao4OWGjv2RiMkyZQNnm2rZXy4UXOptcaNQbg=;
 b=MUGDXWF+MEihiaytlYh4BRq++Iq+I5rKNcwehwRESi+t8pK5S/9rvsUm
 NHDS8/wmWHUuniEAd9/u0LfGGexd98FwIt+60v/RY8u3y71MwZMXTiznL
 U9U/aqXGhOfS2MtnmXwpbD1OAR0xGdnMeMtqTlCaH8wWlxk0Qbqh972Jn
 +K3XeY+eu8KtXXaILqLGaARqeyG4IzRPVnsS3Rr1Gnw+yKdaOdAgedLaO
 v/4rirfffx+VaPCa4FIbd+d0pK5o7P9RxhtFUMBnKuHXOMi3MMjNzv1wp
 OMHsBlmm7TazUgzMG5wt1/vAJ/sHDQompHKwv4sIYtzehMU0TIOIYjYOz g==;
X-CSE-ConnectionGUID: lkBQAdLpSGqeIl88DAW5PQ==
X-CSE-MsgGUID: 4Z4CuS2iRSCK63kJ95kc8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1264530"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1264530"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 00:06:52 -0700
X-CSE-ConnectionGUID: wshryYQLR+2zoMVa34CXOA==
X-CSE-MsgGUID: A2Mwdv6TRaK4agiI2LwLdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3439804"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa006.fm.intel.com with ESMTP; 21 Oct 2026 00:06:49 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v5 06/11] drm/i915/display: Add bits for link_n_extended for
 DISPLAY >= 14
Date: Wed, 21 Oct 2026 12:36:19 +0530
Message-Id: <20261021070623.1158624-7-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260917050649.871960-1-suraj.kandpal@intel.com>
References: <20260917050649.871960-1-suraj.kandpal@intel.com>
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

From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

LINK_N register has bits 31:24 for extended link N value used for
HDMI2.1 and for an alternate mode of operation of DP TG DDA.

Add support for these extra bits.

For displays with version 14 or higher, PIPE_LINK_N1_EXTENDED_MASK
(bits 31:24) is used to handle the extended link N bits. For older
platforms, DATA_LINK_M_N_MASK (bits 23:0) is used to handle the
standard link N bits. This distinction ensures clarity and maintains
the semantics for platforms that support the extended bits. In
subsequent changes the logic is updated to conditionally apply the
extended link N bits.

v2: Drop extra link_n_ext member. (Jani)
v3: Avoid link_n_ext in set_m_n helper. (Jani)
v4: Rebase, and update commit message.
v5: Drop a stale changelog entry, the DISPLAY_VER split here is
    intentional. (Sashiko)

Bspec: 50488
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Co-developed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c   | 18 ++++++++++++++++--
 .../gpu/drm/i915/display/intel_display_regs.h  |  2 ++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index f74e7ddf0e41..461b81bf8341 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2720,14 +2720,22 @@ void intel_set_m_n(struct intel_display *display,
 		   intel_reg_t data_m_reg, intel_reg_t data_n_reg,
 		   intel_reg_t link_m_reg, intel_reg_t link_n_reg)
 {
+	u32 link_n = m_n->link_n;
+
 	intel_de_write(display, data_m_reg, TU_SIZE(m_n->tu) | m_n->data_m);
 	intel_de_write(display, data_n_reg, m_n->data_n);
 	intel_de_write(display, link_m_reg, m_n->link_m);
+
+	if (DISPLAY_VER(display) >= 14)
+		link_n &= ~PIPE_LINK_N1_EXTENDED_MASK;
+	else
+		link_n &= DATA_LINK_M_N_MASK;
+
 	/*
 	 * On BDW+ writing LINK_N arms the double buffered update
 	 * of all the M/N registers, so it must be written last.
 	 */
-	intel_de_write(display, link_n_reg, m_n->link_n);
+	intel_de_write(display, link_n_reg, link_n);
 }
 
 bool intel_cpu_transcoder_has_m2_n2(struct intel_display *display,
@@ -3484,7 +3492,13 @@ void intel_get_m_n(struct intel_display *display,
 		   intel_reg_t link_m_reg, intel_reg_t link_n_reg)
 {
 	m_n->link_m = intel_de_read(display, link_m_reg) & DATA_LINK_M_N_MASK;
-	m_n->link_n = intel_de_read(display, link_n_reg) & DATA_LINK_M_N_MASK;
+	m_n->link_n = intel_de_read(display, link_n_reg);
+
+	if (DISPLAY_VER(display) >= 14)
+		m_n->link_n &= ~PIPE_LINK_N1_EXTENDED_MASK;
+	else
+		m_n->link_n &= DATA_LINK_M_N_MASK;
+
 	m_n->data_m = intel_de_read(display, data_m_reg) & DATA_LINK_M_N_MASK;
 	m_n->data_n = intel_de_read(display, data_n_reg) & DATA_LINK_M_N_MASK;
 	m_n->tu = REG_FIELD_GET(TU_SIZE_MASK, intel_de_read(display, data_m_reg)) + 1;
diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
index 2f509bd06557..983a0d9dcb9c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_regs.h
+++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
@@ -1190,6 +1190,8 @@
 
 #define _PIPEA_LINK_N1		0x60044
 #define _PIPEB_LINK_N1		0x61044
+#define  PIPE_LINK_N1_EXTENDED_MASK	REG_GENMASK(31, 24)
+#define  PIPE_LINK_N1_EXTENDED(val)	REG_FIELD_PREP(PIPE_LINK_N1_EXTENDED_MASK, (val))
 #define PIPE_LINK_N1(dev_priv, tran) _MMIO_TRANS2(dev_priv, tran, _PIPEA_LINK_N1)
 
 #define _PIPEA_LINK_M2		0x60048
-- 
2.34.1

