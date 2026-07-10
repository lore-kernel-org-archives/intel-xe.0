Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B693BC43458
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 12:18:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7526010F8A0;
	Fri, 10 Jul 2026 12:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NcZfF9yX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 175A410F8A0
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jul 2026 12:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783685909; x=1815221909;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LBGb5lYCSByiJrZ3w8b8ORfNiGmg/7x0yDo+GCArO64=;
 b=NcZfF9yXXDZzxAxa12JTHjVcLssvLHhcowNa/QreU8obk5xPOwt12anB
 JTdOSpoki8rrKK0W17cxjrgAKPVqdUWotQW1OvV/OroKFcrBecORIUUxa
 SMChKc7DwXEelwzBSVR7wGdwDgfSXzPPT/D1c3s4I/8atDqDaEg9PrlWq
 tE0LJgkmPmeawb10I0xg/Q40mOoKGqX/aZNQjJ9INZ3Xg46pNYgnZ1X/j
 g32Ae4QKnk+dC33ZFLmOAzeVrs7HMacLKaxEBBu99ZxEATT2DGCir/msw
 OSn/4Fk7GOxAuu1tmLTqoNWTWXe0HnmfVyciMaukQfdtqy7bqrv5U4pwt A==;
X-CSE-ConnectionGUID: r+bwl8X4TP+HSn9QsW2dDQ==
X-CSE-MsgGUID: 0B/RanhtQ3e2KVsxuNFDXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83360314"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="83360314"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 05:18:29 -0700
X-CSE-ConnectionGUID: BpQ5JzXVTHmbAzzWC41BYQ==
X-CSE-MsgGUID: oL+Yd68ES3GzSMJ/+wPY4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="255522153"
Received: from ksatya-dev.iind.intel.com ([10.190.229.72])
 by orviesa009.jf.intel.com with ESMTP; 10 Jul 2026 05:18:28 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/2] KUnit test for VF provisioning error handling
Date: Fri, 10 Jul 2026 17:49:54 +0530
Message-ID: <20260710122007.3329932-1-satyanarayana.k.v.p@intel.com>
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

Satyanarayana K V P (2):
  drm/xe/vf: Add KUNIT stub for guc_action_query_single_klv()
  drm/xe/tests: Add KUnit tests for VF provisioning error handling

 drivers/gpu/drm/xe/tests/xe_gt_sriov_vf.c | 387 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       |   7 +
 2 files changed, 394 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_vf.c

-- 
2.53.0

