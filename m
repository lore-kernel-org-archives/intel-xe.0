Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76D4D358D1
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 07:27:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8330D10E7D9;
	Thu, 29 Jan 2026 07:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ai9yFQhy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D4110E7D9
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 07:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769671643; x=1801207643;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WQey5LFp3pp2iulbdHFORMvyZIAfPBTqfYoHrk5r4fM=;
 b=Ai9yFQhyyT+waRr4WttSzcG7rGGoJlWzdUNa+VU3qnzne4l/9vALVaH1
 whpV8EaDsD+VfJ/T1k5kssgjAdaJ+pMK5aSie1tDCxjWC2798I7hDPhwI
 px0CAERty/5Rxj1UawpCN95bvLYYb9wcfXCRkOd24u4g6zQx8Xeva1W15
 uPXvbGwKLl/yfsqWiC5o3epmNJ4MTuo8zD27OtKJoQ1SfKvnyu5NXeWMd
 7KzhVyE2+ubVTs/rI3c0yMpsC45dc4rno4wy3BtBJ/+M/X98uizpvjjft
 QL6s/ZkUeF43gkYoJqR2D0Z+XIMOY3k6rG426QuHrebWnxs7/BYWc2F0K g==;
X-CSE-ConnectionGUID: 0iJyJLP+QVO51CQFCqu2yQ==
X-CSE-MsgGUID: RCly1qVcQl27FJG8wj6m4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="93561872"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="93561872"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 23:27:23 -0800
X-CSE-ConnectionGUID: sLvP7J/FRIi4LJM6/VFBfg==
X-CSE-MsgGUID: k9qIOdM2RP22tbk5x+9Y2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="212579505"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 23:27:23 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 3/3] Reapply "drm/xe/xe2: Enable Indirect Ring State support
 for Xe2"
Date: Wed, 28 Jan 2026 23:27:01 -0800
Message-ID: <20260129072706.2587551-8-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260129072706.2587551-5-julia.filipchuk@intel.com>
References: <20260129072706.2587551-5-julia.filipchuk@intel.com>
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

This reverts commit 03d85ab36bcbcbe9dc962fccd3f8e54d7bb93b35.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 779546ec8836..37dfbcc8f028 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -94,6 +94,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
 #define XE2_GFX_FEATURES \
 	.has_asid = 1, \
 	.has_atomic_enable_pte_bit = 1, \
+	.has_indirect_ring_state = 1, \
 	.has_range_tlb_inval = 1, \
 	.has_usm = 1, \
 	.has_64bit_timestamp = 1, \
-- 
2.51.0

