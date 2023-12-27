Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01654C46CD2
	for <intel-xe@archiver.kernel.org>; Wed, 27 Dec 2023 23:59:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B4A10E109;
	Wed, 27 Dec 2023 23:59:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA4110E109
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Dec 2023 23:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703721545; x=1735257545;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V6+maOVcb8VRYP12n2ecZuvi7L2nVTTMrFmLo5OIB7A=;
 b=RI+qLdePSR/LQ2cah+WxOiHP11LddM1cEq7yr3tuSdzyzO/UBVH1JJ0f
 c2feajggiYgxvbQK7zyMJqzoAn1pGvRZtNYns2VOeR3f8FikwWRoyuSNt
 nr/Q4gIXhr1HzV2yVJR6Ma7irT1O2KvPm9GZe5XPMzss5IGU9hPwZPutZ
 NuGO/XaBT3vkkzot0NQbJ+/CZzvYzvpOgGEMVSj6xE8g8sEtwndVdcpP9
 SCGmdSXnSA9ZKuK5Q4d5m+ZdkX6/WfBR/iDtBQNQl9Vtcz5IPN89ASJ/Y
 DIvgov+dxN9/WpfIfLvZDBjAgZZjEAiF5zkiPUIoD6dqPVwQjf6IB0IN6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="3329147"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="3329147"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 15:59:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="754589855"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="754589855"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.132.129])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 15:59:02 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 00/10] Introduce Relay Communication for SR-IOV
Date: Thu, 28 Dec 2023 00:58:28 +0100
Message-Id: <20231227235838.212-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

There are scenarios where SR-IOV Virtual Function (VF) driver will
need to get additional data that is not available over VF MMIO BAR
nor could be queried from the GuC firmware and must be obtained
from the Physical Function (PF) driver.

The communication between Virtual Function (VF) drivers and Physical
Function (PF) drivers is based on the GuC firmware acting as a proxy
(relay) agent.

  VF                           GuC                            PF
  |                             |                             |
 [ ] VF2GUC_RELAY_TO_PF         |                             |
 [ ]-------------------------> [ ]                            |
 [ ] { rid, msg }              [ ]                            |
 [ ]                           [ ] GUC2PF_RELAY_FROM_VF       |
 [ ]                           [ ]-------------------------> [ ]
 [ ]                            |  { VFID, rid, msg }        [ ]
 [ ]                            |                            [ ]
 [ ]                            |         PF2GUC_RELAY_TO_VF [ ]
 [ ]                           [ ] <-------------------------[ ]
 [ ]                           [ ]      { VFID, rid, reply }  |
 [ ]      GUC2VF_RELAY_FROM_PF [ ]                            |
 [ ] <-------------------------[ ]                            |
  |             { rid, reply }  |                             |
  |                             |                             |

This series only introduces necessary functions (together with basic
kunit tests) to allow use of relay communication by the VFs drivers.
We will start using this functionality in upcoming series.

Michal Wajdeczko (10):
  drm/xe: Allocate dedicated workqueue for SR-IOV workers
  drm/xe: Define Virtual Function Identifier
  drm/xe: Introduce GT-oriented SR-IOV logging macros
  drm/xe/guc: Add helpers for HXG messages
  drm/xe/guc: Update few GuC CTB ABI definitions
  drm/xe/guc: Add Relay Communication ABI definitions
  drm/xe/guc: Introduce Relay Communication for SR-IOV
  drm/xe/kunit: Allow to replace xe_guc_ct_send_recv() with stub
  drm/xe/kunit: Add GuC Relay kunit tests
  drm/xe/guc: Start handling GuC Relay event messages

 drivers/gpu/drm/xe/Makefile                   |   1 +
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 174 ++++
 .../drm/xe/abi/guc_communication_ctb_abi.h    |   3 +-
 .../gpu/drm/xe/abi/guc_relay_actions_abi.h    |  79 ++
 .../drm/xe/abi/guc_relay_communication_abi.h  | 118 +++
 drivers/gpu/drm/xe/tests/xe_guc_relay_test.c  | 522 ++++++++++
 drivers/gpu/drm/xe/xe_device.c                |   4 +
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_printk.h       |  34 +
 drivers/gpu/drm/xe/xe_guc.c                   |   5 +
 drivers/gpu/drm/xe/xe_guc_ct.c                |  11 +
 drivers/gpu/drm/xe/xe_guc_hxg_helpers.h       | 107 ++
 drivers/gpu/drm/xe/xe_guc_relay.c             | 933 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_relay.h             |  32 +
 drivers/gpu/drm/xe/xe_guc_relay_types.h       |  36 +
 drivers/gpu/drm/xe/xe_guc_types.h             |   4 +
 drivers/gpu/drm/xe/xe_sriov.c                 |  37 +
 drivers/gpu/drm/xe/xe_sriov.h                 |   1 +
 drivers/gpu/drm/xe/xe_sriov_types.h           |  12 +
 19 files changed, 2114 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
 create mode 100644 drivers/gpu/drm/xe/abi/guc_relay_actions_abi.h
 create mode 100644 drivers/gpu/drm/xe/abi/guc_relay_communication_abi.h
 create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_printk.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_hxg_helpers.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_relay.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_relay.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_relay_types.h

-- 
2.25.1

