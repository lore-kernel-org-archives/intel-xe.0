Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1186D5E138
	for <intel-xe@archiver.kernel.org>; Tue, 16 Dec 2025 11:40:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EDD410E6E9;
	Tue, 16 Dec 2025 11:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OeYK7cst";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5553310E6E9
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Dec 2025 11:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765885242; x=1797421242;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/ZIzmpzeG352Z0s6jl23tEsABGtx09DZQPIDe/AVWGY=;
 b=OeYK7cstZAhpStE+7TBMwQTen9jBZWOBtq10eBuzKI2UF6hYNnU2xbF3
 FtvGbHQOPrSF3WO5NplXxHTBmUdAdGkQbfajNZTmyPk9z77BH23AcbfpH
 jA4HYqi3XWfcW1r/UG01JAcyErP5AxXt6w+GhnOS8jBBqAqbKhEYx2+wH
 pNj3IgaWveZ8W2oy9k/h55T5j2Be2Qb/FljsGZSOAbO62OAQR2Dy8Oycc
 YU0dmegkDo6opTkbsO/4emOnsGxz3avTsqDttKlOgti41UD8JIjrCOFxt
 O1iYrwWOu37fGNNOsLKUx2M7F43va8ffQItg3V58Qkal8loZKpUevHA3b w==;
X-CSE-ConnectionGUID: Zx20AHIhSfKcEkh0Y8CiAw==
X-CSE-MsgGUID: MkEkSYhPSfq26vWHwHrLdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="70376736"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="70376736"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 03:40:42 -0800
X-CSE-ConnectionGUID: EHAecS58QteUr3VmOoW0LQ==
X-CSE-MsgGUID: FoRFh92tQku/5m8wsnj3Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="197977845"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 03:40:39 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, rodrigo.vivi@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v3 0/4] drm/xe/hwmon: Expose new temperature attributes
Date: Tue, 16 Dec 2025 17:10:26 +0530
Message-Id: <20251216114030.226399-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

Expose tempX_emergency and tempX_crit for package and vram,
representing shutdown and critical temperature thresholds.
These values are read via pcode thermal mailbox commands.

These are read using pcode thermal mailbox commands

v2: 
 - Expose memory controller, pcie and individual vram
   temperatures also.
 - Addressed some of review comments of v1 from KVP.

v3:
 - Combine patches 1,2,3 into patch 1.
 - Combine patches 4,5 to patch 2.
 - Addressed review comments from v2.
 - Update kernel version in Xe hwmon documentation.

Karthik Poosa (4):
  drm/xe/hwmon: Expose temperature limits
  drm/xe/hwmon: Expose memory controller temperature
  drm/xe/hwmon: Expose GPU pcie temperature
  drm/xe/hwmon: Expose individual vram temperature

 .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 112 +++++++
 drivers/gpu/drm/xe/regs/xe_pcode_regs.h       |   2 +
 drivers/gpu/drm/xe/xe_device_types.h          |   3 +
 drivers/gpu/drm/xe/xe_hwmon.c                 | 295 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_pci.c                   |   5 +
 drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
 drivers/gpu/drm/xe/xe_pcode_api.h             |   7 +
 7 files changed, 415 insertions(+), 10 deletions(-)

-- 
2.25.1

