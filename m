Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F2BC3ABB2
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 08:23:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BBC210E7EA;
	Fri, 30 May 2025 08:23:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xg1Bxzn4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A77410E14C
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 08:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748593387; x=1780129387;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LLj6NZC5EBf7ULN67j24lLfIj2Lu6tRz8GpBkp3kJ+s=;
 b=Xg1Bxzn4s6tsyzHk2gwlH33wz57tOWTUfhSDnGePzIEu7t0wrGTJ1LrU
 +m+WFfn26znYSiYqcV4Y/fEplxJTnzPdXrSH/cr/wIrFi+6meZ4Acyd2L
 JreRQbVbfdKT4tNloQerhy1H7vz2BcYRMj9rOPcCOsbb4LndSMOLNFXfU
 3zlyJ/sWq5+IP5jH2Ed+RiyO9uPj/DE0ba7WdfkO+LJBnAJqI7a0fFM1A
 UmuaIe+1XEI4pt18DBmekw3H8lRBjH0fPDlWKc5HJg1WYGjnBdaA4SbcB
 MQBy4LfqXqTE8Mi1miHBptCwltc+mdUCiq5rq1VuU3WyPXOKMfCKiALz4 Q==;
X-CSE-ConnectionGUID: Rtmhy2hbQgKz6PPKE0RhGg==
X-CSE-MsgGUID: mXNYXe6DT8K9D/B6fwgSZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50825041"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="50825041"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 01:23:07 -0700
X-CSE-ConnectionGUID: QBgBw5XdSBqeSkI1JVt30A==
X-CSE-MsgGUID: RtRZc8PmSSOWP/HJ87lumQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="143772864"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa010.jf.intel.com with ESMTP; 30 May 2025 01:23:06 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 3/3] drm/xe/bmg: Update Wa_16023588340
Date: Fri, 30 May 2025 01:20:47 -0700
Message-Id: <20250530082047.742183-4-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250530082047.742183-1-vinay.belgaumkar@intel.com>
References: <20250530082047.742183-1-vinay.belgaumkar@intel.com>
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

This allows for additional L2 caching modes.

Fixes: 01570b446939 ("drm/xe/bmg: implement Wa_16023588340")

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 0e5d243c9451..6c4cb9576fb6 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -118,7 +118,7 @@ static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
 		xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
 	}
 
-	xe_gt_mcr_multicast_write(gt, XEHPC_L3CLOS_MASK(3), 0x3);
+	xe_gt_mcr_multicast_write(gt, XEHPC_L3CLOS_MASK(3), 0xF);
 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
 }
 
-- 
2.38.1

