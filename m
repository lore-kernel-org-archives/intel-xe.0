Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F02C61D97
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 21:04:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89FD810E317;
	Wed, 22 Nov 2023 21:04:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26DF510E317
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 21:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700687086; x=1732223086;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=seGOcJSnqgauR+yZD+HzxWTviFe9bydPCT5OmF7IG/g=;
 b=hNJQkX87UBznDLjqL0pBUYOKRLoP02Y8jhMtpJa0JhY+y5foh2br9frT
 uHQ97blG4hkAnqj+bIZP/hcs98Qnb5OfLDT3fmLoHmVW2u1eqmPdJuE7/
 Ue77jXkagMpyC2jmP/jcGI0r+hnmg/teZ7QcQOaZbiUjma4gG4/zDsu61
 g28CkrXKT6yJjbmfZePnhX8OJw1TlEmg5oXfzynpkgTEIrbr9WTsb8xHo
 25RS6Ko34hMlZRjpcALYo2KdIjBvv9eisg9/ADcO+KidmBqu0226zEGB6
 lNGWMCFhMtM8l9mvQ7yB+7Yrs0SE9RUZ5WPpqAxD4+STNica2kflBCDp3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="13706946"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="13706946"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 13:04:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="940402390"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="940402390"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga005.jf.intel.com with ESMTP; 22 Nov 2023 13:04:43 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 22 Nov 2023 13:04:21 -0800
Message-Id: <20231122210424.3892196-1-vinay.belgaumkar@intel.com>
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
 drivers/gpu/drm/xe/xe_gt_idle.h               | 15 ++++++++
 drivers/gpu/drm/xe/xe_gt_idle_sysfs.h         | 13 -------
 ..._idle_sysfs_types.h => xe_gt_idle_types.h} |  0
 drivers/gpu/drm/xe/xe_gt_types.h              |  2 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                | 35 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_pci.c                   |  2 ++
 11 files changed, 84 insertions(+), 21 deletions(-)
 rename drivers/gpu/drm/xe/{xe_gt_idle_sysfs.c => xe_gt_idle.c} (85%)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_idle.h
 delete mode 100644 drivers/gpu/drm/xe/xe_gt_idle_sysfs.h
 rename drivers/gpu/drm/xe/{xe_gt_idle_sysfs_types.h => xe_gt_idle_types.h} (100%)

-- 
2.38.1

