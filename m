Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C1DC71136
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 15:18:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D223F10E8DE;
	Fri, 13 Jun 2025 15:18:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GrtM+66M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC02D10E8DE;
 Fri, 13 Jun 2025 15:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749827929; x=1781363929;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QKrnvt9s0JSfFTXYShjuG8PysDlfhZfWmzVx9S84gfo=;
 b=GrtM+66M79pPZckbP27WjmUu3AXvDDjNp5zfEEqq8/ScstwT4V4zzOIJ
 Ze6D/l03ojJefk7XoSB24RaBCXLDDOvHEHv7GDcdKBc8C/2HMulC3M+B/
 gBaPp+pdB2noL3TTN9sruPdVVFEjrGVTrKkaWY3Qw6NSsFnPaas7t/dmj
 aUs0j1TW95aiXybsGzcW2rJPIlYViMCVfJtGkezM3gYOB/e/HsvQmV2Mf
 f7vsuLVFlcG5lAtwlo4zX408S1TN4TVT30mWE3cNd4h/GCVw/hyy7mN6U
 gnXl4M1UFjULkrMax4/SeBhFSQWoIb4zrl5nnLgGnkN7Qq4Jc+Y4HTWWV Q==;
X-CSE-ConnectionGUID: nlluuZNKQbefjppd3BZBYw==
X-CSE-MsgGUID: Suy8PR+7QJmCed2ssl6dCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="74580671"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="74580671"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 08:18:47 -0700
X-CSE-ConnectionGUID: E+bN8K3OTmOIODcfOtHI+Q==
X-CSE-MsgGUID: 6mbD5yeZSayuOnqLCEVyXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="152618048"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.83])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 08:18:45 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, airlied@gmail.com,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 0/3] drm/ttm, drm/xe: Consolidate the Buffer Object LRU walks
Date: Fri, 13 Jun 2025 17:18:21 +0200
Message-ID: <20250613151824.178650-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.49.0
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

This is a deferred task from the Xe bo shrinker addition.

TTM currently have two separate ways of doing buffer object LRU
walks, of which one is exposed to drivers. Both have their benefits
but we shouldn't be implementing the complex bo locking in
two different places. So implement the ttm_lru_walk_for_evict()
function in terms of the guarded iteration also exposed to drivers.

This means that when we get to implement locking using drm_exec,
we only need to do that in a single place.

Add ticketlocking support to the guarded iteration and modify
the iteration arguments.

Thomas Hellström (3):
  drm/ttm: Use a struct for the common part of struct ttm_lru_walk and
    struct ttm_bo_lru_cursor.
  drm/ttm, drm/xe: Modify the struct ttm_bo_lru_walk_cursor
    initialization
  drm/ttm, drm_xe, Implement ttm_lru_walk_for_evict() using the guarded
    LRU iteration

 drivers/gpu/drm/ttm/ttm_bo.c      |  24 ++--
 drivers/gpu/drm/ttm/ttm_bo_util.c | 186 ++++++++++++------------------
 drivers/gpu/drm/xe/xe_shrinker.c  |   8 +-
 include/drm/ttm/ttm_bo.h          |  44 ++++---
 4 files changed, 122 insertions(+), 140 deletions(-)

-- 
2.49.0

