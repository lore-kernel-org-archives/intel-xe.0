Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D053C88E75
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 02:57:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F3910E499;
	Wed, 16 Sep 2026 02:57:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xy+HWDQL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A4B410E499;
 Wed, 16 Sep 2026 02:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789527443; x=1821063443;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jt/m4mmGl8Yi23OKB5K4D68FiBLR83jn7RYt0FrKnTQ=;
 b=Xy+HWDQLL9eeOZxGJFTat5Lp6dYPoQg8SUe3jUoT6Azi38zl97TpJfqH
 KjwDr5Pmfp9vA1vk2zZOMYtszpVXWXxzk5jQ1m8nuXUQ3g0CpE6CzjiER
 UQpoLatamSgpJBGJKt5iAltvNEL9m9ogBE+zmMTBFB1o/g/sVfw2dTEl+
 aQPNouA8jsD98MonhbEZgNDPlb3YqjDdlytFeylenSq+OwlSI6s3T6nJK
 F/28ttlnPBViqbJ5RJZtvMliSiBMMmIZ6GEHYltb/0CAjBM6g8FdSuJgl
 LWip0RlUvVwO4hI9pbtA0NWUxyj2SgWkhtT7my8DQ55/hUgtDdbRf9ACH g==;
X-CSE-ConnectionGUID: MK7dNj35SAioK2hhNGaa+w==
X-CSE-MsgGUID: kWgMtUa4R3WoMFByQlccMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100498336"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100498336"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 19:57:23 -0700
X-CSE-ConnectionGUID: 9YGoC75/QuGSl7TFYH9vCw==
X-CSE-MsgGUID: M4wDvM9XQW66WqAIVbuh4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="311473406"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa001.jf.intel.com with ESMTP; 15 Sep 2026 19:57:22 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 05/10] drm/i915/display: Add bits for link_n_extended for
 DISPLAY >= 14
Date: Wed, 16 Sep 2026 08:27:05 +0530
Message-Id: <20260916025710.432281-6-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260916025710.432281-1-suraj.kandpal@intel.com>
References: <20260916025710.432281-1-suraj.kandpal@intel.com>
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

From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

LINK_N register has bits 31:24 for extended link N value used for
HDMI2.1 and for an alternate mode of operation of DP TG DDA

Add the definition for these extra bits, and make intel_set_m_n()
explicitly mask the software link_n value down to the low 24 bits, so
that a subsequent change can OR the extended field in on top.

For DP the extended field is ignored by hardware, so this has no
functional effect on its own.

v2: Drop extra link_n_ext member. (Jani)
v3: Avoid link_n_ext in set_m_n helper. (Jani)
v4: Rebase, and update commit message.
v5: Drop the now redundant DISPLAY_VER split, the two masks were
    identical.

Bspec:50488
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c   | 18 ++++++++++++++++--
 .../gpu/drm/i915/display/intel_display_regs.h  |  2 ++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index c53163d7c082..6d2025e10995 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -2711,14 +2711,22 @@ void intel_set_m_n(struct intel_display *display,
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
@@ -3475,7 +3483,13 @@ void intel_get_m_n(struct intel_display *display,
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
index 8251ec15190b..57f388c958b4 100644
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

