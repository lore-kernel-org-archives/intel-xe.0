Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA94E7719A
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jan 2025 16:54:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8601E10E2D0;
	Mon,  6 Jan 2025 16:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mP7qgQoN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E89710E22E;
 Mon,  6 Jan 2025 16:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736182473; x=1767718473;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FMJuUPSkU48mOmGQAyF8C+FNtuvFvRXMQx3agOjty6g=;
 b=mP7qgQoNtMx5xwGg2PrzFvM47a7GVuU+wIrTkVfFFVhLbeK6KWxuE5Fj
 osrJ46qF7HoPXeF+f9cWhyEdWUnuMGf2NfV8OaaOTiSxSG9HhZPs1k+c0
 15NNbQ7HDii6fcp6sRSxLhsE0tM1W6GB9DF10AkoadUAwE5kEqDv5dX8V
 uSXc9nlJQuHYmGcYrxEbDW01yqy0WwAuN689xm42s1n4dABOr7IBOX6ec
 P0NELIDcIqLv4Jp5Sx4j00ccykw/pOhgFlNRq3Ft5vqoBjQVWypul7X2g
 owyLoKl7k4ZQpYrFsYr2Rw4gAxlEf0KFEdx2JWvKqVWDKj1YJFGOP34da w==;
X-CSE-ConnectionGUID: eQcAA13NRyKSJsxsn9Lzuw==
X-CSE-MsgGUID: T9CeUT09TFCMsNrpOBWYpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="53880874"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; d="scan'208";a="53880874"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 08:54:33 -0800
X-CSE-ConnectionGUID: BwP0x0iKRdm+xsNEjfamMQ==
X-CSE-MsgGUID: HhhngYTOT7qfXcqZGJ3Lug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="133408732"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa001.fm.intel.com with ESMTP; 06 Jan 2025 08:54:31 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 jani.nikula@intel.com
Subject: [PATCH v3 1/5] drm/i915/scaler: Add and compute scaling factors
Date: Mon,  6 Jan 2025 22:21:07 +0530
Message-ID: <20250106165111.1672722-2-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250106165111.1672722-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20250106165111.1672722-1-mitulkumar.ajitkumar.golani@intel.com>
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

Add scaling factors to scaler_state for a perticular scaler user,
use it later to compute scaler prefill latency. Also to extend this
when either pipe or plane scaler is in use.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_types.h | 2 ++
 drivers/gpu/drm/i915/display/skl_scaler.c          | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index f230163226d1..67c49a1d0232 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -711,6 +711,8 @@ struct intel_initial_plane_config {
 struct intel_scaler {
 	u32 mode;
 	bool in_use;
+	int hscale;
+	int vscale;
 };
 
 struct intel_crtc_scaler_state {
diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index ae21fce534dc..6c69545fe172 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -424,6 +424,9 @@ static int intel_atomic_setup_scaler(struct intel_crtc_scaler_state *scaler_stat
 
 			return -EINVAL;
 		}
+
+		scaler_state->scalers[*scaler_id].hscale = hscale;
+		scaler_state->scalers[*scaler_id].vscale = vscale;
 	}
 
 	drm_dbg_kms(display->drm, "Attached scaler id %u.%u to %s:%d\n",
-- 
2.46.0

