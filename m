Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52438CD5BAB
	for <intel-xe@archiver.kernel.org>; Tue, 19 May 2026 11:23:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB0AF10EC6D;
	Tue, 19 May 2026 11:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VCoSJIFS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6997910EC69;
 Tue, 19 May 2026 11:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779189782; x=1810725782;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zh0u/VM60Tc7r2vCS/agZ6DmQFyItACPwlg3aLnTfhQ=;
 b=VCoSJIFSAGVNAZaMsEzrxLr86pdI7AHFIEAH6LHhlQCGKZ0ebgRwt3I9
 XtIYpy7ObuX9ZukvoH7ZweKXcqaj7pYjbL2wzWpm0I6Fis55aZFUHBWoh
 p5my1+2OmKmpBQiLrgNyUldG0H4wzjsghxgALI+6LpHms7xqU+AXMdqQv
 5sLY4095ylYUl5nCRR/1z86Dr7aVqrT3CaKNb1aMhBedHtJADoLsia0gj
 FuiRsHj/LIjGl4iOusp9yDCWWCzI//gXrDArXi4ULXHmCS2lP9H6280nN
 byAu3eOcNd3z+VOXBnY8x7NFWlgzHiLhZ3U6fiOB2iiSPEsVmINlYYfDN g==;
X-CSE-ConnectionGUID: 2IONUXv/QMuvAmMWrayhKA==
X-CSE-MsgGUID: liE2U7ptQseJU7XENJkO6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97498517"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="97498517"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 04:23:02 -0700
X-CSE-ConnectionGUID: 8bHmdG3zRq2sDxH8SdczhQ==
X-CSE-MsgGUID: fVNAXWG3TxaS136dD96dRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="239606451"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.12])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 04:23:01 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/4] drm/i915/display: harden shift in
 intel_ddi_compute_config_late()
Date: Tue, 19 May 2026 14:11:15 +0300
Message-ID: <20260519112243.1454375-4-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519112243.1454375-1-luciano.coelho@intel.com>
References: <20260519112243.1454375-1-luciano.coelho@intel.com>
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
index 86520848892e..c02c4d62c96e 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4637,8 +4637,8 @@ static int intel_ddi_compute_config_late(struct intel_encoder *encoder,
 
 	if (crtc_state->master_transcoder == crtc_state->cpu_transcoder) {
 		crtc_state->master_transcoder = INVALID_TRANSCODER;
-		crtc_state->sync_mode_slaves_mask =
-			port_sync_transcoders & ~BIT(crtc_state->cpu_transcoder);
+		crtc_state->sync_mode_slaves_mask = port_sync_transcoders &
+			~BIT((unsigned int) crtc_state->cpu_transcoder);
 	}
 
 	return 0;
-- 
2.53.0

