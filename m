Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C8CC02183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 07:47:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A508610EA7E;
	Fri, 17 Jan 2025 07:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SHVcxYE0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5909010EA7D
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jan 2025 07:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737100055; x=1768636055;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=86FyoeUVJ+rX7D1jkFrr0L2QaZyCRTA7SvD+B8xVvNQ=;
 b=SHVcxYE02dyRUk74JLSRpJgzft//QCztszT1zeVyAxMgHbMgENLRlTPh
 DFYYQrJlH43Zcy42eW/B20P1g0TdyKDu+ZUTxzasasnT1qAV/gsmx+rXt
 Uzf2L19+TtkJMsHkw09JbGjyUXxJoZQBWcSJLRJPaWFT97rwrq7AMT3sQ
 ZDBduqSYRr3mNW33ss0y67k1hGY3tGermoMDc4K6CibG7t7LYArctxaI7
 6J2rC6ff6KTVrRXNsoEeoXSBGXlrYzh8ZMLb4jaCZKrqsznkmzqj4sB3f
 ch1ChIghN3dgvhB5O5fZYIj5ajxTh8Z2N+vmDPA/hQPHQJQqrTiboWXpW A==;
X-CSE-ConnectionGUID: kucA9h5rTau4YRSTIldILw==
X-CSE-MsgGUID: tkm98la/Tsexepbo3E/VkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37760745"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="37760745"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 23:47:35 -0800
X-CSE-ConnectionGUID: 4sv2Gc3xQUOcSg7DhyXOAQ==
X-CSE-MsgGUID: DtyZmthvTcGUcBjDkd0Epg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="105687934"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa007.fm.intel.com with ESMTP; 16 Jan 2025 23:47:35 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 1/7] drm/i915/scaler: Add and compute scaling factors
Date: Fri, 17 Jan 2025 13:14:15 +0530
Message-ID: <20250117074422.3965519-2-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250117074422.3965519-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20250117074422.3965519-1-mitulkumar.ajitkumar.golani@intel.com>
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

