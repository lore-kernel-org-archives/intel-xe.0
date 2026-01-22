Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA29D625E7
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 04:21:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A4710E8E8;
	Thu, 22 Jan 2026 04:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="leOepWue";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1716E10E04B;
 Thu, 22 Jan 2026 04:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769055714; x=1800591714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YGcQOGt17sEtgVkRNmVarQjmUMtQ/t8KsPVyvfzVEO4=;
 b=leOepWueeha4YbNQKem93levVzLgfX7iiga7zTRY9RCnkT9H92BVzMyv
 2rPZjuF3oEtr0glXGQRUtHDVFTvWHdbdpjJbWQ43EYRpj7sHAnzaGdjnI
 RGrauHspJQcRFL5zlGYxjcDQE7rI82SHh8SDq+5IeK0YYEKytvlhLagbK
 j8RwodpvwQicZYiWtlcdwnQAl5qs7HqQQ05CLVdhLeJ9kU5YsZUXaCVWU
 +2JdBrSEML8TeUJblv9Y5/Wm6EfFlYtqeapOiU3qtyXpU6Cl5P0YQmbPt
 eTKbwkUfX4zUGCBNyrdz1KxEGF1pay8ErhZqGITjrf1KsS4Gq0pjipYZa g==;
X-CSE-ConnectionGUID: Y8OlwUgIRcukfqBh59DQwA==
X-CSE-MsgGUID: MmO0swY+Rl+OP2cSdbvjVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="81402266"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="81402266"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 20:21:52 -0800
X-CSE-ConnectionGUID: s9R+iByUS8mjWtc9GphjTg==
X-CSE-MsgGUID: O92W1TjsQbmaL3FNFL1t1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="206230527"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa007.fm.intel.com with ESMTP; 21 Jan 2026 20:21:51 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	mitulkumar.ajitkumar.golani@intel.com
Subject: [PATCH v1 1/1] drm/i915/display: Implement Wa_16024710867
Date: Thu, 22 Jan 2026 09:41:33 +0530
Message-ID: <20260122041133.757072-2-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260122041133.757072-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260122041133.757072-1-mitulkumar.ajitkumar.golani@intel.com>
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

Reject PTL+ platforms in intel_ddi_port_sync_transcoders,
As port sync feature is deprecated from PTL onwards.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index d8739e2bb004..be774c6d24e7 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4588,8 +4588,11 @@ intel_ddi_port_sync_transcoders(const struct intel_crtc_state *ref_crtc_state,
 	/*
 	 * We don't enable port sync on BDW due to missing w/as and
 	 * due to not having adjusted the modeset sequence appropriately.
+	 *
+	 * Wa_16024710867
+	 * "Deprecate port sync support for PTL+"
 	 */
-	if (DISPLAY_VER(display) < 9)
+	if (DISPLAY_VER(display) < 9 || DISPLAY_VER(display) >= 30)
 		return 0;
 
 	if (!intel_crtc_has_type(ref_crtc_state, INTEL_OUTPUT_DP))
-- 
2.48.1

