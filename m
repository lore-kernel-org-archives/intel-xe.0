Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F06C07E98
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 01:17:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EEF810E5E5;
	Wed, 29 Nov 2023 01:17:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 214FC10E5E4
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 01:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701220650; x=1732756650;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m3NN+M6XtvKhZpeuRGWjOIhNnrZ+PiVuL/RT31GBa+g=;
 b=KZQ5ooMrwhf4QzleuAK84U8sAMbMPCwS3V738u1k3NCNstzwjBzCR31W
 ZihUHUESpPo4mKqk9Y2IZiC33ySPFyQesFi0Dq7kJ+voNpzHFISFrmbJz
 5i5xpNQKdQ8skDj5nwD0/Re0os1b0t9X3h7UWk/zr71xlZM6pxUuDEx70
 oBrPSou41fc7/2Uo6LCip8uBYqOsQdNbuXfYzRBajWDgSbDCs8PMf6VrY
 5skrnimMRmfFqFiUb34c+NsMBMR5r34lrgOOHEGAHpTZPIN7xjI+OwdOH
 lmoNfAL40Ot2OK6nNZkqmZhG7VBZLx/VldArJfRWOZ4xIMapvFiBosQA9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="6329496"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="6329496"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 17:17:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="1100322344"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="1100322344"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 17:17:28 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Nov 2023 17:17:17 -0800
Message-ID: <20231129011721.2793482-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] HuC authentication via GSC
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

Starting on MTL, in addition to the authentication via GuC, we need to
perform a second HuC authentication via GSC. This second authentication
is required to allow the HuC to process protected content and is
performed by sending a dedicated PXP command to the GSC firmware.

Daniele Ceraolo Spurio (2):
  drm/xe/huc: Prepare for 2-step HuC authentication
  drm/xe/huc: HuC authentication via GSC

 drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h |  59 ++++++
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h         |   2 +
 drivers/gpu/drm/xe/xe_gsc.c                   |  14 +-
 drivers/gpu/drm/xe/xe_huc.c                   | 184 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_huc.h                   |   9 +-
 drivers/gpu/drm/xe/xe_huc_types.h             |   5 +
 drivers/gpu/drm/xe/xe_uc.c                    |   2 +-
 drivers/gpu/drm/xe/xe_uc_fw.c                 |   2 +
 drivers/gpu/drm/xe/xe_uc_fw_types.h           |   3 +
 9 files changed, 263 insertions(+), 17 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h

-- 
2.41.0

