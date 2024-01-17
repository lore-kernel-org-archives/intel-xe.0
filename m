Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08806C47422
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 10:52:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0FDC10E64A;
	Wed, 17 Jan 2024 10:52:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A87510E640
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 10:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705488770; x=1737024770;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/siIEZUo0JPOylVSc4qJ4fA5mnwyIUUSF+13OpQ7yoc=;
 b=FjAGSMAmH1x2woFsZUYCf23PMcUvWUEM3Q9f/RIbCTHTWmeIEF3IIVss
 4MYgqudVNwwJpph97T1Nastjhe66BZIiGGzZ7wJg2yYbGrHRZ500vfGD1
 FrvFttewBQbVOYyD4sGn1TtyG6exM0rJ2n+imDBsyLPPi/WeaAW8PUkh5
 c+DkHiQ0dF6XyWcRIpag7XV+AJnM3A/ThB4hXeWO6UCM+Stn1F/KYSnzc
 grvJPCW8hTKPB9uDBJo15juNQ1NLgh3WdghVS9f+1peaKXaRw7h3GVv3u
 iCupKQQ0ubcGzwB1eIFaE6+1nRGz9fudcuHljkNkyLSzaqP6YIALLtM/R A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="486292280"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="486292280"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 02:52:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="1841"
Received: from clanggaa-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.57])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 02:52:50 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 0/5] TTM placement changes
Date: Wed, 17 Jan 2024 11:52:31 +0100
Message-ID: <20240117105236.121836-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Only for regression checking.

Christian König (4):
  drm/vmwgfx: remove vmw_vram_gmr_placement
  drm/ttm: return ENOSPC from ttm_bo_mem_space
  drm/ttm: improve idle/busy handling v3
  drm/amdgpu: use GTT only as fallback for VRAM|GTT

Somalapuram Amaranath (1):
  drm/ttm: replace busy placement with flags v6

 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  14 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  13 +-
 drivers/gpu/drm/drm_gem_vram_helper.c      |   2 -
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |  37 +++---
 drivers/gpu/drm/loongson/lsdc_ttm.c        |   2 -
 drivers/gpu/drm/nouveau/nouveau_bo.c       |  59 ++++-----
 drivers/gpu/drm/nouveau/nouveau_bo.h       |   1 -
 drivers/gpu/drm/qxl/qxl_object.c           |   2 -
 drivers/gpu/drm/qxl/qxl_ttm.c              |   2 -
 drivers/gpu/drm/radeon/radeon_object.c     |   2 -
 drivers/gpu/drm/radeon/radeon_ttm.c        |   8 +-
 drivers/gpu/drm/radeon/radeon_uvd.c        |   1 -
 drivers/gpu/drm/ttm/ttm_bo.c               | 137 +++++++++------------
 drivers/gpu/drm/ttm/ttm_resource.c         |  81 ++++--------
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c         |  33 +++--
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |   1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  32 -----
 drivers/gpu/drm/xe/xe_bo.c                 |  37 +++---
 include/drm/ttm/ttm_bo.h                   |   3 +-
 include/drm/ttm/ttm_placement.h            |  10 +-
 include/drm/ttm/ttm_resource.h             |   9 +-
 21 files changed, 181 insertions(+), 305 deletions(-)

-- 
2.43.0

