Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC57C0218B
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jan 2025 17:25:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0BD10E46A;
	Mon, 20 Jan 2025 17:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PJQrsbFH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A030210E46A;
 Mon, 20 Jan 2025 17:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737393922; x=1768929922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=86FyoeUVJ+rX7D1jkFrr0L2QaZyCRTA7SvD+B8xVvNQ=;
 b=PJQrsbFHG7IDsGiMfH8MID7YsZkVZ/Bs4sS+zVRWXKshlng+Bc2eW9/d
 9RE0t8GiVjKdKY/THtD0gbtFFw9R0Q0XoRLeQInuXoUJROqZx1bMarVux
 U6jwjNbwdaANAkNU//9WMKEdJe1x9/TvXNPDY8dta2XynJ7KAwCdFXr77
 897LocOwjyIfTL9iYpPldFPmbtpmw3Krj0kLdXsgeBhHd1ST8yLANNqt7
 LidCMle+WEW1oww9VnMxLkaM9wRkrmrD1j7602ytF5z8IhyGVH6DzMLFa
 FsWyfnOJ9p68pKNnwjHd/iAm4T2ttNhAkReDzkL1w5UoheghlUw0KyxLR A==;
X-CSE-ConnectionGUID: HOwNmVkTTqmEkP0HHBx7MQ==
X-CSE-MsgGUID: VJWuezVfQsmDou0shEQCug==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="48462469"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; d="scan'208";a="48462469"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 09:25:21 -0800
X-CSE-ConnectionGUID: hSxstDABRBOOirbacHNF+A==
X-CSE-MsgGUID: 25uPMw03R3KjJ0sEXdiV7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; d="scan'208";a="107121037"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa010.fm.intel.com with ESMTP; 20 Jan 2025 09:25:19 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, jani.nikula@intel.com, ville.syrjala@intel.com
Subject: [PATCH v9 1/7] drm/i915/scaler: Add and compute scaling factors
Date: Mon, 20 Jan 2025 22:52:02 +0530
Message-ID: <20250120172209.188488-2-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250120172209.188488-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20250120172209.188488-1-mitulkumar.ajitkumar.golani@intel.com>
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

Add scaling factors to scaler_state for a particular scaler user.
These factors will be used later to compute scaler prefill latency.
Currently, only plane scaling factors are stored, but the same members
can later be extended to store pipe scaling factors as well.

--v2:
- Rephrase commit message. [Ankit]
- Corrects typos. [Ankit]

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_types.h | 2 ++
 drivers/gpu/drm/i915/display/skl_scaler.c          | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 8271e50e3644..603f292996aa 100644
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
index a11e09a15e23..67b86f6f62fc 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -434,6 +434,9 @@ static int intel_atomic_setup_scaler(struct intel_crtc_scaler_state *scaler_stat
 
 			return -EINVAL;
 		}
+
+		scaler_state->scalers[*scaler_id].hscale = hscale;
+		scaler_state->scalers[*scaler_id].vscale = vscale;
 	}
 
 	drm_dbg_kms(display->drm, "[CRTC:%d:%s] attached scaler id %u.%u to %s:%d\n",
-- 
2.48.1

