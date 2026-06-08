Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FDBCD6E79
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 19:19:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377C810F907;
	Mon,  8 Jun 2026 19:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YqEmMTDA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A400710F907
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 19:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780946339; x=1812482339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l0vlWxTiiPKMkcfPiDnyKbh25g8H2uUjWxChvDrJ1No=;
 b=YqEmMTDAkFDpB/gvliAML1D6Bte1yzOQe86XaicqMviLcmkjkgASrxxb
 6+aqCTgVqvG3c5P3PlsyGHGCITOMTLN3yl/KWm6eEJjPebL9M7q087C5a
 GMth00164b63gi3ESjXGHBV15OSfG04jm2leFdxuRfgiGbnrE/hDU41GJ
 gikcGcXnEs8Z0K29JbRS85DD7lJxWruT+XUhsOkslJT9z/2V7K873HOSl
 oWZHmnSyS/gOktBZty4LbNnsGsj67k03aSA3xxHluiqf0hH5IwYo6I1qb
 WpLbzJDlHYoSDDVeKktv/W3Q5bbZj6D4w+7tMZu7R4Gsd2sZHWvtINspF A==;
X-CSE-ConnectionGUID: OBfPDTUcR/CDwVmDJI+niA==
X-CSE-MsgGUID: A8lZ57dOQeOXfvr2P2UgsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="92019427"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="92019427"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 12:18:59 -0700
X-CSE-ConnectionGUID: ODJfxJP7Stq481BE6Dmjfg==
X-CSE-MsgGUID: AJ7HwZ8vQ62hfkXQjTx5ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="244789332"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 12:19:00 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 2/9] Revert "topic/xe-for-CI: Define GuC firmware for NVL-P"
Date: Mon,  8 Jun 2026 12:17:45 -0700
Message-ID: <20260608191831.2337033-13-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260608191831.2337033-11-julia.filipchuk@intel.com>
References: <20260608191831.2337033-11-julia.filipchuk@intel.com>
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

This reverts commit 1cf7dc778fc0682a29c228939df45bb7be27a433.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index b64db77518bd..a63d49df9a9a 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,8 +115,6 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(NOVALAKE_P,	GT_TYPE_MAIN,	mmp_ver(xe,	guc,	nvlpg,	70, 68, 0))	\
-	fw_def(NOVALAKE_P,	GT_TYPE_MEDIA,	mmp_ver(xe,	guc,	nvlpm,	70, 68, 0))	\
 	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 68, 0))	\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 68, 0))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
-- 
2.51.0

