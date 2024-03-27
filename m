Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29CDC54E67
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 16:05:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853E010FDCD;
	Wed, 27 Mar 2024 16:05:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nZsB5Ce6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED2510FDCA
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Mar 2024 16:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711555549; x=1743091549;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nnon/ZloWniIcb6uw+nOKu3sNT9ve3iIIPzVRf2aRlE=;
 b=nZsB5Ce6QMIUJwbnHCf5ZWJFvrAR4mDX7KoMZmV9ki24XbYCFpkeiVnV
 WqxAlc1Z86lf9rnYHuSmGiNX8n1KDW9NE6N2qasR0hA7pkmJls8XckUti
 65Ji+BXuHlUodbwo9Auq0jZVdAmtw+aLMFlK2fevs6fSpgdOweTzDLX5i
 bJLfKqcP8g7EZ8I7X31JJJaZI2UAY1kTF5Y0UixYDmyn3d53h9rNWZZhV
 ad8GGd+v3CG41aCFixGodPZkedtVptmqs5Mcb7nxc4Lh/TqlWkMPoZj9b
 817JJVaIrAj/2+hFNOjkL2jmjCKQrD+iuuGMYGnaHxblhXchZTHIYGd+F Q==;
X-CSE-ConnectionGUID: 1wVaNwIwTAqpqzaUeRhbnA==
X-CSE-MsgGUID: IgAWeF0ZQ6yEbB3YA0IcYQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="18056654"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="18056654"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:05:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="16292687"
Received: from ktonsber-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.184])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:05:46 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 0/8] drm/ttm, drm/xe: Shrinker support
Date: Wed, 27 Mar 2024 17:05:28 +0100
Message-ID: <20240327160536.53597-1-thomas.hellstrom@linux.intel.com>
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

Thomas Hellström (8):
  drm/ttm: Allow TTM LRU list nodes of different types
  drm/ttm: Use LRU hitches
  drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist
    moves
  drm/ttm: Allow continued swapout after -ENOSPC falure
  drm/ttm: Add a virtual base class for graphics memory backup
  drm/ttm/pool: Provide a helper to shrink pages.
  drm/xe, drm/ttm: Provide a generic LRU walker helper
  drm/xe: Add a shrinker for xe bos

 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |   4 +
 drivers/gpu/drm/ttm/Makefile           |   2 +-
 drivers/gpu/drm/ttm/ttm_backup_shmem.c | 122 ++++++++
 drivers/gpu/drm/ttm/ttm_bo.c           |   1 +
 drivers/gpu/drm/ttm/ttm_device.c       |  33 ++-
 drivers/gpu/drm/ttm/ttm_pool.c         | 387 ++++++++++++++++++++++++-
 drivers/gpu/drm/ttm/ttm_resource.c     | 231 ++++++++++++---
 drivers/gpu/drm/ttm/ttm_tt.c           |  32 ++
 drivers/gpu/drm/xe/Makefile            |   2 +
 drivers/gpu/drm/xe/xe_bo.c             | 106 +++++--
 drivers/gpu/drm/xe/xe_bo.h             |   3 +
 drivers/gpu/drm/xe/xe_device.c         |   8 +
 drivers/gpu/drm/xe/xe_device_types.h   |   2 +
 drivers/gpu/drm/xe/xe_shrinker.c       | 204 +++++++++++++
 drivers/gpu/drm/xe/xe_shrinker.h       |  18 ++
 drivers/gpu/drm/xe/xe_ttm_helpers.c    | 166 +++++++++++
 drivers/gpu/drm/xe/xe_ttm_helpers.h    |  36 +++
 drivers/gpu/drm/xe/xe_vm.c             |   4 +
 include/drm/ttm/ttm_backup.h           |  48 +++
 include/drm/ttm/ttm_device.h           |   2 +
 include/drm/ttm/ttm_pool.h             |   4 +
 include/drm/ttm/ttm_resource.h         |  96 +++++-
 include/drm/ttm/ttm_tt.h               |  12 +
 23 files changed, 1432 insertions(+), 91 deletions(-)
 create mode 100644 drivers/gpu/drm/ttm/ttm_backup_shmem.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
 create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h
 create mode 100644 drivers/gpu/drm/xe/xe_ttm_helpers.c
 create mode 100644 drivers/gpu/drm/xe/xe_ttm_helpers.h
 create mode 100644 include/drm/ttm/ttm_backup.h

-- 
2.44.0

