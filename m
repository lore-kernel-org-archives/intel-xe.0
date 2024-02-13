Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B99C48260
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 21:24:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A3D10E6AD;
	Tue, 13 Feb 2024 21:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nbamF7UB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F0410E393
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 21:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707859476; x=1739395476;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O4o5GMcPKvtS6Oh9CDGEfZi5Q5BaAzqmwLn9925Ua3Q=;
 b=nbamF7UB+bsOhGlzzJringkkagIu0LFsefmIfef1oMEuCjlYezA5rf/4
 e9TfzYCBFKJOL+RE+t5XwaXtL01Sr+givP61t2kTIMoqF8rYOZkCOQWFa
 5alSMx8oSba+bduFPJU9cmmyqY4y8C6B1Aw9OjzuzHpD3DaX25juijVOS
 n8PBitGpsmVXiZ452kYVGEQcMdChGqrFQcDSXnY4NgWplkS/+ZR/kMkMe
 WU16B/fHZH3X1nANCtT/PQA+ZQX5KlHYwz57O04OYvz6dq/Cu8EGw5AHp
 8LjsrKkK9ddXYftE/OKdOX2OsPkbMUVUFq0DZRavF1kmasTYTo0O/s9UF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1741151"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="1741151"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 13:24:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="3042935"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.153.144])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 13:24:34 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH 2/3] drm/xe/pf: Request 64K aligned allocations for LMTT PD
Date: Tue, 13 Feb 2024 22:24:17 +0100
Message-Id: <20240213212418.1309-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240213212418.1309-1-michal.wajdeczko@intel.com>
References: <20240213212418.1309-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Use explicit alignment flag to match hardware requirement.

Bspec: 52404, 67468
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_lmtt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index 0d7c5514e092..dfb0e1887615 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -71,7 +71,7 @@ static struct xe_lmtt_pt *lmtt_pt_alloc(struct xe_lmtt *lmtt, unsigned int level
 					     lmtt->ops->lmtt_pte_num(level)),
 				  ttm_bo_type_kernel,
 				  XE_BO_CREATE_VRAM_IF_DGFX(lmtt_to_tile(lmtt)) |
-				  XE_BO_CREATE_PINNED_BIT);
+				  XE_BO_NEEDS_64K | XE_BO_CREATE_PINNED_BIT);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
 		goto out_free_pt;
-- 
2.43.0

