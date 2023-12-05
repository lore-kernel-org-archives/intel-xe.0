Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0255BC10DCE
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 21:34:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45FC10E63C;
	Tue,  5 Dec 2023 21:34:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C0B10E63C
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 21:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701812046; x=1733348046;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=99YL6yI48dFvgph7lskp+NTZx5Po1QDLiCr5WAtBAB0=;
 b=eb59K22AlNQ8qZMVawvrVMgK9gyQ1iAni9WzBe2dj7DrdiTguqe8rkJZ
 55+pxguG/WxSDzUwlEMa4qylkncWSrR8OQuPTa3Ij5rKgr/sv2XrfWVYD
 1sgbBUrDRKsQa7jnug9re9VLQB9WFkHcMtWdrGfIUTlFoYMWAhi36OwAw
 ZJ3d+2odGMLvSNOU78PaoJ8QYzitcLUzpM1oo8YiPTS9i26KmNEJh6pN3
 gtuGvHP0U9hNB/PHlAQ8GhhBvNKBjklVIlpEe69wSlF/zrB0FqhXFqsEY
 LeGrx6LNp1IfVloSxC4FzgOLt3vNK4GswwjzAruT+w0hr47soddsJESzB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="378983027"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="378983027"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 13:34:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="889079481"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="889079481"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2023 13:34:05 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Dec 2023 03:11:35 +0530
Message-Id: <20231205214135.958847-10-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231205214135.958847-1-himal.prasad.ghimiray@intel.com>
References: <20231205214135.958847-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 9/9] drm/xe/xe2: Support flat ccs
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

Enable flat ccs for XE2_GFX_FEATURES.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 076e9dc85838..4a56c2f7a6ac 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -163,7 +163,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
 #define XE2_GFX_FEATURES \
 	.dma_mask_size = 46, \
 	.has_asid = 1, \
-	.has_flat_ccs = 0 /* FIXME: implementation missing */, \
+	.has_flat_ccs = 1, \
 	.has_range_tlb_invalidation = 1, \
 	.supports_usm = 0 /* FIXME: implementation missing */, \
 	.va_bits = 48, \
-- 
2.25.1

