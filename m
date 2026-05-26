Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D44CD5BC8
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 12:51:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85E910E4A8;
	Tue, 26 May 2026 12:51:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SkYt3aem";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E553210E49D
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 12:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779799910; x=1811335910;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AZl0zhJvSELxAge0tf+ruOm/ExBlUfM/8mDc4vtG2Oc=;
 b=SkYt3aemvs1N3hE06lIK0maXxchGA6it6MsNjFTN7d3w+3kVBQ8DQwwd
 LGcy2bguPH2Y75UE3RzjacuwRDUOAvSN5DUY1hyFm/29TCBgtfn4pCdOr
 mX9mTl1o6WHwm7FHGdALLzMcR7pos2H+eXUHj2jLDYRpbdzCnJyOyW+/W
 UD6hBM05ce0CFLRmYTYpWCMSvFE5j3p8WlWp3FfLlJpWM92pzl5Ce5bbi
 gaU2PmnOg+M4A5NLT5HJXdlTy9kjvRfKrW6jkU+LAvzeGuPU4TsxuJNx0
 ih+hzflCXbVvfJNuPtr/z5VOTkmDnTUJPcCvoTlWKrNGl786/evQoOiYk A==;
X-CSE-ConnectionGUID: cWgyszxoSNiG7ua+tLO6pA==
X-CSE-MsgGUID: 3P1i+827RXyVWku8R9lOVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="92082747"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="92082747"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 05:51:23 -0700
X-CSE-ConnectionGUID: 1scMuRRNQs6lMqut/iPydQ==
X-CSE-MsgGUID: i4XAkakSRgeyqDcF/O8Afw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="235554461"
Received: from ilevi-vm-u24.iil.labsad.intel.com ([10.111.58.213])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 05:51:19 -0700
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, koby.elbaz@intel.com, shuicheng.lin@intel.com,
 thomas.hellstrom@intel.com
Subject: [PATCH v2 0/5] drm/xe/mmio_gem: fix fault handler and destroy path
Date: Tue, 26 May 2026 15:51:07 +0300
Message-ID: <20260526125106.2806522-7-ilia.levi@intel.com>
X-Mailer: git-send-email 2.43.0
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

This series fixes several issues in xe_mmio_gem, introduced by
1ffcf8b8ae8a ("drm/xe: Support for mmap-ing mmio regions"):
split VMA fault handling, a rb-tree leak on destroy, dummy page
accumulation, and use-after-free / MMIO access after destroy.

v2:
- New patch 1/5: fix dummy page WB/UC aliasing (Sashiko)
- Patch 2/5: no longer modifies xe_mmio_gem_vm_fault_dummy_page() (handled by 1/5)
- Patch 3/5: unchanged
- Patch 4/5: compute pfn inside scoped_guard
- Patch 5/5: adapt to xe_mmio_gem_vm_fault_dummy_page() signature change, fix "objecthas" typo

Ilia Levi (4):
  drm/xe/mmio_gem: use write-back mapping for dummy page
  drm/xe/mmio_gem: fix fault handling for split VMA
  drm/xe/mmio_gem: cache the dummy page per object
  drm/xe/mmio_gem: fix destroy flow

Shuicheng Lin (1):
  drm/xe/mmio_gem: Revoke drm_vma_node on xe_mmio_gem destroy

 drivers/gpu/drm/xe/xe_mmio_gem.c | 97 +++++++++++++++++++-------------
 drivers/gpu/drm/xe/xe_mmio_gem.h |  2 +-
 2 files changed, 60 insertions(+), 39 deletions(-)

-- 
2.43.0

