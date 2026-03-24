Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF64BF54ACD
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 15:37:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF8710E71C;
	Tue, 24 Mar 2026 15:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fc83+joC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9395C10E721
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 15:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774366659; x=1805902659;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/E6fNNYxGb1iY7Ex8KoTkoDNh7FxtAb/GZLWegCUrOQ=;
 b=Fc83+joCVR6/eeeJH4MeZoAXK9VcbRly2O72m+CzUFfvXJSkENYF4NZq
 +UJ2Fm48LfmQhW07Ea/n2v0eHqb1O7cuRofnxhNaeLEo5me7NV+cnC3xo
 7DD8uV8CXaKar2aTMz2nvAC5B6kEdnEo9kxZ2g6eS/F/2ZfhJLYSc3uZZ
 l+mtwiG1LPuf4QjuzeYPgYrTKnSnk458DPWCazix/7T2ptrr7llvs2nqV
 RbCb80XCeRzyzpzHi78rKyrEuDxHISN0gPIW3gmls250bYFaHUF7KH2Ad
 augKVJbUCqjIwe7vD+0Vfl0DV6Gx7MGQhmeoFtuvxYT4UF9xoWg4zcYqm A==;
X-CSE-ConnectionGUID: twBAmAraRSCcLa0W9Gz0MA==
X-CSE-MsgGUID: GA/Q0/MKR2+VapX0fXDvpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75102396"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="75102396"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 08:37:39 -0700
X-CSE-ConnectionGUID: qRAGkihaTa6G9BTy5sx4RQ==
X-CSE-MsgGUID: SrGIRTtzTyavLtko3ChV0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="228863586"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 08:37:38 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v2 3/4] drm/xe/pxp: Clear restart flag in pxp_start after
 jumoing back
Date: Tue, 24 Mar 2026 08:37:22 -0700
Message-ID: <20260324153718.3155504-9-daniele.ceraolospurio@intel.com>
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

If we don't clear the flag we'll keep jumping back at the beginning of
the function once we reach the end.

Fixes: ccd3c6820a90 ("drm/xe/pxp: Decouple queue addition from PXP start")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_pxp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
index a054b57f5ae5..aad3dfa3156e 100644
--- a/drivers/gpu/drm/xe/xe_pxp.c
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -512,7 +512,7 @@ static int __exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
 static int pxp_start(struct xe_pxp *pxp, u8 type)
 {
 	int ret = 0;
-	bool restart = false;
+	bool restart;
 
 	if (!xe_pxp_is_enabled(pxp))
 		return -ENODEV;
@@ -541,6 +541,8 @@ static int pxp_start(struct xe_pxp *pxp, u8 type)
 					 msecs_to_jiffies(PXP_ACTIVATION_TIMEOUT_MS)))
 		return -ETIMEDOUT;
 
+	restart = false;
+
 	mutex_lock(&pxp->mutex);
 
 	/* If PXP is not already active, turn it on */
-- 
2.43.0

