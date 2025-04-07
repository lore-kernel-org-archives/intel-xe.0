Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870EBC36010
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 09:53:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF4D10E40A;
	Mon,  7 Apr 2025 09:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dRXwnRPQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC7B10E406
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 09:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744019612; x=1775555612;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AQoCgvoxI/flcYy0CrDrzpEMThjEurAJQBWHUqupZKY=;
 b=dRXwnRPQ8YudA/sLkBx7hJbTRQo5yz5kqMo7ARbhB0SqhlNCFuuMGCCm
 Fe8Sxkp4moWNq8FiFwBcHTaWIcXrbaK3nQ6B+jH5KEeziObwJpj0gEkXu
 qypxrtL+fr7GtiRPvXCTZGrQ0flXqLyWAz48gUwmh0jJPFjwEyjKB9n7x
 Ck70WG4USNqfZqlk3iytSO+S/mQPeaHpsuTu84JOjCvgi63LiEYcc50Lq
 BUCs6VVqlPORBI/YYI4gOJyTH5u8lg2Ala1hpihxxZe+mXeXudmScUhA2
 ly8ZyRsphsVA0NMFbXR7Gfe752ZSEhfhfeNjVyvyXBBgUa5JnsulFVm6F w==;
X-CSE-ConnectionGUID: EGDCW10XQgayfza4iMRGqw==
X-CSE-MsgGUID: C4xl2lvwTyuIaFwWKE3ZZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56029461"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="56029461"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 02:53:32 -0700
X-CSE-ConnectionGUID: o19kJMMARWOfrcMI/teNqA==
X-CSE-MsgGUID: C2QiY/q/TqW3vbKYE5cR+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="128778914"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa009.fm.intel.com with ESMTP; 07 Apr 2025 02:53:31 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 27/32] drm/xe/svm: Support DRM_XE_SVM_ATTR_PAT memory
 attribute
Date: Mon,  7 Apr 2025 15:47:14 +0530
Message-Id: <20250407101719.3350996-28-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
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

This attributes sets the pat_index for the svm used vma range, which is
utilized to ascertain the coherence.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index f870e8642190..f4e0545937b0 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -104,7 +104,14 @@ static int madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
 			     struct xe_vma **vmas, int num_vmas,
 			     struct drm_xe_madvise_ops ops)
 {
-	/* Implementation pending */
+	int i;
+
+	xe_assert(vm->xe, ops.type == DRM_XE_VMA_ATTR_PAT);
+	vm_dbg(&xe->drm, "attr_value = %d", ops.pat_index.val);
+
+	for (i = 0; i < num_vmas; i++)
+		vmas[i]->attr.pat_index = ops.pat_index.val;
+
 	return 0;
 }
 
-- 
2.34.1

