Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D9B1061B08
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 21:16:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951B910E7F5;
	Mon, 30 Mar 2026 21:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DPobWq0s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A00010E7F5
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Mar 2026 21:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774905415; x=1806441415;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IeIS/O7To4l0ZNjGrK1MJ+sK0JBCVeQMpI/yvDs7YDQ=;
 b=DPobWq0sbTIMd6mrWSW2Fxq1uxFrackABdDBwHRcoqkrjYiNz/nyMnwe
 +DeUr0xj3yPBGBFEc5IfDUb3peI6CkNm1DAHGextUYwaNR0CANoHZFf4z
 gQOQxxOD0e/SrsxaLNuJsYcEV0e2lM/9/gz/T0U1wCL7Qn32McoUf5lnn
 qNO5H73rTqEJsskbjfrNP3NZOmSK4aRm2sV/k+UqLB85aPqGv6+sjMG1q
 lAoiid1lzJ/3i0ZLT87ibe0lF4VaVESofKpsLD6d9mcQsp18sWX6HXzNS
 PQMwXMbSJ96i8sm1eTHaAnYfwVK4a6MGM+HBRnTHcIDQWYtpO3ajqoOWe A==;
X-CSE-ConnectionGUID: EZyKaEaBTaCxiO3L5AY6fA==
X-CSE-MsgGUID: 69sUf65dSSypmzlwm/v3Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="79810113"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="79810113"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 14:16:55 -0700
X-CSE-ConnectionGUID: V3iPDdlmRQqqmsUehHHqLg==
X-CSE-MsgGUID: L6Zv7QsKS0+k7tvUROgJmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="225181194"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by orviesa006.jf.intel.com with ESMTP; 30 Mar 2026 14:16:54 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Chen Ni <nichen@iscas.ac.cn>
Subject: [FOR CI][PATCH] drm/xe/xe_vm: Convert comma to semicolon
Date: Mon, 30 Mar 2026 21:02:53 +0000
Message-ID: <20260330210252.3046635-2-shuicheng.lin@intel.com>
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

From: Chen Ni <nichen@iscas.ac.cn>

Using a ',' in place of a ';' can have unintended side effects.
Although that is not the case here, it seems best to use ';'
unless ',' is intended.

Found by inspection.
No functional change intended.
Compile tested only.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/gpu/drm/xe/xe_vm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 56e2db50bb36..72559bd33946 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -634,9 +634,9 @@ void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_pagefault *pf)
 	e->address_precision = SZ_4K;
 	e->access_type = pf->consumer.access_type;
 	e->fault_type = FIELD_GET(XE_PAGEFAULT_TYPE_MASK,
-				  pf->consumer.fault_type_level),
+				  pf->consumer.fault_type_level);
 	e->fault_level = FIELD_GET(XE_PAGEFAULT_LEVEL_MASK,
-				   pf->consumer.fault_type_level),
+				   pf->consumer.fault_type_level);
 
 	list_add_tail(&e->list, &vm->faults.list);
 	vm->faults.len++;
-- 
2.43.0

