Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F1BC5AD4E
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 10:12:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A36810E797;
	Mon, 10 Aug 2026 10:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PfmI1tpH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1A710E7B2
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Aug 2026 10:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786356759; x=1817892759;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HW5v6tlbFxC7Ef7mT7MHPqYSzhEs0jmj5o2BcfqDIxE=;
 b=PfmI1tpHuUOPxz4eAbxXX/wFoJ9yk1WiomW83DfQzkVaDJhVe1RRZu5d
 cTfW76qtmNRfz3ZBeU+F2flG4ShYN9HBQni2+cMPp4RpLyLlBrRAGlN20
 YabOpNFrJqlAFo6AEBHlQI1CT00RRPQsj0oYjY9eRi3JlRsHKvSjeTlfq
 h87tAxMD+2vN/tfs+U8KCVGkJESsmloYgelkZFLPt1z/fXCPzTfVUtf4o
 PNkGPm68zRG49s2vy8Q5sOtZHpW7r6JiwKT1AZCnPr0vD1nEi0jt8Ulpf
 j6IwMkthcvSaN82fS5urQDSUUHQ6j0KmcIW6izKL9kRHiX+RfxpW6B153 A==;
X-CSE-ConnectionGUID: MX6NLDUmR6qaRL7ZwEsjcw==
X-CSE-MsgGUID: fsJzMSw2QvKSM9D8TYweOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="86893648"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="86893648"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 03:12:38 -0700
X-CSE-ConnectionGUID: A9Eg6//OSY+h+QHyWFatCw==
X-CSE-MsgGUID: VR1tvVN9QTarmNHWXBTqmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="301227529"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by orviesa001.jf.intel.com with ESMTP; 10 Aug 2026 03:12:37 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v5 0/6] KUnit test for VF provisioning error handling
Date: Mon, 10 Aug 2026 15:44:27 +0530
Message-ID: <20260810101428.1009573-8-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.53.0
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

This patchset adds infrastructure and tests to verify that a VF
properly handles malformed or invalid device configuration
responses from the PF.

A VF relies on the PF to provide valid hardware configuration through GuC
KLV responses during initialization. If the PF is misconfigured or
malfunctioning, a VF may receive zero, incomplete, or out-of-range
values for critical resources like GGTT, VRAM, Contexts or Doorbells.

Add KUnit test cases that use the xe_guc_mmio_send_recv() stub to inject
bad KLV responses and verify that VF can survive without crashing for
the invalid configuration data received.

While adding this kunit test, found some missing error handling in the VF
code path for invalid doorbell,  GGTT and VRAM configurations. This
patchset also adds the missing error handling to the VF code path.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

Satyanarayana K V P (6):
  drm/xe/guc: Allow to replace xe_guc_mmio_send_recv() with KUNIT stub
  drm/xe/vf: Split submission config query helpers
  drm/xe/vf: Add bounds checking for queried context and doorbell counts
  drm/xe/vf: Add bounds checking for queried GGTT base and size
  drm/xe/vf: Add bounds checking for queried VRAM size
  drm/xe/tests: Add KUnit tests for VF provisioning error handling

 .../gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c   | 322 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |  84 ++++-
 drivers/gpu/drm/xe/xe_guc.c                   |   5 +
 3 files changed, 402 insertions(+), 9 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c

-- 
2.53.0

