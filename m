Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EF1E9A02C
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 00:26:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B2F10E333;
	Thu, 19 Feb 2026 00:26:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LrIsnB/I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B8310E156
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 00:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771460801; x=1802996801;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yZIG45oVBsR6L1DWsV6nG3KQ0cCvl3UWPNvK9mzHE8Q=;
 b=LrIsnB/IItEKCP+MA+0jGJY1rjI0C0XIFs4RZFvy1TI/EJU2VCopM+aG
 vowD2NqcGpyeRbHstR5QeSIiS4snkUMd4IJ5XvVnM/mjmlJtCW9LEMvNX
 H8ugQlTQlxBKZaqED/MAwgHXsamnECASPAyOx4ptmxiA9O8nGRZZlJspA
 CrP9ebuv1ik6mDfgb0qHVIVfCbEeoJ+pglVEAXHsZv+g2JqNM9xVQtl16
 dhPqMt+68dNPs/YkpJFLdlOQ47Ywy5sdHvH7x87OfMlFMQzO1jKffsxss
 TRh5OvwtEv+GU7QzUvLemvQbZyWIO/RlPTlcj2Hs8ucdVIytgf6xdURuJ A==;
X-CSE-ConnectionGUID: 3cQiw9eVRseQTQdDbus9CA==
X-CSE-MsgGUID: Bu/K2+oNQtqXcrBG8zxWDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72449403"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72449403"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 16:26:41 -0800
X-CSE-ConnectionGUID: 3a7V6o7zQ5eRxk5OC22Rqg==
X-CSE-MsgGUID: 6pFmQ55sSamIP43eBDx+Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="218499623"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 16:26:42 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 1/3] drm/xe/pxp: Clean up termination status on failure
Date: Wed, 18 Feb 2026 16:26:29 -0800
Message-ID: <20260219002627.1208210-6-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219002627.1208210-5-daniele.ceraolospurio@intel.com>
References: <20260219002627.1208210-5-daniele.ceraolospurio@intel.com>
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
code won't be called, so the termination will remain incomplete. To avoid
unnecessary waits, mark the termination as completed from the error path.
Note that we already do this if the termination fails when handling a
termination irq from the HW.

Fixes: f8caa80154c4 ("drm/xe/pxp: Add PXP queue tracking and session start")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_pxp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
index d61446bf9c19..782281dbe9e0 100644
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

