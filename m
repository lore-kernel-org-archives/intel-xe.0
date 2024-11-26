Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FFFD65548
	for <intel-xe@archiver.kernel.org>; Tue, 26 Nov 2024 18:13:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCA310E993;
	Tue, 26 Nov 2024 18:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fcgZDraF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2CC10E993
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Nov 2024 18:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732644837; x=1764180837;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/i3+h1awJGQqs17lzBBDvl8WRlndNoTgou2adlItUAE=;
 b=fcgZDraFtZjQpFrC0IXx8OdVBJiG8tViIpE4Vi0xZwhseyNXS3x4sdy0
 BUw+K02T2dqTQAm53e0eQLtEaJHn6MhLUcMaMVsoJD6g6QTYK+XJzURfA
 X7qqYSwJnpkKus9e1vM8vGAT8cNEEzrxVL276M661e1kulqI+qoYh40GH
 pAW/i/7fNybtpfznUi4EI8Abp7dJAeqwBj7cNTXg0edc1MXpTy/ICmW3f
 1hO2dmVvxOgVLZh9D9lmVUCeiNYKj/ZtHAWmfZ/0NROaAlMAZbw//DS4H
 NIquKPjgCPMne/SDNItLe+m2+j9TZrtAWdmWuTtKmWZWemlRQI1tcVbj5 Q==;
X-CSE-ConnectionGUID: 90ws9mlLQ2qW2+iIeou4vg==
X-CSE-MsgGUID: wFPasR5WTpyzhLgpZxCqAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32197191"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="32197191"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 10:13:56 -0800
X-CSE-ConnectionGUID: BlwS6kv4TSqPiH68QOdk1w==
X-CSE-MsgGUID: qOGfTqo9TNSpVhXQqnCIHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="91642696"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.145])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 10:13:55 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 stable@vger.kernel.org
Subject: [PATCH 1/2] drm/xe/migrate: fix pat index usage
Date: Tue, 26 Nov 2024 18:13:00 +0000
Message-ID: <20241126181259.159713-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.47.0
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

XE_CACHE_WB must be converted into the per-platform pat index for that
particular caching mode, otherwise we are just encoding whatever happens
to be the value of that enum.

Fixes: e8babb280b5e ("drm/xe: Convert multiple bind ops into single job")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: <stable@vger.kernel.org> # v6.12+
---
 drivers/gpu/drm/xe/xe_migrate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index cfd31ae49cc1..48e205a40fd2 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1350,6 +1350,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 
 	/* For sysmem PTE's, need to map them in our hole.. */
 	if (!IS_DGFX(xe)) {
+		u16 pat_index = xe->pat.idx[XE_CACHE_WB];
 		u32 ptes, ofs;
 
 		ppgtt_ofs = NUM_KERNEL_PDE - 1;
@@ -1409,7 +1410,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 						pt_bo->update_index = current_update;
 
 					addr = vm->pt_ops->pte_encode_bo(pt_bo, 0,
-									 XE_CACHE_WB, 0);
+									 pat_index, 0);
 					bb->cs[bb->len++] = lower_32_bits(addr);
 					bb->cs[bb->len++] = upper_32_bits(addr);
 				}
-- 
2.47.0

