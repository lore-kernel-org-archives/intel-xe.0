Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42BFAC77B73
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 07:45:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F72A10E050;
	Wed, 19 Apr 2023 07:45:23 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3AE10E8D9
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 07:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681890297; x=1713426297;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nFoF65GOYo+1gBrwa2B/LtC82q9EEVTd5bdQUo4xEi8=;
 b=agIV+/XirXoGlfvYhasZuqMUDYbHE5eY9Hxux0ltelOVvh1D2eRb1DM0
 1T+qV9Y0TEj1R46rxT1ci0ZDCFQoWHHwtiM/SZ7nyrvaPExZsE1JA9Ga9
 4q4bg+D7xy28vGr5zEp7bkCQayIqq6CJNfDYTyPw203KMlt0AaoBbXJJo
 /yzdHCJEw0+DdbECYZ9e7Rl9c9g0FPy3a+6sNfcsZbGJKDgTTDVcVSkNB
 ryWJmqEvfOKMISU1UTr/K9E9UiAf8c+nUy5+coszT+yTW4/LcZ7rCBx8w
 3IDR5/UsiXg2aVWYVtX2LAIDKU1gvecpXLsxQx7jyezzQR0b88Br6LZIQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="334186111"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="334186111"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 00:44:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="693951870"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="693951870"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 00:44:56 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 19 Apr 2023 00:44:26 -0700
Message-Id: <20230419074440.4006398-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230419074440.4006398-1-lucas.demarchi@intel.com>
References: <20230419074440.4006398-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 03/17] fixup! drm/i915/display: Allow fbdev to
 allocate stolen memory
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 46447dd58f3f..2d2388cbc626 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -349,7 +349,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 		else
 			info->fix.smem_start =
 				pci_resource_start(pdev, 2) +
-				xe_bo_addr(obj, 0, GEN8_PAGE_SIZE, &lmem);
+				xe_bo_addr(obj, 0, XE_PAGE_SIZE, &lmem);
 
 		info->fix.smem_len = obj->ttm.base.size;
 	} else {
-- 
2.39.0

