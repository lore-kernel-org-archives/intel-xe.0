Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2116DC44508
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 23:59:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D6D10E8AD;
	Wed, 21 Jan 2026 23:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XekzY9g2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D31A310E8AD
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 23:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769039978; x=1800575978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v0mPqtD9Cz9V6C+LJUpkNys0CUvRNnK2qCSPbrTLzTM=;
 b=XekzY9g2MyLHAXBQ/cZZ4Fm9xt4ObFBeUj8gMYBmmtSEgzncmHV1CQnp
 /QUJheVULKUaOE6JfCpTinDnLkU1IrdfpZczNfZ91HMNF2L8lhGC3Dtr0
 gea91H78LxUC9RNUI1B8toaAurbnLgirlfgw2SYguGgngQM6XLEmJsShg
 vjDUfMHU4dRHZpxSYZori9GT6GZ9cH1cP4fSgz7NEikDM8Kb1PJMixRAZ
 oUxxLx13lf1VTYzmtMUpyHtlmTT/5l2Ho6KV1ahMho3KjrAnSm9SYuhuW
 fq+bqngs4nW6av0iO2pyT+5QihIRa/HPI3RNGAMREpMBu1Lowc1KaqKjC A==;
X-CSE-ConnectionGUID: VpJDCJy4S8e5/rkVDWKqeA==
X-CSE-MsgGUID: AHuOEOr3Sd+W+AxzZK4ubQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="57839578"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="57839578"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 15:59:38 -0800
X-CSE-ConnectionGUID: vE04Xx7NT361FAv6xfMEkw==
X-CSE-MsgGUID: PjPdMO7NTbu4gu7u2Ev7ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="207017452"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa009.fm.intel.com with ESMTP; 21 Jan 2026 15:59:36 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 1/2] drm/xe: Make xe_modparam.force_vram_bar_size signed
Date: Wed, 21 Jan 2026 23:56:20 +0000
Message-ID: <20260121235618.3138251-5-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260121235618.3138251-4-shuicheng.lin@intel.com>
References: <20260121235618.3138251-4-shuicheng.lin@intel.com>
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

vram_bar_size is registered as an int module parameter and is documented
to accept negative values to disable BAR resizing.
Store it as an int in xe_modparam as well, so negative values work as
intended and the module_param type matches.

Fixes: 80742a1aa26e ("drm/xe: Allow to drop vram resizing")
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_module.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 1c75f38ca393..79cb9639c0f3 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -12,7 +12,7 @@
 struct xe_modparam {
 	bool force_execlist;
 	bool probe_display;
-	u32 force_vram_bar_size;
+	int force_vram_bar_size;
 	int guc_log_level;
 	char *guc_firmware_path;
 	char *huc_firmware_path;
-- 
2.50.1

