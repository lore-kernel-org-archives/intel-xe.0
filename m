Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383E5CD4851
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 15:00:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF4C10E166;
	Thu, 14 May 2026 15:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m+w8BMvp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8421C10F269
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 15:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778770832; x=1810306832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aSNioQFwSdJzFE/HLM+lQxpDakW8cg3iH39X4uq+mIo=;
 b=m+w8BMvp4fBwbTmE/b6N9MMruWAgBlHi8Zwl79DW6nv0hUtc29fR3dOJ
 ih9Mn07ZQUdGlFmU3MLeJ1OGbD+9fdOIAmPE0Q5ZS+MhpJyGBdPb46/KE
 eJvRo5SXk/70t0Yze+d0MJ3wAS7pABN7+Dv3GSf1Z5JZuN2bb2u7oquVn
 369Tuylqy3LozpuBrSkA8tCyhIo30C48y7rQTMcZVbgh21XapAhl8w/Nz
 XbKqmjZUwolozicz4nHofotzMJJd1G4DT17WUtJOuOOlmkvJ3jvSajLAR
 Q//9bkQADdDcSna1bPSUsJ8mLhMkayVFaIEVaFLYPl+SYfDWiIKpkhDeY Q==;
X-CSE-ConnectionGUID: xMciLaQSQuWCMPfqV9iAJw==
X-CSE-MsgGUID: Tt8U52ENRUSa0tgheQGiiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="91178854"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="91178854"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 08:00:32 -0700
X-CSE-ConnectionGUID: KXUmbrSbT4WjcP6Gt/Ie3g==
X-CSE-MsgGUID: BFYGQZOtRW6SLYDEAYMNeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="262152882"
Received: from johnmoon-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.112.169])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 08:00:30 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 9/9] drm/xe/memirq: Drop cached iosys_map for MEMIRQ status
Date: Thu, 14 May 2026 17:00:10 +0200
Message-ID: <20260514150010.7123-10-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260514150010.7123-1-michal.wajdeczko@intel.com>
References: <20260514150010.7123-1-michal.wajdeczko@intel.com>
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
---
 drivers/gpu/drm/xe/xe_memirq.c       | 2 --
 drivers/gpu/drm/xe/xe_memirq_types.h | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 65038571b6d5..7fe1b00a0607 100644
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

