Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0C6108E1F7
	for <intel-xe@archiver.kernel.org>; Thu, 19 Mar 2026 11:59:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646F010E983;
	Thu, 19 Mar 2026 11:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oJWfW29y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4848010E983
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Mar 2026 11:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773921574; x=1805457574;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0DX803sl68mWwpix+tTkv2yE1QmvygOqsICtFQ6AKH0=;
 b=oJWfW29y7Os/pyk3Hc8748PvvEij9Kl/M5yt07oZbYczAhyyS8c6GV6n
 CjTm0lB7e2L7u7YoI9WJt3PA64tQiUS+hZUtUeCA1Zr1Hfpkvwox9RUfr
 0nqpYWut0VGP++uq1AKQI2qo8eYVd0b3S06s31/TAFyP0vSkQD08R4QsN
 lIts2m5Y3x+rwQ1DYlnOqvsc3pzqQ7aff3O4mqwRRpoCTkaNySaDfnQ0a
 gJsHWJX0uyqycj1xoWaJrAJIBW/Mv0fvD4JxLCDlDHzgX1pqfdvbA+tpM
 4g4f78s5gdQfn4QLq6aURleBE6ONxrMBo1wBMqIv5X7MvxwXuhQqUnR0Q w==;
X-CSE-ConnectionGUID: dsNGH9sQTH+3i4qah+zxeA==
X-CSE-MsgGUID: Hfj+mQo9QTK+UUtvWNrjqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="78593945"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="78593945"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 04:59:23 -0700
X-CSE-ConnectionGUID: 0riXiJskQRuDboGamoaJsA==
X-CSE-MsgGUID: CpNlCEPHRoifXiBgZZT3rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="223160890"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.31])
 by orviesa007.jf.intel.com with ESMTP; 19 Mar 2026 04:59:04 -0700
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>, stable@vger.kernel.org,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 Mathew Alwin <alwin.mathew@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v7 2/2] drm/xe: Reject coh_none PAT index for CPU_ADDR_MIRROR
Date: Thu, 19 Mar 2026 11:58:58 +0000
Message-ID: <20260319115858.444541-3-jia.yao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319115858.444541-1-jia.yao@intel.com>
References: <20260129000147.339361-1-jia.yao@intel.com>
 <20260319115858.444541-1-jia.yao@intel.com>
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

Add validation in xe_vm_bind_ioctl() to reject PAT indices with
XE_COH_NONE coherency mode when used with
DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR, consistent with the existing
validation for DRM_XE_VM_BIND_OP_MAP_USERPTR.

CPU address mirror mappings use system memory which is CPU cached,
making them incompatible with COH_NONE PAT index. Using COH_NONE with
CPU cached buffers is a security issue: GPU can bypass CPU caches and
directly read stale sensitive data from DRAM, potentially leaking data
from previously freed pages.

Although CPU_ADDR_MIRROR mappings don't create actual memory mappings
(the range is reserved for dynamic mapping on GPU page faults), the
underlying system memory is still CPU cached, so the same PAT coherency
restrictions as MAP_USERPTR should apply.

v2:
- Correct fix tag

v6:
- No change

v7:
- Correct fix tag

Fixes: b43e864af0d4 ("drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR")
Cc: stable@vger.kernel.org # v6.18
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Mathew Alwin <alwin.mathew@intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Jia Yao <jia.yao@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5572e12c2a7e..1c4b4a5eeadb 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3491,7 +3491,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 		    XE_IOCTL_DBG(xe, obj &&
 				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
 		    XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
-				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
+				 (op == DRM_XE_VM_BIND_OP_MAP_USERPTR || is_cpu_addr_mirror)) ||
 		    XE_IOCTL_DBG(xe, comp_en &&
 				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
 		    XE_IOCTL_DBG(xe, op == DRM_XE_VM_BIND_OP_MAP_USERPTR &&
-- 
2.43.0

