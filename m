Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF4E1061B1E
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 20:41:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F24D10E800;
	Mon, 30 Mar 2026 20:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DLCXyBut";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB40810E7D8
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Mar 2026 20:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774903259; x=1806439259;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OC7980c3D3Iu3HscyF9T1FnUq6sEEIUlwp0INKg6nSg=;
 b=DLCXyButH6OuA+za5GUhbdjk3A430XGjxfzpXtmrVnr6ZrTU3qyA7d/+
 wAdz6+w6xq7b6mX3tfk7oqcwqpVZubt4OGWBu6bHH+rPXCv3q0pwwUyb5
 uxRD00eMy2w8Fb9659i2ebl6rzkigkga023A4RTpcU1YVZqTCH8KjmIk0
 VfJIB4hlY9JBj0tHYPC29m10WS8tRvgIBuXuYyhN3k4tI9Q0/tFj4nEoc
 SGg4IQIkj+7yn0w7Fes4SPgbMkPKH0hrxcylE7xTt5ynkRzXqVGZQHEH8
 hs8711CdOF0TPHR77C1HmGjSG9MHE6vf7Uu5d/tqeKheNQDqhnP7iCM3/ A==;
X-CSE-ConnectionGUID: hE0oa56eT4W4SATA5Lb8kw==
X-CSE-MsgGUID: 3B31rn1tS2eAChy/H+NfWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75923694"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="75923694"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 13:40:58 -0700
X-CSE-ConnectionGUID: KPesuy+9SPi9BI/Y1EPLkw==
X-CSE-MsgGUID: MTNZNyzsSSe/Kr5aoGbI5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="225329321"
Received: from liyantan-mobl1.gar.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.179])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 13:40:57 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 00/13] drm/xe/pf: Improve EQ/PT provisioning
Date: Mon, 30 Mar 2026 22:40:31 +0200
Message-ID: <20260330204046.567-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

Since some time [1] we allow to change scheduling configurations of
the PF and VFs, what can be done before or after the VFs are enabled.

But while default EQ/PT values give the most flexibility, they don't
protect the PF or other VFs from one VF that could constantly submit
workloads without any gaps that would let GuC do a VF-switch.

To avoid forcing careless users to use sysfs prior to the experiments,
perform some auto-provisioning and preset PF and VFs EQ/PT to 16ms,
which should be fine for most simple usecases.

But before doing that, fix some minor corner cases that could impact
EQ/PT provisioning.

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/commit/3f984d706d6b

Michal Wajdeczko (13):
  drm/xe/guc: Update POLICY_SCHED_IF_IDLE documentation
  drm/xe/pf: Fix pf_get_sched_priority() function signature
  drm/xe/pf: Force new VFs prorities only once
  drm/xe/pf: Print applied policy KLVs
  drm/xe/pf: Reprovision policy settings after GT reset
  drm/xe/pf: Don't reprovision policies if already default
  drm/xe/pf: Encode scheduling priority KLV if needed
  drm/xe/pf: Check EQ/PT/PRIO when testing VF config
  drm/xe/pf: Allow to change sched_if_idle policy under lock
  drm/xe/pf: Reprovision scheduling to default when no VFs
  drm/xe/pf: Extract helper to show which VFs are provisioned
  drm/xe/pf: Extract helpers for bulk EQ/PT provisioning
  drm/xe/pf: Perform fair scheduling auto-provisioning

 drivers/gpu/drm/xe/abi/guc_klvs_abi.h      |   7 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c        |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 255 ++++++++++++++++++---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c | 122 ++++++----
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h |   4 +-
 drivers/gpu/drm/xe/xe_pci_sriov.c          |   2 +
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c |  41 ++++
 drivers/gpu/drm/xe/xe_sriov_pf_provision.h |   1 +
 9 files changed, 355 insertions(+), 80 deletions(-)

-- 
2.47.1

