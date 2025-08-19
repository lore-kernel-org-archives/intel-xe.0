Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C904ECA0EE9
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 07:04:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C57610E541;
	Tue, 19 Aug 2025 07:04:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e1L/QUI2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3B210E541;
 Tue, 19 Aug 2025 07:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755587053; x=1787123053;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IzQYhbmuGTQpsRUqBPH3XwlHPfiCXkVI9zAmnYDnB7E=;
 b=e1L/QUI2MjS4SE9CirpCj86sxJuP3qm5x4crQ7Uri2hVvNg0P1iZMqNQ
 cyjVFQ+p4eG3vLLSegUkf/70kbKmtm2l3B55lO97naUBf2OD5XjLuPXUM
 hv/vQeTmazPf1EJyShArO3u836hbQtaT0T9WyDKSE8FJiCA1FbU89oECv
 Av3sOJZIajZI4Vt06cV5G4WtOy25fYBQ0mc87vrfC2v6J/4E9cEEJSkum
 tIqmZp7EWTxVF72ulFSszQSzWdIW742h/syQgZuI49QeHBtvoEKB7hvn2
 51LPcrrCR7Wrd8krkzgKapkmpxsZ8tpzHQQxRv5uKqBY4aIfxBb+lBlrA w==;
X-CSE-ConnectionGUID: DrQTpEmgQ4inCDeN3RytCQ==
X-CSE-MsgGUID: eSazquIPQRWdW2W2tp7THg==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="75392354"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="75392354"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 00:04:13 -0700
X-CSE-ConnectionGUID: xcMs9N3KTUuehEZVNVlkiQ==
X-CSE-MsgGUID: vUx/Z4UuTGuVgKbt5GUAkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="168008253"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.244.65])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 00:04:12 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v7 2/6] drm/i915/psr: Add intel_psr_use_trans_push to query if
 TRANS_PUSH is used
Date: Tue, 19 Aug 2025 10:03:49 +0300
Message-ID: <20250819070353.3062341-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250819070353.3062341-1-jouni.hogander@intel.com>
References: <20250819070353.3062341-1-jouni.hogander@intel.com>
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

This is a preparation to start using trans push as a PSR "Frame Change"
event. It adds intel_psr_use_trans_push placeholder which return false for
now until we have everything in place.

v2:
  - modify commit message
  - add TODO

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 6 ++++++
 drivers/gpu/drm/i915/display/intel_psr.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 8bea2b8188a7..302744252b24 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -4253,3 +4253,9 @@ bool intel_psr_needs_alpm_aux_less(struct intel_dp *intel_dp,
 {
 	return intel_dp_is_edp(intel_dp) && crtc_state->has_panel_replay;
 }
+
+bool intel_psr_use_trans_push(const struct intel_crtc_state *crtc_state)
+{
+	/* TODO: Enable using trans push when everything is in place */
+	return false;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_psr.h b/drivers/gpu/drm/i915/display/intel_psr.h
index 9b061a22361f..7237dfa388b6 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.h
+++ b/drivers/gpu/drm/i915/display/intel_psr.h
@@ -81,5 +81,6 @@ void intel_psr_debugfs_register(struct intel_display *display);
 bool intel_psr_needs_alpm(struct intel_dp *intel_dp, const struct intel_crtc_state *crtc_state);
 bool intel_psr_needs_alpm_aux_less(struct intel_dp *intel_dp,
 				   const struct intel_crtc_state *crtc_state);
+bool intel_psr_use_trans_push(const struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_PSR_H__ */
-- 
2.43.0

