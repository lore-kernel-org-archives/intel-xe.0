Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5ECBC531FC
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 11:49:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8196810F37D;
	Fri, 24 Jul 2026 11:49:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gIpRaatU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC7C10F37D
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 11:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784893788; x=1816429788;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RPsyoqgCU6yQuUZEkfEkrTJDi0xwCnkdRMH/DSK2fUg=;
 b=gIpRaatUThGDJ6YmO4tXLDONd+mYyDAKrmSg4psf3kRuzprEWOH4h1wZ
 U47TM1FNyBUNVNmJFQVB7zi+RiNuG6FMMcODveyYfdaSl70ts0D/uHdLs
 0aepRJ7gunTyXYzIiu5keCwEUxlgrDkfgIScS4ybId+YawbZ/3mDbnFpc
 APgdWfTv0MikAv5HuOyyoXE/ett/VwfasO35OBBDSfF8nCAisSO1epO/S
 wxFHr/XCB6U0NCOVQSEXAAw0j9nEFd/qqt77OSk3Qvbl0ns1K5ChxYw0x
 ydh7P5V+7cPiG2c/52f1RlOYIaLuncr6ZC3fwFAHm9z/xP0X4LFlQHGMD A==;
X-CSE-ConnectionGUID: 0ZH2qX85ThGuUl4YbUM99w==
X-CSE-MsgGUID: dGDW1f6xSeGXpCoHlq0y1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="89385149"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="89385149"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 04:49:47 -0700
X-CSE-ConnectionGUID: ckTrn8BJTp6J4ytwTAsbqQ==
X-CSE-MsgGUID: TYZX+vrtTKSbbF0w2m5Nag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="296909330"
Received: from gsd-build.iind.intel.com ([10.190.229.141])
 by orviesa001.jf.intel.com with ESMTP; 24 Jul 2026 04:49:45 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3 0/4] KUnit test for VF provisioning error handling
Date: Fri, 24 Jul 2026 11:49:35 +0000
Message-ID: <20260724114939.1560743-6-satyanarayana.k.v.p@intel.com>
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

Add KUnit test cases that use the guc_action_query_single_klv32() and
guc_action_query_single_klv64()static stubs to inject bad KLV responses
and verify that VF can survive without crashing for the invalid
configuration data received.

While adding this kunit test, found some missing error handling in the VF
code path for invalid doorbell configuration. This patchset also adds the
missing error handling to the VF code path.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

Satyanarayana K V P (4):
  drm/xe/vf: Add KUNIT stub for guc_action_query_single_klv()
  drm/xe/vf: split submission config query helpers
  drm/xe/pf: Allow valid doorbell configuration during VF provision
  drm/xe/tests: Add KUnit tests for VF provisioning error handling

 .../gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c   | 213 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |  68 +++++-
 3 files changed, 271 insertions(+), 12 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c

-- 
2.43.0

