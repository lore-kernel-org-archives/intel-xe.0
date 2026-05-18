Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510F4CD4F57
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 19:26:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F52210E801;
	Mon, 18 May 2026 19:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ALUbt+gi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A5210E7EF
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 19:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779132364; x=1810668364;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=GHFoHWCebyNnVnip0kC4f9EyUdAwoef4Ib1PN/iuHRg=;
 b=ALUbt+giqWhSx6oF5jjRq/vgttsOOAXb4jxizg/VTBvcpIh3brJydG3A
 gK2kEbxQo+YQeaUG/KZmDuSXb+XpoX8H4MrAnJt0MwDpSHW9BemUZKnut
 m84/As29GjOprb5IflqMOdO6tsNHBnjavDx8JIuawV8hrdJrRSp1X3UgK
 WscEo/yyMWxGezivE+vrjCDwX8tnimuuKXUgIq73tVxQ+YozQ/c5TYLha
 FDutt13evtzB5CyhXLZRMHyEdWwer3A60yDHX4TUc3mZNV7Lu/axZQR3i
 /dRUgsYsZtZNlDBzl0ZO8IGt58e0P1MQ5C8MQekTKi31SnMKku5vdB6ST g==;
X-CSE-ConnectionGUID: BL8Xl5ZBQhyVpAy2BiCbxg==
X-CSE-MsgGUID: DWyN+ma6RH27JuvxkhEvEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="90304798"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="90304798"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 12:26:04 -0700
X-CSE-ConnectionGUID: Sxk01G4JTZmPGi8xWZ2fuA==
X-CSE-MsgGUID: x01uRiL4RrigyAyMekS6/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="235276039"
Received: from johnmoon-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.112.169])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 12:26:03 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 8/9] drm/xe/memirq: Drop cached iosys_map for MEMIRQ mask
Date: Mon, 18 May 2026 21:25:46 +0200
Message-ID: <20260518192547.600-9-michal.wajdeczko@intel.com>
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

It is used occasionally and iosys_map_wr() helper takes an offset
parameter anyway. There is no extra benefit to keep a separate map.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/xe_memirq.c       | 5 ++---
 drivers/gpu/drm/xe/xe_memirq_types.h | 2 --
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
index 609e0f3220cc..4909dafe182d 100644
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

