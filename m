Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E5DC79FB9
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 12:25:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D2310E2B3;
	Thu, 10 Sep 2026 12:25:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sw2OPny0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4057A10E2B3
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 12:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789043101; x=1820579101;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AOyK7VDG5PkETgD2iRQx3SsJjRHZezR0ZXoE4NO8c/M=;
 b=Sw2OPny0v7g9SmNRmjmo/2fHS7Yuc+h5K/fZiZxo2JORomDCU8En42Im
 7gB8s2TVVuDNVRLW1LMWj5j1axXy10/u5h9afyLuGKJN6lTB4pWzQy6gf
 +ZuL+bM1ss9FU0VOlxxVj5jE5OdWTbGTIYUKVlR7TwzI9c0PCuVszp0an
 R37914DipnbWRY1GGH/Hx3tIHqQD2cOO1YxS2DIruvSj1oP3f0WZ9b8d+
 cE0FelGsLNIMcdBjD5C72feB2GRc7WtefkPVLtjpuQwkwvepId0AmjAIV
 tNX+q+/1KK8lyUGKma5jUcZiNYd9/82ruiKXNYzht+GkE2Ahy5/64IL2M A==;
X-CSE-ConnectionGUID: 37/i7kMYTVS7HkfCrXS4iA==
X-CSE-MsgGUID: hqpYZRKEThazwWzU9uA/uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93181623"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="93181623"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 05:25:00 -0700
X-CSE-ConnectionGUID: lXCQNJL7SlOc/FLOCCNYvw==
X-CSE-MsgGUID: g27OiwPDQeuKD7v7yWQ3dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="272121179"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 05:24:59 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, heikki.krogerus@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v2 0/2] Expose device sysfs for AMC and GPU UUID
Date: Thu, 10 Sep 2026 18:11:51 +0530
Message-ID: <20260910124151.3135801-4-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.54.0
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

Expose device sysfs entries for AMC SMBUS alert reason and GPU UID

v2:
  - Fixed sashiko warning in AMC sysfs patch
  - Dropped references of UUID in uid sysfs patch  

Badal Nilawar (2):
  drm/xe/i2c: Expose AMC Alert reason sysfs
  drm/xe/cri: Expose device UID through sysfs

 .../ABI/testing/sysfs-driver-intel-xe-amc     | 25 ++++++
 .../ABI/testing/sysfs-driver-intel-xe-gpu     | 10 +++
 drivers/gpu/drm/xe/regs/xe_regs.h             |  2 +
 drivers/gpu/drm/xe/xe_amc.c                   | 78 ++++++++++++++++---
 drivers/gpu/drm/xe/xe_device.c                |  4 +
 drivers/gpu/drm/xe/xe_device_sysfs.c          | 36 +++++++++
 drivers/gpu/drm/xe/xe_device_types.h          |  5 ++
 drivers/gpu/drm/xe/xe_pci.c                   |  2 +
 drivers/gpu/drm/xe/xe_pci_types.h             |  1 +
 9 files changed, 153 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-amc
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-gpu

-- 
2.54.0

