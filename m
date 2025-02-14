Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E96C021A6
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 21:23:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D10410ED45;
	Fri, 14 Feb 2025 21:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ReT4YZxa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5B010ED44
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 21:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739568226; x=1771104226;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NIZz8al7+6GTx5r9JvSFBaX5SZyqpe9C+0eTaYZDsLU=;
 b=ReT4YZxapSxuaVyjAjAtBFDVMttyP3tzObf9cyk1GY49aNbcCd0Ge8Qo
 HyHwAAb2A9kw5bK7rlXHs8WjBf0JHPgBNX7bowEEB01gtsLIiG1WHjOjI
 EEo0EsXpUsxmHejdMaRy8Wab5rH0+vlKR035ZfTN75FcS5loD9JZNwsTO
 ZXjq1FOSzuhralc1LsU0pZokylGNrMw8WTHtLmQNTmN9ewQd5tdmuRfnK
 Lo6zgoRv+Gjkm2RyVItnQhEvgjxvJFnF8UyvexKEG5Ji+plolGRpXxfdN
 els5bAJ7vrAuVK1OovsjbFCI0WUZ0Xi/Sqmyyg3o6NpkLXViRi7nB2XoB g==;
X-CSE-ConnectionGUID: coQcD8J5Realyr2/KIlFbA==
X-CSE-MsgGUID: fY7PQQOOQlO4RAJvJSYnhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40447025"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40447025"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 13:23:46 -0800
X-CSE-ConnectionGUID: pnq4Fw4TT+eXYe/YBNaZcw==
X-CSE-MsgGUID: /uv5+jsKRNuTRve/sG0Fbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="113757052"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 13:23:45 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 9/9] drm/xe: Stop ignoring errors from xe_ttm_sys_mgr_init()
Date: Fri, 14 Feb 2025 13:23:13 -0800
Message-ID: <20250214212313.1767562-10-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214212313.1767562-1-lucas.demarchi@intel.com>
References: <20250214212313.1767562-1-lucas.demarchi@intel.com>
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

xe_ttm_sys_mgr_init() already cleans up after itself, just return error
if that failed.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 3255c36700f60..8b13b22b62bd6 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -748,6 +748,7 @@ int xe_device_probe(struct xe_device *xe)
 		return err;
 
 	xe->info.mem_region_mask = 1;
+
 	err = xe_set_dma_info(xe);
 	if (err)
 		return err;
@@ -756,7 +757,9 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	xe_ttm_sys_mgr_init(xe);
+	err = xe_ttm_sys_mgr_init(xe);
+	if (err)
+		return err;
 
 	for_each_gt(gt, xe, id) {
 		err = xe_gt_init_early(gt);
-- 
2.48.1

