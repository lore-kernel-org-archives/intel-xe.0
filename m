Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6159CCD183
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 23:04:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5148610E85D;
	Thu,  2 Oct 2025 23:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NI5nhUY/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C5610E85C
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 23:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759446288; x=1790982288;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=npsTKUw/iZTvYtXk2CtYlwEGauOz6DEDplIz4tZtheI=;
 b=NI5nhUY/IIe+XBbgXLiMVwFr8VYX9Ng25AskAEgntJYN2Qr0x6ehmjuu
 +uC8GIBOr46FB3DPSleG67uIysRiHtXtTebFJ7/SqnKA84iYWtAG8cNCj
 9M8Ki4vUvXkJkBZsM3AykZ5gYWGl1kk7DHJLq2fzBqoNG0qUoN2ibjbpo
 q/5myMA+CsuBE/74o7PMvDphEEIGWiVM1Q+oUBNyEDfaKMPK1+l1v+jQO
 YBAPMlJyUEmxOnrXLyLCZoFR4jFU5KxuzsERbasWgjvkfdJqET6G1/aoM
 0ODj4bWqFq7jBH1dLFyAhESncFHVxweH6Jk4i6MrOyLab4ucATrA/RWFO Q==;
X-CSE-ConnectionGUID: NDBKw0s5Tiq4hHhY4rTTNQ==
X-CSE-MsgGUID: Ny3Utcq+TMu0j2bc9VYTyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="79165582"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="79165582"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 16:04:47 -0700
X-CSE-ConnectionGUID: VgEgsV0FRRi7i7NGZ5WyZQ==
X-CSE-MsgGUID: vdEiLwxKQ+OD0TOKOYKCuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="179566728"
Received: from dut4351arlh.fm.intel.com ([10.105.10.106])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 16:04:46 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 5/7] drm/xe: Handle missing migration VM on VM creation
Date: Thu,  2 Oct 2025 23:04:42 +0000
Message-Id: <20251002230444.313505-6-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002230444.313505-1-stuart.summers@intel.com>
References: <20251002230444.313505-1-stuart.summers@intel.com>
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

Theoretically, a user could attempt to create a VM
while the migration VM is for some reason being
destroyed such that the xe_vm_create() routine gets
called, but when we assign a migration exec queue
to that VM, the VM for that migration exec queue is
no longer there. Add an error check here for that
case.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index c31bc8411a71..6baa19b8051c 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -326,6 +326,9 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
 	struct xe_vm *migrate_vm;
 
 	migrate_vm = xe_migrate_get_vm(tile->migrate);
+	if (!migrate_vm)
+		return ERR_PTR(-ENODEV);
+
 	if (xe->info.has_usm) {
 		struct xe_hw_engine *hwe = xe_gt_hw_engine(gt,
 							   XE_ENGINE_CLASS_COPY,
-- 
2.34.1

