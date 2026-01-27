Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE58D2FEC4
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 17:05:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B72010E5A5;
	Tue, 27 Jan 2026 17:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T2Mge5v/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11AE610E5A1
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 17:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769533498; x=1801069498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6piSAGUydFEVLrWUa1H6WrRq9PKT544OvcATww2IUdc=;
 b=T2Mge5v/M/Dqv6/42OTmuXfQl2YKen2BwmiRVWGf5nFpfjQ5N5nIybms
 IR/X+GaUYoudCejnUVDc1icmp4BRSI6ZxJBD0tsN+VCQxP13RcBSlmn9q
 1nnMLizWDSpRGOnLUH0LVPcdZNUeJM0aOiYMdYdSHQBbzGJEQwtPK6w5P
 jWx4YQLgk3HkpEBaSTgYDqshu9DKfC+NEKX6zxxsVtkJEV7sYcIWRb0Mp
 DGaIRekOYaeUCdDU2N9JNL9JejK72Hp4snNENsdHu/eBKRP3DtFqWlJbX
 rAM6MfePGjysMcYcjiIa1M36rL3w3iVfv2odz6y8BSeFXjNUlkncuc13/ g==;
X-CSE-ConnectionGUID: BZ8RZSZ7REaBbHO1GYT6Rg==
X-CSE-MsgGUID: rsGUVMZsSjOPCiQV8ge2MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="93393530"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="93393530"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 09:04:58 -0800
X-CSE-ConnectionGUID: 1Ya8M0chSWiDjKn9fkmMng==
X-CSE-MsgGUID: yfnXmkAPRKiubeCwnmBioA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="208039398"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa008.jf.intel.com with ESMTP; 27 Jan 2026 09:04:58 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>, stable@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 4/5] drm/xe/guc: Ensure CT state transitions via STOP
 before DISABLED
Date: Tue, 27 Jan 2026 12:04:54 -0500
Message-Id: <20260127170455.618616-5-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260127170455.618616-1-zhanjun.dong@intel.com>
References: <20260127170455.618616-1-zhanjun.dong@intel.com>
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

The GuC CT state transition requires moving to the STOP state before
entering the DISABLED state. Update the driver teardown sequence to make
the proper state machine transitions.

Fixes: ee4b32220a6b ("drm/xe/guc: Add devm release action to safely tear down CT")
Cc: stable@vger.kernel.org
Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index dfbf76037b04..6a658f085e0f 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -345,6 +345,7 @@ static void guc_action_disable_ct(void *arg)
 {
 	struct xe_guc_ct *ct = arg;
 
+	xe_guc_ct_stop(ct);
 	guc_ct_change_state(ct, XE_GUC_CT_STATE_DISABLED);
 }
 
-- 
2.34.1

