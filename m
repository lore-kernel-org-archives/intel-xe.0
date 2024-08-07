Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4D5C3DA7F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 23:53:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B787310E60B;
	Wed,  7 Aug 2024 23:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fV70GiQ+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34BE910E60B
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 23:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723074821; x=1754610821;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JtDfVkuEO7C86X/w/b8FM1EQbd8r6zOC8tizqNk8F+I=;
 b=fV70GiQ+/nKRDkf4E5BAHsnP7D6FdjFXRKZVG14OJh24qFaghvMHGgNa
 LXN/nEdUdbYe++t42nrtAG3V2Dcuk2sWxozGesxrJe107WmxHYKZbz9Hp
 Ul4jAtue2rbBrpDjQbHYyuIALg+WwJ8CYV1ysc3PHZt1lYbDrLBVtR7eY
 H2+cQHS6563/feBhR1x/kozC3ibxv10xF3bozdn67nueEzC22Ux07HQ0w
 eyh/Bwx1/EJFSNV2oPaR6oGnthLhgrLz/gXr/XNWohFn/oowrvhQ7AED/
 2vEjXCr+GWMlRQ1TlbrpvnDBn+6skk6rvwICbgc1J/M1LXQgGV+VMApCW w==;
X-CSE-ConnectionGUID: 2dnKcSsZSJyj6qTUcpUo8w==
X-CSE-MsgGUID: wfCZpw2uRxGPwk8Jw2V/yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="31847587"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="31847587"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 16:53:41 -0700
X-CSE-ConnectionGUID: HrZSWpW/SfO2kagkQ+/yzA==
X-CSE-MsgGUID: 4GUacyB0Rg+DUovGlEChVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="56705742"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 16:53:41 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 1/2] drm/xe: fix WA 14018094691
Date: Wed,  7 Aug 2024 16:53:32 -0700
Message-ID: <20240807235333.1370915-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

This WA is applied while initializing the media GT, but it a primary
GT WA (because it modifies a register on the primary GT), so the XE_WA
macro is returning false even when the WA should be applied.
Fix this by using the primary GT in the macro.

Note that this WA only applies to PXP and we don't yet support that in
Xe, so there are no negative effects to this bug, which is why we didn't
see any errors in testing.

v2: use the primary GT in the macro instead of marking the WA as
platform-wide (Lucas, Matt).

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index f8239a13fa2b..77ce44e845c5 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -260,7 +260,7 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
 	struct xe_tile *tile = gt_to_tile(gt);
 	int ret;
 
-	if (XE_WA(gt, 14018094691)) {
+	if (XE_WA(tile->primary_gt, 14018094691)) {
 		ret = xe_force_wake_get(gt_to_fw(tile->primary_gt), XE_FORCEWAKE_ALL);
 
 		/*
@@ -278,7 +278,7 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
 
 	ret = gsc_upload(gsc);
 
-	if (XE_WA(gt, 14018094691))
+	if (XE_WA(tile->primary_gt, 14018094691))
 		xe_force_wake_put(gt_to_fw(tile->primary_gt), XE_FORCEWAKE_ALL);
 
 	if (ret)
-- 
2.43.0

