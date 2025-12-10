Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F4AD3B9A9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 04:32:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F2410E65D;
	Wed, 10 Dec 2025 04:32:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FN0fFbRd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 563B410E65C
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 04:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765341142; x=1796877142;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=51bznLstXSeTDtQtSJk3zK1yzNxRaTuuWy5nu6XWbBk=;
 b=FN0fFbRdUxJquj1wNLljjzpUt1OjdtWE/Wcc1e7vLzr3MlckxgxYNgYY
 EJsnjpnsKC3TYSj7ZDuT/11wUrxsDFEccY3L1E9nrQyhimQl4mBd57WEF
 2GK/Ht+/TnJ2oBQG4pX+bPu1ck/+skOI5jmBYl+K1PD82wt+nq0pPfvdp
 dNmoTeTjnDKkydZhd1tzTi7u3OeOaIVc6C7ybR0XSvLy6o3/Ft6BxCx3n
 vc5Y3Q6fWU0/kqKJU/lBSf4mjwhfJgRA1S138DNDg72X6i3wlS+7uWm0y
 M8O1Ui1R5F34/scPcXqzgmSokwT5c4l+/AlpC7WdTurtq+48Z0OUH2Yrg Q==;
X-CSE-ConnectionGUID: gC9QFc+4Smeaywp74aJL9g==
X-CSE-MsgGUID: fO705KRYQJucwtzZ5I5c5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="78000062"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="78000062"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 20:32:22 -0800
X-CSE-ConnectionGUID: 7mIYVoZfTmqFFn1Xtdx3bA==
X-CSE-MsgGUID: BPq3WN4PQJKA2xayFWMBow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="196466663"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 20:32:21 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, pallavi.mishra@intel.com
Subject: [RFC v3 4/8] drm/xe/bo: Handle CPU faults on purged buffer objects
Date: Wed, 10 Dec 2025 10:00:48 +0530
Message-ID: <20251210043112.3267620-5-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210043112.3267620-1-arvind.yadav@intel.com>
References: <20251210043112.3267620-1-arvind.yadav@intel.com>
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

Return -EFAULT when CPU attempts to access a purged buffer object.
Purged BOs have their backing store reclaimed by the kernel, making
CPU access invalid. For mmap() users, this is reported as SIGBUS via
the usual VM_FAULT_SIGBUS conversion, matching i915 semantics.

Check xe_bo_is_purged() under dma-resv lock in the page fault
handler to prevent races. The fault handler returns VM_FAULT_SIGBUS
to signal the error to userspace.

v2:
  - Added xe_bo_is_purged(bo) instead of atomic_read.
  - Avoids leaks and keeps drm_dev_exit() while returning.

v3:
  - Move xe_bo_is_purged check under a dma-resv lock (Matthew Brost)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c161ac6420db..31b2fa490440 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2033,6 +2033,12 @@ static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
 		if (err)
 			break;
 
+		/* Purged BOs have no backing store - fault to userspace */
+		if (xe_bo_is_purged(bo)) {
+			err = -EFAULT;
+			break;
+		}
+
 		if (xe_ttm_bo_is_imported(tbo)) {
 			err = -EFAULT;
 			drm_dbg(&xe->drm, "CPU trying to access an imported buffer object.\n");
-- 
2.43.0

