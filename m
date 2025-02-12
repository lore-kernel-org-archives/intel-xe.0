Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7228C021A4
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 19:36:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803A410E97A;
	Wed, 12 Feb 2025 19:36:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PaNcY6z3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E1F10E974
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 19:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739388996; x=1770924996;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T23PYdrHWZtWl2DZtSCaAHWRV15JcJ189XfmHaKKluk=;
 b=PaNcY6z3IbrpKU/KoV1vUVSKktU0xufQdi05aijq738sXe3BX88dkodv
 my5ZMz7IyiXYpKkG1Konq2DQ4sjGdsIJTKbwV69r2THlursaoC27ULDu+
 x9kMgaIZ7TewL9zaIqlDWruaHgefpjrA3NukrprVh9AV5xTxWtujEIX3W
 EaNM6+6KLIi7+fM65cv3Ui5F/1O/s8S7xdet/62v7P6V9OFFbcK7vRALX
 68G2bPNEo3HG0sk04btMDBIkr7rzhXa4tgAAQEBSOemyT3n4pd4di+x1U
 v2hszncIaI1J8LU8RGimqVehCJz9vEc8mEvqYw/7zBkYL6Zqct4hout9F A==;
X-CSE-ConnectionGUID: CF7AHD1EQm+NVvkkfncRdw==
X-CSE-MsgGUID: X8OxTj2JQFm4tgEuvxMMdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40184250"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40184250"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 11:36:36 -0800
X-CSE-ConnectionGUID: dzgeNhFnRNW6JcDDMSliOA==
X-CSE-MsgGUID: lBg3wJ1NSvqcpPxM5q20dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="113437883"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 11:36:35 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH v4 10/13] drm/xe: Move drm_dev_unplug() out of display function
Date: Wed, 12 Feb 2025 11:35:57 -0800
Message-ID: <20250212193600.475089-11-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212193600.475089-1-lucas.demarchi@intel.com>
References: <20250212193600.475089-1-lucas.demarchi@intel.com>
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

This is not really display-related and needed for any sequence on driver
removal that has to interact with drm_dev_enter()/drm_dev_exit().
Just remove xe_device_remove_display() and inline it in the single
caller to make clear this is not done only for display.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1a3563dbfe36b..2e1b7be7f60ab 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -974,20 +974,16 @@ int xe_device_add_action_or_reset(struct xe_device *xe,
 	return 0;
 }
 
-static void xe_device_remove_display(struct xe_device *xe)
+void xe_device_remove(struct xe_device *xe)
 {
 	xe_display_unregister(xe);
 
 	drm_dev_unplug(&xe->drm);
+
 	xe_display_driver_remove(xe);
-}
 
-void xe_device_remove(struct xe_device *xe)
-{
 	xe_oa_unregister(xe);
 
-	xe_device_remove_display(xe);
-
 	xe_heci_gsc_fini(xe);
 
 	xe_device_call_remove_actions(xe);
-- 
2.48.1

