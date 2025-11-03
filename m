Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC815CCF9F8
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 05:41:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC3810E366;
	Mon,  3 Nov 2025 05:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cwQEZSfI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A44210E366
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 05:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762148475; x=1793684475;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+6lR84kalcLgK8+rD9yPGhX2OqZCmhjJHiex6zUXRbg=;
 b=cwQEZSfIJLklDnr3OJai2BwxPUsprnnbLKr1NGxhymhNraK5l4oCWZqS
 hOU0wQF3N7VJ9vTvhECS0EApuKmA5TbCt7YVhUNrTV/6xVKqprQ7dyA2r
 ayPo+Yvf+/B0YdX5Xl9X/kl/sgrbF29K8b9QfnGEmd80lzG/TJZ5uIPf3
 JCEsYo2E0bsTltDWa5XB270K6acGVcaJuWyJ2xmlpMmRuhVRARVIAbIeM
 hjgAAs2BCg6SKBjTxpyu2dL4u2Cm+HO9PxADkQVnVnFtOAOvWYeYTVSys
 r99SuaLTH5evHCqS1xomrjfoD1H5Wsq8WbtDXUeyIBu4D5H1LaMUEXPnM w==;
X-CSE-ConnectionGUID: CGhHm5RoQFqox1kT9Z03cQ==
X-CSE-MsgGUID: 1GnT+VhQQqiunwqCGmfojw==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="74896313"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="74896313"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2025 21:41:14 -0800
X-CSE-ConnectionGUID: UYPTP4djTR6duXXohYS4/w==
X-CSE-MsgGUID: K6vGFSp8RRWSCTljyi03QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="191936193"
Received: from himal-super-server.iind.intel.com (HELO
 hghimira.iind.intel.com) ([10.190.239.34])
 by orviesa005.jf.intel.com with ESMTP; 02 Nov 2025 21:41:13 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4 0/5] Improve VMA merging for CPU-address-mirrored mappings
Date: Mon,  3 Nov 2025 11:39:52 +0530
Message-Id: <20251103060957.957760-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
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

This patch series introduces improvements to VMA range handling by
identifying and extending mergeable regions around CPU-address-mirrored
VMAs with default attributes.

The goal is to reduce fragmentation caused by `bo_unmap` and `madvise`
operations that leave adjacent ranges free. By computing an extended
range and applying it during mapping, the series enables better
coalescing of compatible VMAs.

-v2
Rebase
Add assert for vm lock 

-v3
fix Unbind failure at check_ufence

-v4
Fix vma lookup 

Himal Prasad Ghimiray (5):
  drm/xe: Add helper to extend CPU-mirrored VMA range for merge
  drm/xe: Merge adjacent default-attribute VMAs during garbage
    collection
  drm/xe/svm: Extend MAP range to reduce vma fragmentation
  drm/xe/svm: Enable UNMAP for VMA merging operations
  drm/xe/vm: Skip ufence association for CPU address mirror VMA during
    MAP

 drivers/gpu/drm/xe/xe_svm.c      | 62 ++++++++++++++++++--------------
 drivers/gpu/drm/xe/xe_vm.c       | 59 +++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_vm.h       |  3 ++
 drivers/gpu/drm/xe/xe_vm_types.h |  3 +-
 4 files changed, 96 insertions(+), 31 deletions(-)

-- 
2.34.1

