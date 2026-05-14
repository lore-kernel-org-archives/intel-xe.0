Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F77CD4F3C
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 15:00:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22D210F269;
	Thu, 14 May 2026 15:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ckyjaSCb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E01210F269
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 15:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778770831; x=1810306831;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YmrMQGBtXKVn1w16H4e9LvijAMJPGhEgqz96rSwvozo=;
 b=ckyjaSCbk8tLbvnh4NYt8t2Fr27druG+gsF75vMPno4qBOyqUUTf5Npa
 dIJlpPnbvkpWgH2MD1N5+YZpupjCnSgDj0Ra8FJyF1k/LkzbRx3mFpxlg
 wWQto0/H1AmpORHHEfQ2AAg1SzZwlQib4Ilot8F+h4Mp115RXmF+fu0BM
 1V37XzMWU4J80WLHiP3WrXoaj8mJLmleYMcavYlRge8/sIhU4PP0IjNLB
 VCTy7CEhyRU6Xh2I3ySp4dg1XXpX4HBs1LwqOJ2VJ5ltev6nCJ7wQE+i/
 dXavMV3NbM6ksKpEqGG4zbZQl8fSmmRFOTjEGXSnp1bjTGlITfZUwY8g7 w==;
X-CSE-ConnectionGUID: /K3iZ4F7R3uZH+PfGd2fkA==
X-CSE-MsgGUID: hiJKzhJCRgmARkcGgJvChQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="91178853"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="91178853"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 08:00:31 -0700
X-CSE-ConnectionGUID: hkAmQeM1QqafU8Q0ycR2Ow==
X-CSE-MsgGUID: 7cfrcwJ6Q6CKtFQHL7sbBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="262152877"
Received: from johnmoon-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.112.169])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 08:00:29 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 8/9] drm/xe/memirq: Drop cached iosys_map for MEMIRQ mask
Date: Thu, 14 May 2026 17:00:09 +0200
Message-ID: <20260514150010.7123-9-michal.wajdeczko@intel.com>
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

It is used occasionally and iosys_map_wr() helper takes an offset
parameter anyway. There is no extra benefit to keep a separate map.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_memirq.c       | 5 ++---
 drivers/gpu/drm/xe/xe_memirq_types.h | 2 --
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 7bc7dc106a79..65038571b6d5 100644
--- a/drivers/gpu/drm/xe/xe_memirq.c
+++ b/drivers/gpu/drm/xe/xe_memirq.c
@@ -220,12 +220,10 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
 	memirq->bo = bo;
 	memirq->source = IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_SOURCE_OFFSET(0));
 	memirq->status = IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_STATUS_OFFSET(0));
-	memirq->mask = IOSYS_MAP_INIT_OFFSET(&bo->vmap, XE_MEMIRQ_ENABLE_OFFSET);
 	memirq->num_pages = num_pages;
 
 	memirq_assert(memirq, !memirq->source.is_iomem);
 	memirq_assert(memirq, !memirq->status.is_iomem);
-	memirq_assert(memirq, !memirq->mask.is_iomem);
 
 	memirq_debug(memirq, "pages: count %u size %zu\n", num_pages, bo_size);
 	memirq_debug(memirq, "page0: source %#x status %#x mask %#x\n",
@@ -246,7 +244,8 @@ static void memirq_set_enable(struct xe_memirq *memirq, bool enable)
 	 * We only care about the GT_MI_USER_INTERRUPT from the engines and
 	 * the GuC does not look at the ENABLE mask at all.
 	 */
-	iosys_map_wr(&memirq->mask, 0, u32, enable ? GT_MI_USER_INTERRUPT : 0);
+	iosys_map_wr(&memirq->bo->vmap, XE_MEMIRQ_ENABLE_OFFSET, u32,
+		     enable ? GT_MI_USER_INTERRUPT : 0);
 
 	memirq->enabled = enable;
 }
diff --git a/drivers/gpu/drm/xe/xe_memirq_types.h b/drivers/gpu/drm/xe/xe_memirq_types.h
index eab384342878..4ea3d1976d4f 100644
--- a/drivers/gpu/drm/xe/xe_memirq_types.h
+++ b/drivers/gpu/drm/xe/xe_memirq_types.h
@@ -17,7 +17,6 @@ struct xe_bo;
  * @num_pages: number of per-instance source/status pages.
  * @source: iosys pointer to `Interrupt Source Report Page`_.
  * @status: iosys pointer to `Interrupt Status Report Page`_.
- * @mask: iosys pointer to Interrupt Enable Mask.
  * @enabled: internal flag used to control processing of the interrupts.
  */
 struct xe_memirq {
@@ -25,7 +24,6 @@ struct xe_memirq {
 	unsigned int num_pages;
 	struct iosys_map source;
 	struct iosys_map status;
-	struct iosys_map mask;
 	bool enabled;
 };
 
-- 
2.47.1

