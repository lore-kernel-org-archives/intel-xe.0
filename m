Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96449CD98C8
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 23:12:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3BD10E664;
	Tue,  9 Jun 2026 23:12:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R4NCkOhw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C75210E653;
 Tue,  9 Jun 2026 23:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781046767; x=1812582767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OEpFIEmzeRGFcsg82poRNiBsgaLvok++PE7KVF/zfOw=;
 b=R4NCkOhw3q/tnSshF9BlpBvHoSLx5G6urpBiScUaFGkWjJNIwImkkjDo
 0e+wkYtdnOZyxotfMhKk/TtqOF0Xs7GXc9b7YbZmia3EdHDDqfZWDEgAv
 WvkS0kU3kmNH+wj4OxZ5ovTM0+dbFYlftTb+XGaLd5LqxiuiOH/mDUyT2
 bMEnQjlflbHWIEVL3LC/JykyrIBZralwhF9gFO/y7SQuXcUQy9yTvWfYX
 QlL74f3rtQKl92zpQ1i8sJrOgGLwuwC1a+b1tWbQjGLjOyzrSw/EawYIf
 O+kotfXWwQQMs7IVMHUfdZ2jwOvgzuPUItDYFdH14klMF8SLDXB2jISB1 w==;
X-CSE-ConnectionGUID: /JZaOhWnR2eVMrrEPwvZhw==
X-CSE-MsgGUID: r21x+YNqRDKPwOBFHkLGQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="104492298"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="104492298"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 16:12:47 -0700
X-CSE-ConnectionGUID: 75uaNgS2RpqA4ON6WsUatg==
X-CSE-MsgGUID: MM98vfbXTTe+uLW6F2YTJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="276187976"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP; 09 Jun 2026 16:12:46 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v1 3/9] drm/i915/scaler: de-Morgan-ize !scaler_has_casf()
Date: Wed, 10 Jun 2026 01:12:11 +0200
Message-ID: <20260609231217.208357-4-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260609231217.208357-1-michal.grzelak@intel.com>
References: <20260609231217.208357-1-michal.grzelak@intel.com>
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

Distribute negation inside scaler_has_casf() using de Morgan law
resulting in (!HAS_CASF(display) || scaler_id != 1). Distribute the AND
operator with casf_scaler using de Morgan law once again in order to
have two OR'd clauses.

This will be used by next patches to separate and move both clauses.

Cc: Nemesa Garg <nemesa.garg@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 drivers/gpu/drm/i915/display/skl_scaler.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 0cfa5b7564ba..f2216a9ea3f8 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -343,7 +343,8 @@ static int intel_allocate_scaler(struct intel_crtc_scaler_state *scaler_state,
 		if (scaler_state->scalers[scaler_id].in_use)
 			continue;
 
-		if (casf_scaler && !scaler_has_casf(display, scaler_id))
+		if ((casf_scaler && !HAS_CASF(display)) ||
+		    (casf_scaler && scaler_id != 1))
 			continue;
 
 		scaler_state->scalers[scaler_id].in_use = true;
-- 
2.45.2

