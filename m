Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90918C54F4C
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 15:11:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32CFE10E58B;
	Tue, 28 Jul 2026 15:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cok+eoKe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427CB10E4D1;
 Tue, 28 Jul 2026 15:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785251477; x=1816787477;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wM/QZdvQ8iOu7cd4l0YH11NyvyScYTgyGQWkCYV2jp8=;
 b=cok+eoKeOfJyvir6GVF3vZM734YdSYTJ66YcDhur4fUxxD6CDOL+OGP+
 2qqbIAKAo1x5LRMU3xr8Nys7IXMV/V9bdzoJ80jYm2RieVnWmRMvwQNvl
 yhWvFvKm6xO6A92bWY8wipvESy2xMUKQQnIGhU12ThyDU5n+Z9wI42i9Z
 YMIUkmMgtvuqgR89Ca8CO9WTu11/DQlmf1Nkcxkp8GxDJSW1cHGgIBMA2
 +2W6CnOHg8HJYs4LP66iXl/8+zSSvY31xOa98mNnc5xIPApne5dguOF8N
 VldjGfntjZ4jqXtQR9dPdVINKKbuH/e/OALYgKn7lDRn1LoNz2M7Pvf30 w==;
X-CSE-ConnectionGUID: mUOGTq8TRuKDKjtHsf4bFQ==
X-CSE-MsgGUID: kGkLjs0USCuMdWjNOEzpGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="88376905"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="88376905"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 08:09:58 -0700
X-CSE-ConnectionGUID: 4QaHDQwiQfakJ6LzKE6kAg==
X-CSE-MsgGUID: VyTVWNZATSGBaCQcrVMwiQ==
X-ExtLoop1: 1
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa003.fm.intel.com with ESMTP; 28 Jul 2026 08:09:56 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v7 01/10] drm/i915/vrr: Return from PSR2 compute config in
 case of CMRR enabled
Date: Tue, 28 Jul 2026 20:29:33 +0530
Message-ID: <20260728145943.3848704-2-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260728145943.3848704-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260728145943.3848704-1-mitulkumar.ajitkumar.golani@intel.com>
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

CMRR is mutually exclusive to PSR2, do not enable PSR2 when CMRR is
enabled.

--v2:
- Restrict selective update config check (Ankit)
- Commit message change

--v3:
- Commit changes

--v4:
- Add check to psr2_config_valid (Jouni)

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 40e3d7095996..5ddcede6db27 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1491,6 +1491,12 @@ static bool intel_psr2_config_valid(struct intel_dp *intel_dp,
 	int crtc_vdisplay = crtc_state->hw.adjusted_mode.crtc_vdisplay;
 	int psr_max_h = 0, psr_max_v = 0, max_bpp = 0;
 
+	if (crtc_state->cmrr.enable) {
+		drm_dbg_kms(display->drm,
+			    "Selective update cannot be enabled when CMRR is enabled\n");
+		return false;
+	}
+
 	if (!connector->dp.psr_caps.su_support || display->params.enable_psr == 1)
 		return false;
 
-- 
2.48.1

