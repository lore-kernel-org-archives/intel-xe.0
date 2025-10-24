Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B50CCF9E0
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 19:20:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA6E10E224;
	Fri, 24 Oct 2025 19:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="io7BcyH/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 790E210E224
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 19:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761333604; x=1792869604;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UA5y5QgATzUogSAYc7EHZDA/+b3J3SfK5ImPJiQKU7k=;
 b=io7BcyH/7HH70dP6AnKZeWs7dlg2B6K1URLLdHmmMLHpHtuJiHGZoH4M
 FRO4iVu1z7UtSpBIhdD0XjvGsMRcoYVLRn1+Ty6SxH27mF1+hS6ZvE9lD
 TM/ADeWQV2lSAXniogQBfaH2K5Ny98xOBv8Onl0gFvD4Ar7Bc7ndp2chE
 BTsBmSdfVFda9CBYblq0HP5JSS4PxelOYmCqKYOkemuvpHHoJcsFYq90D
 HQMkSyJi2OQ+5u9a+G08YZIf/jQaSQPVWAb1ZJ1/g0oB1RsB81Kv20Kan
 ZQahRKYzmY1Y7RhMg30hWKS/z91HjqY6Oqp0N1ZklZ5nHiq2yS8YKf9Mx A==;
X-CSE-ConnectionGUID: LtSqFWQdTZmEVcN3kE+zOw==
X-CSE-MsgGUID: kmaUoMQ4Rf2pNb4l83niww==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62728148"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="62728148"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 12:20:04 -0700
X-CSE-ConnectionGUID: rRmkOMM6RpW9uu4kuYGl0g==
X-CSE-MsgGUID: OhMcoTbQTC6XxuIl3dJYMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="184416136"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by fmviesa006.fm.intel.com with ESMTP; 24 Oct 2025 12:20:04 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, ashutosh.dixit@intel.com,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v2] drm/xe/uc: Change assertion to error on huc authentication
 failure
Date: Fri, 24 Oct 2025 15:19:59 -0400
Message-Id: <20251024191959.2555145-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

The fault injection test can cause the xe_huc_auth function to fail.
This is an intentional failure, so in this scenario we don't want to
throw an assert and taint the kernel, because that will impact CI
execution.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
History:
v2: Update commit comments (Daniele Ceraolo Spurio)
    Remove warning comment (Dixit, Ashutosh)
---
 drivers/gpu/drm/xe/xe_uc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 465bda355443..c94b828cc24f 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -218,9 +218,9 @@ int xe_uc_load_hw(struct xe_uc *uc)
 
 	xe_guc_engine_activity_enable_stats(&uc->guc);
 
-	/* We don't fail the driver load if HuC fails to auth, but let's warn */
+	/* We don't fail the driver load if HuC fails to auth */
 	ret = xe_huc_auth(&uc->huc, XE_HUC_AUTH_VIA_GUC);
-	xe_gt_assert(uc_to_gt(uc), !ret);
+	xe_gt_err(uc_to_gt(uc), "Huc authentication failed:%d\n", ret);
 
 	/* GSC load is async */
 	xe_gsc_load_start(&uc->gsc);
-- 
2.34.1

