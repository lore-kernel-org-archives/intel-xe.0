Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4D7C79F99
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 16:51:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F305610ED13;
	Tue,  8 Sep 2026 16:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E4vCmeq3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199CF10ED0F
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 16:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788886270; x=1820422270;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i8Mo1OPtF2zNK7F+kIguHZxVx3yEmEU7ow26i787GHk=;
 b=E4vCmeq3u6bn8xtjGESsu4K402n6KWvY9KGSUNJ8gAquJ9imjhWivk+y
 +dyuZzxzqHpOMk3s7bOnJ/fP7OsYb9QgzwcnaSemeaO7jZBhmrf1owkKT
 8UsCLbOn26zMdOMJgLM1oDpVGXDyWeWzhYeeq0UP5I4daijP5q2hE8BmJ
 zv0QQXb4gUC1G1lo2tpuUXBzKPALUslEwKDnrQS6FMPDX2diphp3dDs8i
 +nchth3XBcBdOo02HIdSqW/0JsLaIX9y4JBog3ODzfrAUTW3zazs2rULE
 09rVoKYGy/am+6j86w+xTfagpHJ1AOEYIz9KCVQYPTLh39rkElP4TOvXo Q==;
X-CSE-ConnectionGUID: 0itTbXs6RMawf1jz8G3YHw==
X-CSE-MsgGUID: OJlNHjb3Tbiy9aWVJh7/Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99888265"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="99888265"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 09:51:10 -0700
X-CSE-ConnectionGUID: j3ojfLRgTGC3LcffXs/LkA==
X-CSE-MsgGUID: 5/4rNRAqRJq4kvb5OPqJsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="272995664"
Received: from rvuia-mobl.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.158])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 09:51:09 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 0/8] drm/xe/mmio_gem: fix fault handler and destroy path
Date: Tue,  8 Sep 2026 17:50:47 +0100
Message-ID: <20260908165046.1393557-10-matthew.auld@intel.com>
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

v5 (Thomas):
- Tweak "convert PCI barrier mmap to use xe_mmio_gem" to use scoped_guard()
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

