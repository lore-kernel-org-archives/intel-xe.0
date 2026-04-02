Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9752AD6AAFD
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 19:18:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4078A10E3AF;
	Thu,  2 Apr 2026 19:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BxKUuXMe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70FE110E3AF
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 19:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775157488; x=1806693488;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kaGuHmbn5z3RkA7gd1tnIB2ilG3IPcJRZ4kkh2+lGEw=;
 b=BxKUuXMe6A/keGlrPE3BImhDXC42M/z+vJTwHQgfDyfyjyua+4k67l1x
 DaELHE9TiBOejlf30QcnQSuk8FSDOSHtPWVdVn5nzCkr1gVRQ+4iL44RB
 mykm0cRSf4U7j1EGGqEAY5Luv5V0nP2PYFz19zD0Blcpt4T6HEEyhKC5F
 gJvXzC3WESVeITH7TBv/BiXgGkZYHbrCOg5MyDOdb1vJHyM07+aJex/wX
 lR/w2wgzixsGW4BVr++RTrSP0WdlQ+BIVc+iCzA2nMkJbO/yMoYYlaCMR
 nsCLVaAdQZLN0n3umvgxpNF0N+RAJbLO7+2jLw4FBf3lnOPlvYw4haAel w==;
X-CSE-ConnectionGUID: umI7jrp+QAeqZ2PWNEnQ5Q==
X-CSE-MsgGUID: ZmxZ+VtEQkOXLlwlogaQQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76241083"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="76241083"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 12:18:07 -0700
X-CSE-ConnectionGUID: oovnhFqsRfaS7sy265G0kQ==
X-CSE-MsgGUID: EYmQTfmiSZKMRIFCB9w5Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="222212921"
Received: from ngusev-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.92])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 12:18:05 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 00/13] drm/xe/pf: Improve EQ/PT provisioning
Date: Thu,  2 Apr 2026 21:17:13 +0200
Message-ID: <20260402191726.4932-1-michal.wajdeczko@intel.com>
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

v1: https://patchwork.freedesktop.org/series/164119/#rev1
v2:
    add explicit lockdep_assert_held (Piotr)
    don't miss to check last VF sched-provisioning (Michal)
    and explicitly check sched_if_idle mode (Michal)

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
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 262 ++++++++++++++++++---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c | 122 ++++++----
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h |   4 +-
 drivers/gpu/drm/xe/xe_pci_sriov.c          |   2 +
 drivers/gpu/drm/xe/xe_sriov_pf_provision.c |  41 ++++
 drivers/gpu/drm/xe/xe_sriov_pf_provision.h |   1 +
 9 files changed, 362 insertions(+), 80 deletions(-)

-- 
2.47.1

