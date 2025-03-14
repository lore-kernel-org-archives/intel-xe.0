Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890D7C282EC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 07:39:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5048B10E98A;
	Fri, 14 Mar 2025 07:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D3QAe4P5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC4A10E98C
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 07:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741937941; x=1773473941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AQoCgvoxI/flcYy0CrDrzpEMThjEurAJQBWHUqupZKY=;
 b=D3QAe4P54C4Ya+9yuiL1B7W6E+EwsboLN1DC0htt4ZEuajxen+oy8AwS
 wWZ1OSFIU/xFkMUwIeD5+gEOPutiYNmTCfaG1Tk1nkwgTF6ZoOoD1K9Dp
 m78CtF82vBzt/sOcpMIOZJ9nDbxcKw4Wtn/8VyCGL4NRFWn4Y8rUSuxr2
 Omk/qw4328p2bEgYGfWOgvFk+r5zolHW/BJa1qfLrRCk4f/TypwcrZXsQ
 1al1a2Lv+ToWu3+g8gBplV/aNZ65NE/U8l222/RboKbRAw+ZYwzwhIga/
 KnBr3hA1me1GHl6U5OwgLNRTxM1boFTLEYyyysQn1n/vXjifQdvB56gah g==;
X-CSE-ConnectionGUID: pwEInD4CRkG2BAw0hTlc0Q==
X-CSE-MsgGUID: Rr90qW+FT8SYcMGiApvTMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="68446118"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="68446118"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 00:39:01 -0700
X-CSE-ConnectionGUID: SQRoB+9YTBGv4apaU0fMsQ==
X-CSE-MsgGUID: IC7WGKbqQM+59wBcx87fQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="152043877"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by orviesa002.jf.intel.com with ESMTP; 14 Mar 2025 00:38:59 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 oak.zeng@intel.com, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 24/29] drm/xe/svm: Support DRM_XE_SVM_ATTR_PAT memory attribute
Date: Fri, 14 Mar 2025 13:32:21 +0530
Message-Id: <20250314080226.2059819-25-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
References: <20250314080226.2059819-1-himal.prasad.ghimiray@intel.com>
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

