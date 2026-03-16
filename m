Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6E0EFCBD5
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 07:23:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6784310E306;
	Mon, 16 Mar 2026 07:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c8Hj7aHW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D13B810E2FE
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Mar 2026 07:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773645798; x=1805181798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dMz9gxky277hIegot6eUiWfg4LVLemeokMnJMIbMVkI=;
 b=c8Hj7aHWTluP8Vjw9MALcqj1U3unnf3UwwbtGnfjcJ+0LxFe0T9R8hGG
 ZyoTgOCeCf5bRh6ba7KwFDXyGsQCC7hAco79I1h/ma4nUxPdBocmqvtc2
 fkKS1QHZdiPfIonz47FfjqgIGC3kuapMNvAX5yncDK27H2/wx+CYdfPbo
 /c4x2O4FqErxuVEcAXALlw5OrlWZzIWyLY+fiEyVx8U85ENUIdORGwYO9
 pXaDjpbUkLykQFQCSxwewTVky+t1Wvo1WOsJSh+73T3Avsfx/QcJEFnDJ
 Q3WB752UZnk8JPoqf9pUU/bxHuDt/WQpamAq3A7rkLoHpL9IcVS4lTG/X A==;
X-CSE-ConnectionGUID: 5xayRVXMTHqKOiMO0HrLIA==
X-CSE-MsgGUID: NZWMh3oAQsK1we6+XwqhNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="92038915"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="92038915"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 00:23:18 -0700
X-CSE-ConnectionGUID: xt2/YgOhSjOiP7Zu7WzEtw==
X-CSE-MsgGUID: ttspON/4Sm+WXmL3hNUOWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="226497599"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.31])
 by fmviesa005.fm.intel.com with ESMTP; 16 Mar 2026 00:23:17 -0700
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>, stable@vger.kernel.org,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 Mathew Alwin <alwin.mathew@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v5 2/2] drm/xe: Reject coh_none PAT index for CPU_ADDR_MIRROR
Date: Mon, 16 Mar 2026 07:22:57 +0000
Message-ID: <20260316072257.255372-3-jia.yao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316072257.255372-1-jia.yao@intel.com>
References: <20260129000147.339361-1-jia.yao@intel.com>
 <20260316072257.255372-1-jia.yao@intel.com>
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

Fixes: ada7486c5668 ("drm/xe: Implement madvise ioctl for xe")
Cc: stable@vger.kernel.org # v6.18
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Mathew Alwin <alwin.mathew@intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Jia Yao <jia.yao@intel.com>
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

