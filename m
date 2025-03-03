Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE43C282CD
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 19:52:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965E110E4CB;
	Mon,  3 Mar 2025 19:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aPq6jkXt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07E010E4CB
 for <Intel-Xe@lists.freedesktop.org>; Mon,  3 Mar 2025 19:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741031541; x=1772567541;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iflluk8Vd8uvLhP6Zc+vwezq6f10q5xcH6Sz/f6g+9Q=;
 b=aPq6jkXtr4cjA3GVW7OraSZNEs2SwC60RfcUgHFsTHJUxOmq0yKufbBC
 RL5xbe9gBOvt5zrABuTOFE8NmK/g2WiS66aDw2CUxDvGKLtK/UpCFRSkh
 Ea6a6Hf3/ZBkvybsPD23DEWBXebmyoNRzUAcY4XSD4F33vTrocwVMXxQU
 GjeXi5JrS/VCSVpFA1OEGhdPtbt7O4yKEmeD0Z8WRYugxsFZlZMhEN8BK
 tlVY+Eh9exYUGzNGiwZnD38+N5HW99MzcCnH3OPXi7q6DKe8CYDKf5OKW
 zgQt6JPZIPI2NGXAGBvO1ImSi8emq/84/NAUsDtW3+bcfllnF+RxCmlia g==;
X-CSE-ConnectionGUID: VO1bjtKJTtKBoxQuUxhHmw==
X-CSE-MsgGUID: zWi6dOIORWOvzYXoiQuxMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41167374"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41167374"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 11:52:17 -0800
X-CSE-ConnectionGUID: i8g30l7uQSatFU0MSDFxKg==
X-CSE-MsgGUID: 39G2gx3nSMOvqBUwC9g2Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="141366106"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa002.fm.intel.com with ESMTP; 03 Mar 2025 11:52:16 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 7/7] drm/xe/ptl: Define HuC FW version for PTL
Date: Mon,  3 Mar 2025 11:52:15 -0800
Message-ID: <20250303195215.1046192-8-John.C.Harrison@Intel.com>
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

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

First HuC release for PTL. Note that the HuC team now only releases
GSC-enabled blobs, so we don't need the "_gsc" postfix to identify
the variant anymore. The driver can identify the type of binary at
runtime no matter the name.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241011163612.6558-1-matthew.s.atwood@intel.com
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 0cca2c8d6d99..eb77528628f2 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -122,6 +122,7 @@ struct fw_blobs_by_type {
 	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2, ""))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
+	fw_def(PANTHERLAKE,	mmp_ver(xe,	huc,		ptl, 10, 2, 1, ""))	\
 	fw_def(BATTLEMAGE,	no_ver(xe,	huc,		bmg))		\
 	fw_def(LUNARLAKE,	no_ver(xe,	huc,		lnl))		\
 	fw_def(METEORLAKE,	no_ver(i915,	huc_gsc,	mtl))		\
-- 
2.47.0

