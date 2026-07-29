Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B5BC54FCD
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 23:06:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB58E10E0BF;
	Wed, 29 Jul 2026 23:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EmWJv5Du";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B813010E0BF
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jul 2026 23:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785366414; x=1816902414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4JsHh3jTeWCiyvcGdoquX424RU83TFBgod0qHVziBso=;
 b=EmWJv5DuWmPeATipHABcLmbesqEeaw+SfZpslVqU5TrsK2JFJbcaTYqQ
 byItWpwmW7/tdvFPmH5rdBBA6eLowmrYH/7FHG/AwFuix09TQDOVcoYBU
 r/txo5BwoNs8h5m6XjQcASPd069zNKFvhAtJx6oSqBr6FNhI2rvHfDYFG
 epbavIVVCfmc4jyZ4DKiQx9VGufK7B2EtjksAsE/zaPqDeNgvf9cOiCz2
 M2jk7CBEGI34VNflFwTAtMdXYTUtuqSx/xJnfuJ6cnUmxErGLZSlEBFOm
 96n+wUhIRxS7OxPz3GGYptkkZjcnlNM1uIw1xPZ+/MO8Ny98XcusmFRmL w==;
X-CSE-ConnectionGUID: D7w8FWjzTruvQqM6EW70Zw==
X-CSE-MsgGUID: asCvv7jESYm04yWXA6+gEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96568379"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="96568379"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 16:06:54 -0700
X-CSE-ConnectionGUID: 9UNYfPeWSB+igOpKtGMifg==
X-CSE-MsgGUID: RZQDs2H3S4KpidD81yS65A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; d="scan'208";a="255824513"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 16:06:54 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v4 1/2] drm/xe/mcr: Take vcs1/vecs1 into account for first
 media slice
Date: Wed, 29 Jul 2026 16:06:44 -0700
Message-ID: <20260729230645.3052178-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260729230645.3052178-1-ashutosh.dixit@intel.com>
References: <20260729230645.3052178-1-ashutosh.dixit@intel.com>
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

vcs1 and vecs1 may also be present on the first media slice, so take
vcs1/vecs1 also into account when determining if the first media slice is
absent.

Bspec: 67103, 77977

Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
v2: Bug fix
v3: Fix for BMG (Matt Roper)
v4: Add TODO (Matt Roper)
---
 drivers/gpu/drm/xe/xe_gt_mcr.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index a97b236dab7c9..1949bf7d370ac 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -443,11 +443,16 @@ static void init_steering_dss(struct xe_gt *gt)
 
 static void init_steering_oaddrm(struct xe_gt *gt)
 {
+	u64 hwe_mask = XE_HW_ENGINE_VCS0 | XE_HW_ENGINE_VECS0;
+
+	/* TODO: Add 'VD per SCMI' and 'VE per SCMI' values into 'struct xe_media_desc' */
+	if (MEDIA_VERx100(gt_to_xe(gt)) >= 3500)
+		hwe_mask |= XE_HW_ENGINE_VCS1 | XE_HW_ENGINE_VECS1;
 	/*
 	 * First instance is only terminated if the entire first media slice
-	 * is absent (i.e., no VCS0 or VECS0).
+	 * is absent (i.e., no engines in hwe_mask).
 	 */
-	if (gt->info.engine_mask & (XE_HW_ENGINE_VCS0 | XE_HW_ENGINE_VECS0))
+	if (gt->info.engine_mask & hwe_mask)
 		gt->steering[OADDRM].group_target = 0;
 	else
 		gt->steering[OADDRM].group_target = 1;
-- 
2.54.0

