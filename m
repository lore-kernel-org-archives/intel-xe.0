Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDC8F513F0
	for <intel-xe@archiver.kernel.org>; Sun,  8 Mar 2026 13:25:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9562E10E179;
	Sun,  8 Mar 2026 13:25:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H1QAW7Dn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 030EF10E175;
 Sun,  8 Mar 2026 13:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772976314; x=1804512314;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p+O2dYYLBD4tD8j4Y6YNsBRPaO1EsoXdHdMkrFX4z6c=;
 b=H1QAW7DnKOXRkXSgIpo/H0bksbrFrHMVtRQDztOe+ayskNR7OGH+rXKm
 ebpulwrGV1/jtt/ehim2Or1TsnYYMwebww+Wldf2qvPfD2RRSOjTneT9T
 5JAxi6zn2tTx+InnUjRgvRd442GamWtSijwfW3dab7lHk1Z+nI0JcPSvi
 BViwJ9U+P7Qj/yWJv5Yz/YD9SdbAQN99TrOFKWlC1s7HZJFjWXNOIvnx1
 GROrz47IgF2/+r/bhI+UcRJnMplWhtSR9PBRKMvHmmDR7Bwlxq6cql+1l
 lxRtyWdPSEsQSHqVNSMVDjNG/H1KlxX2yHj49Iw/UOf69ML0p0dmLzFbm A==;
X-CSE-ConnectionGUID: zdF6yUSDTMmYvjNcWZh3xA==
X-CSE-MsgGUID: hD6c2BNZSba3toiRiOSpEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="77871409"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; d="scan'208";a="77871409"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 06:25:14 -0700
X-CSE-ConnectionGUID: Fp48SRCkTRaqvKibJXkkRw==
X-CSE-MsgGUID: kady+aWrSBWElEH09DfkLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; d="scan'208";a="217598188"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by fmviesa008.fm.intel.com with ESMTP; 08 Mar 2026 06:25:13 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [RFC v1 10/11] drm/i915/dg2: warn on V/P Override request on dg2
Date: Sun,  8 Mar 2026 14:24:45 +0100
Message-ID: <20260308132446.3320848-11-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260308132446.3320848-1-michal.grzelak@intel.com>
References: <20260308132446.3320848-1-michal.grzelak@intel.com>
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

DG2 doesn't support vswing/preemphasis overriding. Issue a warning when
requested to do so.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
index 632a5fe08381..1b30c9888f95 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
@@ -1804,6 +1804,10 @@ dg2_get_snps_buf_trans(struct intel_encoder *encoder,
 		       const struct intel_crtc_state *crtc_state,
 		       int *n_entries)
 {
+	drm_WARN(to_intel_display(encoder)->drm,
+		 intel_bios_encoder_overrides_vswing(encoder->devdata),
+		 "Port %s asks to override vswing/preemph tables [DG2]\n",
+		 port_name(intel_bios_encoder_port(encoder->devdata)));
 	if (intel_crtc_has_dp_encoder(crtc_state) &&
 	    intel_dp_is_uhbr(crtc_state))
 		return intel_get_buf_trans(&dg2_snps_trans_uhbr, n_entries);
-- 
2.45.2

