Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19B3EB64DA
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jul 2023 02:01:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45ED10E055;
	Thu, 13 Jul 2023 02:01:48 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC8410E055
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jul 2023 02:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689213706; x=1720749706;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RKwxjFdELaHbibqOo5/+kqH4g6/c+ixpMOc61ivKy/s=;
 b=KfDuSOJOLEUU5rpMUeoDnXg0ILnYJnOduZp5IQkGlz+1l+/LOTKM8KhW
 ED6jNdlZ5VJPctbIESFB5LO6His+aSBcZyovbJcorhEBBSnnCKjHLT7L7
 mcMi/aasQPxh5ioO1ls28Ao3NiBeI51GjkPX/C/tpioQvdbgLLNwty04y
 Zw5GoZZNgIbNRzrGaCDchnVsFg1frxNJVDPaJbmMPJxDXwyVSowgV8srg
 qXGDMG5C2gjnP96+cMFiAyAPyof3Cmvi3KpimTXEhl6ppkJ1jhMLxDmRe
 Cr1iLwTUkJsO2dZ4ZZhVr+vNqhbPcWuu14QWRHrYsypkxM3rGDeuDb2EY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="349913499"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; d="scan'208";a="349913499"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 19:01:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="725110316"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; d="scan'208";a="725110316"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 19:01:45 -0700
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 12 Jul 2023 19:01:44 -0700
Message-Id: <20230713020144.21594-1-brian.welty@intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Fix BUG_ON during bind with prefetch
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

It was missed that print_ops needs to include DRM_GPUVA_OP_PREFETCH.

Else we hit the impossible BUG_ON:
[  886.371040] ------------[ cut here ]------------
[  886.371047] kernel BUG at drivers/gpu/drm/xe/xe_vm.c:2234!
[  886.371216] invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
[  886.371229] CPU: 1 PID: 3132 Comm: xe_exec_fault_m Tainted: G        W          6.4.0-xe+ #16
[  886.371257] RIP: 0010:vm_bind_ioctl_ops_create+0x45f/0x470 [xe]
...
[  886.371517] Call Trace:
[  886.371525]  <TASK>
[  886.371531]  ? __die_body+0x1a/0x60
[  886.371546]  ? die+0x38/0x60
[  886.371557]  ? do_trap+0x10a/0x120
[  886.371568]  ? vm_bind_ioctl_ops_create+0x45f/0x470 [xe]

Fixes: d39e49e2ad38 ("drm/xe: Port Xe to GPUVA")
Signed-off-by: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 6c216350084b..f96690e868aa 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2230,6 +2230,8 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
 		       (ULL)xe_vma_start(vma), (ULL)xe_vma_size(vma),
 		       op->unmap.keep ? 1 : 0);
 		break;
+	case DRM_GPUVA_OP_PREFETCH:
+		break;
 	default:
 		XE_BUG_ON("NOT POSSIBLE");
 	}
-- 
2.38.0

