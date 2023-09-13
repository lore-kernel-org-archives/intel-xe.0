Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE1DEE0212
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 23:14:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D7310E1DD;
	Wed, 13 Sep 2023 23:14:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2046E10E1DB
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 23:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694646891; x=1726182891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e/LMPOGyLUrGIap0bh9Wz4NL71n21cSTHu/L48ADfJg=;
 b=iB8uks3rZL6eDx6IkdtiC30qZwVFfOKiQxs6EVLyxClEIwW+nrqTz6ia
 4rGP82zTnDMjAFTPzfDip1Oz0jM2qAHznzjbpIHZOH5mSSUlWcp1WIr79
 F9IyQpHyuZKuR/R6cwKW6RuZnhM7wtFJ9K++jUHvJgcx4isWY517Zo6Re
 5WNHeVsWxnu4Hq6xGlODnC0nS9xToigQmjOqRE2ngzwxKRLOFFPKOr+wl
 PLAcp2RYHcLvpAgZRSzX5M2ByGe52vy2FeSH31LtW6sfJKUEteQfUc2lB
 u8bUM5grg13f5nevV2TnnRyCqURxzhhZ1M4Empg1Zi1VzrA64iQnL4ryE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="377714988"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="377714988"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 16:14:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="773659700"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="773659700"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 16:14:50 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 13 Sep 2023 16:14:14 -0700
Message-ID: <20230913231411.291933-10-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230913231411.291933-8-matthew.d.roper@intel.com>
References: <20230913231411.291933-8-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/6] drm/i915/adlp: Stop calling
 gen12lp_init_clock_gating()
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The only programming that happens in gen12lp_init_clock_gating is for
display workarounds that are specific to display version 12 and are not
relevant to ADL-P's display version 13.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230906234732.3728630-8-matthew.d.roper@intel.com
(cherry picked from commit 3d0a1688fe5b7ff46e4d308488aee38b4146868b)
---
 drivers/gpu/drm/i915/intel_clock_gating.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c b/drivers/gpu/drm/i915/intel_clock_gating.c
index 1f2e2d7087cb..2a4714c662b8 100644
--- a/drivers/gpu/drm/i915/intel_clock_gating.c
+++ b/drivers/gpu/drm/i915/intel_clock_gating.c
@@ -375,8 +375,6 @@ static void gen12lp_init_clock_gating(struct drm_i915_private *i915)
 
 static void adlp_init_clock_gating(struct drm_i915_private *i915)
 {
-	gen12lp_init_clock_gating(i915);
-
 	/* Wa_22011091694:adlp */
 	intel_de_rmw(i915, GEN9_CLKGATE_DIS_5, 0, DPCE_GATING_DIS);
 
-- 
2.41.0

