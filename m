Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F63EEE25E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 20:38:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA6B10EC4A;
	Thu, 12 Sep 2024 20:38:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eIEIfTww";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4AE10EC4A
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 20:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726173511; x=1757709511;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b8IcFk3HJeM2JCobyfbkEoe1iqxPr4HpRwpREEKhKV8=;
 b=eIEIfTwwr2S+l5SMcOUjAd/IMSa26DjhcWZLWIMF9WsKzJYi6VkCFTD6
 y0QT2Fw5i609ep02C7Nz/By6uqMUdKADzmGFOWykoYELqTryFk7OAJ35V
 tSIXtBHeJcINLNuDvulBrIleHKFoXMnnXQz8B+XHfCNktE5F0FJlueD//
 r2SOdGlwN1oJLxVRn+44aJHST3TlbnIwgUuYbOKE4HzLx5YXk1ONMmpc6
 1GK9FZ0ca6BN1Mq0PoDMXaFMayemOW5jhke0hSdSwnW42xdxENizoqxPF
 7aKvWlwtiLxUgNSiAGg9GAnsZ9A5x1RX0SOuJhHkuzvzWNWV1E4jTBvNG g==;
X-CSE-ConnectionGUID: 9IM7ETztSl+Z32TKeENOug==
X-CSE-MsgGUID: tS6A1g5xQWC70xxuU+g54w==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="35725111"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="35725111"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 13:38:30 -0700
X-CSE-ConnectionGUID: b07jP6j3SBmFpKf3zOp+JA==
X-CSE-MsgGUID: 2T8wgtjgQpiekRyyHY7wQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="68126764"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.117])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 13:38:29 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/6] PF: Initial support to save/restore VF GuC state
Date: Thu, 12 Sep 2024 22:38:11 +0200
Message-Id: <20240912203817.1880-1-michal.wajdeczko@intel.com>
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

To successfully migrate a VM with attached GPU VF we also need to
migrate VF's GuC state. This series adds necessary functions to save
and restore a VF state and also allows testing migration flow using
debugfs, ahead of availability of other required components that are
under development.

Michal Wajdeczko (6):
  drm/xe/guc: Fix GUC_{SUBMIT,FIRMWARE}_VER helper macros
  drm/xe/guc: Add PF2GUC_SAVE_RESTORE_VF to ABI
  drm/xe/pf: Add functions to save and restore VF GuC state
  drm/xe/pf: Save VF GuC state when pausing VF
  drm/xe/pf: Allow to view and replace VF GuC state over debugfs
  drm/xe/pf: Allow to trigger VF GuC state restore from debugfs

 drivers/gpu/drm/xe/Makefile                   |   1 +
 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    |  61 +++
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c           |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  41 +-
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  49 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 419 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  24 +
 .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  40 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   6 +
 drivers/gpu/drm/xe/xe_guc.h                   |   6 +-
 11 files changed, 648 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h

-- 
2.43.0

