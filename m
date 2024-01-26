Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1776C47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 22:06:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D4F510FEFC;
	Fri, 26 Jan 2024 22:06:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2437810FEFC
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 22:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706306795; x=1737842795;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UJ8QoYHOt0CAqrucS3GbJLuTRRC73IzT5sfvPWv9HjE=;
 b=ae0Oxjpw4GaeQObNtFeeLUZ0RAS9J9j03Vs+ltIsdiZymgPto6r+po42
 KmLa1FsaXJzkCw4YCrN7KpLSRMARt6gm/XizKbBxw7Lb0htnhMhx4hx+n
 KhKSYHEr+J30ZQPUKpn6j340i9d1LBgDbX4tJJGCAmtzh8bMc0X5v7Wxs
 PvvI6DAM4HWRdyFudSnYUw3IRDksxeNKuIOvwCnxeEBUJJ8q4Uo5p1Ou0
 y45uUgjuh7XB6GV5Hk7E4jmgktLGD3D0PrBFIqgl+UoFUpETYWx1bGGlm
 rHMGfXFmDWWOlis6wHeGhxYYK5GgCLuiAEjbPG0THBlr0avRhOziCDohn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="16114810"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="16114810"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 14:06:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2799726"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.132])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 14:06:27 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Grab mem_access when disabling C6 on skip_guc_pc
 platforms
Date: Fri, 26 Jan 2024 14:06:14 -0800
Message-ID: <20240126220613.865939-2-matthew.d.roper@intel.com>
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
Cc: matthew.d.roper@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

If skip_guc_pc is set for a platform, C6 is disabled directly without
acquiring a mem_access reference, triggering an assertion inside
xe_gt_idle_disable_c6.

Fixes: 975e4a3795d4 ("drm/xe: Manually setup C6 when skip_guc_pc is set")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
Rodrigo has a pending series to kill off mem_access in general, but
that's a large, complicated series that will probably take some time to
land.  This quick fix is still useful in the meantime.

 drivers/gpu/drm/xe/xe_guc_pc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index f71085228cb3..d91702592520 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -963,7 +963,9 @@ void xe_guc_pc_fini(struct xe_guc_pc *pc)
 	struct xe_device *xe = pc_to_xe(pc);
 
 	if (xe->info.skip_guc_pc) {
+		xe_device_mem_access_get(xe);
 		xe_gt_idle_disable_c6(pc_to_gt(pc));
+		xe_device_mem_access_put(xe);
 		return;
 	}
 
-- 
2.43.0

