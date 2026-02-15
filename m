Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712ECE63F12
	for <intel-xe@archiver.kernel.org>; Sun, 15 Feb 2026 20:33:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D2110E04E;
	Sun, 15 Feb 2026 20:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UrxS1N3p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2C910E00C
 for <intel-xe@lists.freedesktop.org>; Sun, 15 Feb 2026 20:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771187620; x=1802723620;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LHj50oB3V/LSJd6IGO1iIF//3mTfRBwLXlSithMbIsY=;
 b=UrxS1N3pad+AHE+NncSmggjLGz4g3H5nljbuf7JGnpa8srIpiNByW2F0
 qWdJxKkJRz8BXPZOUrX+5vAKg/1uR+/wXGqShK6PKjWAqsAXpe/d/JWeu
 //Ps/eePcEEtE/4wnzsQ0br4S37N2L/CsEXxRxIv9LBwsTuOTt9aNxEZW
 syAAwRfcmsNLh/STBfBV02SnqoOy4i+looxAripeNgmDtAwXjBopq4lEV
 Iu4smGPlqb3xpjuNRqNBB0dIFPzjyHvKNQsu0wkW4ZqngADq45XbENkNp
 O8sAUb0DspouJiQ5QAnnGnD2BI627vjomh7KF/WfEnRpHZSCPtZKmTwmU Q==;
X-CSE-ConnectionGUID: oSju+kMmQqC+VacigyscGw==
X-CSE-MsgGUID: EmVEi4O/QMqqSaR7EHBciQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="71996386"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208";a="71996386"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2026 12:33:39 -0800
X-CSE-ConnectionGUID: BK7ZfEyfQvqX+mqFObNpFA==
X-CSE-MsgGUID: PF3utjjBS+G0Kn7aYXUesA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208";a="251096585"
Received: from shealy-mobl3.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.64.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2026 12:33:38 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 0/9] drm/xe/pf: Allow to change VFs VRAM quota using sysfs
Date: Sun, 15 Feb 2026 21:33:14 +0100
Message-ID: <20260215203323.595-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

Extend Xe driver specific sysfs SR-IOV knobs with VRAM provisioning.

 /sys/bus/pci/drivers/xe/BDF/
 ├── sriov_admin/
     ├── .bulk_profile
     │   └── vram_quota                 [RW] unsigned integer
     ├── vf1/
     │   └── profile
     │       └── vram_quota             [RW] unsigned integer
     ├── vf2/
     │   └── profile
     │       └── vram_quota             [RW] unsigned integer

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>

Michal Wajdeczko (9):
  drm/xe/pf: Add locked variants of VRAM configuration functions
  drm/xe/pf: Add functions for VRAM provisioning
  drm/xe/pf: Allow to change VFs VRAM quota using sysfs
  drm/xe/pf: Use migration-friendly VRAM auto-provisioning
  drm/xe/tests: Add KUnit tests for new VRAM fair provisioning
  drm/xe/pf: Don't check for empty config
  drm/xe/pf: Prefer guard(mutex) when doing fair LMEM provisioning
  drm/xe/pf: Skip VRAM auto-provisioning if already provisioned
  drm/xe/pf: Add documentation for vram_quota

 .../ABI/testing/sysfs-driver-intel-xe-sriov   |  31 ++++
 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |  90 +++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 167 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h    |   4 +
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c    | 121 +++++++++++--
 drivers/gpu/drm/xe/xe_sriov_pf_provision.h    |   4 +
 drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c        |  26 ++-
 7 files changed, 416 insertions(+), 27 deletions(-)

-- 
2.47.1

