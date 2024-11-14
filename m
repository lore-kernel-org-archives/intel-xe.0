Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CFAD637D9
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 02:24:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7941E10E794;
	Thu, 14 Nov 2024 02:24:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JRIJFuuZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08AE410E0E6
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 02:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731551091; x=1763087091;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=P/bbItVDwPdykY0uPBwuT+CV1JY0ZZMIC55puf9s2Q0=;
 b=JRIJFuuZQ7NWtQ8knPrsFT2LaMtWh2jh0IjQf0pKrIx6xiw/n9Ivh7K9
 YqBe21uA3AWuI/s11guB0v2CjB9zECuMYSJYPorZns+xnQ9i2AZmKsI7o
 UJmIkU4W4UH/M8mIIxRuv5h/aGbqs0PoiPyadKrvNuytzxHuZYI+OD2a+
 8TVsu1SOCpi38ZnulXsOSlQJaHvzh4x3WZPJZ2VTV+i6HsFfjuEydoH2B
 XZJR//ItMpnOEFqncOlyZJajXq27OO2f9NaaZ6YeYDY0h8T87kGnZf3Di
 hg89J+XcuSqyXYsTLOMbUXKISkpr5bcShrPncXuWbH22ZwhsluOR28WmP A==;
X-CSE-ConnectionGUID: 8sxRaHGFSOuiWIewrJIagQ==
X-CSE-MsgGUID: e7MB2XhHTea+V41Q+CGFKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="31576658"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="31576658"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 18:24:50 -0800
X-CSE-ConnectionGUID: FqKK2mnYTHekVyKIY136ug==
X-CSE-MsgGUID: O/VIz/1zQn+vhcEsw8DnaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="93110571"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 18:24:50 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 2/7] drm/xe: Add ring address to LRC snapshot
Date: Wed, 13 Nov 2024 18:25:17 -0800
Message-Id: <20241114022522.1951351-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114022522.1951351-1-matthew.brost@intel.com>
References: <20241114022522.1951351-1-matthew.brost@intel.com>
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

The ring is currently in LRC BO but this may change going forward.
Include the ring address in the snapshot protecting again any future
changes.

v2:
 - s/ring_desc/ring_addr (Jonathan)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 3 +++
 drivers/gpu/drm/xe/xe_lrc.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index e0d80e8201eb..cc77e5132157 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1636,6 +1636,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 		xe_vm_get(lrc->bo->vm);
 
 	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
+	snapshot->ring_addr = __xe_lrc_ring_ggtt_addr(lrc);
 	snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
 	snapshot->head = xe_lrc_ring_head(lrc);
 	snapshot->tail.internal = lrc->ring.tail;
@@ -1693,6 +1694,8 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
 		return;
 
 	drm_printf(p, "\tHW Context Desc: 0x%08x\n", snapshot->context_desc);
+	drm_printf(p, "\tHW Ring address: 0x%08x\n",
+		   snapshot->ring_addr);
 	drm_printf(p, "\tHW Indirect Ring State: 0x%08x\n",
 		   snapshot->indirect_context_desc);
 	drm_printf(p, "\tLRC Head: (memory) %u\n", snapshot->head);
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 9d64cedc4d14..37ca321ed492 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -25,6 +25,7 @@ struct xe_lrc_snapshot {
 	unsigned long lrc_size, lrc_offset;
 
 	u32 context_desc;
+	u32 ring_addr;
 	u32 indirect_context_desc;
 	u32 head;
 	struct {
-- 
2.34.1

