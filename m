Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303F2606A326
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 10:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HVjEgebb
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E365410E5F2;
	Mon,  2 Nov 2026 10:01:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B49210E5E0;
 Mon,  2 Nov 2026 10:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793613673; x=1825149673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GJ3a7H2Pwgz4pUACG1Y52iVmzWsdZ9OWZCQ0/x4Uqfc=;
 b=HVjEgebbJIPZcuSDzOXKpeYDZdsbEyk2xmjx8l+3S1IxQfzMLZpy6Ixo
 Qclr4iu94qjAOXa6k+8OYN1YMMvrvL2d7qSFvtp4WtTTRA7rKH7Y5P26n
 FCN5y4j57Yol49IlATCKae6gwXstptE7Pqn1qJHXYrBBu2YWqHyo376Rt
 h/v0q/t4mEeMvQ2A+if1OI5X8gq8YCVB3N4/BeubXvWh7PzR0wISsvKXQ
 54rC59MrnTz90Mx41Uw6fTRu20sphvrEyD3sBgdJyfWj+UZwPjndt5Gub
 MP84Scq7P9GQK+SuyG13ZeSg5NwsPUewyyRPqMMu1CleFpPdeIe1oQQv+ w==;
X-CSE-ConnectionGUID: cNH/Zp85T5unOHP2OQKotQ==
X-CSE-MsgGUID: XsrqArSaTka4XGkVJSaaNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2204598"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2204598"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 02:01:13 -0800
X-CSE-ConnectionGUID: WbTEPbP3S2aezdrNLVVNeA==
X-CSE-MsgGUID: Lpx4iqTxQYeELfImDTLRcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6068329"
Received: from bradocaj-mobl.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.122])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 02:01:10 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 stable@vger.kernel.org, Ambica Pramod <ambica.pramod@intel.com>
Subject: [PATCH v2 2/4] drm/i915/psr: Re-arm PSR after flush
Date: Mon,  2 Nov 2026 12:00:49 +0200
Message-ID: <20261102100051.272137-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102100051.272137-1-jouni.hogander@intel.com>
References: <20261102100051.272137-1-jouni.hogander@intel.com>
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

Move also pipe_frontbuffer_bits ==0 check to done right after pipe
frontbuffer bits are figured out. Anyways nothing is currently done after
in intel_psr_flush if the bits are 0.

v2: Do not re-activate PSR on other pipe frontbuffer bits.

Fixes: ef39826c12b4 ("drm/i915/display: Fix glitches when moving cursor with PSR2 selective fetch enabled")
Cc: <stable@vger.kernel.org> # v5.16+
Tested-by: Ambica Pramod <ambica.pramod@intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index b37723ad56c42..be1edd9099fb3 100644
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
@@ -3856,6 +3853,10 @@ void intel_psr_flush(struct intel_display *display,
 		}
 
 		pipe_frontbuffer_bits &= psr_frontbuffer_mask(intel_dp);
+
+		if (pipe_frontbuffer_bits == 0)
+			goto unlock;
+
 		intel_dp->psr.busy_frontbuffer_bits &= ~pipe_frontbuffer_bits;
 
 		/*
@@ -3870,13 +3871,14 @@ void intel_psr_flush(struct intel_display *display,
 			psr2_dc3co_flush_locked(intel_dp, frontbuffer_bits);
 
 		if (origin == ORIGIN_FLIP)
-			goto unlock;
-
-		if (pipe_frontbuffer_bits == 0)
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
2.53.0

