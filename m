Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDE5C282D9
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 19:52:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38A010E4D4;
	Mon,  3 Mar 2025 19:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N3LXqDEV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C168110E4CC
 for <Intel-Xe@lists.freedesktop.org>; Mon,  3 Mar 2025 19:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741031541; x=1772567541;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XQhuMXcQ3d0AuVlbM2dsvjFWFXLcFzyTM7LZjIyWhSg=;
 b=N3LXqDEVReuRHT7dL4hVJ6iXR5zwOB/JBTnjcRhhuA4ulZNYOEsnEROG
 MAnClQmUg965Itd57hcCPj2YhlMNL8tfv7n1aUbsiuUggM8mPofDsTt9i
 YH6t6Kj+8HxTzySDiHFUX6Ir6jLJYE9IuxE5zc0cjslnudbfHfEM9bGQV
 xCVxDyUpoKLlP4ASsgdRBNsNWMjKECQkpMcBDuFfxc1iBV8JEryc2fcCW
 to+mcuKVuYhDlyLiT7of2ksylqW/2yqZdj0W0W7k4mOVwMpPyQzZPhYKn
 8/UazoMnjRDigipkXzxYnB94a/HN3zV5QM5G+CAdrbw+IJj2epqWAmV2y w==;
X-CSE-ConnectionGUID: JW76/2GiQCOLb4yU0xmt0A==
X-CSE-MsgGUID: hInFI8PHTY+SjzV49v1yqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41167373"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41167373"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 11:52:17 -0800
X-CSE-ConnectionGUID: SsLWEweNQ0S3zRwLK9b8Hg==
X-CSE-MsgGUID: 0wfIw5FbTgm3YnYh6MaXEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="141366102"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa002.fm.intel.com with ESMTP; 03 Mar 2025 11:52:16 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: Clint Taylor <clinton.a.taylor@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2 6/7] drm/xe/ptl: Add GuC firmware definition
Date: Mon,  3 Mar 2025 11:52:14 -0800
Message-ID: <20250303195215.1046192-7-John.C.Harrison@Intel.com>
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

From: Clint Taylor <clinton.a.taylor@intel.com>

Define the GuC firmware to load on the platform.

Signed-off-by: Clint Taylor <clinton.a.taylor@intel.com>
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
Tested-by: Jordan Justen <jordan.l.justen@intel.com>
Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241011163920.7926-1-matthew.s.atwood@intel.com
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 7c63c6ed13a8..0cca2c8d6d99 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -108,6 +108,7 @@ struct fw_blobs_by_type {
 };
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
+	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 38, 1, ""))	\
 	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2, ""))	\
 	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2, ""))	\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2, ""))	\
-- 
2.47.0

