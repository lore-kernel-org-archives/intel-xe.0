Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310AB10F92E9
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 18:34:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65C910EB61;
	Tue, 31 Mar 2026 18:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OeqqviZC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3D710EB35;
 Tue, 31 Mar 2026 18:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774982088; x=1806518088;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o+5KXXSDcp11TymKlkLfqxzUFFVAc62ZNptay5Kearg=;
 b=OeqqviZCfD0ySaGpbICZ69V9TP17OkzwdS/Lkai7j7q0ApUiK8cnxrSF
 8ohKkLJZ1MUBKZXUk9Xo/a5UuASXcwNCSJxvPYf84rm5oCoCirmMhGoeM
 UtT/8LXCA1LTM8hnf6Hs6K3oFVj/ftFetkJctrQ2jcqVcgfZINf6aqvuk
 2QMHtxLcuTSRQdrpMcG8n8CQyTMyyhy0gUzKusxZEQEEEdLvaP89OXy7M
 JUokXHENhbQeMMZdr/E0ZX7edv4Jei9OkROX6tR0HInMaADXqPAcJH40q
 4nQGn9XY97B0d0ZnHDRiVmYHea4fhOBTWriFOk9jZf5J6Dss7eTJr9DEr g==;
X-CSE-ConnectionGUID: ufU7xvU0QkKv/jc7BNYafg==
X-CSE-MsgGUID: HwaIMCAVQ/+woDDrLqnyNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="86705200"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="86705200"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 11:34:48 -0700
X-CSE-ConnectionGUID: OGkTftZwR2KmD1MGekuXJQ==
X-CSE-MsgGUID: 2+mQnOwgTouXBOgyJVXAcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="256944532"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP; 31 Mar 2026 11:34:47 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v1 14/16] drm/i915/buf_trans: compute EHL's VS/PE Override
 index
Date: Tue, 31 Mar 2026 20:33:30 +0200
Message-ID: <20260331183332.1773886-15-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260331183332.1773886-1-michal.grzelak@intel.com>
References: <20260331183332.1773886-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Add a placeholder for VS/PE Override index computation on EHL. Assume
default index as 0.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
index 6978ad32ef2a..7ebc1480c4b4 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
@@ -1786,6 +1786,12 @@ xe3plpd_get_lt_buf_trans(struct intel_encoder *encoder,
 		return intel_get_buf_trans(&xe3plpd_lt_trans_dp14, n_entries);
 }
 
+static enum icl_vswing_preemph_index
+_compute_index_icl(const struct intel_crtc_state *crtc_state)
+{
+        return (enum icl_vswing_preemph_index) 0;
+}
+
 static enum snps_vswing_preemph_index
 _compute_index_snps_c10(const struct intel_crtc_state *crtc_state)
 {
@@ -1849,6 +1855,8 @@ vswing_preemph_compute_index(struct intel_encoder *encoder,
 			index.snps = _compute_index_snps_c10(crtc_state);
 		else
 			index.snps = _compute_index_snps_c20(crtc_state);
+	} else if (display->platform.elkhartlake) {
+		index.icl = _compute_index_icl(crtc_state);
 	} else {
 		drm_dbg_kms(display->drm, "using default VS/PE Override index");
 		index = (union ddi_vswing_preemph_index) 0;
@@ -1865,6 +1873,8 @@ vswing_preemph_cast_index(struct intel_display *display,
 		return index.lt;
 	} else if (DISPLAY_VER(display) >= 14) {
 		return index.snps;
+	} else if (display->platform.elkhartlake) {
+		return index.icl;
 	}
 
 	return 0;
-- 
2.45.2

