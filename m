Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B466BC25B7A
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 10:22:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E0910F492;
	Wed, 22 May 2024 10:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NkfysRoH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B86210EBFE
 for <intel-xe@lists.freedesktop.org>; Wed, 22 May 2024 10:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716373334; x=1747909334;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=B+J4/P7Rn4wgKHayIY577pl5IoZNbAsvbKokQY+IjFY=;
 b=NkfysRoHmz59KuY9uwvLuz9xULYj0XtRQkhP90TPICKnqL0/4ddifoGF
 DXBOFRkg36OpdkN/l408Dk/67JHf+5r2QcDjZCar+mJXOA+qug0lY3DHg
 pppG652g7rp/33NUTt/M5Kmml3u8+UYnziC2JLpoXojVuJwfDm5A52MJv
 SNXMB1SENSPejPBP/413OC1mmuPYfypAt8hJTq1zaf19GktEdiPUlgTt+
 IVWvf66GSAHP2s84Yv1DGJggNtCz+WBPRyqITGlV0vcXwDtcxFyIKoNTm
 eHahPr/nbdx8QfxvXi847b9zQuSsDuKtdpUK35IA06Xvu0Xb0MpKCSICO w==;
X-CSE-ConnectionGUID: Zc7sUC8ORTeJ7b+pxGMRvA==
X-CSE-MsgGUID: dZTOTmeoThy+t6J2IiBblg==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="15562697"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="15562697"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:22:14 -0700
X-CSE-ConnectionGUID: b594WF5MRh601MtJhAwang==
X-CSE-MsgGUID: ZlsFXdLhSF+adXUzCVpTZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="38195302"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.245.124])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:22:14 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v3 11/18] drm/xe/coredump: move over to devm
Date: Wed, 22 May 2024 11:21:54 +0100
Message-ID: <20240522102143.128069-29-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240522102143.128069-19-matthew.auld@intel.com>
References: <20240522102143.128069-19-matthew.auld@intel.com>
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

Here we are using drmm to ensure we release the coredump when unloading
the module, however the coredump is very much tied to the struct device
underneath. We can see this when we hotunplug the device, for which we
have already got a coredump attached. In such a case the coredump still
remains and adding another is not possible. However we still register
the release action via xe_driver_devcoredump_fini(), so in effect two or
more releases for one dump.  The other consideration is that the
coredump state is embedded in the xe_driver instance, so technically
once the drmm release action fires we might free the coredumpe state
from a different driver instance, assuming we have two release actions
and they can race. Rather use devm here to remove the coredump when the
device is released.

References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1679
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 3d7980232be1..e70aef797193 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -238,13 +238,15 @@ void xe_devcoredump(struct xe_sched_job *job)
 		      xe_devcoredump_read, xe_devcoredump_free);
 }
 
-static void xe_driver_devcoredump_fini(struct drm_device *drm, void *arg)
+static void xe_driver_devcoredump_fini(void *arg)
 {
+	struct drm_device *drm = arg;
+
 	dev_coredump_put(drm->dev);
 }
 
 int xe_devcoredump_init(struct xe_device *xe)
 {
-	return drmm_add_action_or_reset(&xe->drm, xe_driver_devcoredump_fini, xe);
+	return devm_add_action_or_reset(xe->drm.dev, xe_driver_devcoredump_fini, &xe->drm);
 }
 #endif
-- 
2.45.1

