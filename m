Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDADD111A8
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 05:53:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A0CA10E2A9;
	Mon,  1 Dec 2025 05:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gUYANre+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B58D10E2A9
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 05:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764568435; x=1796104435;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OafG+5v+gTvq7tH2yx+42fZttnFHiCqn1hH93HbFD0s=;
 b=gUYANre+smMchQVtQ2xnf8PhDJ2llUcwDRoucSwy/Uq1ZpydTczjmtBI
 j0qsKx0MQCc5zLLmdnMj/yOfy9Lq2PsMLheC9GgkSb8xlcMzvgWBNMOH3
 0J14KzelU/QRv3spLlDGfG8/iQNXl7iB4fKIAown61k1FfDgBCkHD6C3a
 amYOChrI3etsol+5MohNw+lASogMg/cFkuzF10tSno3bwBsvloVX+F+Gq
 3pM3SdV2B2wioWSvsFdGJLuVfaRSmasjbIArQuIzkTjmrP2dxWjrMdgcb
 VvxNkj+ODip1NOW5vqMLWWf2LPgOSrzxl2ygyaVtHlhToE0knk01CCqfM g==;
X-CSE-ConnectionGUID: Oj2MNMycQPyVCuc3Lp1QUw==
X-CSE-MsgGUID: 8tm9SShPRx2EpVYyM9E9fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66457386"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66457386"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 21:53:55 -0800
X-CSE-ConnectionGUID: 0h5mbKTBTeOjO1okC3uPiQ==
X-CSE-MsgGUID: AymUcT1+QRC3/cbLY0qbag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="224950832"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 21:53:53 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, pallavi.mishra@intel.com
Subject: [RFC v2 5/9] drm/xe/bo: Handle CPU faults on purged buffer objects
Date: Mon,  1 Dec 2025 11:20:15 +0530
Message-ID: <20251201055309.854074-6-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201055309.854074-1-arvind.yadav@intel.com>
References: <20251201055309.854074-1-arvind.yadav@intel.com>
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

Modify the CPU page fault handler, `xe_bo_cpu_fault()`, to correctly
handle access to buffer objects that have been purged.

When a buffer object is in the `XE_MADV_PURGED` state, its backing
store has been reclaimed by the kernel. If the CPU attempts to access
this memory, it is an error that should be reported to the application.

v2:
  - Added xe_bo_is_purged(bo) instead of atomic_read.
  - Avoids leaks and keeps drm_dev_exit() while returning.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index f0b3f7a13114..7f5bcf114ed4 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1992,6 +1992,16 @@ static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
 	if (!drm_dev_enter(&xe->drm, &idx))
 		return ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
 
+	/*
+	 * BO content is gone. Signal the user process.
+	 * Once purged, BO remains permanently invalid (i915 semantics).
+	 * Application must destroy and recreate the BO.
+	 */
+	if (xe_bo_is_purged(bo)) {
+		ret = VM_FAULT_SIGBUS;
+		goto out;
+	}
+
 	ret = xe_bo_cpu_fault_fastpath(vmf, xe, bo, needs_rpm);
 	if (ret != VM_FAULT_RETRY)
 		goto out;
-- 
2.43.0

