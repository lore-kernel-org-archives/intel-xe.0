Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40947E6FE4D
	for <intel-xe@archiver.kernel.org>; Sat,  7 Sep 2024 00:08:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BDE10EB4E;
	Sat,  7 Sep 2024 00:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B4hREjVh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F23810EB2E
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Sep 2024 00:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725667678; x=1757203678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pqvMAH6lFWcUdrmnm+U7m3xxvi1/0715IM6t5OAGnK4=;
 b=B4hREjVhUjPPZ7Rq4U2WTUiFxqN6wjuctdI5zJg1fbO26VfUq+V5/Yo5
 bDz/vCTF2OerxiayPAjR91QrhDllzBT6CeFlTOcS7nQ0LU1P7smWnpb+8
 SdJrkN1IpL/1vyWIDLxF93r7VsaThT2LJXCfbKxu7Ch0zWycNMOjqQ94x
 K9tIxtB3jHGWnDFNl6SARfIFBK0paH16/7jbv93YwCuxJyfQN5ouhLE6/
 EPMnACedCtJm9esEhR3lZqloPBcrrJMmkVVG7RisYa4p/Cs/YWwUjqYZD
 xurhef5/ik4Q5HylZmuFElYfX9iSXrzVnwrYdpryBBrY3LhljPQXh7Za/ w==;
X-CSE-ConnectionGUID: d5dLYCeLQ+mcpypwZ8g5Dg==
X-CSE-MsgGUID: SBT02Gk4RImG8agCDpLFjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49855309"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="49855309"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
X-CSE-ConnectionGUID: uf9+c4W0RO2//sQcKyMrKQ==
X-CSE-MsgGUID: v1FRmn2JRqOI40wFnwKlmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; d="scan'208";a="65792672"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 17:07:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH v2 19/43] drm/xe/wa: Convert register access to use xe_mmio
Date: Fri,  6 Sep 2024 17:08:08 -0700
Message-ID: <20240907000748.2614020-64-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240907000748.2614020-45-matthew.d.roper@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
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

Stop using GT pointers for register access.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 28b7f95b6c2f..d8a5a85e9ebd 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -883,11 +883,11 @@ void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p)
  */
 void xe_wa_apply_tile_workarounds(struct xe_tile *tile)
 {
-	struct xe_gt *mmio = tile->primary_gt;
+	struct xe_mmio *mmio = &tile->mmio;
 
 	if (IS_SRIOV_VF(tile->xe))
 		return;
 
-	if (XE_WA(mmio, 22010954014))
+	if (XE_WA(tile->primary_gt, 22010954014))
 		xe_mmio_rmw32(mmio, XEHP_CLOCK_GATE_DIS, 0, SGSI_SIDECLK_DIS);
 }
-- 
2.45.2

