Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41D3606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 04:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iIPsr7kL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 838B310E26B;
	Wed, 21 Oct 2026 04:13:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C52C310E26B
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 04:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792556029; x=1824092029;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CbAgZ0k8ioz05sahgJi9SeUTmTLjcE7lLDhsS5u98Ho=;
 b=iIPsr7kLCsDbth5mfLBpHc5pRhn4mIaSQf4wnv+k1/1kPKBpc9pAEoO9
 3BLf/5n8CBSFigVe1/zy65ebTmfaoY6eSYuszfmiRhInTBaoRcLTliCyC
 9MYELIeyflM/0ZKsLYvuWwI8qdZGjnoyrZYDfFszeYJrUQYCXp4QHYLws
 ztmEdG0xmBQhvQBZar5+UZ5R17pgYeIlusE8Tx3WspI23USeoYgKvwZ1v
 YjMgpWJ/YWFr5IUMtg80ENllC0JXgjVNah7e7Tf91jZejn21lTAC9YRGA
 gXYtF0W0cT6soTWWnw+jrE7oTyiPgffCrzBGxLxcIfHr3SzZuNGw1kWH9 g==;
X-CSE-ConnectionGUID: 5iy8ugiGQ++X18gkIyYOpA==
X-CSE-MsgGUID: bjx428DHRLGy+aFtK2eu/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1264309"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1264309"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 21:13:49 -0700
X-CSE-ConnectionGUID: QfJj/y5qQgmM5WT76IasGQ==
X-CSE-MsgGUID: v8s9DBm1TpexcrEm3ppWhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="2868682"
Received: from gfx-coremm-kmd15.iind.intel.com ([10.223.55.8])
 by orviesa008.jf.intel.com with ESMTP; 20 Oct 2026 21:13:47 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH 0/6] ATS/PASID SVA support and PRI-less fault servicing 
Date: Wed, 21 Oct 2026 09:41:11 +0530
Message-ID: <20261021041117.1774877-1-naresh.kumar.g@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds initial Shared Virtual Addressing (SVA) support for xe
on platforms where ATS and PASID are available but PRI is not enabled or
not supported.

For SVA, the device must be able to issue memory transactions tagged
with a PASID so that address translation is performed in the process
address space rather than in a driver owned address space. This series
adds the xe side infrastructure needed for that flow: VM support for SVA
PASID state, PASID retriveal helpers, and programming of CTX_SYS_PASID
for ATS and PASID enabled contexts.

On systems with PRI, device page faults can be surfaced and resolved
through the hardware page request interface, so the driver does not need
to implement a separate fault servicing path for SVA.
On non PRI systems, that hardware assisted fault path is unavailable.In
that case, the driver still needs a way to resolve faults against the
backing process address space so execution can proceed.

To support that case, this series introduces a CPU mirror VMA and uses
it as part of a driver managed SVM path for SVA faults without PRI.The
purpose of the CPU mirror VMA is to provide a CPU side VMA
representation for the address range being accesses through SVA,so the
driver can rely on the kernel MM/VMA machinery to validate mappings and
resolve backing pages for fault handling in the absence of PRI.In
other words, since the device cannot issue PRI requests, the driver
needs a CPU visible VMA context that mirrors the GPU SVA range closely
enough to let faults be service through normal MM paths.

At a high level, this series does the following:

 1. log ATS/PASID enablement state during probe,
 2. add VM infrastructure needed for SVA PASID support,
 3. add a helper to retrieve the VM SVA PASID,
 4. program CTX_SYS_PASID for ATS/PASID-enabled contexts,
 5. add a PCI helper for ATS/PASID operation without PRI,
 6. add a CPU mirror VMA for handling SVA faults on non PRI platforms

Patches 1-5 provide the ATS/PASID and VM/context plumbing needed for
this flow and have been validated internally.Patch 6 adds the non PRI
fault servicing path, and feedback on that overall approach would be
especially appreciated.

Himal Prasad Ghimiray (1):
  drm/xe/vm: Setup SVA infrastructure for PASID support

Nareshkumar Gollakoti (5):
  drm/xe/pci: log ATS/PASID enablement state at probe
  drm/xe/vm: add helper to retrieve VM SVA PASID
  drm/xe/lrc: program CTX_SYS_PASID for ATS/PASID-enabled contexts
  drm/xe/pci: add helper for ATS/PASID without PRI
  drm/xe/pagefault: add CPU mirror VMA for SVA faults without PRI

 drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  6 +++
 drivers/gpu/drm/xe/xe_lrc.c             | 37 ++++++++++++++++
 drivers/gpu/drm/xe/xe_pagefault.c       | 49 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pagefault_types.h |  6 +++
 drivers/gpu/drm/xe/xe_pci.c             |  7 ++++
 drivers/gpu/drm/xe/xe_pci.h             | 15 +++++++
 drivers/gpu/drm/xe/xe_vm.c              | 56 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h              |  2 +
 drivers/gpu/drm/xe/xe_vm_types.h        |  6 +++
 9 files changed, 184 insertions(+)

-- 
2.43.0

