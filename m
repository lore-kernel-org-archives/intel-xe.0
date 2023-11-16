Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7D3C54FB9
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 15:12:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AAFF10E611;
	Thu, 16 Nov 2023 15:12:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FEE10E28F
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 15:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700147575; x=1731683575;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5aS5tlkjWarblpyVLuGxRK7QkhAJm3AuKre+ikj4hq0=;
 b=dmC1T6LyiZo3ATYJr1QFQBvFPF2bBaiPayIbTWlhoT0xZBdwp5C0Vh+4
 JiTM6FhZez/oRLRu90l1+XrHnrvb8m0yajV+98qshIB/65LEM/TOZ2Mwt
 xPExD2ZVl9stlDa2iEn0Ubd4ra3aIGtIiayzCG5DiRrePJ9AcREheWEHR
 PiaZPL78V1aUW4XblOZT4BENJSZ5RZQic7SY7ox4/UBftPWP3Q7roXj8K
 /1gywWiYegAdPOiS50yPAXOc5pI4Ne5rJqZBqdP4Ksiaox1pFgYo7nPlz
 rR9Gx8aXpPBYA7CY6DjFOJoyGb9gmIEOg1DXIytgVKRWs2X5k1eFPJUb7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="388269215"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="388269215"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 07:12:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="938863168"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="938863168"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.152.135])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 07:12:54 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Nov 2023 16:12:42 +0100
Message-Id: <20231116151242.2125-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231116151242.2125-1-michal.wajdeczko@intel.com>
References: <20231116151242.2125-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 4/4] drm/xe/guc: Use valid scratch register
 for posting read
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

There are only 4 scratch registers VF_SW_FLAG(0..3) on each GuC.
We shouldn't use non-existing register VF_SW_FLAG(4) for posting
read.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 56edcb2b0e45..6de2ab05bf4e 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -615,7 +615,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 	u32 header, reply;
 	struct xe_reg reply_reg = xe_gt_is_media_type(gt) ?
 		MED_VF_SW_FLAG(0) : VF_SW_FLAG(0);
-	const u32 LAST_INDEX = VF_SW_FLAG_COUNT;
+	const u32 LAST_INDEX = VF_SW_FLAG_COUNT - 1;
 	int ret;
 	int i;
 
-- 
2.25.1

