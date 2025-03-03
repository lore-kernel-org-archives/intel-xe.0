Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585B3C282D4
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 19:52:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44A310E4CF;
	Mon,  3 Mar 2025 19:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vho4iQ14";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B7510E4CB
 for <Intel-Xe@lists.freedesktop.org>; Mon,  3 Mar 2025 19:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741031540; x=1772567540;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cOERG3uSv9gwHa/9bQ6cSDo1qfcvQlA02aBBQr/TpIo=;
 b=Vho4iQ14IMa329hm1k/kmSAOJJJY7Mhi9zbt9Yh6phc23MBJrASTeaVW
 8MbuifKGUhO6Fv1y0oeV0TenSdYLZiHfEHe+I/9HjvG2q2SIZoy+j2t68
 y40Mb0YXuFGp1EtLA126PLfyIHk9Re1mEpKh6aWfxpQfAOpT5fhE6wetg
 weoyEWGVwBXXr0BipsSrUCnfw5vdESX2n9GietPqSUvH0rlWzeHpUXYAU
 HubGoAEN28szNZABBncZLMVAHpBsKrbNZrBWSmI387MLgwzq9dX1Y9NzN
 v4Us8N+WbTteKbrqB0emcQjfZjQ8mbGXaKF5AHIv+qzWO+h+TAUYEnBwT g==;
X-CSE-ConnectionGUID: xh0WhJqXREqay2uQ/Ael8w==
X-CSE-MsgGUID: PC+QjarZTHqgUF2F7elY4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41167366"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41167366"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 11:52:16 -0800
X-CSE-ConnectionGUID: BK9TpCl3ToayFAaCaCImBA==
X-CSE-MsgGUID: p4cy18XJSQaHFGUuTqT52A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="141366083"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa002.fm.intel.com with ESMTP; 03 Mar 2025 11:52:15 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v2 1/7] Revert "drm/xe/ptl: Define HuC FW version for PTL"
Date: Mon,  3 Mar 2025 11:52:09 -0800
Message-ID: <20250303195215.1046192-2-John.C.Harrison@Intel.com>
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

From: John Harrison <John.C.Harrison@Intel.com>

This reverts commit 6ea369b34748ef5377f23e24b577912585ce5445.
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 18e06ee9e23f..63dc3ebc02bf 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -121,7 +121,6 @@ struct fw_blobs_by_type {
 	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
-	fw_def(PANTHERLAKE,	mmp_ver(xe,	huc,		ptl, 10, 2, 1))	\
 	fw_def(BATTLEMAGE,	no_ver(xe,	huc,		bmg))		\
 	fw_def(LUNARLAKE,	no_ver(xe,	huc,		lnl))		\
 	fw_def(METEORLAKE,	no_ver(i915,	huc_gsc,	mtl))		\
-- 
2.47.0

