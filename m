Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FB3C282D6
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 19:52:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D263910E4D3;
	Mon,  3 Mar 2025 19:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gt5FVFUt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B84F10E16C
 for <Intel-Xe@lists.freedesktop.org>; Mon,  3 Mar 2025 19:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741031541; x=1772567541;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dbfxzewy5qhr3XCPwfYreoocX0h6BfX0iVp4aesG9Zc=;
 b=gt5FVFUtOGN5o1M2Y61va+FZbXPdJDWvi4WZChsQ62ZYcAFVlKfb/VZd
 3d5jnJXpV0vq+aZknGRYwuM6VFOK0BrSeNb/TwddalUEhouS55wApnrQG
 dx/kZvpCxNH3s0Cj4REZw+cUtMfw+o9N+rw6UzA/2ZVA323xqsvbuJjXJ
 lM+S+tNGCNjulJAcSgG4Cl5tcqvPcSVf08T1qdpMTewaBZM3Is7YLPyHz
 DgGX+q3OOFxWngJ9rfyXW2e7juoEOPKDyCZIq4LB+D6YgR+fCTzWEwaNs
 qzcO8WFaVJWND+oVNYZo87I6EYHwwMwcOOnbXEvdn/XZ63x1THANmfHsF A==;
X-CSE-ConnectionGUID: FuMlkTHHTdqh52uupxXbUw==
X-CSE-MsgGUID: N9Y6npxtRrq1DtNEGtwNGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41167372"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41167372"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 11:52:17 -0800
X-CSE-ConnectionGUID: 5VHP7VSVTlygFoCp0AmHDg==
X-CSE-MsgGUID: W2pZljhxQPKOk37gR1syzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="141366098"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa002.fm.intel.com with ESMTP; 03 Mar 2025 11:52:16 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2 5/7] drm/xe/pvc: Add GuC firmware definition
Date: Mon,  3 Mar 2025 11:52:13 -0800
Message-ID: <20250303195215.1046192-6-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250303195215.1046192-1-John.C.Harrison@Intel.com>
References: <20250303195215.1046192-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: Julia Filipchuk <julia.filipchuk@intel.com>

Add pre-release support for PVC.

UAPI version 1.13.4.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240802222129.3976212-5-John.C.Harrison@Intel.com
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 748863b75adf..7c63c6ed13a8 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -111,6 +111,7 @@ struct fw_blobs_by_type {
 	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2, ""))	\
 	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2, ""))	\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2, ""))	\
+	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 29, 2, ""))	\
 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 29, 2, ""))	\
 	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 29, 2, ""))	\
 	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 29, 2, ""))	\
-- 
2.47.0

