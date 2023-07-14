Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5A1C001DE
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jul 2023 00:02:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F0B10E05E;
	Fri, 14 Jul 2023 00:02:27 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE9510E05E
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jul 2023 00:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689292945; x=1720828945;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OpEtWyh+vcYW0Mov3KqgTrNOjzpMhjNRROyWpBUs6Vs=;
 b=Vxx0PfY5lGxT4VAmfQzZW6sQyr4Eu6EoNqRrKLOKRuM0lWr8R4Bk51Zn
 s0VZ9M4GBCogLeMH4UVuuhSiHqyCWJN+R4A3+QkJa8E/hTWc9Q4/Bqm1b
 VP8N+g2+lP4Q7S+nH3Xy5vFwLPxvd8yuPTpNwnSr2igOvFtAS9N45FubF
 7rpKb5zNOAu7gBb26M6GC7RqFTtyJ7SHtKHLGWvvClb0dJ2ATAKLQsiUE
 KSw/R1uur9lAr71ul6a0RuyFCYG90b9kbD4/ZmAQNRgkRb8NeWoCyKk29
 vhcX2kA4PMqyeQoyr7hMMSTsTlJ4UzoyYz4tTQcZW1Y1fT6slxmEYV32O w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="350218122"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; d="scan'208";a="350218122"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 17:02:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="722178673"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; d="scan'208";a="722178673"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2023 17:02:23 -0700
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 13 Jul 2023 17:02:22 -0700
Message-Id: <20230714000222.12396-1-brian.welty@intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe: Fix BUG_ON during bind with prefetch
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

It was missed that print_op needs to include DRM_GPUVA_OP_PREFETCH.

Else we hit the impossible BUG_ON:
[  886.371040] ------------[ cut here ]------------
[  886.371047] kernel BUG at drivers/gpu/drm/xe/xe_vm.c:2234!
[  886.371216] invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
[  886.371229] CPU: 1 PID: 3132 Comm: xe_exec_fault_m
[  886.371257] RIP: 0010:vm_bind_ioctl_ops_create+0x45f/0x470 [xe]
...
[  886.371517] Call Trace:
[  886.371525]  <TASK>
[  886.371531]  ? __die_body+0x1a/0x60
[  886.371546]  ? die+0x38/0x60
[  886.371557]  ? do_trap+0x10a/0x120
[  886.371568]  ? vm_bind_ioctl_ops_create+0x45f/0x470 [xe]

v2: add debug print for PREFETCH in print_op

Fixes: d39e49e2ad38 ("drm/xe: Port Xe to GPUVA")
Signed-off-by: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 6c216350084b..fc4d54425160 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2230,6 +2230,11 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
 		       (ULL)xe_vma_start(vma), (ULL)xe_vma_size(vma),
 		       op->unmap.keep ? 1 : 0);
 		break;
+	case DRM_GPUVA_OP_PREFETCH:
+		vma = gpuva_to_vma(op->prefetch.va);
+		vm_dbg(&xe->drm, "PREFETCH: addr=0x%016llx, range=0x%016llx",
+		       (ULL)xe_vma_start(vma), (ULL)xe_vma_size(vma));
+		break;
 	default:
 		XE_BUG_ON("NOT POSSIBLE");
 	}
-- 
2.38.0

