Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CBEC021B8
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 15:34:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F07F10E941;
	Wed, 26 Feb 2025 15:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e3iDMc3b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0549D10E941
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Feb 2025 15:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740584075; x=1772120075;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AcIq87XwWyv2Vo+pckDZSCqdo6lE7wSZ10U3Hd4yvfo=;
 b=e3iDMc3bkzWSI1durojUv9oLs0+GB4XsCxgYKyUSxnrEbaYwu2hvEu8j
 j1QNcCXGj03wy3QAJ6HCeJaciUWFjl/Ug4vKcM/nh6PO2X2s+2ENmJ4ZE
 Cbj9IPo5e9dHluIJUZl1tvvEOuUu+Ef7r40NIC5duKIKdav6n0R5szmL1
 IhICErXodzyxZ1+aa9kXJKAIfnkLjLEfqVPNq832GudYm3GeGDLMFz00E
 yjHPO8mlqf1fL7ck4sSzyUpqJU/TIkY+hmqQ2o6lxgcuoI9a7cI2XsSY4
 +Uun6u/l6kpHtAg+DVM6xs5/XvAxBsw37ODLI4bPjHq0ZTcyvgDoA9IkT w==;
X-CSE-ConnectionGUID: HitsX3TTSjaKGHQ6kpuepw==
X-CSE-MsgGUID: fU75z73hSpihqIlX+16jIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="44260320"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; d="scan'208";a="44260320"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 07:34:34 -0800
X-CSE-ConnectionGUID: 1oZMnajSSL6Z2l6C3CPU0g==
X-CSE-MsgGUID: jomlnrmjRNeNBwM6a86TiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; d="scan'208";a="116917916"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.81])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 07:34:33 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 0/4] drm/xe: Fix userptr races and missed validations
Date: Wed, 26 Feb 2025 16:33:40 +0100
Message-ID: <20250226153344.58175-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
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

A series that fixes a couple of userptr races and a missed validation.

Patch 1
- Fixes a missed userptr validation causing a potential infinite loop.
Patch 2
- Fixes a misplaced #endif in preparation for patch 3.
Patch 3
- Fixes a race between fault mode invalidation and unbind, where
  the userptr invalidation could attempt to traverse a page-table
  tree under modification
Patch 4
- Fixes a race between fault mode invalidation and multiple bind
  operation, where the invalidation could potentially get lost.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>

Matthew Brost (1):
  drm/xe: Add staging tree for VM binds

Thomas Hellström (3):
  drm/xe/vm: Validate userptr during gpu vma prefetching
  drm/xe/vm: Fix a misplaced #endif
  drm/xe: Fix fault mode invalidation with unbind

 drivers/gpu/drm/xe/xe_pt.c       | 96 ++++++++++++++++----------------
 drivers/gpu/drm/xe/xe_pt_walk.c  |  3 +-
 drivers/gpu/drm/xe/xe_pt_walk.h  |  4 ++
 drivers/gpu/drm/xe/xe_vm.c       | 87 +++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_vm.h       | 10 +++-
 drivers/gpu/drm/xe/xe_vm_types.h |  4 +-
 6 files changed, 123 insertions(+), 81 deletions(-)

-- 
2.48.1

