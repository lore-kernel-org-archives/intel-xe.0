Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EDE5E77180
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 01:02:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29BA710ECA1;
	Thu, 12 Dec 2024 01:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n8O2R/y0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF8CD10ECA0
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 01:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733965323; x=1765501323;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VcMU2FpJNEI7/hVtTcuLNy9OiQOL8qWmPtcJteClqP8=;
 b=n8O2R/y0XgciB5rtKnEWRBL5WHKZneduEKUhZDyJgCOSDp6OYnub7wnu
 LwKbkJds8BYkAZXpb5r7F+oqr15ONya6Vrh4CPhcwARALCr6kEMhBNzAN
 AnqBflIrwApEOJxBbzjxDkVWl1ASJCyYUYGMt5jgV/edhCPt+1OiA54oT
 JkWx+qprnoFjfkvCuZasLA3M1gdJX+vvl3q1h0J389vlFZqkPob2hjU9U
 xhIwNIPB0ljRMoLU+rnMKSokgryx1tqYZTKLcCf5uV+WD4Mdmr9M2lb1j
 sHDQyNvwseKOky4XMl40yAb5C4Uj57PbIrNvhZHywwe7LFdsNV8fiOIJQ g==;
X-CSE-ConnectionGUID: HhksCekQRWyXBVrOsaeEwQ==
X-CSE-MsgGUID: 5aV8h4YCT72YQWI+IPftnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45379792"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45379792"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 17:02:03 -0800
X-CSE-ConnectionGUID: 9gFaGUR8QtKf3Ryi+RCsXA==
X-CSE-MsgGUID: 4TLduZdCQEiW39XAml/A/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="126856524"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.80.89])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 17:02:03 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 05/13] drm/xe/sa: Improve error message on init failure
Date: Thu, 12 Dec 2024 02:01:33 +0100
Message-Id: <20241212010141.389-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241212010141.389-1-michal.wajdeczko@intel.com>
References: <20241212010141.389-1-michal.wajdeczko@intel.com>
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

Instead of raw errno value we can print friendly error code and
also print size of the buffer object that we fail to prepare.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_sa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index b990bd8a49fd..94d22371af84 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -50,8 +50,8 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
 					  XE_BO_FLAG_GGTT |
 					  XE_BO_FLAG_GGTT_INVALIDATE);
 	if (IS_ERR(bo)) {
-		drm_err(&xe->drm, "failed to allocate bo for sa manager: %ld\n",
-			PTR_ERR(bo));
+		drm_err(&xe->drm, "Failed to prepare %uKiB BO for SA manager (%pe)\n",
+			size / SZ_1K, bo);
 		return ERR_CAST(bo);
 	}
 	sa_manager->bo = bo;
-- 
2.47.1

