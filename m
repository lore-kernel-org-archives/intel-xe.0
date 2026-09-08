Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A302C79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 13:50:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74C510EBF9;
	Tue,  8 Sep 2026 13:50:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HKk/8JOR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E15D310EBF9
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 13:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788875449; x=1820411449;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3pckxe3uvJGRhx09nDorQW6Wtljn0gtkoUBz8uRSpdU=;
 b=HKk/8JORxkr1lCprs0QSqlqFfKhwD5QmKCs+CQECMVSu1e4QeZsVKalv
 zkPL2CcqRMAOZIDDxc8f6Meey2cgyeO5apjeFuS9r4lNUnAw0DeO1JCq2
 9A8uFiyIcCvCr4RZ1LCiFJ9zTvKcceykTCoKV4ZRMFA+biT6shZHUEhq0
 /gHc4LlatpVRQQqgJzByynJS5o6UIJONVVMRIC1/BwVXOFz5Qoa3O/oxE
 FHfvPqLfzaxTpLbfubxdrwD8CtHbgBA3Znqk07IxDbUucGUjr4Qev6Lv5
 oQn+WFRkDj8z3bsJCcf9YO82H8e6/z3dWgrSvybAk2/N1S9RULyzY+0l1 g==;
X-CSE-ConnectionGUID: KY9+0QpDQlCUxXrj+8SNHg==
X-CSE-MsgGUID: IYjJ8kqbTfCTpwdhCkl4Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="106793374"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="106793374"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 06:50:48 -0700
X-CSE-ConnectionGUID: p5LC3cFgRoqopd47asJGnw==
X-CSE-MsgGUID: gqt3L+8ZQA+yg0B3Ea3HrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="270519655"
Received: from rvuia-mobl.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.158])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 06:50:47 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 0/8] drm/xe/mmio_gem: fix fault handler and destroy path
Date: Tue,  8 Sep 2026 14:49:56 +0100
Message-ID: <20260908134955.1344429-10-matthew.auld@intel.com>
X-Mailer: git-send-email 2.55.0
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

Picking up the series from Ilia:
https://lore.kernel.org/intel-xe/20260723161832.137153-1-ilia.levi@intel.com/

This series fixes several issues in xe_mmio_gem, introduced by
1ffcf8b8ae8a ("drm/xe: Support for mmap-ing mmio regions"):
split VMA handling, WB/UC aliasing of the dummy page, a rb-tree
leak on destroy, dummy page accumulation, and use-after-free / MMIO
access after destroy. It also converts the existing PCI barrier mmap
to build on xe_mmio_gem now that the infrastructure is in place.

v4:
- One extra patch for VM_EXEC and DONTCOPY.
- Tweak the commit message in "use write-back mapping for dummy page" wrt x86.
v3: (Matt Auld)
- New patch using the xe_mmio_gem infra for PCI barrier mmap
- New patch for rejecting VMA split
- Using dma_resv lock for synchronization
- SIGBUS instead of dummy page on access after destroy
- Some changes in patch splitting (e.g. the vm_pgoff handling now lives
  in the destroy-flow patch alongside the zap that needs it)
v2:
- New patch 1/5: fix dummy page WB/UC aliasing (Sashiko)
- Patch 2/5: no longer modifies xe_mmio_gem_vm_fault_dummy_page() (handled by 1/5)
- Patch 3/5: unchanged
- Patch 4/5: compute pfn inside scoped_guard
- Patch 5/5: adapt to xe_mmio_gem_vm_fault_dummy_page() signature change, fix "objecthas" typo

-- 
2.55.0

