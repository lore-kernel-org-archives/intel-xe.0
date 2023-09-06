Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B57EE14A9
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 23:00:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD7910E67E;
	Wed,  6 Sep 2023 23:00:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3957B890BB
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 23:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694041223; x=1725577223;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YaO/g8nW5GHdLKhcqmh4rjOORHKwV8K/oYVlWWK3RRQ=;
 b=SDE1blnzdCoKJqyQ6ZaXrisx/3VKMcX6bXdK/ZWfng0SQLzNG/OF8R9f
 yb1uP8bqRLfw9EMrlpRUkHluLCPPUG9VWsvTixGmbu59cIsY0d2Q1SeZM
 xsC0TV7+Ye2c2i7IFm5AUGo1Yc7Jt+ABMkUYRxQQSTH2B2O0Y8Z2C1onA
 GTRE3xgbG7GjQH4L0ywcqucoeo3rang6/Ad19Qj3yKL1JeCWmeGdfBjYe
 8OcJoQYVyd4yHs8yGlAoXfNlq5PUafALL/JxphCZLPCELhCtQNkMaGHQl
 Gjpnm+Y92q6tOThZ4VBr7MNXxfbI+FRsMQz7GkwEn6Ww4xVK1ZvOykMvW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="377116640"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="377116640"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 16:00:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="865349279"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="865349279"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 16:00:21 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Sep 2023 16:00:10 -0700
Message-ID: <20230906230010.2704642-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/guc: Switch to major-only GuC FW tracking
 for MTL
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

Newer HuC binaries for MTL (8.5.1+) require GuC 70.7 or newer, so we
need to move on from 70.6.4. Given that the MTL GuC uses major-only
version matching in i915, we can do the same here instead of just
bumping the version (and having to push the versioned binaries,
because they're not there already for i915).

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 37ad238148b0..8fc1fbc551c2 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -101,7 +101,7 @@ struct fw_blobs_by_type {
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
 	fw_def(LUNARLAKE,	mmp_ver(xe,	guc,	lnl,	70, 6, 8))	\
-	fw_def(METEORLAKE,	mmp_ver(i915,	guc,	mtl,	70, 6, 4))	\
+	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 7))		\
 	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 6, 4))	\
 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 5))		\
 	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 5))		\
-- 
2.41.0

