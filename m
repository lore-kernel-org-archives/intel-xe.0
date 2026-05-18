Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152A3CD4F57
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 19:26:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C128910E9C0;
	Mon, 18 May 2026 19:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LnpNz+Hj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 257F710E80D
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 19:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779132365; x=1810668365;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=nakeJ/ER5qxkVXsDgFQYfAibHgtLHfLTCE6YLVf8m6c=;
 b=LnpNz+HjqaOKXI74lMqgU5KuI6/mp/DrSGw+grnZ1yOyqv7IMtalbqDH
 Ft7MlAdhrmLWQeCqVsSs7npiigx6f5Rt8Y1Tao14fgamx4c2k4u+cmW9e
 swlgfSttl/b1NF9eg7Oaf3NyemjlyvnlCKqZNYcNGeqH1V0P9FKxb6hN2
 zLtYwdcgjJT7Re1dFX1X8abdcF95nacnsghjAz469WXDtwYOtFoLhqYZR
 hQNuTTttlUBm/tCb1mPXvJgiKw3t59Vds3vw1f8Y4WXqNrSIahoW94kAB
 EavEr74iqSZ3lq01+bln9TQUmbRkjHpjjTFki/mwZI6udFYtrLSEFm6yG w==;
X-CSE-ConnectionGUID: 0oYsRIYaRVOA+koaai7vEw==
X-CSE-MsgGUID: NktDSs/mT1CCiWjHXd9xxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="90304801"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="90304801"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 12:26:05 -0700
X-CSE-ConnectionGUID: 2NSLK1jER8ayOPdbOqWXnA==
X-CSE-MsgGUID: zgDBUSCRSeGIJhTzlY3/9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="235276043"
Received: from johnmoon-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.112.169])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 12:26:04 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 9/9] drm/xe/memirq: Drop cached iosys_map for MEMIRQ status
Date: Mon, 18 May 2026 21:25:47 +0200
Message-ID: <20260518192547.600-10-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518192547.600-1-michal.wajdeczko@intel.com>
References: <20260518192547.600-1-michal.wajdeczko@intel.com>
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

Since addition of the MSI-X support, we mostly rely on the offset
calculations done by XE_MEMIRQ_STATUS_OFFSET. We don't use this
separate map pointing to the first status page anymore.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_memirq.c       | 2 --
 drivers/gpu/drm/xe/xe_memirq_types.h | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 4909dafe182d..9dfe965cb46e 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -219,11 +219,9 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
 
 	memirq->bo = bo;
 	memirq->source = IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_SOURCE_OFFSET(0));
-	memirq->status = IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_STATUS_OFFSET(0));
 	memirq->num_pages = num_pages;
 
 	memirq_assert(memirq, !memirq->source.is_iomem);
-	memirq_assert(memirq, !memirq->status.is_iomem);
 
 	memirq_debug(memirq, "pages: count %u size %zu\n", num_pages, bo_size);
 	memirq_debug(memirq, "page0: source %#x status %#x mask %#x\n",
diff --git a/drivers/gpu/drm/xe/xe_memirq_types.h b/drivers/gpu/drm/xe/xe_memirq_types.h
index 4ea3d1976d4f..c2b0b33d55cd 100644
--- a/drivers/gpu/drm/xe/xe_memirq_types.h
+++ b/drivers/gpu/drm/xe/xe_memirq_types.h
@@ -16,14 +16,12 @@ struct xe_bo;
  * @bo: buffer object with `Memory Based Interrupts Page Layout`_.
  * @num_pages: number of per-instance source/status pages.
  * @source: iosys pointer to `Interrupt Source Report Page`_.
- * @status: iosys pointer to `Interrupt Status Report Page`_.
  * @enabled: internal flag used to control processing of the interrupts.
  */
 struct xe_memirq {
 	struct xe_bo *bo;
 	unsigned int num_pages;
 	struct iosys_map source;
-	struct iosys_map status;
 	bool enabled;
 };
 
-- 
2.47.1

