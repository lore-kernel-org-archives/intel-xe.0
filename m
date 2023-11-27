Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9E8C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 19:59:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3099F10E0BC;
	Mon, 27 Nov 2023 19:59:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C675410E0BC
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 19:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701115148; x=1732651148;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qh9l00WRakNgyjU/Cf8eg6O8QuZhBuHpZ3DC5y1yMZ0=;
 b=ilTtTrPTYHLePMxYcVbDObt7GK40+OwPFVNOhWs7CkZykhBloJ2SdUib
 3kOTML8kpV7LTUuwuCq2J+iehkVUwLGVmTdjI9IZz/vm738i8bdl5jXP2
 mk9mrpqf4b4QMrC9S0Lh5VDmqmHau/saueZpV64qf2Gp0aYGpIuxa2Slx
 L9zYBn0sai8cxFFMY+8xQe6YRGVlwYgbvDsMLcuT9wcY4CmE8AFEuEM72
 X73L9rHSs90qDGxPqv698hXHZMg/+uXi87d3+/mH0J/LEJhyOYDxinSFx
 A29UuAnbg3xkc8trt0bMSMzQN9cZypqwwj6xF+xjs2L2jdA/XMuZIVN16 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="383163967"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="383163967"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 11:59:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="16705560"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by fmviesa001.fm.intel.com with ESMTP; 27 Nov 2023 11:59:08 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 27 Nov 2023 11:58:53 -0800
Message-Id: <20231127195856.4183070-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/3] drm/xe: Add a flag that can disable GuC PM
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

This could be used to enable HW C6 and also debug any GuC related
PM issues.

v3: Rebase

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Vinay Belgaumkar (3):
  drm/xe: Rename xe_gt_idle_sysfs to xe_gt_idle
  drm/xe: Add skip_guc_pc flag
  drm/xe: Manually setup C6 when skip_guc_pc is set

 drivers/gpu/drm/xe/Makefile                   |  2 +-
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |  4 +++
 drivers/gpu/drm/xe/xe_gt.c                    |  2 +-
 .../xe/{xe_gt_idle_sysfs.c => xe_gt_idle.c}   | 28 +++++++++++++--
 drivers/gpu/drm/xe/xe_gt_idle.h               | 17 +++++++++
 drivers/gpu/drm/xe/xe_gt_idle_sysfs.h         | 13 -------
 ..._idle_sysfs_types.h => xe_gt_idle_types.h} |  0
 drivers/gpu/drm/xe/xe_gt_types.h              |  2 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                | 35 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_pci.c                   |  2 ++
 10 files changed, 84 insertions(+), 21 deletions(-)
 rename drivers/gpu/drm/xe/{xe_gt_idle_sysfs.c => xe_gt_idle.c} (85%)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_idle.h
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_idle_sysfs.h
 rename drivers/gpu/drm/xe/{xe_gt_idle_sysfs_types.h => xe_gt_idle_types.h} (100%)

-- 
2.38.1

