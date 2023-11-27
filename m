Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172B7C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 18:55:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C670C10E0DB;
	Mon, 27 Nov 2023 18:55:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C916610E0DB
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 18:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701111308; x=1732647308;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bywwKgnijOVgYj1sHinghZX0yQL0OVsvLWSz1rGQFK8=;
 b=DwhFl4ytp8hhmOV1cDA4gYtU5+5l5mG4UBd2Z7MqCCHF2I4Ob3f7mhWL
 Mg8RgQp+QW4Ol/rT4gGEY0ZFNr65mgCGjPFvnqh66fjz+gWbdQLF7YW2d
 UJL4KEatifCYejDsFWx3A9tphxZ58iQN9g+DCUC3MGQqbiW4+/CYHvJdp
 xYFBuzyI89GBtVYznL6vMj/7/bUQgHTTz24p84by1dZQOP75ZjLujPdNw
 V9ODZP3fZpLrWH8Lnz8rzb9eVv+96w+X8xxXkJhPqDqMo+xGAfvwqMhPK
 OFmEBbWeQJj15UBv6/RxZ8B4J4VkJwTR2R41Nq5+l939pSQlrcNKTG9zo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="5959534"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="5959534"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 10:55:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="718128031"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="718128031"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga003.jf.intel.com with ESMTP; 27 Nov 2023 10:55:05 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 27 Nov 2023 10:54:42 -0800
Message-Id: <20231127185445.4156792-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/3] drm/xe: Add a flag that can disable GuC PM
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

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Vinay Belgaumkar (3):
  drm/xe: Rename xe_gt_idle_sysfs to xe_gt_idle
  drm/xe: Add skip_guc_pc flag
  drm/xe: Manually setup C6 when skip_guc_pc is set

 drivers/gpu/drm/xe/Makefile                   |  2 +-
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |  4 +++
 drivers/gpu/drm/xe/xe_device_types.h          |  2 ++
 drivers/gpu/drm/xe/xe_gt.c                    |  2 +-
 .../xe/{xe_gt_idle_sysfs.c => xe_gt_idle.c}   | 28 +++++++++++++--
 drivers/gpu/drm/xe/xe_gt_idle.h               | 17 +++++++++
 drivers/gpu/drm/xe/xe_gt_idle_sysfs.h         | 13 -------
 ..._idle_sysfs_types.h => xe_gt_idle_types.h} |  0
 drivers/gpu/drm/xe/xe_gt_types.h              |  2 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                | 35 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_pci.c                   |  2 ++
 11 files changed, 86 insertions(+), 21 deletions(-)
 rename drivers/gpu/drm/xe/{xe_gt_idle_sysfs.c => xe_gt_idle.c} (85%)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_idle.h
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_idle_sysfs.h
 rename drivers/gpu/drm/xe/{xe_gt_idle_sysfs_types.h => xe_gt_idle_types.h} (100%)

-- 
2.38.1

