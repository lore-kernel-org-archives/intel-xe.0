Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02638CCF9F0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 14:24:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9717810E9BB;
	Thu, 30 Oct 2025 14:24:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V/oPJpWM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F54110E9BB
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 14:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761834254; x=1793370254;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=p/y113vtV1iDg3cGyfLsCnyrwu4sMc33ww0akM/L5ks=;
 b=V/oPJpWM62b1j99JImgh/L3I0SIeSqNxlIJQ79Cieu/EWBfuafF7YcPf
 a0JMb0jZd5OYpaPR+J1uyramAkHwf8VAXWLe1Wcd243QDdatamSxryuLu
 hg5mh/coGgA/PbSaDYTKDTKVi1j9lzF2bMHkrZsCTIiWiXgfv9AeQ+BZt
 ONkeJx5l+KQ8001CJvjuImYSlt07+Vll9Hjj17oFCZJAggrPGX+zuPLmf
 Yllxgcps5bWh46c8HYDZrDm3v1SvlM5FogWivK2y/HTE6W0sFvExDevnj
 agjI8jdXwuu/SLkowrgemNlOjVPFbRaPjVD2V/G5Xr/Sv9JJmoddE2AA1 w==;
X-CSE-ConnectionGUID: KAMj7N1cSRmf6Gpb1jVfQQ==
X-CSE-MsgGUID: vmdNV2PkQIu9xLdzxuLM+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63181328"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="63181328"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 07:24:14 -0700
X-CSE-ConnectionGUID: WSVCmYalQ4eBiKMq6V6lFQ==
X-CSE-MsgGUID: EBLM0y3jRY61N60QV0E6jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="216625305"
Received: from himal-super-server.iind.intel.com (HELO
 hghimira.iind.intel.com) ([10.190.239.34])
 by orviesa002.jf.intel.com with ESMTP; 30 Oct 2025 07:24:13 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v3 0/5] Improve VMA merging for CPU-address-mirrored mappings
Date: Thu, 30 Oct 2025 20:22:48 +0530
Message-Id: <20251030145253.867189-1-himal.prasad.ghimiray@intel.com>
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

