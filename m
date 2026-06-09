Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88856CD8CA7
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 08:21:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3602D10E19F;
	Tue,  9 Jun 2026 08:21:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nYSBNdWh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6019F10E19D;
 Tue,  9 Jun 2026 08:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780993268; x=1812529268;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d0lPsWc3r7WmViA5eaOV6GoSy4Z3YU9OKUEqkR4DyAs=;
 b=nYSBNdWhO9y/wobVB8KJEeVDQJB1BaiT9Zr/TeUWLo/R5TPXE2vpdshz
 GDuxoxLVJ3RJkVn1e2/FxZWoYhEzPeJaKRhnCjnXeNC31c3SKGfapacPD
 VZP9fuNXE/gg8nVoogFV90FqOyVDYUI/KD52MNXqeDD2V2FJr8oDeK12F
 ofhDrt2dLSHi5ojb6xpsYfywf/kSqYTMwQLl0m41CCBWHAgfbWPu8dSkm
 FhEIeVEUge3+VJuPFuJYS4h1ZEfD0KZS/7lYXdM2IhSnNPXB33IwpXFCD
 fFYf1X/Vb4IwBLax8gLs2I7BcyBoolhAH2R3TJurucKufyJdxwXyG6AOF g==;
X-CSE-ConnectionGUID: FdTyHdBUQwKSkiJXNJyXvw==
X-CSE-MsgGUID: dclerNRsRKm9HJsy1gDyHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81494382"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="81494382"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 01:21:08 -0700
X-CSE-ConnectionGUID: iD7kE/3ATv2ID75vwinFdA==
X-CSE-MsgGUID: 025lV8ILRzWyobkpNTV5fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="245647609"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.95])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 01:21:08 -0700
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 3/4] drm/i915/display: harden shift in
 intel_ddi_compute_config_late()
Date: Tue,  9 Jun 2026 11:19:53 +0300
Message-ID: <20260609082040.524725-4-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609082040.524725-1-luciano.coelho@intel.com>
References: <20260609082040.524725-1-luciano.coelho@intel.com>
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

