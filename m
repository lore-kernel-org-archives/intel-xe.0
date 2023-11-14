Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0E3C072A2
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 00:46:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5804710E43D;
	Tue, 14 Nov 2023 00:46:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED97010E436
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 00:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699922771; x=1731458771;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Eao+UulksTdGidMTufOKYGrPAJf03AtaIq3Lh1Awy8c=;
 b=H7ir6Drh0/6rWQv1udbD0mJIobSVniKTFm6gNHkPDEBDaiTVT4IenW5b
 I0caHJYFSZGlOhkFrxU9NDW4kfEIc7nE+/gsXK0Bnhz87fN0HU+72TmG9
 +uJcDbgDFOplUjvUNXBwvwVYeANKKcqa5kdY1vV8XDGBQdriL/Qv2cioV
 OkTNNpeCMw7rTO5pzbnt18PQoQd0Kf2vsi6AL+0qAjxa08YB0RaNHJgUm
 XoZCA2NmMsLg6yQ5Ux7vGYTT4neZ1r3ywVpw58ZJhjkWvB1vZi/21N2R+
 JP/3w6duye7PAy3NwCj5a6tiM23qIBq4pLpPk/FGUfw9r/kioYXarFMqO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="3621910"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="3621910"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 16:46:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="740923718"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="740923718"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 16:46:10 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Nov 2023 16:46:02 -0800
Message-Id: <20231114004604.4439-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC v3 0/2] drm/xe/pvc: Enable fixed CCS mode
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
v3: Make ccs_mode a per 'gt' entry instead of per tile (Matt Roper)
    Allow ccs_mode update only when there are no drm clients.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (2):
  drm/xe: Enable Fixed CCS mode setting
  drm/xe: Avoid any races around ccs_mode update

 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 14 ++++++
 drivers/gpu/drm/xe/xe_device.c       |  9 ++++
 drivers/gpu/drm/xe/xe_device_types.h |  9 ++++
 drivers/gpu/drm/xe/xe_gt.c           | 10 ++++
 drivers/gpu/drm/xe/xe_gt.h           |  2 +
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 73 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_ccs_mode.h  | 22 +++++++++
 drivers/gpu/drm/xe/xe_gt_sysfs.c     | 62 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_types.h     | 14 ++++++
 drivers/gpu/drm/xe/xe_guc_ads.c      |  3 ++
 drivers/gpu/drm/xe/xe_hw_engine.c    | 20 ++++++++
 12 files changed, 239 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.h

-- 
2.21.0.rc0.32.g243a4c7e27

