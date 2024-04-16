Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753EBC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 22:22:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB3410F3E9;
	Tue, 16 Apr 2024 22:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gW3tIZ7p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD5510F3E9
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 22:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713306134; x=1744842134;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=05VybkSaM0Lx3uX/KGyydTM8GThaKe0SQW4qYAMGItc=;
 b=gW3tIZ7p7eXu8KnD9um+qMbsHZmGrUymlKu5QCC5FizSeUOdi/X7qo18
 PMBW/EWXQ0KpIqPK3LJS2Yvlp94v0lpVcGCG/lTLRU4f8YxogQxfkk0wX
 72AtBvEDE1vaegrbu+AokrJwQ7/KFxBgGwqRj+UGTCklQBwsQ8maxNQ/g
 Fm05ckwiCimi+50W/eT+fqL+UH0e8ktETv3zoKa0MeP/E4fCnQLORK8EL
 5uCerik2cj1LlHdyre2D0Wj1c2y2rHey//H0/Ot6RXaoN1RLjEXyqfLKa
 bZhhg33hhSrcOGDExQN+Uz3JKSi+Nl+Zlc7HmF4QA58xkltIIypUr2eMC Q==;
X-CSE-ConnectionGUID: Bf+PGD3fTSCV/9dbGoLj5g==
X-CSE-MsgGUID: mt670VNUQvqZxqGQGo8RCw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="11719808"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; d="scan'208";a="11719808"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 15:22:13 -0700
X-CSE-ConnectionGUID: yzno/OmDSOiG6ndOGb2bDQ==
X-CSE-MsgGUID: I8LZZdEfQ7+CQmk8g14OoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; d="scan'208";a="22463239"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 15:22:13 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [xe-for-ci v2 3/3] drm/xe/gsc: define GSC FW for LNL
Date: Tue, 16 Apr 2024 15:21:59 -0700
Message-ID: <20240416222159.1332619-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240416222159.1332619-1-daniele.ceraolospurio@intel.com>
References: <20240416222159.1332619-1-daniele.ceraolospurio@intel.com>
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

Interface and compatibility versions are the same as MTL.

Note that the FW is still in development and the current release is
for CI only. Theefore, we'll need to keep this patch in the xe-for-ci
branch until we get the finalized FW release.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index f27e96c47baa..ae38172b6e0e 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -126,6 +126,7 @@ struct fw_blobs_by_type {
 
 /* for the GSC FW we match the compatibility version and not the release one */
 #define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
+	fw_def(LUNARLAKE,	major_ver(intel-ci/xe, gsc, lnl, 1, 0, 0))	\
 	fw_def(METEORLAKE,	major_ver(i915,	gsc,	mtl,	1, 0, 0))
 
 #define MAKE_FW_PATH(dir__, uc__, shortname__, version__)			\
-- 
2.43.0

