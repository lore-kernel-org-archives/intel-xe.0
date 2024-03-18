Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC125C54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 11:28:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E86C10F3A4;
	Mon, 18 Mar 2024 11:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FIcg9Woi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB31910F3A4
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 11:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710761294; x=1742297294;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e81WVQdE8Lnc6O3ZV/kOQLvZYSnVRaMjIOSnXRSrVQs=;
 b=FIcg9WoikfPvDCvdHt6TwxRFTLAzjHUMaa/xUNsCuyRHuKr1m1HAGXxW
 /haurJ6RYsEoIMEp/u9mfXLbbu9nzel0dWIOkaIgJTu+HY5nnB2cVSt2Y
 dFoTzvxbgFKN2fcjYqKXoqp/G+X+AemzGtOKaHhfl18msB0W9WeLnqeJ9
 LjK+n+QSng9voV3zubBaJpi1RiHFdDEMw+4IHXglcnAAS0TEQUgXy/gKw
 c/ZUDyAsw+dmPEDrtPk37Uv+rAKRM0Tq79bI5LU8rwCoFrW/DmBqu9MC1
 rDX1jfpo5M2uvKdwCrNYWGTbbqe/PR8dPdC6J8SPQJJzhFLSytYlQMRq2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="16204667"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="16204667"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 04:28:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="18147603"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orviesa003.jf.intel.com with ESMTP; 18 Mar 2024 04:28:12 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe/gt: Remove continue statement which has no effect
Date: Mon, 18 Mar 2024 17:10:57 +0530
Message-Id: <20240318114057.3831274-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
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

Remove continue statement which does not have real effect
as no actions are to be taken post continue.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_irq.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 2275ca35a3c7..996806353171 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -326,7 +326,6 @@ static void gt_irq_handler(struct xe_tile *tile,
 					xe_heci_gsc_irq_handler(xe, intr_vec);
 				else
 					gt_other_irq_handler(engine_gt, instance, intr_vec);
-				continue;
 			}
 		}
 	}
-- 
2.25.1

