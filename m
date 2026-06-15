Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DDDCD98CE
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 20:34:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88EDB10E6A5;
	Mon, 15 Jun 2026 20:34:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DZ94sVzf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337DF10E6A6;
 Mon, 15 Jun 2026 20:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781555653; x=1813091653;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=77fQ1dtXoZAs4c3CulsSQL2aVUVIj8pVBq/r71f1GQw=;
 b=DZ94sVzf1TkNCUd6+1GVqvxt69fqqEg4EcBhvcwnDn2oI6nAz6Kp1spj
 YXlznS7XotNbUkg8VCIBDI+CADAON4Ga13INg9wAbCO76xzF/KkAKub1e
 +FkwScKemU9DXKP8GXmJgT1m97hBH/K5W5CPdGWySsHza7uDIWs99AZPn
 terb8wVWwCn33+cx7OCfiJkxghEBhV7T+E2mE1Ptp1sCKaECFado2D419
 wkUVb0X5z1SqzW/YtGO7lLF3DdtWOFotkTxKvVnx2O388kYY5Rep7Llp1
 Gi3uwrgkEn05eyRsHL96s5zbsJ89ZLQBHzbLBu5FUR5oJOUMTl04i3q2T A==;
X-CSE-ConnectionGUID: +cqK+OOCRtiZ14X6kz+MjA==
X-CSE-MsgGUID: QaaoOW5KRNaxgWlwShN53g==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="93694565"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="93694565"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 13:34:13 -0700
X-CSE-ConnectionGUID: qSL36WyJRuavzFLWERbm5A==
X-CSE-MsgGUID: lI1osJqIQpWjsliPIrwvoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; d="scan'208";a="252538445"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.246])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 13:34:09 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH v3 1/7] drm/i915/wm: clear the plane ddb_y entries on plane
 disable
Date: Mon, 15 Jun 2026 23:33:49 +0300
Message-ID: <20260615203355.218578-2-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615203355.218578-1-vinod.govindapillai@intel.com>
References: <20260615203355.218578-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

The UV/Y plane DDB entriess are never cleared on
sk_wm_plane_disable_noatomic() and can leave stale DDB state
for NV12 planes on pre-Gen11 devices

Fixes: d34b59d5ba41 ("drm/i915: Add skl_wm_plane_disable_noatomic()")
Assisted-by: Copilot:claude-sonnet-4.6
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/skl_watermark.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index 5a3677ea25b0..a4ce21d4c024 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -3856,7 +3856,7 @@ void skl_wm_plane_disable_noatomic(struct intel_crtc *crtc,
 		return;
 
 	skl_ddb_entry_init(&crtc_state->wm.skl.plane_ddb[plane->id], 0, 0);
-	skl_ddb_entry_init(&crtc_state->wm.skl.plane_ddb[plane->id], 0, 0);
+	skl_ddb_entry_init(&crtc_state->wm.skl.plane_ddb_y[plane->id], 0, 0);
 
 	crtc_state->wm.skl.plane_min_ddb[plane->id] = 0;
 	crtc_state->wm.skl.plane_interim_ddb[plane->id] = 0;
-- 
2.43.0

