Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473A5CCF9E0
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 12:25:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C54C10E5FB;
	Tue, 28 Oct 2025 12:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fVKazhZB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D644D10E5CB
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 12:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761654318; x=1793190318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jb9/yjmVH/ebvr9wJXmGp+iZ5pfcwwDVtMmUUMOJVyM=;
 b=fVKazhZBoRMSQooXDcbpClSxkIe3JPpkz6zPHEnkfSztj6LJ7u7WrsCj
 timtTeyoIQxCVtMGYZShNldhQ7RiqaTzmbgLbnwXmrXAPsxPA6DtmUQgZ
 CFsB0mDMkVrZ5yFf5W82tbW6Bm6HPQUptVeben3Cm9pYiMMW7dZej4kvd
 /OoT/VO7DsOn5WR2pr6mH9p7comQxExsQy56e05SSD9DZwRv+c5EigaGR
 WjQV/MeE6pyGSt4OQNFAAZUqYGY+RBKC1hYa2QCnT0f3hZqX7JCQcbBUS
 OvqKh4GmgKDxwn6CvepgT+7EFCRJcJ3AzcXPq9J3O41HWa0UwewOAElpm A==;
X-CSE-ConnectionGUID: R5h8P/CxRzuk4fNdtcVEDA==
X-CSE-MsgGUID: RtBQqlLbSAmzzqMzyTJgpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62956648"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="62956648"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 05:25:18 -0700
X-CSE-ConnectionGUID: OpCWLaDkTLOyZL5aDEgJdg==
X-CSE-MsgGUID: BlNNrSsmS36tvhr94r8cGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="190524486"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 05:25:16 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [RFC PATCH 9/9] drm/xe: Add support for querying purgeable BO states
Date: Tue, 28 Oct 2025 17:54:15 +0530
Message-ID: <20251028122415.1136721-10-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028122415.1136721-1-arvind.yadav@intel.com>
References: <20251028122415.1136721-1-arvind.yadav@intel.com>
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

Add support for querying purgeable buffer object states through the
XE_VM_QUERY_MEM_RANGE_ATTRS ioctl. This allows userspace to determine
the current purgeable state of BO:
 - WILLNEED: BO is actively needed and re-validate if purged
 - DONTNEED: BO is not currently needed and may be purged
 - PURGED: BO has been purged by the kernel due to memory pressure

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index b8d60550c191..7d58f89dc415 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2014,6 +2014,7 @@ static int get_mem_attrs(struct xe_vm *vm, u32 *num_vmas, u64 start,
 
 	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
 		struct xe_vma *vma = gpuva_to_vma(gpuva);
+		struct xe_bo *bo;
 
 		if (i == *num_vmas)
 			return -ENOSPC;
@@ -2026,6 +2027,10 @@ static int get_mem_attrs(struct xe_vm *vm, u32 *num_vmas, u64 start,
 		attrs[i].preferred_mem_loc.migration_policy =
 		vma->attr.preferred_loc.migration_policy;
 
+		bo = xe_vma_bo(vma);
+		if (bo)
+			attrs[i].purge_state_val.val = atomic_read(&bo->madv_purgeable);
+
 		i++;
 	}
 
-- 
2.43.0

