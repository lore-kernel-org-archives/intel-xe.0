Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8617C531F9
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 09:50:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B78810E859;
	Tue, 28 Jul 2026 09:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iBrDSDvU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7DCD10E85A
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 09:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785232233; x=1816768233;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TbwQP8OnZyYwVdC1mq8pgDoSJsV9WDdnwpBJSR+VAWQ=;
 b=iBrDSDvUlncW/d4DlbPmSlg7+FOLYtHFxze/w/ihNZYLDjiwFOYBP1DC
 vIHUzWHfTQKQOuudECgmEGLBYR6B6ytyw5uMNI9DmcfuiH1adYvU/M/Ya
 uD1nnDTtu75iGHOGqOfHTbSQMObABY2tkO906bOPYYOTSSn+HMTXgzM5v
 vVu5dGsSrUJeJMXuszBwX3knyVWUTpnTDK6GchCmO2KP++Z3kubMz+reP
 HjkzUmLjINWDtc9S4971Z+QAtmNwsJlx59J/7fTSZeMJoP9/orA6Jiuak
 pxb+PX+6eraGLe9U3yIWrl7dywjgADR1vtcWBufuHD71rNyxdriW/PepX g==;
X-CSE-ConnectionGUID: l7Q/tawkRce8vhsoTnksjQ==
X-CSE-MsgGUID: 0kSbTIJSSJ+Z0Q5HmpNDZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="111357393"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="111357393"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 02:50:32 -0700
X-CSE-ConnectionGUID: L7DlJVvfQpqeV4A+u263Ww==
X-CSE-MsgGUID: 7CYHF1AZTZ+aPQKNlKtgvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="258387235"
Received: from gsd-build.iind.intel.com ([10.190.229.141])
 by orviesa010.jf.intel.com with ESMTP; 28 Jul 2026 02:50:31 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v4 0/4] KUnit test for VF provisioning error handling
Date: Tue, 28 Jul 2026 09:50:26 +0000
Message-ID: <20260728095026.2197333-6-satyanarayana.k.v.p@intel.com>
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

Add KUnit test cases that use the xe_guc_mmio_send_recv() stub to inject
bad KLV responses and verify that VF can survive without crashing for
the invalid configuration data received.

While adding this kunit test, found some missing error handling in the VF
code path for invalid doorbell configuration. This patchset also adds the
missing error handling to the VF code path.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

Satyanarayana K V P (4):
  drm/xe/guc: Add KUNIT stub for xe_guc_mmio_send_recv()
  drm/xe/vf: Split submission config query helpers
  drm/xe/vf: Add bounds checking for queried context and doorbell counts
  drm/xe/tests: Add KUnit tests for VF provisioning error handling

 .../gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c   | 212 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |  64 +++++-
 drivers/gpu/drm/xe/xe_guc.c                   |   3 +
 3 files changed, 268 insertions(+), 11 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_vf_kunit.c

-- 
2.43.0

