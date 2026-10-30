Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB39E606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 07:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y08pti1N
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B6D112668;
	Fri, 30 Oct 2026 07:06:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A44112661;
 Fri, 30 Oct 2026 07:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793343992; x=1824879992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BcvCQAQiW6MzZ6IY5r+d3o5BM2LDy32d/YeuJ0VMAIQ=;
 b=Y08pti1NWkFIonJ1dYmh1yIvsJWV2VNUitWhjVPXxQ/t1uioyPPiCFIZ
 qNzOLlKIMno7dWqFrYlh4K+l1zxTKEOYJSgvqadQ9K8YNsb3ysU/kw/9v
 S1/I8C59aIDVNke8PqFlTHhLYSpPFd8510OXcVNBiLdWTn5xDHunuqhxG
 itVPRm/p/0CtNdHUNKR0fxWznIMAkAQ5iOxmbNP+iRAxgoZyJu1kd0eQ/
 C49ERiU7JEnvu4nkiXU96tGGW41gdhhhcSu3lbTttr6zs0dKJBHCm7mVe
 WKD0TBvGXclHhxX/+36LlhvLjd0r+AJk4TDB4F7Ud+8w3Pxmu1y7nFFOV w==;
X-CSE-ConnectionGUID: HDoqaUa5S8K14FpC/cLccg==
X-CSE-MsgGUID: We0D5HwkQqSTzOzBljcR2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1985051"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="1985051"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 00:06:31 -0700
X-CSE-ConnectionGUID: gQltKq11TviJRuzl0e77mA==
X-CSE-MsgGUID: gAchhe2mRZOP4fbxS4GdUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5485189"
Received: from szadworn-mobl.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 00:06:29 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 stable@vger.kernel.org
Subject: [PATCH 1/2] drm/i915/psr: Re-arm PSR after flush
Date: Fri, 30 Oct 2026 09:06:12 +0200
Message-ID: <20261030070613.181026-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030070613.181026-1-jouni.hogander@intel.com>
References: <20261030070613.181026-1-jouni.hogander@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

An ORIGIN_FLIP flush can clear the last busy frontbuffer bits without
queuing the work that re-arms PSR.

Queue the re-arm work after each flush when PSR is inactive and no
frontbuffers are busy.

Fixes: ef39826c12b4 ("drm/i915/display: Fix glitches when moving cursor with PSR2 selective fetch enabled")
Cc: <stable@vger.kernel.org> # v5.16+
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 288836d4a993c..752edc1adaa1b 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -3822,9 +3822,6 @@ static void _psr_flush_handle(struct intel_dp *intel_dp)
 		 */
 		intel_psr_force_update(intel_dp);
 	}
-
-	if (!intel_dp->psr.active && !intel_dp->psr.busy_frontbuffer_bits)
-		queue_work(display->wq.unordered, &intel_dp->psr.work);
 }
 
 /**
@@ -3870,14 +3867,18 @@ void intel_psr_flush(struct intel_display *display,
 		    (origin == ORIGIN_CURSOR_UPDATE &&
 		     !intel_dp->psr.psr2_sel_fetch_enabled)) {
 			psr2_dc3co_flush_locked(intel_dp, frontbuffer_bits);
-			goto unlock;
+			goto rearm;
 		}
 
 		if (pipe_frontbuffer_bits == 0)
-			goto unlock;
+			goto rearm;
 
 		/* By definition flush = invalidate + flush */
 		_psr_flush_handle(intel_dp);
+
+rearm:
+		if (!intel_dp->psr.active && !intel_dp->psr.busy_frontbuffer_bits)
+			queue_work(display->wq.unordered, &intel_dp->psr.work);
 unlock:
 		mutex_unlock(&intel_dp->psr.lock);
 	}
-- 
2.43.0

