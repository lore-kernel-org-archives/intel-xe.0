Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A123C4167D
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 04:01:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6982910E54B;
	Tue, 12 Dec 2023 04:01:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE3010E183
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 04:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702353670; x=1733889670;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9NsLOvzfzif+/yfE30p4LID1XSlGW/3U/4bSwSgMHuw=;
 b=JrWCMRMvH5j4l39B3BhS1rO1C6GH528WHDYkFeRP6wdx/ewX6qIrm/vx
 /tCVKetSIobz+oAul7bKcG+9QodIw++zXYJvXDqOSUS2SN/w+PfqOhcfL
 RPzILGkPvxUmvjTRgQZP7SFEYDxqSKYm8NfdXiYRtignKpcl0nEdbZuBK
 l4i7nHCQrlPSaiZlVd0Nbtn5KmI3svlB0/fFne/hjvSpF7SM2s4Hb7k5y
 1jj6ZarNe3i6BHYIFzRwOa0vuw1kH+ZuL98eLfCEajvT2H/ziL1cNiMBU
 BkYLF2rvBJFUXI5DHpD10ggtue8rIiK+TgtHBOv6HB3dVXohQakEfnTCK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="461225916"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="461225916"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 20:01:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="723074989"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="723074989"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 20:01:10 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 0/2] drm/xe/pmu: Remove PMU from Xe till uapi is finalized
Date: Mon, 11 Dec 2023 20:01:00 -0800
Message-ID: <20231212040102.2888700-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

A slightly better version with a separate fixup patch for the compile fix
to xe/tests/xe_dma_buf.c.

Ashutosh Dixit (2):
  drm/xe/pmu: Remove PMU from Xe till uapi is finalized
  fixup! drm/xe/uapi: Reject bo creation of unaligned size

 drivers/gpu/drm/xe/Makefile           |   2 -
 drivers/gpu/drm/xe/regs/xe_gt_regs.h  |   5 -
 drivers/gpu/drm/xe/tests/xe_dma_buf.c |   2 +
 drivers/gpu/drm/xe/xe_device.c        |   2 -
 drivers/gpu/drm/xe/xe_device_types.h  |   4 -
 drivers/gpu/drm/xe/xe_gt.c            |   2 -
 drivers/gpu/drm/xe/xe_module.c        |   5 -
 drivers/gpu/drm/xe/xe_pmu.c           | 645 --------------------------
 drivers/gpu/drm/xe/xe_pmu.h           |  25 -
 drivers/gpu/drm/xe/xe_pmu_types.h     |  68 ---
 include/uapi/drm/xe_drm.h             |  40 --
 11 files changed, 2 insertions(+), 798 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/xe_pmu.c
 delete mode 100644 drivers/gpu/drm/xe/xe_pmu.h
 delete mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h

-- 
2.41.0

