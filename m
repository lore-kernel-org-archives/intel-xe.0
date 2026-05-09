Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E5ACD37B2
	for <intel-xe@archiver.kernel.org>; Sat,  9 May 2026 16:41:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E941110E3D9;
	Sat,  9 May 2026 16:41:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nrGU1Nj5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 159C110E101;
 Sat,  9 May 2026 16:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778344908; x=1809880908;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NZsNR/Jn2KPUiE5E2Z3cgYlugSjRmetBLhv2zQkZhtk=;
 b=nrGU1Nj55oxF2Lgs99Lz/3t1lYq1KaSZ2voEioskD6eaRHzShGeBM+2S
 bWnBi/au1h/UKaoq7awvk1AJunjbYDsEWLaEkw9ppUHK+9d5IVFs1dumi
 0y+eLU6jFQuC+YTHRHwIBlPNsTCN/R8hfWsW6po3Qf0o1ZZUd3JYnR0LM
 4O6/H7ZN1vw2A8cutKO/VbxrQZcN+sasjX7OxVNfTe6V+xBTmhCJXrPfP
 ZraCxmNeej1U3rfJHl1ksPSy3L46iDi3OlSpOfULczS/QC4lhwwVqzlfC
 IJzkvVqd2fjEjMaF7l10nmUX+p3DF4WSK0NPax0x7Bc66HB3norX/7EMJ A==;
X-CSE-ConnectionGUID: ma3EkC7dTr6Y3hB0bTaraQ==
X-CSE-MsgGUID: 3ZOlOUwcTDut6bGfua4PAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="90763607"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; d="scan'208";a="90763607"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2026 09:41:48 -0700
X-CSE-ConnectionGUID: dF4A9in5SzKWBwUpwS+2kg==
X-CSE-MsgGUID: I1NeMx+tQOG5JkYFqUp19Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; d="scan'208";a="236212223"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa010.jf.intel.com with ESMTP; 09 May 2026 09:41:46 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, nemesa.garg@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH v3 1/9] drm/i915/casf: fix comment typos
Date: Sat,  9 May 2026 18:40:40 +0200
Message-ID: <20260509164048.627399-2-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260509164048.627399-1-michal.grzelak@intel.com>
References: <20260509164048.627399-1-michal.grzelak@intel.com>
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

Remove superfluous whitespace character and fix the spelling.

Cc: Nemesa Garg <nemesa.garg@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_casf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
index c2d2746c5f04..9a306aee2199 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.c
+++ b/drivers/gpu/drm/i915/display/intel_casf.c
@@ -162,7 +162,7 @@ static u32 casf_coeff(const struct intel_crtc_state *crtc_state, int t)
 
 /*
  * 17 phase of 7 taps requires 119 coefficients in 60 dwords per set.
- * To enable casf:  program scaler coefficients with the coeffients
+ * To enable casf: program scaler coefficients with the coefficients
  * that are calculated and stored in pch_pfit.casf.coeff as per
  * SCALER_COEFFICIENT_FORMAT
  */
-- 
2.45.2

