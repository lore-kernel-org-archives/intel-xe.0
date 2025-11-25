Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB3FCFD315
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 07:27:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AAB110E0F1;
	Tue, 25 Nov 2025 07:27:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uoifokd+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F63610E0F1
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 07:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764055643; x=1795591643;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1vFQQEDk+wWa6r02SQ+Cj6VT6ch0eV4RpuAwN1PnZWA=;
 b=Uoifokd+nQNeXChiIrdSaH5u7GDCggmZ0GzNuTlWbkEl4IMNpEhTpIcT
 H/J76MWimguZMatvIX636h5AwPWmqtAKliMzNFWA/KU71oHjVuA1TLgHv
 BvT9tNNgxlNr1zZkmYRhxRRDtKtAn0MGEeJhrH0Qu/vympqTvNPU+iY5/
 5OUkw+ol5Gpq5QWoAu9O1ZgVtXsRHnwPVAcvxb064QFgMfipMR7IbDKcc
 +rqeH7aH/MSmKA5iezVHypB10QTj2WQbii4wOhVx5PdCglOHCKJznGGK6
 0TnjfRVlaoEG3jd3cpO6MnZjiUFQEbLsDSWR0Yl8zvd5QTqSRO/1rgBOx w==;
X-CSE-ConnectionGUID: X9G01axfRDmP/yIf5MvZYA==
X-CSE-MsgGUID: WIVQ6vJHQQaSAt0YmA1c+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="91553139"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; d="scan'208";a="91553139"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 23:27:19 -0800
X-CSE-ConnectionGUID: 2zFmpZqvSgKky9xxrjXROg==
X-CSE-MsgGUID: /dCy24nrQLWFnSDxv6v3FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; d="scan'208";a="191698536"
Received: from himal-super-server.iind.intel.com (HELO
 hghimira.iind.intel.com) ([10.190.239.34])
 by orviesa006.jf.intel.com with ESMTP; 24 Nov 2025 23:27:18 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 0/5] Improve VMA merging for CPU-address-mirrored mappings
Date: Tue, 25 Nov 2025 13:26:23 +0530
Message-Id: <20251125075628.1182481-1-himal.prasad.ghimiray@intel.com>
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

 drivers/gpu/drm/xe/xe_svm.c      | 59 ++++++++++++++++++--------------
 drivers/gpu/drm/xe/xe_vm.c       | 59 +++++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_vm.h       |  3 ++
 drivers/gpu/drm/xe/xe_vm_types.h |  1 +
 4 files changed, 92 insertions(+), 30 deletions(-)

-- 
2.34.1

