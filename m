Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BA5C4167D
	for <intel-xe@archiver.kernel.org>; Wed,  1 Nov 2023 23:57:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8314D10E7F6;
	Wed,  1 Nov 2023 23:57:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40BC510E7F4
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Nov 2023 23:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698883074; x=1730419074;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L0HxPntLa73WnVABqLoiwDarqkZE6fzEESdPHXrH1zc=;
 b=I8q3rFZJO0J92Wxr6RzrUm/x5saEWjS4EkVH2yJxiyhfokJdiIUEpeB/
 oWtE7Ze+Z8HRdTjAntvOEseSN+I+YyOXwQ50CjDAI+Y/q0fDcVf38K+F6
 C4PU1NbuX2iwuLFxQl2YtpaCvBHKm/S+XtInLvvLp7BD2iIT+DGaYpIVK
 /nk5PKRJ++bLYXx2gBt/uiYuLppOrkQBBFPRQ0XCgKi+Ka42LKIIeZUIx
 QeOZiYnFQVRFLlIBfVCV9bfezfKa89md3Zi6gKS3hv/irnQa+hKrojKNO
 m5lAfOQJA1nujAskKFmx/PuwYtavZ9NFFlRQ9TpHOjVU+7Y7eaJswcqa9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="378996968"
X-IronPort-AV: E=Sophos;i="6.03,269,1694761200"; d="scan'208";a="378996968"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 16:57:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1008276011"
X-IronPort-AV: E=Sophos;i="6.03,269,1694761200"; d="scan'208";a="1008276011"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 16:57:53 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  1 Nov 2023 16:57:47 -0700
Message-Id: <20231101235749.4720-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC v2 0/2] drm/xe/pvc: Enable fixed CCS mode
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

Allow static assignment of compute slices to a user selected
number of compute engines. Add a per-tile 'ccs_mode' sysfs
interface for user selection. By default assign all compute
resources to the first available compute engine. User must
ensure the tile is idle while changing the ccs mode as this
causes a tile reset. User must also ensure that there are no
open exec queues while changing the ccs mode. Also, error will
be returned for exec queue creation with disabled ccs engines. 

Support this mode for PVC which can be extended to other
platforms in future.

IGT: https://patchwork.freedesktop.org/series/125873/

v2: Fixed issue with HW config, ensure no exec queue is created
    with disabled CCS engines.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (2):
  drm/xe: Enable Fixed CCS mode setting
  drm/xe: Prevent exec_queues creation on diabled CCS engines

 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 14 +++++
 drivers/gpu/drm/xe/xe_device.c       |  1 +
 drivers/gpu/drm/xe/xe_device_types.h |  9 ++++
 drivers/gpu/drm/xe/xe_exec_queue.c   | 45 +++++++++++++++-
 drivers/gpu/drm/xe/xe_gt.c           | 27 ++++++++--
 drivers/gpu/drm/xe/xe_gt.h           |  2 +
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 79 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_ccs_mode.h  | 22 ++++++++
 drivers/gpu/drm/xe/xe_gt_types.h     | 16 ++++++
 drivers/gpu/drm/xe/xe_guc_ads.c      |  3 ++
 drivers/gpu/drm/xe/xe_hw_engine.c    | 14 +++++
 drivers/gpu/drm/xe/xe_tile_sysfs.c   | 62 ++++++++++++++++++++++
 13 files changed, 288 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.h

-- 
2.21.0.rc0.32.g243a4c7e27

