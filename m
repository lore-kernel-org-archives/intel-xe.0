Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64B4C47074
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 22:20:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91AAA10E548;
	Thu,  4 Jan 2024 22:20:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6908910E548
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jan 2024 22:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704406842; x=1735942842;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1oK5DdY5H1PSnKmxv+QzEMIEiKmWzF9G0RkQQaDByjo=;
 b=NoOCcQWixfdyum9zbotLqRAYst+m/KjscDTwufjq0B/6quoPwukbqRYa
 ysEycHqt82rTdBGYOhRvC34Kcv78SXcLcIFUXgvCMMtrDS0434n0K8iJY
 X2Ba8E2ZmsWrwS7mP0L98asim9Zd+RRCfbtPhJRwfBdw9OVQFS9Cvr4TK
 mF8y9C4XP3t+Bi0N+OYrOJ5CzeJPaUT/Ct8FgStonZh/y4vfr4lhvNgpX
 KL0j96mcamKm0eXoKh1v2vARSzVlasKU1FOumx0/fm7laLY7e96xclrRk
 B3Z4P9Zl9h9iH4mWhZs//prwJpUn23rxdgD/uoXJDLzjTxkeNIrpnx/Mo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="428546839"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; d="scan'208";a="428546839"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 14:20:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="784022787"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; d="scan'208";a="784022787"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.149.125])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 14:20:40 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 00/10] Introduce Relay Communication for SR-IOV
Date: Thu,  4 Jan 2024 23:20:21 +0100
Message-Id: <20240104222031.277-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

v2: apply review comments from Piotr

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
 drivers/gpu/drm/xe/xe_guc_hxg_helpers.h       | 108 ++
 drivers/gpu/drm/xe/xe_guc_relay.c             | 941 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_relay.h             |  37 +
 drivers/gpu/drm/xe/xe_guc_relay_types.h       |  36 +
 drivers/gpu/drm/xe/xe_guc_types.h             |   4 +
 drivers/gpu/drm/xe/xe_sriov.c                 |  32 +
 drivers/gpu/drm/xe/xe_sriov.h                 |   1 +
 drivers/gpu/drm/xe/xe_sriov_types.h           |  12 +
 19 files changed, 2123 insertions(+), 1 deletion(-)
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

