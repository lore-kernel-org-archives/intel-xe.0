Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC42E9D41F
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 17:31:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 553A310E707;
	Wed,  4 Feb 2026 17:31:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FQPRDJWu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB4610E6FE
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Feb 2026 17:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770226275; x=1801762275;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8njQpBb/222R8Bz9laI5rJOAgjKdamWHV/uizpMDcPM=;
 b=FQPRDJWun1uaU4yt6T4PY2ftzpE98TDPWyNuX0EneElEoeR6f49h+MmZ
 O2MNQYXgyiBJ6IT4RIOOwZKS/r1DMv02jVmLSWfCHA8z40geSCBl0WQNI
 4/4f/vkTN1/9hhE76FZAnt6iqE1W2KB2AcndCR4GwJ9huAmcOerNkO9AF
 RXOhGIUYK12ISd4tdb0vcG2pZJZET4ux1msKApZXQcaNWNnwR26aZg+iN
 eD6CaCZ93nlPnLiLX9Hb83yCsVYx7x9qVyE8v7KuDsiKufQCqmuHvYHKQ
 3v+9f1qb8D0Ej9REFgE8D4ImgFJl65lsomNKRVl7TGuyBwrz4ATX74k4N w==;
X-CSE-ConnectionGUID: 639otPduQFejvEUd6IM+Dw==
X-CSE-MsgGUID: 3I73mk1rQ3Gbbgd9F0b2bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="88837366"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="88837366"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 09:31:15 -0800
X-CSE-ConnectionGUID: OsRF0C/cRh+FhCQVoM57SA==
X-CSE-MsgGUID: 8OE5+QXuSm2Pph/adSMxLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="233155598"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa002.fm.intel.com with ESMTP; 04 Feb 2026 09:31:12 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2] drm/xe/reg_sr: Fix leak on xa_store failure
Date: Wed,  4 Feb 2026 17:28:11 +0000
Message-ID: <20260204172810.1486719-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
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

Free the newly allocated entry when xa_store() fails to avoid a memory
leak on the error path.

v2: use goto fail_free. (Bala)

Fixes: e5283bd4dfec ("drm/xe/reg_sr: Remove register pool")
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_sr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index d3e13ea33123..8efb2c352a6c 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -98,10 +98,12 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
 	*pentry = *e;
 	ret = xa_err(xa_store(&sr->xa, idx, pentry, GFP_KERNEL));
 	if (ret)
-		goto fail;
+		goto fail_free;
 
 	return 0;
 
+fail_free:
+	kfree(pentry);
 fail:
 	xe_gt_err(gt,
 		  "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
-- 
2.50.1

