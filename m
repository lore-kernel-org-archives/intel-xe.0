Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B97C25B6B
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 18:00:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B0610E6C9;
	Wed, 25 Oct 2023 18:00:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B6910E6C6
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 18:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698256809; x=1729792809;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EXukgFIFWjfUBGaIcBKTN67uibZNo13XTVW8eQ7p6O0=;
 b=M64/Bmo2La0COIJj82SI7dunE7r9tsuvprvsrisFx/+7hVFh6V+NLEVi
 PxHNrxNNlOmZK0tad5VUkOsnqRIUJgIwczueII9lY0JcrBw7fo1XfxPkl
 vsyaFu0vHPiJPSVCdNIZWFBmZB6znEmu4pBdQKgiQN59AS0xPYcQyZKI4
 sBFe9K0ePa64xr1cXbXg1+R54cJQ4jNsSJsgfIFslrU2oNYogCfdI/Gkr
 7qfqdNBYz6EwEAFR7gI8jVO2LiV91aApOr1heQmSG+w67ihaATaNtEmvm
 HIx5uSDu+QzN4dMJ1moOGHKS/6e91fqOxSxalx0ZK2O+ha/ydsqnBSOU/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="8922326"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="8922326"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 11:00:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="735470636"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="735470636"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 11:00:08 -0700
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 25 Oct 2023 11:00:05 -0700
Message-Id: <20231025180008.24167-1-brian.welty@intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/3] Reduce usage of xe_tile in xe_bo.c
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

mem_type_to_tile() is being used in xe_bo.c to access the tile's underlying
tile.mem.vram.  Let's clean this up to access instead thru TTM VRAM manager
to get pointer to the xe_mem_region.  More comments in the patches.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Brian Welty (3):
  drm/xe: Replace xe_ttm_vram_mgr.tile with xe_mem_region
  drm/xe: Remove unused xe_bo_to_tile
  drm/xe: Replace usage of mem_type_to_tile

 drivers/gpu/drm/xe/xe_bo.c                 | 72 +++++++++++-----------
 drivers/gpu/drm/xe/xe_bo.h                 |  2 -
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       |  7 +--
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  6 +-
 4 files changed, 42 insertions(+), 45 deletions(-)

-- 
2.38.0

