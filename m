Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F366BC44537
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 16:16:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B8F10EAB7;
	Tue, 21 Jul 2026 16:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mLeyHHPq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9760A10EAB3;
 Tue, 21 Jul 2026 16:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784650590; x=1816186590;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nT1bgcBE3YcvpHeyAYMtPbuEavXIl4Fgv+GhLA4goTw=;
 b=mLeyHHPqXDqVltDWZC/3K+6Wf5et9hX0ccw/m49aP4AjTftMAmf154f5
 Z5DajBvnW+sAqCOz30ycqF9UvvjyAJue3pSgp9vCc3ckqJ3WMB8/ra0fz
 7gMmSOPZC/uauyqdqWIbwIF/GNZYxNGZuEXya63J2TmSqHIKqDqmMsmbu
 8w9hUEb48KfVq3oD2Gi7Aqy5dx7ciIInhIQce0rhmDUBpkjGqk2Yg5Bue
 rvMXpe3q/LFYa65ZWDXPV2avvsCZEH55ZwRzGeKsF/3PmwfXkfoccofc7
 GPrnsL2MSpAkwsp5aAolZUUPBrzb2Fp6Vxy/hoJgZDoR8+szbmNMejGEn A==;
X-CSE-ConnectionGUID: 6UxTlI5oSne/mVQxWg5h7g==
X-CSE-MsgGUID: bYwakCnaTbq+4aCwixn4Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="95853572"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="95853572"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 09:16:30 -0700
X-CSE-ConnectionGUID: 48bCJFsMTt2PQ1y0ZfksWw==
X-CSE-MsgGUID: ms9pC5HBQpiEVZoazVg7sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="253904883"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa010.fm.intel.com with ESMTP; 21 Jul 2026 09:16:29 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v5 9/9] drm/i915/vrr: Enable cmrr
Date: Tue, 21 Jul 2026 21:35:55 +0530
Message-ID: <20260721160556.3144646-10-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260721160556.3144646-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260721160556.3144646-1-mitulkumar.ajitkumar.golani@intel.com>
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

Enable CMRR during compute config and add related state
checker for the same.

--v2:
- Everything else except enable compute to handle before this patch
(Chaitanya)

--v3:
- Remove redundant return from compute config

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 3847c7c2d8cb..19aa3c53b6e7 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -289,6 +289,8 @@ intel_vrr_cmrr_compute_config(struct intel_crtc_state *crtc_state)
 	adjusted_mode->crtc_vtotal = div64_u64_rem(dividend,
 						   crtc_state->vrr.cmrr.cmrr_n,
 						   &crtc_state->vrr.cmrr.cmrr_m);
+
+	crtc_state->vrr.cmrr.enable = true;
 }
 
 static
-- 
2.48.1

