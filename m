Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF20BC0015E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 16:10:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8015B10E4A1;
	Wed, 26 Jul 2023 16:10:14 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3EB310E49D
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 16:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690387798; x=1721923798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FnFBBWg3ayhau2PbvbKnBuXIl6bw5OTb6POdmhGajaE=;
 b=FGIFFa3sQ8RNDHR7n2y8yZyd0SFEt0Mwx7gef1ugShLjFQBL/hldy1dm
 edoIknGAPdmNBKCUXYi/kk3TdQKavwMqSGnGwwiABhbm3ChbZ3Ztv8MkD
 +B8aga5fslnTvq32qwm7Fc06X7I58ZYN0bINX+ilj/QWYKCDI8KMC1uG5
 Usp7CI2CkId0E6pJg8C32gUYo2Z6Sc5nSOuJGFJYzblA31BaE0FfQ1pZZ
 Aaz0UZp+wspJ9f4ZzJPeYiYVHY7viBsiXV8BP8cxBQaucnSdmeFV+XyLI
 mqI5JEOjqlf4a6d/k+qdIqu3mlRSBwmP053sOkU+yHoywZxFA5716LrWd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="398994894"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="398994894"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 09:07:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="1057279359"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="1057279359"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 09:07:19 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jul 2023 09:07:01 -0700
Message-Id: <20230726160708.3967790-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230726160708.3967790-1-lucas.demarchi@intel.com>
References: <20230726160708.3967790-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 03/10] drm/xe: Fix checking for unset value
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Commit 0f885eced0a8 ("drm/xe: NULL binding implementation") introduced
the NULL binding implementation, but left a case in which the out value
is_vram is not set and the caller will use whatever was on stack.
Eventually the is_vram out could be removed, but this should at least
fix the current bug.

Fixes: 0f885eced0a8 ("drm/xe: NULL binding implementation")
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index d4660520ac2c..d5a237b7c883 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -81,8 +81,10 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
 static dma_addr_t vma_addr(struct xe_vma *vma, u64 offset,
 			   size_t page_size, bool *is_vram)
 {
-	if (xe_vma_is_null(vma))
+	if (xe_vma_is_null(vma)) {
+		*is_vram = 0;
 		return 0;
+	}
 
 	if (xe_vma_is_userptr(vma)) {
 		struct xe_res_cursor cur;
-- 
2.40.1

