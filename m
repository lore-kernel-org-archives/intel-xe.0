Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979BAECD983
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 16:15:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D8010E913;
	Thu,  5 Feb 2026 16:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dp2KoBoB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41CE410E913
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Feb 2026 16:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770308132; x=1801844132;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jSTGMS76wzaOXx16IoRmWUKxzuVmR27lmFqETn3KgOM=;
 b=Dp2KoBoBSzl+i9y6O6YJzB2VTmkBtXL4RSjp5o6NzmG2oUPkPWmitygI
 BH9b91yK7AHcmENI8wZbOylN0GAtvjT5fSllMJ1OzAOpUgllRw6op5ZW7
 yUtPC3/9JpI3IOuWJkSVtmgWpXU+AmfP1dE5iGVjR4J64+ZxFkRoKw1L0
 rJV2jHyEVtWX9uTlYVOpaShszxDgIFn5jNzHkm2f5IdceTwE2qhgr0dc4
 jXeZ+DvTctGl71DBk0X7uryvw4IMMIePbPktId52wlRSNzl1FkoNQNah7
 KRKpi3mGMIWOKc6YzDo4NbY5Nnj06OU6AbsTpglGPrZ5L8JFalQYFMUOt w==;
X-CSE-ConnectionGUID: F8pRZ+JHQCWJVgmhToNsnQ==
X-CSE-MsgGUID: 3MRAWYVIRVylnQQc138diQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="82142976"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="82142976"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 08:15:32 -0800
X-CSE-ConnectionGUID: fx2G/4XkS1GuMC2Xq9k9zg==
X-CSE-MsgGUID: 0fgGELw1QF6L/H6IXH+iSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="210379389"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.45])
 by orviesa009.jf.intel.com with ESMTP; 05 Feb 2026 08:15:32 -0800
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 stable@vger.kernel.org, Matthew Brost <matthew.brost@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3] drm/xe: Add bounds check on pat_index to prevent OOB
 kernel read in madvise
Date: Thu,  5 Feb 2026 16:15:29 +0000
Message-ID: <20260205161529.1819276-1-jia.yao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203172045.1154546-1-jia.yao@intel.com>
References: <20260203172045.1154546-1-jia.yao@intel.com>
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

When user provides a bogus pat_index value through the madvise IOCTL, the
xe_pat_index_get_coh_mode() function performs an array access without
validating bounds. This allows a malicious user to trigger an out-of-bounds
kernel read from the xe->pat.table array.

The vulnerability exists because the validation in madvise_args_are_sane()
directly calls xe_pat_index_get_coh_mode(xe, args->pat_index.val) without
first checking if pat_index is within [0, xe->pat.n_entries).

Although xe_pat_index_get_coh_mode() has a WARN_ON to catch this in debug
builds, it still performs the unsafe array access in production kernels.

v2(Matthew Auld)
- Using array_index_nospec() to mitigate spectre attacks when the value
is used

v3(Matthew Auld)
- Put the declarations at the start of the block

Fixes: ada7486c5668 ("drm/xe: Implement madvise ioctl for xe")
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Cc: <stable@vger.kernel.org> # v6.18+
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Jia Yao <jia.yao@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index add9a6ca2390..091e450b781c 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -246,6 +246,10 @@ static int xe_vm_invalidate_madvise_range(struct xe_vm *vm, u64 start, u64 end)
 
 static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madvise *args)
 {
+	s32 fd;
+	u16 pat_index;
+	u16 coh_mode;
+
 	if (XE_IOCTL_DBG(xe, !args))
 		return false;
 
@@ -261,7 +265,7 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
 	switch (args->type) {
 	case DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC:
 	{
-		s32 fd = (s32)args->preferred_mem_loc.devmem_fd;
+		fd = (s32)args->preferred_mem_loc.devmem_fd;
 
 		if (XE_IOCTL_DBG(xe, fd < DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM))
 			return false;
@@ -291,8 +295,11 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
 		break;
 	case DRM_XE_MEM_RANGE_ATTR_PAT:
 	{
-		u16 coh_mode = xe_pat_index_get_coh_mode(xe, args->pat_index.val);
+		if (XE_IOCTL_DBG(xe, args->pat_index.val >= xe->pat.n_entries))
+			return false;
 
+		pat_index = array_index_nospec(args->pat_index.val, xe->pat.n_entries);
+		coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
 		if (XE_IOCTL_DBG(xe, !coh_mode))
 			return false;
 
-- 
2.43.0

