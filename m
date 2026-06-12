Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E323CD98CC
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 05:33:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE1C10E940;
	Fri, 12 Jun 2026 05:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nucvEoI1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8AB10E93F;
 Fri, 12 Jun 2026 05:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781242386; x=1812778386;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9oIVnkQHNhefTsb1v/3f1vPciRLMAQ9cKD0jgER0BWs=;
 b=nucvEoI1ZNMIpmeRUXBf/q6u9VG2Tntvn6VO8Pkj1JpDlhSuCDYSVQl6
 G0HUEaCjZdpBarIvyr11vHSXNT3wLOg5xLU2AiY0jtPs6a6wv7aG4xgmq
 TMSQT4J1uQEPaJ+/e2L9Q0AnwdBiNu3KXTL3ukpmsF+fEmXJ9g9v0yENF
 xM9rALEn0lMku8NkjyYXLmyRgYqtgmGdMNskx6uC1czicq5Lfbm7KVJ+d
 QzQrHXqu24/mylTuqvQmdlKKSGBaHHtATqFPv0igZCL4Tg+6zqUYOG2aZ
 MRU8YsRlStmcIQzBHiUUfoD/4NdTOTd8ErDoUtq+xaTVXN99LaPHm+zD3 g==;
X-CSE-ConnectionGUID: RrKKnAYjQ+mSWFr22Bj1iA==
X-CSE-MsgGUID: RkQk+TMNTquORyoiq5XmzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82075222"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="82075222"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 22:33:06 -0700
X-CSE-ConnectionGUID: +rMSub/kQLOMUmmhouGuyA==
X-CSE-MsgGUID: e81S1Rg6QFqLlKPfbv7HgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="270762785"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.89])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 22:33:04 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 2/3] drm/i915/psr: Detect possible ALPM errors on Panel Replay
 as well
Date: Fri, 12 Jun 2026 08:32:48 +0300
Message-ID: <20260612053249.246878-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612053249.246878-1-jouni.hogander@intel.com>
References: <20260612053249.246878-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Panel Replay is also using ALPM. Currently possible ALPM errors are
detected only when PSR2 is enabled. Detect possible ALPM errors also when
eDP Panel Replay is enabled.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 99d357bfd84b7..a848c57e4ce5d 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -3866,7 +3866,8 @@ static void psr_alpm_check(struct intel_dp *intel_dp)
 {
 	struct intel_psr *psr = &intel_dp->psr;
 
-	if (!psr->sel_update_enabled)
+	if ((!psr->sel_update_enabled && !intel_dp->psr.panel_replay_enabled) ||
+	    !intel_dp_is_edp(intel_dp))
 		return;
 
 	if (intel_alpm_get_error(intel_dp)) {
@@ -3980,7 +3981,6 @@ static void _psr_short_pulse(struct intel_dp *intel_dp)
 	/* clear status register */
 	drm_dp_dpcd_write_byte(&intel_dp->aux, DP_PSR_ERROR_STATUS, error_status);
 
-	psr_alpm_check(intel_dp);
 	psr_capability_changed_check(intel_dp);
 }
 
@@ -4001,6 +4001,8 @@ void intel_psr_short_pulse(struct intel_dp *intel_dp)
 	else
 		_psr_short_pulse(intel_dp);
 
+	psr_alpm_check(intel_dp);
+
 exit:
 	mutex_unlock(&intel_dp->psr.lock);
 }
-- 
2.43.0

