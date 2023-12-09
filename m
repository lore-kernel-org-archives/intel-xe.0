Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F19C54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 07:59:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E293B10E086;
	Mon, 25 Mar 2024 07:59:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RgmwKf7P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B7D10E663
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 07:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711353564; x=1742889564;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Pj6Axzg4obJhcETA+oLNsc85W4lxvKBUOeZ6OdQ34qo=;
 b=RgmwKf7PBduYGd0OGwSNC3MEtPXrZeXvQZEQrWmRzWDlMqISxIDsUFXE
 TDYAGKrIKJ+lYiZ36zIf6OMGpZjDiKtE62jV+T6q/5rx43YekdipN6WJk
 5A0gqujenlI16Zk6uXWLA6S1quPzffqKJgeVtncOrlVwWmYEnideA+5K+
 mTZl57uGpwjCGI/t1R9zQKT5/1KbVKBFS6Xw4Dluw4V7vWU8JSN429ovz
 LZ33QrBJG/ZIzlKsbji1c7Jgiz/JceatP2aws8qgbRXDlAeZodR4o9GGC
 5javOvRk8hDSyftHx9jNEwALFitHdPyx88+OyN2FYsNBS1gvGtNBduXgb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6199050"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="6199050"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 00:59:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; d="scan'208";a="15525046"
Received: from bommu-optiplex-5060.iind.intel.com ([10.145.169.63])
 by orviesa009.jf.intel.com with ESMTP; 25 Mar 2024 00:59:23 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Subject: [PATCH v4 0/2] drm/xe : avoid the risky function sprintf
Date: Sun, 10 Dec 2023 05:29:47 +0530
Message-Id: <20231209235949.54524-1-krishnaiah.bommu@intel.com>
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

drm/xe/xe_hw_engine_class_sysfs: use sysfs_emit() for attr's _show()
    sprintf() is deprecated for sysfs, use preferred sysfs_emit() instead.

drm/xe: prefer snprintf over sprintf
    since the sprintf() function lacks built-in protection against buffer
    overflows using the snprintf() function.

Bommu Krishnaiah (2):
  drm/xe: prefer snprintf over sprintf
  drm/xe/xe_hw_engine_class_sysfs: use sysfs_emit() for attr's _show()

 drivers/gpu/drm/xe/xe_debugfs.c               |  2 +-
 drivers/gpu/drm/xe/xe_exec_queue.c            | 12 +++----
 drivers/gpu/drm/xe/xe_gt_debugfs.c            |  2 +-
 drivers/gpu/drm/xe/xe_gt_idle.c               |  4 +--
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 36 +++++++++----------
 drivers/gpu/drm/xe/xe_hw_fence.c              |  2 +-
 6 files changed, 29 insertions(+), 29 deletions(-)

-- 
2.25.1

