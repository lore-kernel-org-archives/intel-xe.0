Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DBCC5AC82
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 10:12:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5BD710E7A3;
	Mon, 10 Aug 2026 10:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jj0XQaed";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9670F88BE3
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Aug 2026 10:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786356765; x=1817892765;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=So8dhCwftiKoAhlOxdwbQwhrWs313TVdiPvXMd7pMBc=;
 b=Jj0XQaedM+eL3V4GbGfIxCQjLlLP2cWX995PuGUBiOBiMfenoHCOU+24
 FPT5UtIArSNT5XyhEyhKgbcVuiXYQ/zHy2bqloWH+CO9ksqd7o6eywEKj
 jDckPrguTwuMSQHedbt4kASCNJv5IbgLJtDks+qbVDRxJwyf7bJna8Jci
 m1FxgYbxtyGc0wcwWa53GvWjsK1rdwHSS6HUmXgssQ7qs/FPvuVGwiSbQ
 jXFrncq6WskpwFjq36qnxwjPecYf44+rOQO5G3rZtU5YODB+9SMgOQLq9
 WSQkVvlrI+lDPZHYyHgEEV9KOxVJktDi6eauWD5Let6wZ98vLg/GJdSwa Q==;
X-CSE-ConnectionGUID: fuQq7MOATjuDOTQL+cqSqA==
X-CSE-MsgGUID: Je/WinngSQ6HaYxEmfasow==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="86893662"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="86893662"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 03:12:45 -0700
X-CSE-ConnectionGUID: z0+X0fFhSbCL48zRRO1cBg==
X-CSE-MsgGUID: gSR3wUMQQPyZM6tW44ajJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="301227593"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by orviesa001.jf.intel.com with ESMTP; 10 Aug 2026 03:12:43 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v5 5/6] drm/xe/vf: Add bounds checking for queried VRAM size
Date: Mon, 10 Aug 2026 15:44:32 +0530
Message-ID: <20260810101428.1009573-13-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260810101428.1009573-8-satyanarayana.k.v.p@intel.com>
References: <20260810101428.1009573-8-satyanarayana.k.v.p@intel.com>
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

Add explicit bounds checks for VRAM size which can detect and reject
invalid configuration data from a misconfigured or malfunctioning PF,
preventing protocol violations and protecting VF initialization.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
V4 -> V5:
- New commit.
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 65e48f135801..6c1878e4b1b2 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -575,7 +575,7 @@ static int vf_get_lmem_info(struct xe_gt *gt)
 		return err;
 
 	lmem_size = xe_tile_sriov_vf_lmem(tile);
-	if (lmem_size && lmem_size != size) {
+	if ((lmem_size && lmem_size != size) || (size % SZ_2M)) {
 		xe_gt_sriov_err(gt, "Unexpected LMEM reassignment: %lluM != %lluM\n",
 				size / SZ_1M, lmem_size / SZ_1M);
 		return -EREMCHG;
-- 
2.53.0

