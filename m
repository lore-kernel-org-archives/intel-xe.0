Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060E2FF510E
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 17:53:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F5810E123;
	Tue,  7 Apr 2026 17:53:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nz8RG3zS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782B610E123;
 Tue,  7 Apr 2026 17:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775584400; x=1807120400;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/kEM5EEfHcU1SJmoGQJpUv6cu7xEJ66R/mYEB4lvNh0=;
 b=nz8RG3zSJl8fZQophjVPidee5dopiUg8MBjfkgO6p2Mk5eXpvHEPFcfF
 tRMV4wo1UtOk2I1HJdFkMmLAQ76Rsolp4CUQEyZIsx7Iz8ONJrjfHefzh
 KklUAgPgsK1e3JOOblhGr1Baw9/xefGy7bUukxrxgwBrsif+1iDWmU2PU
 P1t3QWf85zxpxJSVS3en/kcjh5x3DwK9zSSMBhejh5GCBU7juH+fdCMbT
 ZlHUVXjx8dIsDuNRUf5sQycUJS4oYskP8+0Qv7dHXOiZG57dyWP49pgIq
 4H6sTZtACPC2tRUSa7KH9zgLEdsT3iGPVjJ+mP8EEgGnQohXJ/PvXiS3P A==;
X-CSE-ConnectionGUID: +MfXmPeXQyKJj1j+6A/5IQ==
X-CSE-MsgGUID: l2GNq0vyQ2OP7eGytXXong==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76449550"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="76449550"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 10:53:20 -0700
X-CSE-ConnectionGUID: Fm4+AEvyQbGEMSHVBYigNg==
X-CSE-MsgGUID: WUHg1aUuQPOtBoYaiVnMOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="223936118"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.211])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 10:53:18 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH v2 7/9] drm/i915/casf: Remove redundant argument from
 intel_casf_filter_lut_load()
Date: Tue,  7 Apr 2026 20:52:41 +0300
Message-ID: <20260407175244.19654-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260407175244.19654-1-ville.syrjala@linux.intel.com>
References: <20260407175244.19654-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

intel_casf_filter_lut_load() can find the crtc from the crtc_state.
No need to pass in both.

Reviewed-by: Michał Grzelak <michal.grzelak@intel.com>
Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_casf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
index f777aae3fc57..21e84a4f9ff5 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.c
+++ b/drivers/gpu/drm/i915/display/intel_casf.c
@@ -61,10 +61,10 @@ const u16 filtercoeff_3[] = {
 	FILTER_COEFF_0_125,
 };
 
-static void intel_casf_filter_lut_load(struct intel_crtc *crtc,
-				       const struct intel_crtc_state *crtc_state)
+static void intel_casf_filter_lut_load(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	int i;
 
 	intel_de_write(display, SHRPLUT_INDEX(crtc->pipe),
@@ -270,7 +270,7 @@ void intel_casf_enable(const struct intel_crtc_state *crtc_state)
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	u32 sharpness_ctl;
 
-	intel_casf_filter_lut_load(crtc, crtc_state);
+	intel_casf_filter_lut_load(crtc_state);
 
 	intel_casf_write_coeff(crtc_state);
 
-- 
2.52.0

