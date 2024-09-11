Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8B1EE57D0
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 20:02:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D73810E9E9;
	Wed, 11 Sep 2024 20:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k2BOxV9X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0657610E9C4
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 20:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726084948; x=1757620948;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Wo4eqtQ+CYGXEWrWWhFJZ0hd4Rb1wGnsJV92A3h094c=;
 b=k2BOxV9XOGUTFYxkdy3E8sUiJq9UM8EKhZ2nMrEO0dn6vQnCDB5foN4a
 +0O1RrgaCnSCIPIRhcUNODL1DymsbH7jrw/+T+tPQ+MEmuEEISkRSMljQ
 1QFzqCcMAtEaMQpjB7jTPnUSwf1r6JVMmzsH9lnVC1tZKlRdYAZ79OcXj
 1oL0hiej4UyzRL8czi2hrCYFZS4dmuGiyoiNUgP74xoAh37TD/CJurqiu
 S0mp+MjCXGRubiyyOEjYNs1j4Csmu2BWuV5/nwSvp0iR89Z6dph8bJhHi
 mp6mfNHnHt8SJNqBHTsShj3JIvceiMf8fdKLV5HMFtshFfKB2JCQm2I1D w==;
X-CSE-ConnectionGUID: CRbEgbP4SFWZtvEgwb3Wkg==
X-CSE-MsgGUID: 4o+YzyyOTtmqvUQkCXAj6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25066810"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="25066810"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 13:02:27 -0700
X-CSE-ConnectionGUID: 4dUPWCZmQy2FuICKnVK3aw==
X-CSE-MsgGUID: x6HFDfHjQmijEWu40qMnPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="98177326"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 13:02:27 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH 1/3] drm/xe: Fix build by setting the correct parameter to
 intel_dmc_suspend()
Date: Wed, 11 Sep 2024 13:02:16 -0700
Message-ID: <20240911200218.130219-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

intel_dmc_suspend() was a intel_display no a xe_device.

Fixes: 501d799a47e2 ("drm/xe: Wire up device shutdown handler")
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 3551a9c8eb755..e65e7d70f9890 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -377,7 +377,7 @@ void xe_display_pm_shutdown(struct xe_device *xe)
 
 	intel_opregion_suspend(display, PCI_D3cold);
 
-	intel_dmc_suspend(xe);
+	intel_dmc_suspend(display);
 }
 
 void xe_display_pm_runtime_suspend(struct xe_device *xe)
-- 
2.46.0

