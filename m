Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD1B606A325
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 21:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IKZBoGYo
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B26AB11201C;
	Wed, 18 Nov 2026 21:32:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F2811201C
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 21:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795037566; x=1826573566;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9klYbx6cEiHJk+fG6bYvchESBBSloHqX9APlFWpymIs=;
 b=IKZBoGYo54gPiA3KeiotMYZT+Ibw4S98NKvhO6SzacQZU6vM83kYhdY2
 jBXkCCaFnVrR2ytHMg8iIKuGYyjLnUKjR/+MudPOsyXBD1bXY4Yi1wsKV
 1qfOQ4xzvQv7ln1n/Vl1PxdDa1W01i5rHRf1Vzh4qwFytmFRw7Bs/Ey1D
 6SrQSa2jzrC1c535s33hwGqGOUxzdvEGSMVmeIvqqlyPRKNli/4Y9Fust
 PkdEDaieKl941sxB09apjjT4WiymA2vL+MRWa4TWC7EhT2gRaqt4L0cp/
 1qyBSvXzquewQMjehNmm8cWjJo93pMZpsIVUlTpLxKhw+0mo32dfwDlyh g==;
X-CSE-ConnectionGUID: L8Ghgcl4RZq97b1TTzSxNQ==
X-CSE-MsgGUID: CVfY/L36St6E6HYASG+KZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3762399"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3762399"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 13:32:46 -0800
X-CSE-ConnectionGUID: fy2IQx6aTv6e7twEplbWCg==
X-CSE-MsgGUID: Vly5MXUGTyeA2CYu7nN53Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10494911"
Received: from dceraolo-desk1.fm.intel.com (HELO dceraolo-desk1)
 ([10.121.64.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 13:32:46 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v2 2/2] drm/xe/pxp: Enable PXP for NVL-P
Date: Wed, 18 Nov 2026 21:32:36 +0000
Message-ID: <20261118213234.59171-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118213234.59171-3-daniele.ceraolospurio@intel.com>
References: <20261118213234.59171-3-daniele.ceraolospurio@intel.com>
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
Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
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

