Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B546EE499D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 12:50:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C954910E18E;
	Wed, 11 Sep 2024 12:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sk8b4CFp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE5E10E18E
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 12:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726059051; x=1757595051;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GCBMqDxmAkaFr9QQiTvDpJzRRwdU0caj9OugHNBKcTE=;
 b=Sk8b4CFp7jCd3iZL3LcE8FDSfDRD/8HgZhNfLK8LVnBat8WCOfnx3WP2
 mKqemKytf7Yk9lDqDBys6s6WeO8eSSJGTtHoi5Q8Q/D3b2z47oqylKGFQ
 OQamXCGJpsS5RVrbr27gqNIXjtQI3eeo33FL+yKIBtnZD7RUigHq0ADPf
 KN0hfOShozNT8m6uZNZsXsZvdewxgCMC1WS3dTk3KLsY4Z+Nw1lF1pbHb
 ElmM1froG6yHzvZ5ui100K242EJ9U/VPWX9opT1CER+1QqJaOqhCb+wpG
 8gJk0Em+2u3QVYjylDo5isSc8gfa1xQP9sHwPNedWdtPsECP7A6nItESQ g==;
X-CSE-ConnectionGUID: pqVfqlMvQgC7iiLxLFPKwQ==
X-CSE-MsgGUID: 14GhCazdSQyiHJFz7t1SUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24990943"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="24990943"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 05:50:51 -0700
X-CSE-ConnectionGUID: xJTyzeDDQzG0M3T4onxoqA==
X-CSE-MsgGUID: 2LsPJCJvQgC4XsGu9HqlAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="72135096"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by orviesa003.jf.intel.com with ESMTP; 11 Sep 2024 05:50:47 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, rodrigo.vivi@intel.com, imre.deak@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH] drm/xe/display: Remove dp_mst_suspend/resume from d3cold
Date: Wed, 11 Sep 2024 18:18:21 +0530
Message-ID: <20240911124821.685459-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.43.2
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

Remove intel_dp_mst_suspend/resume functions from d3cold_suspend/
resume. It is incorrect as it depends on AUX transfers which itself
depend on the device being runtime resumed. This is also why we see
a lock_dep splat here.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 61c8eb10a1b3..76c1365489bc 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -312,8 +312,6 @@ static void xe_display_to_d3cold(struct xe_device *xe)
 	 */
 	intel_power_domains_disable(xe);
 
-	intel_dp_mst_suspend(xe);
-
 	intel_hpd_cancel_work(xe);
 
 	intel_opregion_suspend(display, PCI_D3cold);
@@ -333,9 +331,6 @@ static void xe_display_from_d3cold(struct xe_device *xe)
 
 	intel_hpd_init(xe);
 
-	/* MST sideband requires HPD interrupts enabled */
-	intel_dp_mst_resume(xe);
-
 	intel_power_domains_enable(xe);
 }
 
-- 
2.43.2

