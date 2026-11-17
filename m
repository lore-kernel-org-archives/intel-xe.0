Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65335606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 00:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZfK4FEZY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257A610EAC8;
	Tue, 17 Nov 2026 00:25:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 584B610EAC8
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Nov 2026 00:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794875144; x=1826411144;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7YW67bx9B76GzWzujdrJ+gi3lo3kZDhstKNiM2OZi3Y=;
 b=ZfK4FEZYad/SBDuZvkRwvpOK4Dfsnw+pAmkAOBlQBm/Pd+g8+l1x8cGG
 1/h5bHqgSmKZ9P9cyAcfVWNNbZ91m98sF72/ziLjFYWXe26Pji/+t/GtK
 1pav31w3Kwt4yQ7/E0TUEZQHw0usMCiOSTEU62GZ39MHWjtK0Tv9KJlsc
 CUJng1sPD5KErzzexk3TaVkxW8RxJN7x+i9AF9YA6ALyGgSVyJaeJwVo3
 Qx4vKQgqq+2qIOYAmhSx07ILz8lpwOKA2TfiFgIvfDfHWkZaR5BS1jA3r
 9+trlnGx2YMWSwor5DaewJvjBia1C1jz+v/TbeYZFZEWkhapK4imbb27K Q==;
X-CSE-ConnectionGUID: 9vG4dJbAQfS0Dhg4kGsp4w==
X-CSE-MsgGUID: ZqKmkFcZRT2ZSGtYfcUx6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3627825"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3627825"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 16:25:44 -0800
X-CSE-ConnectionGUID: O5RlXozYRX6CmPN/Qx1/pw==
X-CSE-MsgGUID: 9KUEIFrvSSuOa2lsEup6PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9755679"
Received: from dceraolo-desk1.fm.intel.com (HELO dceraolo-desk1)
 ([10.121.64.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 16:25:44 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 2/2] drm/xe/pxp: Enable PXP for NVL-P
Date: Tue, 17 Nov 2026 00:25:31 +0000
Message-ID: <20261117002529.1925156-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117002529.1925156-3-daniele.ceraolospurio@intel.com>
References: <20261117002529.1925156-3-daniele.ceraolospurio@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Now that GSC is in place, we can enable PXP for NVL-P. No changes
required compared to previous platforms.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 619653c68f2c..44ca50964bed 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -506,6 +506,7 @@ static const struct xe_device_desc nvlp_desc = {
 	.has_flat_ccs = 1,
 	.has_page_reclaim_hw_assist = true,
 	.has_pre_prod_wa = true,
+	.has_pxp = true,
 	.has_sriov = true,
 	.max_gt_per_tile = 2,
 	MULTI_LRC_MASK,
-- 
2.53.0

