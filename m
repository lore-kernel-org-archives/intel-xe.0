Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78048C9EC8C
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 02:52:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74CC110E451;
	Tue, 13 Jan 2026 02:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dxe8/0ff";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD5110E307
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 02:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768272758; x=1799808758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wrLzQkzTzT8fWvyCJFLLEV5DQ9jeCqiZEX0i0hblXvI=;
 b=Dxe8/0ffAIjXlx+n5NSemsO32mrZt2j3FnTsl2AoHqeD0mBYiDtcU7DV
 AfmgUhTksWVCJ9mjOTsz6x1ZaIJOaGvYNDPMsz4fmNNADNstmdjVVNzcG
 1L+cNDLP2cQxLVLhK6Q/DaGPnV+r4wURvdx/cWVUH9eYV1qQxWWH/pJAR
 HPdfu184Y8BkMWvBwiUNOKSWgHdTXYCcLf0rACi9dyMgmPqWz5lm1Z7Va
 dfUOcIvREItXOXlxLSrMUiUvkc8TzNyLzRP4mVOFQ3dnG2vjQt3m05GSF
 GsNyqfILbCcmZcyn/bRE88o38Z+RXSAK8Pi+F0u7yDpv36MJKDYtiOZz5 g==;
X-CSE-ConnectionGUID: IQ88RTnXSoemNkDBHQnwFg==
X-CSE-MsgGUID: c798HEIdTraGZXQWuBicIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69714525"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69714525"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 18:52:37 -0800
X-CSE-ConnectionGUID: hX9aA6NnR1mufFtpX0x2Rg==
X-CSE-MsgGUID: c7dbMDb7RDK2X6OyoWYutA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204070311"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 18:52:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com
Subject: [PATCH v4 02/12] drm/xe: Make usm.asid_to_vm allocation use GFP_NOWAIT
Date: Mon, 12 Jan 2026 18:52:22 -0800
Message-Id: <20260113025232.3504648-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260113025232.3504648-1-matthew.brost@intel.com>
References: <20260113025232.3504648-1-matthew.brost@intel.com>
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

Ensure the asid_to_vm lookup is reclaim-safe so it can be performed
during TLB invalidations, which is necessary for context-based TLB
invalidation support.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 694f592a0f01..bdb04d6bf39c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1654,7 +1654,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 		down_write(&xe->usm.lock);
 		err = xa_alloc_cyclic(&xe->usm.asid_to_vm, &asid, vm,
 				      XA_LIMIT(1, XE_MAX_ASID - 1),
-				      &xe->usm.next_asid, GFP_KERNEL);
+				      &xe->usm.next_asid, GFP_NOWAIT);
 		up_write(&xe->usm.lock);
 		if (err < 0)
 			goto err_close;
-- 
2.34.1

