Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB425F54ACD
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 15:37:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A2810E717;
	Tue, 24 Mar 2026 15:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bm/jQFEO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5954010E717
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 15:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774366655; x=1805902655;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A9CrpWaW/etMXe3bTPV6UyF0UMgmO9R+xQkFr2XBAAc=;
 b=Bm/jQFEOUUP/TbApvTZkOCS6IqCTRXynOGjHDx2JoZeWul/APlAn0uQ6
 0jr5grgMLkEctkLCCvXwbmV7ndK/XVC/eRGLL4M8fnpnirU5r4yb7zpQt
 bBJXxITxDQu7SDPukeyKz9k7GQbEvKteKHzCjIlpu/yVc5KKasytxZgWT
 RR92dNDu0JBienoCJDFaDm1VDtB20Uo+ga+xQaJCxMi+pN7fBcMr+veQ+
 l7sU07qA1wqQuU8OzPmqi7L+ylmB28H5nBuH4nNPQKOlHyvzDHXjg1WNK
 hN/J8vpK4xjirfvqpVt9UvSUEm0p4JednZWQzd0f9hRVOBLaTYvXNq40Q g==;
X-CSE-ConnectionGUID: 0swvFMTwR5yBOPq7Zd7y5Q==
X-CSE-MsgGUID: 3yaQHaSYTFizJ+4eD5nA9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75102392"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="75102392"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 08:37:35 -0700
X-CSE-ConnectionGUID: tAMChaUGRpKWhono5LvTPQ==
X-CSE-MsgGUID: Z8BefmrATKGF7jrkZ2nefQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="228863577"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 08:37:34 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v2 1/4] drm/xe/pxp: Clean up termination status on failure
Date: Tue, 24 Mar 2026 08:37:20 -0700
Message-ID: <20260324153718.3155504-7-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324153718.3155504-6-daniele.ceraolospurio@intel.com>
References: <20260324153718.3155504-6-daniele.ceraolospurio@intel.com>
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

If the PXP HW termination fails during PXP start, the normal completion
code won't be called, so the termination will remain uncomplete. To avoid
unnecessary waits, mark the termination as completed from the error path.
Note that we already do this if the termination fails when handling a
termination irq from the HW.

Fixes: f8caa80154c4 ("drm/xe/pxp: Add PXP queue tracking and session start")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_pxp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
index e2978e48f660..b60ea85c3e11 100644
--- a/drivers/gpu/drm/xe/xe_pxp.c
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -583,6 +583,7 @@ static int pxp_start(struct xe_pxp *pxp, u8 type)
 			drm_err(&pxp->xe->drm, "PXP termination failed before start\n");
 			mutex_lock(&pxp->mutex);
 			pxp->status = XE_PXP_ERROR;
+			complete_all(&pxp->termination);
 
 			goto out_unlock;
 		}
-- 
2.43.0

