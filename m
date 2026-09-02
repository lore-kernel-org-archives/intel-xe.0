Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FC1C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 14:54:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D020210F22C;
	Wed,  2 Sep 2026 14:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F+qwG080";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6338E10F22C
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 14:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788360893; x=1819896893;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wp/FqiDwPKzYGNbIFUYQvIAtW6BQlfLsTYlL4xcCq+g=;
 b=F+qwG080MsraMCaYVenZsGHq28hzq0VZxNtPK/suaSJMd8JBpfmokUDW
 wzk1CNpEHf85r1i25FpiQKw66svgSxtYB9OXCBvy12PfxrzSOyf/XdDiL
 1I0JEgRqr9z598Lr4dscPvXUu9wMgbUVqAkic4Rd039ZRlnMBp52ETOBl
 RA1xlCnMslR7uBHvaa17w4LAvjiKSZ34kiO82A7q2Qm0PqguSKuN/ltzi
 9bCXl7leLtZ4RTq53WkhnAjp3Fxw2GIMEPbbD63HzNLMoAvIst5vNAeTN
 SHiPDdZ6G9OnmSAgDqgrV3+y5llPLyidoW0iBtQIuNtS/JaI4YyMmQzfp Q==;
X-CSE-ConnectionGUID: IJ6+jsWLT8e694nRyOYLZw==
X-CSE-MsgGUID: xUvwh6pVTZeH3sxqxWGoxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92525997"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="92525997"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:54:53 -0700
X-CSE-ConnectionGUID: mupobPERTf2B1qGW1ykPxw==
X-CSE-MsgGUID: k5WaNVKUTp6h0ZLvqG25pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="263259985"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 07:54:50 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 Matthew Brost <matthew.brost@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Arvind Yadav <arvind.yadav@intel.com>
Subject: [PATCH V20 03/15] drm/xe: Export xe_ttm_bo_purge()
Date: Wed,  2 Sep 2026 20:23:46 +0530
Message-ID: <20260902145343.465686-20-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260902145343.465686-17-tejas.upadhyay@intel.com>
References: <20260902145343.465686-17-tejas.upadhyay@intel.com>
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

Remove the static qualifier from xe_ttm_bo_purge() and add its
prototype to xe_bo.h. This allows the function to be called
from other parts of the driver outside of xe_bo.c, specifically
needed for the memory page offline feature.

Cc: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Arvind Yadav <arvind.yadav@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 2 +-
 drivers/gpu/drm/xe/xe_bo.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index dde309821237..8f93e09e51bb 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -921,7 +921,7 @@ void xe_bo_set_purgeable_state(struct xe_bo *bo,
  *
  * Return: 0 on success, negative error code on failure
  */
-static int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
+int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
 {
 	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
 	struct ttm_placement place = {};
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index e8081af5bfc1..90b15fff36c7 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -600,6 +600,7 @@ struct xe_bo_shrink_flags {
 long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
 		  const struct xe_bo_shrink_flags flags,
 		  unsigned long *scanned);
+int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx);
 
 /**
  * xe_bo_is_mem_type - Whether the bo currently resides in the given
-- 
2.52.0

