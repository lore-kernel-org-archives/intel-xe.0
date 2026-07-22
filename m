Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3498C44539
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 12:33:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6246310E43D;
	Wed, 22 Jul 2026 12:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MQteg/F4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7CE10E43D
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 12:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784723629; x=1816259629;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5LPiJHDLjC9P4i+BcjB9ZslH2wNn8MSOQB3gf3/4d2k=;
 b=MQteg/F4eYc53lO1thasw3EUjj7fa6H5PSp5rT+Ngoc6LpmqV55sR93i
 pa3TqPvQ2UhjUIVAWikG42rjhh52dluazGGYO8YCWbZ0plfXtJQ4XwtBm
 xwPkk/b5KS1bFvC2umqS3CIPXBi9fOQ45qg8bq5vxbnGMWww8Fl9VSrg8
 LBBFu7D8xd0/wpOgpcpVESjdYFiLW6e4Xx8mDYP1SVgYJmziGHHXJ5SMB
 FPhDHB1jjn7VHnkQlVSrfxDXtz5AaVLQ9MzGG0S2w25VtZxHhsPjfGGpo
 K/J+nqu2CYja0OYOO8OTIYHFE/YGh3CueqAJ43ZHk7rM21R9KZ1Im/NLC A==;
X-CSE-ConnectionGUID: InHA3yoUQbuPDivfncj72Q==
X-CSE-MsgGUID: stm4UizaRyqsHYylZfVXYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="96872756"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="96872756"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 05:33:49 -0700
X-CSE-ConnectionGUID: O54Um0KHSrWRK6euODBjqw==
X-CSE-MsgGUID: Z63L7YkRQEWWGUl0bOshzg==
X-ExtLoop1: 1
Received: from gsd-build.iind.intel.com ([10.190.229.141])
 by fmviesa003.fm.intel.com with ESMTP; 22 Jul 2026 05:33:47 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 0/3] KUnit test for VF provisioning error handling
Date: Wed, 22 Jul 2026 12:33:41 +0000
Message-ID: <20260722123342.339623-5-satyanarayana.k.v.p@intel.com>
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

This patchset adds infrastructure and tests to verify that a VF
properly handles malformed or invalid device configuration
responses from the PF.

A VF relies on the PF to provide valid hardware configuration through GuC
KLV responses during initialization. If the PF is misconfigured or
malfunctioning, a VF may receive zero, incomplete, or out-of-range
values for critical resources like GGTT, VRAM, Contexts or Doorbells.

A parametrized KUnit test suite (vf_gt_config_suite) that covers distinct
error scenarios across the four resource types is added. Each test verifies
that the corresponding VF configuration function returns a negative error
code when presented with:

  Contexts : zero count, too-small allocation, invalid,
             single context, too-large allocation
  Doorbells: zero count, too-small allocation, invalid,
             single doorbell, too-large allocation
  LMEM     : zero size, too-small allocation, double expected size,
             1 GB allocation, too-large allocation
  GGTT     : zero size, too-small allocation, 4K vs 2G expected

All tests use the guc_action_query_single_klv() stub to inject these bad
responses without requiring actual hardware or PF interaction.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

---
V1 -> V2:
- Renamed the kunit file name (Michal W).
- Fixed review comments (Michal W).

Satyanarayana K V P (3):
  drm/xe/vf: Add KUNIT stub for guc_action_query_single_klv()
  drm/xe/vf: split submission config query helpers
  drm/xe/tests: Add KUnit tests for VF provisioning error handling

 .../gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c   | 268 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |  56 +++-
 2 files changed, 315 insertions(+), 9 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c

-- 
2.43.0

