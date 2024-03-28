Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5393ACD11DD
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 16:28:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A941124D2;
	Thu, 28 Mar 2024 16:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dfXl7eeb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34101124D5
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 16:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711643303; x=1743179303;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Cq/EfaJxufeibH3AJ9idkraTctN/Oa7l8lz10YX0RUw=;
 b=dfXl7eebAxYIoOKq76P4ITg1vwioTBDZUrzu9RoGmMIHbKvEcPH4+ixZ
 xYTejceVceDYGFlQRNoDi8VNH654NRFrc1CCbHURrDbmfzfuG8VNkPhem
 MjteKUJMb1Cf9HdxxMPQ4ADkPSuiqf1qYsGXhiJzckFv3JXA4uawsZB/x
 ldUn/jZKaXYBxxRndkn4nIxFYCtWNjZnWj0Yb/mkLsbpM0TV2AhnS1RqA
 jYjJYfDTqfJgL+7pVNBVUJ0sghNb2oyS2y8pCBJKfBqcLvbeuvcPGKKkg
 tVw1oGVGWVxU+vdID2PrpHJFTtx+BYq32+NsbjVZLsoTqkcbK6dd6LCgE g==;
X-CSE-ConnectionGUID: HzQfn0uISKa0P0BoJc7bAA==
X-CSE-MsgGUID: qqx38r06QZG7hPmPhl/Aug==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6742957"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="6742957"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 09:28:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="16579257"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.157.82])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 09:28:23 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 1/3] drm/xe: Store pointer to struct xe_gt in gt/ debugfs
 directory
Date: Thu, 28 Mar 2024 17:28:06 +0100
Message-Id: <20240328162808.451-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240328162808.451-1-michal.wajdeczko@intel.com>
References: <20240328162808.451-1-michal.wajdeczko@intel.com>
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

Attributes added under 'gt/' directories may wish to use that
in case they can't obtain it from elsewhere.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
Link: https://lore.kernel.org/r/20240214115756.1525-2-michal.wajdeczko@intel.com
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
v2: improved comment
---
 drivers/gpu/drm/xe/xe_gt_debugfs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 6b4dc2927727..abec616927f0 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -268,6 +268,13 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 		return;
 	}
 
+	/*
+	 * Store the xe_gt pointer as private data of the gt/ directory node
+	 * so other GT specific attributes under that directory may refer to
+	 * it by looking at its parent node private data.
+	 */
+	root->d_inode->i_private = gt;
+
 	/*
 	 * Allocate local copy as we need to pass in the GT to the debugfs
 	 * entry and drm_debugfs_create_files just references the drm_info_list
-- 
2.43.0

