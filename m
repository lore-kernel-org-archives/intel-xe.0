Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0303DC282D0
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 19:52:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A967510E4CE;
	Mon,  3 Mar 2025 19:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FSiLM8ae";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780CB10E4CB
 for <Intel-Xe@lists.freedesktop.org>; Mon,  3 Mar 2025 19:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741031541; x=1772567541;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uDY7r5bAhEpOj2EiKDoI/2HOafQzqF1AJ/7AVwsa4M4=;
 b=FSiLM8ae2DPZR8bexc9BtseOsbtbL/cpDeKOVa6jL8ecnSunZ65IOYlf
 TeOfRnuDuz6VJBYX4YxtNfYNYtQTZMU1ve741nVKbP8EyK3szReruLl7/
 gg2e7+hG6/L6kXF8eEIcd4a6KibpBUC2T5C4OF35FpOR/SB7iv8FWo7u/
 WXfI76vdTo7ETC1fQYhTr/20JkEUGwbFaDz77qRKrHQJhFtfSXl6SqCee
 1adoRFjZOc0qjbO7ZA/HrQIaHfS3Z3JtcLEtbMfdjfu+kjdjb1iGcafd9
 BQBTPOenoK0hcayD7xD2/jXkvJ+xSxeRJnM8MhO4QojvbP0V2zfjAjrFF g==;
X-CSE-ConnectionGUID: LQlpQc5aQvepowjwQSMaog==
X-CSE-MsgGUID: 2rJU3nLtRV6SpZoVjC1usw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41167369"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41167369"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 11:52:16 -0800
X-CSE-ConnectionGUID: EIQAo9piQ0e5VVt3m5bpaw==
X-CSE-MsgGUID: pZv2cOQYTPSnIC+lyu4YTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="141366091"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa002.fm.intel.com with ESMTP; 03 Mar 2025 11:52:16 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v2 3/7] Revert "drm/xe/pvc: Add GuC firmware definition"
Date: Mon,  3 Mar 2025 11:52:11 -0800
Message-ID: <20250303195215.1046192-4-John.C.Harrison@Intel.com>
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

This reverts commit 413e37a14b3b5f616612b5ebd6ff96172d333aea.
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 087fb96f707e..fb0eda3d5682 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -110,7 +110,6 @@ struct fw_blobs_by_type {
 	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
 	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
-	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 29, 2))	\
 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 29, 2))	\
 	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 29, 2))	\
 	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
-- 
2.47.0

