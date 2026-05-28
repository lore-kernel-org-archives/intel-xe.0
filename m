Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002B8CD5BD1
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 09:32:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D9210EEF0;
	Thu, 28 May 2026 09:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HcGhU43D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C8110EEED;
 Thu, 28 May 2026 09:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779960758; x=1811496758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z4Vb4V5EyL/qxxktchWRVT7su3ZsOyjXefUWXWibul0=;
 b=HcGhU43DRvjX712ZacJO/PpDwaFqmpGYv6Vi3DpoF4/wkE/+ptYqNm5P
 L8yhPonrrBbeIfCJ9c+BDsXLYlb2ErEo+4p3Ov/89V5RaZKIlPudT4EW0
 jfqlAdPAUKKm+ZXmHeVZ3zAdYU1npSjoWY7lgGuk8SaE0lcUJ8qI6ODcN
 /3B+Dvtp3tw6AlGRKLaYq+NyFF7cvmf8N9eJj8rU0AlWXlrpGakj5vfSr
 YdK5rM2Vh5H8nJ7u8DfiUYHRTHCknmhDBVnoligsa7wMseixsfXrIBkul
 pSLMB6ncZ3foDl5mtBHr0qUxMx/Bq+ELpZEobiE3EjcCkP+2p0hqOHxU9 g==;
X-CSE-ConnectionGUID: ZzqSdnvmQz+uW4mYIxPzsA==
X-CSE-MsgGUID: YTxeoPA8QE6ArIlPnItqzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="84426942"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="84426942"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 02:32:38 -0700
X-CSE-ConnectionGUID: PBvmJlpuR0+DdT93FfvsbA==
X-CSE-MsgGUID: SQ/wN9BTTByYamqctZD7xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="242352071"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO hazy) ([10.245.245.229])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 02:32:36 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	jani.nikula@linux.intel.com
Subject: [PATCH v2 3/4] drm/i915/display: harden shift in
 intel_ddi_compute_config_late()
Date: Thu, 28 May 2026 12:30:27 +0300
Message-ID: <20260528093222.2758007-4-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260528093222.2758007-1-luciano.coelho@intel.com>
References: <20260528093222.2758007-1-luciano.coelho@intel.com>
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

BIT() takes a non-negative shift amount, but cpu_transcoder is of type
enum transcoder, which can in theory be INVALID_TRANSCODER (-1).

This is not a problem with the current implementation, because
cpu_transcoder is always valid when this code is reached, but it's
more robust to cast to unsigned so the shift is always well-defined.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 86520848892e..47e4999425ea 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4637,8 +4637,8 @@ static int intel_ddi_compute_config_late(struct intel_encoder *encoder,
 
 	if (crtc_state->master_transcoder == crtc_state->cpu_transcoder) {
 		crtc_state->master_transcoder = INVALID_TRANSCODER;
-		crtc_state->sync_mode_slaves_mask =
-			port_sync_transcoders & ~BIT(crtc_state->cpu_transcoder);
+		crtc_state->sync_mode_slaves_mask = port_sync_transcoders &
+			~REG_BIT(crtc_state->cpu_transcoder);
 	}
 
 	return 0;
-- 
2.53.0

