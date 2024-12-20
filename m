Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85650E77184
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 01:22:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E79510E4BC;
	Fri, 20 Dec 2024 01:22:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LTq4FeY9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E40210E4BC
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 01:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734657739; x=1766193739;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ed8nwdsRzc4R8J98Ypk776AiPX8uwyAG/Q5wUbjHls8=;
 b=LTq4FeY9LXG5VoW8FuZeZrKkcC2ibjYAPyxaDIbXXpHif5GU5FuCh61e
 4BuI+bvqqANVzRoz7Ya+dvOiAtjXKN/TVqIfPNLwhTi+RTYFWo6ElSpzs
 fZgm9q0TMfyOg9KpM5i8aqvB8sOIYrTm+sOpmr/2eIAjb+8c+/E8MAw9L
 4xbnUgQkD/RrxWrf9j6kSkIoEaIy/aqdyRlzGq+laqqTzk0hS7WzYmpay
 Zx4nA77XI2C3ZLi/u2P3vMkzvmaMoi+5H1Xf20ziSYHIR+Qda1o1Zysst
 Rvk/vKSVyFhcjsNXXqJXhkuhMruHLBOYV6WkcDXAqwQMpDJ550qvj0hHr w==;
X-CSE-ConnectionGUID: Hk0wDr82Qb+dz5nG96V2Tw==
X-CSE-MsgGUID: 1T6dBNgVShONxhI5ho3DVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="45693297"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; d="scan'208";a="45693297"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 17:22:19 -0800
X-CSE-ConnectionGUID: /WgjWDQ0S/mOxw+nnm2viQ==
X-CSE-MsgGUID: yjnVqlkESDak8IA8N1w+qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135694983"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa001.jf.intel.com with ESMTP; 19 Dec 2024 17:22:18 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rui Zhang <rui.zhang@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v10 0/4] drm/xe/pmu: PMU interface for Xe
Date: Thu, 19 Dec 2024 17:19:06 -0800
Message-Id: <20241220011910.103280-1-vinay.belgaumkar@intel.com>
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

v10: Fix a leaked ref in pmu_enable(Riana)

Cc: Rui Zhang <rui.zhang@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Aravind Iddamsetty (1):
  drm/xe/pmu: Enable PMU interface

Vinay Belgaumkar (3):
  drm/xe: Add locks in gtidle code
  drm/xe/pmu: Add GT C6 events
  drm/xe/pmu: Add GT frequency events

 drivers/gpu/drm/xe/Makefile           |    2 +
 drivers/gpu/drm/xe/xe_device.c        |    3 +
 drivers/gpu/drm/xe/xe_device_types.h  |    4 +
 drivers/gpu/drm/xe/xe_gt.c            |    5 +
 drivers/gpu/drm/xe/xe_gt_idle.c       |   23 +-
 drivers/gpu/drm/xe/xe_gt_idle.h       |    1 +
 drivers/gpu/drm/xe/xe_gt_idle_types.h |    3 +
 drivers/gpu/drm/xe/xe_module.c        |    5 +
 drivers/gpu/drm/xe/xe_pmu.c           | 1092 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.h           |   30 +
 drivers/gpu/drm/xe/xe_pmu_types.h     |  147 ++++
 11 files changed, 1312 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
 create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h

-- 
2.38.1

