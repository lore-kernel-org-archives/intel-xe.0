Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13392C282EC
	for <intel-xe@archiver.kernel.org>; Mon, 17 Mar 2025 10:41:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C5E10E101;
	Mon, 17 Mar 2025 10:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iAN9Vydl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D50C510E101
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Mar 2025 10:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742208111; x=1773744111;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JDsaAqwncEnjKEdQxfWHHyQ9LE6jV97sIqmNUMgP/iQ=;
 b=iAN9VydlDr04F4AF6HAj6FEF6i4vgmiRnMB2Rd+aK6pTRFUOMoPz4dcj
 RXGRUwcyCTWzBW0cgCaBqKxvWXrGWHQg8mbcYmx9wJvrZNECynpisnQ4r
 GYbwNuKhFmKEiqnTZP7aDw4cfflW2vH2nBZfNSgvRmz2Ci2T2eS2wkaJH
 T9GSu/+0PwPNqskHDCo8s4YNNoI0eaV29KfeTAQcFQiENZoen9uq1eC42
 h+PCkY0IJeTP79kcK24yHFzyAqiWBS3IrEuC9GbDnIAST099VFg9VzdLl
 t2K6u/EXcF0A8WY+0cNaVv0JcAk7q8mgzyYJgI7gWqcNl2sXYZsdC5mWB Q==;
X-CSE-ConnectionGUID: LRC19JPeRVKh2vSupByeOg==
X-CSE-MsgGUID: WWswUidJQ72Mpm9zKtvCfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="42470892"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="42470892"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 03:41:50 -0700
X-CSE-ConnectionGUID: om0FL9WuROOpkCr86J5QFg==
X-CSE-MsgGUID: QNlNuhXmR9iQyBjdutw3DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="122377016"
Received: from carterle-desk.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.66])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 03:41:48 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 himal.prasad.ghimiray@intel.com, Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 0/5] drm/xe: xe-only patches from the multi-device GPUSVM
 series
Date: Mon, 17 Mar 2025 11:41:27 +0100
Message-ID: <20250317104132.8200-1-thomas.hellstrom@linux.intel.com>
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

A collection of misc patches that are prerequisites for the multi-device GPUSVM
series but that are xe-only and can be merged separately.

Patch 1
- Improved conditional compilation for the Xe GPUSVM support
Patch 2
- Fix a pontential UAF
Patch 3
- Adds a bo remove callback. In addition to GPUSVM this will improve
  on our device unbind support.
Patch 4
- A small fix for multi-gpu-svm support
Patch 5
- A change in implicit UAPI and needed for multi-gpu-svm support.

Thomas Hellström (5):
  drm/xe: Introduce CONFIG_DRM_XE_GPUSVM
  drm/xe/svm: Fix a potential bo UAF
  drm/xe/bo: Add a bo remove callback
  drm/xe/migrate: Allow xe_migrate_vram() also on non-pagefault capable
    devices
  drm/xe/uapi, drm/xe: Make the PT code handle placement per PTE rather
    than per vma / range

 drivers/gpu/drm/xe/Kconfig           |  16 +++-
 drivers/gpu/drm/xe/Makefile          |   2 +-
 drivers/gpu/drm/xe/xe_bo.c           | 108 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_bo.h           |   2 +
 drivers/gpu/drm/xe/xe_device.c       |   2 +
 drivers/gpu/drm/xe/xe_device_types.h |   6 +-
 drivers/gpu/drm/xe/xe_migrate.c      |   8 +-
 drivers/gpu/drm/xe/xe_pt.c           | 112 +++++++++++++--------------
 drivers/gpu/drm/xe/xe_query.c        |   2 +-
 drivers/gpu/drm/xe/xe_svm.c          |  22 +++++-
 drivers/gpu/drm/xe/xe_svm.h          |  72 ++++++++++++-----
 drivers/gpu/drm/xe/xe_vm.c           |   2 +-
 12 files changed, 260 insertions(+), 94 deletions(-)

-- 
2.48.1

