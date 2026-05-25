Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A95CD5BBF
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 04:26:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B256C10E02F;
	Mon, 25 May 2026 04:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fJuGHh03";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCF210E02F
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 04:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779683214; x=1811219214;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Dy6w5ivJ3kIW7ZCJpcAz4K3bUc9CLwQI8s+iGG0ObMw=;
 b=fJuGHh03SYgWrbN5DHzSnYjZYmMQ15u6ItSJQdjs9dGMuFsqgdZor0JO
 iXPyEQ/I709+hDHCPhP0EtIwQNxnqxFv22TJoA/KL655FTjVoyrMz/I9I
 6u0a1x7wiJgtElt385puglZwG/qqiWzQdkFPqMv88c48X6mGUNneyKobe
 MrWmPPpHHAFDYDPsomsI+eLhKTZqnlBPjAtfp17cddM5EZKPoaunXsCzF
 66pWjwvkNv09wt1vgAHM53Oloyb0gkCYIJmmyVSgwNNQrDFiOwjE9KLrx
 S4xZPRg2dHH8Hq2AP3AxVcwueOnm/lVL915TGobgGP6oCPeMHF/OM/Zfs Q==;
X-CSE-ConnectionGUID: XwPPGAi4ROGEDb6LKJVfAw==
X-CSE-MsgGUID: JMLlAFwoQbmieo+ffYJ7kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="84388859"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="84388859"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2026 21:26:54 -0700
X-CSE-ConnectionGUID: ZvlRt8wzQlS2ucI2xhp73w==
X-CSE-MsgGUID: L1/wmVkiR9S3xFn6ReWWpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="238920316"
Received: from pgurram-desk.iind.intel.com ([10.190.238.70])
 by fmviesa008.fm.intel.com with ESMTP; 24 May 2026 21:26:53 -0700
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Pravalika Gurram <pravalika.gurram@intel.com>,
 Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH v1] drm/xe: Fix decompress validation in
 vm_bind_ioctl_check_args
Date: Mon, 25 May 2026 10:12:39 +0530
Message-ID: <20260525044239.83893-1-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.43.0
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

The validation logic for decompress operations was inverted. It was
allowing decompress to happen even when compression support wasn't
enabled in the PAT index, which caused the GPU to try decompressing
uncompressed data.

Missing negation operator (!) was the culprit. Now it properly rejects
decompress when compression isn't available:
- is_decompress=1 + comp_en=0 → REJECT (was allowing before)
- is_decompress=1 + comp_en=1 → ALLOW

This fixes the exec queue reset storms we were seeing during VM bind ops.

Fixes: 2b484419700a ("drm/xe: implement VM_BIND decompression in vm_bind_ioctl")

Cc: Nitin Gote <nitin.r.gote@intel.com>
Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index b01f31ed4417..758138dbcc90 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3677,7 +3677,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 		    XE_IOCTL_DBG(xe, op != DRM_XE_VM_BIND_OP_MAP &&
 				 (is_decompress || is_null || is_cpu_addr_mirror)) ||
 		    XE_IOCTL_DBG(xe, is_decompress &&
-				 xe_pat_index_get_comp_en(xe, pat_index)) ||
+				 !xe_pat_index_get_comp_en(xe, pat_index)) ||
 		    XE_IOCTL_DBG(xe, !obj &&
 				 op == DRM_XE_VM_BIND_OP_MAP &&
 				 !is_null && !is_cpu_addr_mirror) ||
-- 
2.43.0

