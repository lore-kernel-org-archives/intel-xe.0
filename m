Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F7BC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 23:20:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E6141128B6;
	Mon, 15 Apr 2024 23:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PKArDJDj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11FAE1128AE
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 23:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713223205; x=1744759205;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=05VybkSaM0Lx3uX/KGyydTM8GThaKe0SQW4qYAMGItc=;
 b=PKArDJDjtj4DjQWJu0RhBgK1sagXg7pmjq+LR6FRf27lnOOdfRKD49gD
 cHS1S7NGjAymQXJ/gFS899Bof8v3xsDu4vthX09arK+yeChfrNHCdAGkp
 klVNTdxlfpv3Mdv7YBz0FPc3x541Yde3eWtRd77jx9CGNFIS0g6OeOBf0
 kwqNn/03lNPeJWiNgmTuckw2p9ZbArfnwgxCqD7f+TMqhv5yTqMWrsNkU
 HhQMOYM232WqHnFW5HgqZoibKqys1PXOnTsIuv2zMlFm2V4DExVq/H0yb
 9q4OJLPXr4Aj89slHGtpT6WuqkePZkIYZCDQ7r2CmHZ4woCSvik0aOhFF Q==;
X-CSE-ConnectionGUID: sX0tBiJFQDCuvYvx34R8Bg==
X-CSE-MsgGUID: SLkN6obFQ9+VVM+2v3g9Jg==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8496779"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="8496779"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 16:20:00 -0700
X-CSE-ConnectionGUID: ZgBLxGbITeq5usJJ/2borw==
X-CSE-MsgGUID: B/G0USBuQI6FiP/uhWhvBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; d="scan'208";a="22141845"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 16:20:00 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [xe-for-ci 3/3] drm/xe/gsc: define GSC FW for LNL
Date: Mon, 15 Apr 2024 16:19:47 -0700
Message-ID: <20240415231947.1230707-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240415231947.1230707-1-daniele.ceraolospurio@intel.com>
References: <20240415231947.1230707-1-daniele.ceraolospurio@intel.com>
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

