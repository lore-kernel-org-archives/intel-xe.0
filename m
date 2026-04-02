Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2058CC6B3A
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 09:16:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E3B10F117;
	Thu,  2 Apr 2026 09:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iotKKl/F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B4B910F117
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 09:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775121390; x=1806657390;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AztiPs5S9VA3snwSOj1X1fMakFzfMHl7HwuHgGJ/BCs=;
 b=iotKKl/FMY6BriQwarENAr/T1alORdL95VCDIaSaRjpfNYEIZWF4WKG8
 PxLOaY33Hc0LYhQObGj06p/ZcqUsfdqQD5unpwXZn9bJVo4zim+4r45B1
 CFy++4ji1p8wnoFzqWq57jPqS1rxax9unLhw79Or09CrugIJgxwdyMUBn
 nndkgPt5I7RXTzhsKgUDOg5zTNQe4VfyzFQ/Pp9zv7Mq69Hgn+cYAHVU1
 DcfuOnMV03z5oSTB6QMQWXdvJu82rw22QCKON7TKBJkRtVlz7aLmBQ0wG
 KJ8Dc+j1qnGvgzXyOhQsQSfjA3+Rr12u+2lzhmCgPgJUoGiXXdL6R2F2B A==;
X-CSE-ConnectionGUID: dwj1bveAS/an4ATvhZ+WlA==
X-CSE-MsgGUID: njFaOvM+Ra2KBA1nyeEPMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76066651"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="76066651"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 02:16:30 -0700
X-CSE-ConnectionGUID: gHLcrzBuRkGnlq4p7I8C0Q==
X-CSE-MsgGUID: et2+fDOoQ2m8VfdJPQkB7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="264867194"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.32])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 02:16:28 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, stable@vger.kernel.org
Subject: [PATCH] drm/xe: Fix slab-out-of-bounds on PT update ops retry
Date: Thu,  2 Apr 2026 11:15:39 +0200
Message-ID: <20260402091539.4114-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.53.0
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

xe_pt_update_ops_prepare() calls xe_pt_update_ops_init() at the start of
each invocation to reset per-attempt state, but current_op was not
included in that reset. When vm_bind_ioctl_ops_execute() retries due to
ww-mutex contention (drm_exec_retry_on_contention), ops_execute() calls
xe_pt_update_ops_prepare() again. The second call walks the same op list
and fills ops[] starting from current_op, which still holds the value
from the first attempt. This indexes past the end of the ops array
allocated by xe_vma_ops_alloc(), whose size was computed for a single
pass.

KASAN reported:
  BUG: KASAN: slab-out-of-bounds in bind_op_prepare+0x89c/0xae0 [xe]
  Write of size 8 at addr ffff88812e72bae8 by task xe_evict/2848
  [...]
  bind_op_prepare+0x89c/0xae0 [xe]
  xe_pt_update_ops_prepare+0xbd0/0x1570 [xe]
  ops_execute+0x3ae/0x2030 [xe]
  vm_bind_ioctl_ops_execute+0x4d5/0xed0 [xe]

The write lands at ops[1].vma (offset 360 into the second element of a
one-element 384-byte allocation) because entries[] is exactly 360 bytes
and current_op was 1 at the start of the retried prepare pass.

Fix by resetting current_op to 0 in xe_pt_update_ops_init().

Fixes: e8babb280b5e ("drm/xe: Convert multiple bind ops into single job")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: <stable@vger.kernel.org> # v6.12+
Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 8e5f4f0dea3f..3607cd57fc4c 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -2291,6 +2291,7 @@ xe_pt_update_ops_init(struct xe_vm_pgtable_update_ops *pt_update_ops)
 	init_llist_head(&pt_update_ops->deferred);
 	pt_update_ops->start = ~0x0ull;
 	pt_update_ops->last = 0x0ull;
+	pt_update_ops->current_op = 0;
 	xe_page_reclaim_list_init(&pt_update_ops->prl);
 }
 
-- 
2.53.0

