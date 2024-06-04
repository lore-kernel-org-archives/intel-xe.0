Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD18C27C53
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 08:27:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78DC10E43D;
	Tue,  4 Jun 2024 08:27:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m7fvtYzR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C1410E203
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 08:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717489654; x=1749025654;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=w1KjahSYLKKTe/OBCluV/0SM0ZNsXwcunITcN/na74U=;
 b=m7fvtYzRkx7YSa/BJNssJHXC4F3Zr8RIfwmbyMWmGo5zMJh3znl0lyh+
 yWxgwygupc1gxTbAvZ3EqzcmJSEX8LOBO3Bzr8qxuW3xtBkL+xMUh3e1o
 www1MCZeEv5YTAXsSDH74PopFJzd4CvvRsl0IruUv5adilt2Lwld244Vw
 8YY+uAUOR55xlfAFjITqGWZU0L/nSPryUelzMU0iP7tquzCRmxmho7vKg
 YMhJhUl9AfSTixQMQBnqsM1nRJvInbSOcZfw7y2VQ5zLLI13l/qcAokJr
 6K93G8Nv6/TxJm2V2egaYxAPY9A1Jc9uMLncPLTnYBpPAcZPxy6vCZ+1P w==;
X-CSE-ConnectionGUID: 0ZnnTdkhSN2S+TTpUp4Bgg==
X-CSE-MsgGUID: s5ZaDWBLRv2VHavSenNzEQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="17857228"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="17857228"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 01:27:33 -0700
X-CSE-ConnectionGUID: YwxdoY+7S7qPjIFDCv1pMA==
X-CSE-MsgGUID: dcWMDukGStiHvCUoy+cZqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="37180834"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.236])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 01:27:32 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 00/11] Xe + TTM bo shrinker
Date: Tue,  4 Jun 2024 10:27:11 +0200
Message-ID: <20240604082722.4670-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
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

Testing the shrinker with power managerment.

Thomas Hellström (11):
  drm/ttm: Allow TTM LRU list nodes of different types
  drm/ttm: Slightly clean up LRU list iteration
  drm/ttm: Use LRU hitches
  drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist
    moves
  drm/ttm: Provide a generic LRU walker helper
  drm/ttm: Use the LRU walker helper for swapping
  drm/ttm: Use the LRU walker for eviction
  drm/ttm: Add a virtual base class for graphics memory backup
  drm/ttm/pool: Provide a helper to shrink pages
  drm/ttm: Use fault-injection to test error paths
  drm/ttm, drm/xe: Add a shrinker for xe bos

 drivers/gpu/drm/Kconfig                |  10 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |   4 +
 drivers/gpu/drm/ttm/Makefile           |   2 +-
 drivers/gpu/drm/ttm/ttm_backup_shmem.c | 137 ++++++++
 drivers/gpu/drm/ttm/ttm_bo.c           | 463 ++++++++++++-------------
 drivers/gpu/drm/ttm/ttm_bo_util.c      | 212 +++++++++++
 drivers/gpu/drm/ttm/ttm_device.c       |  29 +-
 drivers/gpu/drm/ttm/ttm_pool.c         | 412 +++++++++++++++++++++-
 drivers/gpu/drm/ttm/ttm_resource.c     | 264 +++++++++++---
 drivers/gpu/drm/ttm/ttm_tt.c           |  37 ++
 drivers/gpu/drm/xe/Makefile            |   1 +
 drivers/gpu/drm/xe/tests/xe_bo.c       | 118 +++++++
 drivers/gpu/drm/xe/tests/xe_bo_test.c  |   1 +
 drivers/gpu/drm/xe/tests/xe_bo_test.h  |   1 +
 drivers/gpu/drm/xe/xe_bo.c             | 139 +++++++-
 drivers/gpu/drm/xe/xe_bo.h             |   4 +
 drivers/gpu/drm/xe/xe_device.c         |   8 +
 drivers/gpu/drm/xe/xe_device_types.h   |   2 +
 drivers/gpu/drm/xe/xe_shrinker.c       | 287 +++++++++++++++
 drivers/gpu/drm/xe/xe_shrinker.h       |  18 +
 drivers/gpu/drm/xe/xe_vm.c             |   4 +
 include/drm/ttm/ttm_backup.h           | 136 ++++++++
 include/drm/ttm/ttm_bo.h               |  48 ++-
 include/drm/ttm/ttm_pool.h             |   5 +
 include/drm/ttm/ttm_resource.h         |  99 +++++-
 include/drm/ttm/ttm_tt.h               |  20 ++
 26 files changed, 2088 insertions(+), 373 deletions(-)
 create mode 100644 drivers/gpu/drm/ttm/ttm_backup_shmem.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h
 create mode 100644 include/drm/ttm/ttm_backup.h

-- 
2.44.0

