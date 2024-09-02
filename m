Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F340CD13CF
	for <intel-xe@archiver.kernel.org>; Mon,  2 Sep 2024 15:42:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 625BB10E30D;
	Mon,  2 Sep 2024 15:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F3zG0WPk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7582D10E30D;
 Mon,  2 Sep 2024 15:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725291747; x=1756827747;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DWuKfmd90TKc92pQ6GdwpsfhqvnRhXHI2Lsx01n6D2E=;
 b=F3zG0WPkMKUk66xZlyXhaN2SeyN2xnCcGl1V+1/1geO6FYs7uYUaxvHo
 Nc4F1f+oZ/kT/dqhwXiAaoOnpGwRku1Di1sYyfpo0cN8mbUJzGZHlRk+C
 kCi4oUx8GJBlzm1hCfm5B+WwjGP6rKvxHDtI9xrLt7I/mhpK5RGCjLDvh
 pr3php4qH4mpSsIuRBbYq0zn57Dt/jfHcwAi1TCyeIVPBHD/cLtmolCCS
 i7ipGKLgAAf6bDDrqMhazCBYKNW+oPimU9bYKxT2hjASh2+d+IuCAGuZY
 EDvNaGdfYcQey/4clCagA99IaghRWkzxUVYpoKySxSX6kbRKSSW6WYDnA A==;
X-CSE-ConnectionGUID: EgTfj1nHTPyEbEbIR7P4LA==
X-CSE-MsgGUID: mbWyRfIkRBaIaUtemccAGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="41352838"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="41352838"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 08:42:27 -0700
X-CSE-ConnectionGUID: LWTwDZI9RV22de/zYANc6g==
X-CSE-MsgGUID: 0OhVr/aiTvS7+3XD+yp0Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="65370612"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.77])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 08:42:26 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/ttm: Really use a separate LRU list for swapped- and
 pinned objects
Date: Mon,  2 Sep 2024 17:41:57 +0200
Message-ID: <20240902154159.78871-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.0
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

Resources of swapped objects were never moved off their LRU list
when swapped, and also resources of pinned objects might remain on
their LRU list unless the driver moved them to the device pinned list
after pinning.

Rename the device "pinned" list to "unevictable" and ensure that resources
of objects that are pinned or swapped are moved to that list.

RFC: Should we instead of a device-wide unevictable list, introduce an
unevictable priority so that all objects remain with their resource's
respective manager?

Patch 1/2 deals with swapped objects and also handles the problem of
moving objects back to their manager's LRU list when populating.

Patch 2/2 deals with pinned objects.

Cc: Christian König <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>

Thomas Hellström (2):
  drm/ttm: Move swapped objects off the manager's LRU list
  drm/ttm: Move pinned objects off LRU lists when pinning

 drivers/gpu/drm/i915/gem/i915_gem_ttm.c      |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c   |  4 +-
 drivers/gpu/drm/ttm/ttm_bo.c                 | 65 ++++++++++++++++++--
 drivers/gpu/drm/ttm/ttm_bo_util.c            |  6 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c              |  2 +-
 drivers/gpu/drm/ttm/ttm_device.c             |  4 +-
 drivers/gpu/drm/ttm/ttm_resource.c           |  9 +--
 drivers/gpu/drm/ttm/ttm_tt.c                 |  1 -
 drivers/gpu/drm/xe/xe_bo.c                   |  4 +-
 include/drm/ttm/ttm_bo.h                     |  2 +
 include/drm/ttm/ttm_device.h                 |  5 +-
 include/drm/ttm/ttm_tt.h                     |  5 ++
 13 files changed, 87 insertions(+), 24 deletions(-)

-- 
2.46.0

