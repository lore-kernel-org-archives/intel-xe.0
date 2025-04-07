Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9ABC3601E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 04:52:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B218710E1AC;
	Mon,  7 Apr 2025 04:52:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kb/O1Ynq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8978710E00C
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 04:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744001548; x=1775537548;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HI7a1Jj4axP+YS7VuASuO1iW2Gu7wKIFJR3coE5nwkU=;
 b=Kb/O1Ynq7DCuA55nTjLolqRD3ZpTZTpgi75TJFjqGImkvKZp2+Tud0Io
 SW9Q5aXoTSOq87FOuyOtRxwwGQTbTdP0ooYxy/HoU+tZhlZ3uuMWej7FM
 yzsbIFkYmc6aPNZNe4Oei1ddt94nesVDZs9DRYNFyvb+WBtMemggQ5VMY
 5u2zJlUb2fvQJjQlpoByKNlqarukwsqQRIB+gLOhVfzVr73L/eUyoOwkP
 e0OpvM+BZfg8XxsQdMwk5aQPEgmMxPtqBGVDYBDm9GZ7d6vSJFDgUnzG+
 uyQZJMf3AoMM6kD7/O6EZEycFcvHz9hreA7MzIr+t/44LLSETPbr0uW0t A==;
X-CSE-ConnectionGUID: rFPJBbTxSb+lldAzTOvyZA==
X-CSE-MsgGUID: t83nFuW8QAei7QzRV/QpCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56002448"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="56002448"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 21:52:28 -0700
X-CSE-ConnectionGUID: HThhfNEQTXiw1wtqSjpYKA==
X-CSE-MsgGUID: lzUlzp1bRuCzQ+f4FYmAOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="128697729"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 21:52:26 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, matthew.d.roper@intel.com,
 aravind.iddamsetty@linux.intel.com
Subject: [PATCH v4 0/3] Add configfs support for survivability mode
Date: Mon,  7 Apr 2025 10:44:10 +0530
Message-ID: <20250407051414.1651616-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
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

Add configfs support for survivability mode

This series proposes to expose attributes via xe configfs
subsystem. Xe registers a configfs subsystem named 'xe' which
creates a directory under configfs. Userspace can then create 
directories for the devices they want to configure and 
set appropriate attributes

This is done by

mkdir /sys/kernel/config/xe/0000:03:00.0

echo 1 > sys/kernel/config/xe/0000:03:00.0/survivability_mode
echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind

This is an alternative to introducing module param that causes
all the connected and supported GPU cards to enter survivability mode.
Manually entering survivability mode is useful when pcode does not
report failure, in field repairs and validation

Rev2: use config_groups (Lucas)
Rev3: fix review comments and kernel-docs (Lucas, Rodrigo)
Rev4: fix kernel-doc (Lucas)

Riana Tauro (3):
  drm/xe: Add configfs to enable survivability mode
  drm/xe: Add documentation for survivability mode
  drm/xe: Enable configfs support for survivability mode

 Documentation/gpu/xe/index.rst             |   1 +
 Documentation/gpu/xe/xe_configfs.rst       |  10 +
 Documentation/gpu/xe/xe_pcode.rst          |   7 +
 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/xe_configfs.c           | 250 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_configfs.h           |  24 ++
 drivers/gpu/drm/xe/xe_device.c             |   2 +-
 drivers/gpu/drm/xe/xe_module.c             |   5 +
 drivers/gpu/drm/xe/xe_pci.c                |  19 +-
 drivers/gpu/drm/xe/xe_survivability_mode.c |  69 ++++--
 drivers/gpu/drm/xe/xe_survivability_mode.h |   1 +
 11 files changed, 359 insertions(+), 30 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_configfs.rst
 create mode 100644 drivers/gpu/drm/xe/xe_configfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_configfs.h

-- 
2.47.1

