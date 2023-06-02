Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CD2C77B7A
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 10:42:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FCD310E659;
	Fri,  2 Jun 2023 10:42:59 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E6210E656
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 10:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685702577; x=1717238577;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=51wTgqm+s5Rg2y3fr6wN/xeMKfkq6cAN1KYDxCfvrX8=;
 b=cpGeurTu9WHYBg5J6Us1qt9b8RUpjKK56yFD4ZokbuI1XT2G/WMSw+mu
 eX34gxmW3wFW7/0DKtKiwZ1XojveC5iI/EYjSQfr1wpz3JZNbRGv3ms2A
 vj0v4NkUVzDgYjMItmV1ug3rM/nK5hi2COOuAlOFOzthEikgAoHqIbbcD
 gRZ5++zRxPOn3uDRDdec7cDXdJeAPB/1In+IAdvMw4DfeFMJXrRaIsKxg
 l4z5HFyPtYYvJfkEkx9V18Ip5crNu0ffI3JKTxMSdNiyEXmp8DHkuYR3s
 Yo2BLBa5X1wOGyIYtyQOm/oHzIUJde62ElTKA6oxqEw5XKAiSVIvLGpgV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="442215538"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="442215538"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 03:42:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="658237893"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="658237893"
Received: from amelillo-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.251.209.93])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 03:42:55 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  2 Jun 2023 13:42:28 +0300
Message-Id: <20230602104237.1014684-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602104237.1014684-1-jouni.hogander@intel.com>
References: <20230602104237.1014684-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 01/10] Revert "drm/i915/display: Make FBC
 check stolen at use time."
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit 21e4ad64271f79f821e808a3a84bc145f4c5b2cb.

As a part of clean-up we want to revert this patch and introduce required
changes as a set of patches.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 0e8e899f596b..0a9b081c18b8 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1134,13 +1134,6 @@ static int intel_fbc_check_plane(struct intel_atomic_state *state,
 	if (!fbc)
 		return 0;
 
-#ifndef I915
-	if (!i915_gem_stolen_initialized(i915)) {
-		plane_state->no_fbc_reason = "stolen memory not initialised";
-		return 0;
-	}
-#endif
-
 	if (intel_vgpu_active(i915)) {
 		plane_state->no_fbc_reason = "VGPU active";
 		return 0;
@@ -1794,10 +1787,8 @@ void intel_fbc_init(struct drm_i915_private *i915)
 {
 	enum intel_fbc_id fbc_id;
 
-#ifdef I915
 	if (!i915_gem_stolen_initialized(i915))
 		RUNTIME_INFO(i915)->fbc_mask = 0;
-#endif
 
 	if (need_fbc_vtd_wa(i915))
 		RUNTIME_INFO(i915)->fbc_mask = 0;
-- 
2.34.1

