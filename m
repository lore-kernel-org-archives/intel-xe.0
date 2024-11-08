Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4E8D64074
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 18:18:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCEBD10E277;
	Fri,  8 Nov 2024 18:18:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b1SOcmMw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08EC610E277
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 18:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731089880; x=1762625880;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jZg8IVK6K3/kGh2L85vQm5CDI6mTanc0T86CYmIDVzY=;
 b=b1SOcmMwQDPxHG7HrNKowqUOnKMh1Edz1DzfsEfZn8YofFN+PYEitTpl
 wfKibhY5qqZhjtng0Aa/2qItBxmnOMZfQMBImmjwqxKXt1NFQLcpaR4bF
 jxpXVn0U4eP3FS+CU/leC+sTWW2VNu3pkWoqXWAZk+l29mAqbyTe3Wuml
 WeCSVL3UouORXGl0pwGNaSqCSj8InBjrz3VqQtnHbJOIJpHB0WhacXsca
 wkfgcVTYUxk+Z6kLflLS5Yd/HzN3yDmHmEMfFf4YqF95BdMiC940vuc1n
 ZVW8w39+h5Uj4zHeV6gOIKBZWUVc7TWYtp/BC8QX4IwwbaUYXQ7eL3+uh Q==;
X-CSE-ConnectionGUID: 2VSZ1aERQE+Yj8mOhXyOMw==
X-CSE-MsgGUID: EMWNhcIMQciYPXIQT8evfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53545630"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="53545630"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 10:17:59 -0800
X-CSE-ConnectionGUID: AU2iCdvnQjio9vhv2vB2+A==
X-CSE-MsgGUID: Au7fEJHQQOWnvwrWZ9bD9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="85676625"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa010.jf.intel.com with ESMTP; 08 Nov 2024 10:17:58 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rui Zhang <rui.zhang@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 0/3] drm/xe/pmu: PMU interface for Xe
Date: Fri,  8 Nov 2024 10:15:09 -0800
Message-Id: <20241108181512.3461481-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

Port i915 PMU event capture capability to Xe driver. This
has been requested by users of tools like gputop and turbostat
where PMU events are used to monitor GT freq and C6 residencies.

Cc: Rui Zhang <rui.zhang@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Aravind Iddamsetty (1):
  drm/xe/pmu: Enable PMU interface

Vinay Belgaumkar (2):
  drm/xe/pmu: Add GT C6 events
  drm/xe/pmu: Add GT frequency events

 drivers/gpu/drm/xe/Makefile          |    2 +
 drivers/gpu/drm/xe/xe_device.c       |    6 +
 drivers/gpu/drm/xe/xe_device_types.h |    4 +
 drivers/gpu/drm/xe/xe_gt.c           |    4 +
 drivers/gpu/drm/xe/xe_gt_idle.c      |   17 +-
 drivers/gpu/drm/xe/xe_gt_idle.h      |    1 +
 drivers/gpu/drm/xe/xe_module.c       |    5 +
 drivers/gpu/drm/xe/xe_pmu.c          | 1040 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.h          |   30 +
 drivers/gpu/drm/xe/xe_pmu_types.h    |  159 ++++
 10 files changed, 1263 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
 create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h

-- 
2.38.1

