Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0C0C76196
	for <intel-xe@archiver.kernel.org>; Fri, 10 Mar 2023 22:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D457B10EA2B;
	Fri, 10 Mar 2023 22:16:31 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB6210EA1B
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Mar 2023 22:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678486588; x=1710022588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A9Ih9D9aP3rTtGi7Q143BVNIuDtNbhvQB458WeILOEk=;
 b=eDNRpo5LgrN7NW1sBNwm5xTc9cy6T7NfI8aRZHs8XjPxptsCyGSvclfb
 UYmwhogLUZGyFeDH4rY8hEiKP85eiUuz4ee9NWjimxZdluhgLkEM9nweP
 VpAT4b2EaSKnrR42Ndi2CTLWeY0cnNGR5ey4KXGcUKQPvio1ZHHWOO4rj
 8jtc7qEKIkggU6WJ2yRFMZYAF+dgMgwVbew4uKTXteG8DrWyHlcgdZlMA
 XJ2Ba8E9NBX4HfIDrYPuEPVpY7QRcdwIqgv6K3pDyMTey8oja9Y5zsEdv
 56kghhJhYXvZpRyNKCTy55R0caAhtBtxpK3QQHBEw9YslBOL6e0qRpXWD g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="423106176"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="423106176"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 14:16:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="821234961"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="821234961"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 14:16:23 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 10 Mar 2023 14:15:42 -0800
Message-Id: <20230310221549.2337402-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230310221549.2337402-1-lucas.demarchi@intel.com>
References: <20230310221549.2337402-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 05/12] drm/xe: Remove policy on preemption
 from WAs
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The fake WA FtrPerCtxtPreemptionGranularityControl is documented in i915
and is not a true WA, it's a policy chosen to allow preemption settings
to be controlled on a per-context basis by userspace.  The policy for
the xe driver is to be decided, and if the same is chosen, it should be
set in another place, like xe_tuning.c. Certainly not the place it
currently is.

Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 67539f9d70b4..76c603dfc030 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -236,12 +236,6 @@ static const struct xe_rtp_entry engine_was[] = {
 	  XE_RTP_ACTIONS(SET(GEN10_SAMPLER_MODE, ENABLE_SMALLPL,
 			     XE_RTP_ACTION_FLAG(MASKED_REG)))
 	},
-	{ XE_RTP_NAME("FtrPerCtxtPreemptionGranularityControl"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1250), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(GEN7_FF_SLICE_CS_CHICKEN1,
-			     GEN9_FFSC_PERCTX_PREEMPT_CTRL,
-			     XE_RTP_ACTION_FLAG(MASKED_REG)))
-	},
 	{}
 };
 
-- 
2.39.0

