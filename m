Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA944C7EE24
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 10:43:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C634510E65A;
	Fri,  2 Jun 2023 10:43:14 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B63C410E662
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 10:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685702592; x=1717238592;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gNGB38aT68mbBKr1CLfkjKpgtMTTiWGIL6Yrlnw6jWE=;
 b=Me28u8lrvpBpq68nCl44zxLD4h7IoKcwH5BjWQ+dEHiiLwZ75d1TOaa2
 Y0JEk/A1oMwuXn4737UxOdWG4NJaJNiqrNiiwlAhLimApZ2ElYZ6BVbnF
 Tt2XCQkRTzIh8w1QA+wAjFFzITBzQR+jwNhDN2X+bmJVMBSnfYpsqvbDF
 B/rw1Ex4ZLPtQow9s7ZKU0PmXbuINGNHejEWBnPnIIMHk6IQyct9X/I1c
 xb7IcMe2UOMnoufZsda6McuXoZoLoZALjOKy2onw0yRjB69l5OnuFBpro
 gX7mM3hRHM9eIVu7ppRXSlaFQnpK43PtTmdUy3BS2cVG6vDAtWsX4aRay A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="442215570"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="442215570"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 03:43:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="658237919"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="658237919"
Received: from amelillo-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.251.209.93])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 03:43:10 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  2 Jun 2023 13:42:35 +0300
Message-Id: <20230602104237.1014684-9-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602104237.1014684-1-jouni.hogander@intel.com>
References: <20230602104237.1014684-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 08/10] drm/i915/fbc: Make FBC check stolen at
 use time
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

In case of xe, stolen is not initialised until much later, so just
assume it works, and check at runtime if required. There is no specific
reason to differentiate behavior for i915 -> do runtime check for both.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index e154f0bb1e01..0edfc897e94d 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1056,6 +1056,11 @@ static int intel_fbc_check_plane(struct intel_atomic_state *state,
 	if (!fbc)
 		return 0;
 
+	if (!i915_gem_stolen_initialized(i915)) {
+		plane_state->no_fbc_reason = "stolen memory not initialised";
+		return 0;
+	}
+
 	if (intel_vgpu_active(i915)) {
 		plane_state->no_fbc_reason = "VGPU active";
 		return 0;
@@ -1709,9 +1714,6 @@ void intel_fbc_init(struct drm_i915_private *i915)
 {
 	enum intel_fbc_id fbc_id;
 
-	if (!drm_mm_initialized(&i915->mm.stolen))
-		RUNTIME_INFO(i915)->fbc_mask = 0;
-
 	if (need_fbc_vtd_wa(i915))
 		RUNTIME_INFO(i915)->fbc_mask = 0;
 
-- 
2.34.1

