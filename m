Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F90E8B361
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 21:07:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00BF710E1D5;
	Tue,  3 Feb 2026 21:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AOcAEHgy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FE610E1D5
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 21:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770152829; x=1801688829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AVOPhidzgzJMaFL+YHbIzdFGwxnv7loyHyd6PxOivRo=;
 b=AOcAEHgyCgV4kKTZTS7Te6GLojHflLiHrNxogz5UoC888gDY65qad0KG
 7OLHp6pL/IChbRCcZLpEyuebq4X8MzxlyO/IOVopQ7ShiCzke2spgZUcQ
 FKRALKA8zfhxFDfZ2LuRB8IHfSYO2P1GmA6zk5ML7asVrT1wzSPkLa262
 RB7r7rXBSvlM8k3jFySL4q79gcW0uj9yHltvNTi/AG5JG0pdEhdiuWelx
 XoM440BrcGKNK5vRnCgMCQbb0Zm9IUjPsPg2UfSh05DTkGhBAyQFIfUC1
 uLc6lhR3bsQTmovbTw5oKaOyVEWvACWmxlLG7ni1G3DgLo/ssNF82ZcTn A==;
X-CSE-ConnectionGUID: 3oH598jgRQ+O8rUVgDdcog==
X-CSE-MsgGUID: xQvbkEAvTWiMCToxe3L+ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75188333"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="75188333"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 13:07:08 -0800
X-CSE-ConnectionGUID: x/V2thHxS1miDU7JbspNSQ==
X-CSE-MsgGUID: WrCok6ccQeOG1v985CNIuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="214691068"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.45])
 by fmviesa004.fm.intel.com with ESMTP; 03 Feb 2026 13:07:08 -0800
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2] drm/xe: Add bounds check on pat_index to prevent OOB
 kernel read in madvise
Date: Tue,  3 Feb 2026 21:06:59 +0000
Message-ID: <20260203210659.1194480-1-jia.yao@intel.com>
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

Fixes: ada7486c5668 ("drm/xe: Implement madvise ioctl for xe")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Jia Yao <jia.yao@intel.com>
---
 drivers/gpu/drm/xe/xe_vm_madvise.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index add9a6ca2390..3564e1442694 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -291,7 +291,12 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
 		break;
 	case DRM_XE_MEM_RANGE_ATTR_PAT:
 	{
-		u16 coh_mode = xe_pat_index_get_coh_mode(xe, args->pat_index.val);
+		if (XE_IOCTL_DBG(xe, args->pat_index.val >= xe->pat.n_entries))
+			return false;
+
+		u16 pat_index = array_index_nospec(args->pat_index.val, xe->pat.n_entries);
+
+		u16 coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
 
 		if (XE_IOCTL_DBG(xe, !coh_mode))
 			return false;
-- 
2.43.0

