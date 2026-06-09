Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3816CCD8CAA
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 09:55:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF17A10E212;
	Tue,  9 Jun 2026 09:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h64HXDAZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F014010E20F;
 Tue,  9 Jun 2026 09:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780998945; x=1812534945;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d0lPsWc3r7WmViA5eaOV6GoSy4Z3YU9OKUEqkR4DyAs=;
 b=h64HXDAZxKiTb87kLzR0Vs6igxCKcajFvlsVXQ/ZGWS6rWP+peq1Zo0s
 2HA+7IvmZTkQ82MTBYKlMUtsk/5aphCi3EtO0degPvYA++HmYM9kVmkit
 1+PO13pJK4MZcmydle9lU7Xjmn9jO+MWXheYdbUEE6t+ePNjk8zOdx6wv
 sAGit/QqsSZtFQNDkA7XGMYpyCy7xgvfjwH9KC7435LDxRmo4QaiVeURD
 VLuDVQwHO3KW3rcz5L+h/h2OSpd5d+6zOoMJqb6S48OeCbUdmxHenYTQW
 3gKD+hnojY6lMpIcKr7Wl0PF6gCPbu/fXhgTrSSd/qcpi8ehqbAu4aHrg A==;
X-CSE-ConnectionGUID: 7oxkF4VJQlalAC8+qigX0A==
X-CSE-MsgGUID: mK6DV5mfSEKvVBbZJnBAuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81759180"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="81759180"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 02:55:45 -0700
X-CSE-ConnectionGUID: xHYufaJ+TTyPaX41K/wcjw==
X-CSE-MsgGUID: xXCq4d4ATe2PeXra6q2EIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="250898101"
Received: from amilburn-desk.amilburn-desk (HELO hazy.intel.com)
 ([10.245.245.108])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 02:55:42 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 3/4] drm/i915/display: harden shift in
 intel_ddi_compute_config_late()
Date: Tue,  9 Jun 2026 12:52:38 +0300
Message-ID: <20260609095525.570614-4-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609095525.570614-1-luciano.coelho@intel.com>
References: <20260609095525.570614-1-luciano.coelho@intel.com>
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
index 6399b16405c8..51816c5bc80b 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4635,8 +4635,8 @@ static int intel_ddi_compute_config_late(struct intel_encoder *encoder,
 
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

