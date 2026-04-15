Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F32FF433D2
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 23:47:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDB610E800;
	Wed, 15 Apr 2026 23:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jbm6K3V1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09D910E7DD;
 Wed, 15 Apr 2026 23:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776296844; x=1807832844;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dcj6C+KyfnfcjWgVCjJ/EkDyt8jAd3R53h/ubjY/qaY=;
 b=Jbm6K3V11DntZh1mWQvJIqj2xsTm90BoZ2iCN1goLPRMF/6jG1BO3YtW
 9eqSmx3GAtMURAs2UZNGuNOuIg4Kb03cTw/1Z6V89Hh71V+3gXljF89ik
 EWtMMnWAksluMZV3StaBeT/qbgVnFOUhsN+kQEspLUKHYoJesx4uwcpaI
 jKFh/b4sn0rqMeDWFLymv0ui5BjrKiIYLN7WytDO2t2kBrVA09uVZrKT9
 izRYLvRdOf5nZoVQMFxfmExttOb+Tqh0q2rbI4u9Imb6DRJBrKVL9Xs9G
 FfFxlNZ+Ou0FkV2F/H9CBxowmjg3zZkrRlD6famDZNgRVNu3/LP57Pb1h w==;
X-CSE-ConnectionGUID: rp+xeOuOQ1SB8zcxxFhgtw==
X-CSE-MsgGUID: 6OhTUxfSRAGs+Z6MJ3ANkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77403517"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77403517"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 16:47:24 -0700
X-CSE-ConnectionGUID: Clqc4M+KRPiF9e50Hh0nvw==
X-CSE-MsgGUID: DQEjyqyrSSm455VE9RC1mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="235511222"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by fmviesa005.fm.intel.com with ESMTP; 15 Apr 2026 16:47:22 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v2 23/32] drm/i915/buf_trans: enumerate C20's VS/PE-O indices
Date: Thu, 16 Apr 2026 01:46:30 +0200
Message-ID: <20260415234639.3577774-24-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260415234639.3577774-1-michal.grzelak@intel.com>
References: <20260415234639.3577774-1-michal.grzelak@intel.com>
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

Encapsulate C20's VS/PE-O's indices in enum snps_c20_vspeo_index.

Treat error case as referring to index -1. Refer to it as C20_ERR.

Tables 1-4 are not used at all and are most likely to be zeroed. Refer
to them as _C20_unusedN.

5th table is used for any mode below DP 2.0 (exclusive). Refer to it as
C20_DP14.

6th table is used for any mode above DP 2.0 (inclusive). Refer to it as
C20_DP20.

Indices for other tables have not yet been observed to be used as of
now.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c |  8 ++++----
 drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h | 12 ++++++++++++
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
index ff2ae498a616b..5d1d258f6b6a6 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
@@ -1786,21 +1786,21 @@ xe3plpd_get_lt_buf_trans(struct intel_encoder *encoder,
 		return intel_get_buf_trans(&xe3plpd_lt_trans_dp14, n_entries);
 }
 
-static int
+static enum snps_c20_vspeo_index
 snps_c20_compute_index(const struct intel_crtc_state *crtc_state)
 {
 	if (intel_crtc_has_dp_encoder(crtc_state)) {
 		if (intel_dp_is_uhbr(crtc_state))
-			return 5;
+			return C20_DP20;
 		else
-			return 4;
+			return C20_DP14;
 	}
 
 	drm_WARN(to_intel_display(crtc_state)->drm, 1,
 		 "non-DP (%d) encoder asks to compute VS/PE-O index\n",
 		 crtc_state->output_types);
 
-	return -1;
+	return C20_ERR;
 }
 
 static enum lt_vspeo_index
diff --git a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h
index 30fafeeaf62f2..e182fbe9590c5 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h
+++ b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.h
@@ -86,6 +86,18 @@ enum lt_vspeo_index {
 	LT_DP21
 };
 
+enum snps_c20_vspeo_index {
+	C20_ERR = -1,
+
+	_C20_unused0 = 0,
+	_C20_unused1,
+	_C20_unused2,
+	_C20_unused3,
+
+	C20_DP14 = 4,
+	C20_DP20
+};
+
 bool is_hobl_buf_trans(const struct intel_ddi_buf_trans *table);
 
 void intel_ddi_buf_trans_init(struct intel_encoder *encoder);
-- 
2.45.2

