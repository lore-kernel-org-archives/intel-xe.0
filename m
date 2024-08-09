Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24862C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 16:52:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5AC310E992;
	Fri,  9 Aug 2024 16:52:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ixwtXvT/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B102A10E992
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 16:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723222337; x=1754758337;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aJikprWVt7krPvzOlxmiqyQSw0yFbbp7mKTfaLwys0U=;
 b=ixwtXvT/TsaS26kd6IsHbtHfuaSPSrwkESMpuUN+gjy1Tvjeu4LQ4aJN
 OsPwjfrPfnwaRz3iu4XSoTPPATtSyHv43IgduSOZrfv14IrrroaheGcDy
 U0NpLZGRsyW43UV4xzIUDlTo2lON/JrS+EJU2PQlifVgmRFMOhPC8blsH
 zvTMm23OAQIjorGf6lK5EwZpcjqAaoacQCWOykCzUcjJ41IJG+13enPCK
 /8oIH/ZJr52LlowX3Rystpw1TqAT+E3hhPzFy0o2/x8a7BQ95hmDO+DM8
 5N8kghYhQ4RIvThV05Nmlp2q/o2ElLZGVqLCc86ygD4Eff5ginsZBcqcp g==;
X-CSE-ConnectionGUID: 5pe1VpwWRfG9SFsZ8t+jLA==
X-CSE-MsgGUID: YzO9pv2AQQKdrFsMesIMiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21379388"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21379388"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 09:52:16 -0700
X-CSE-ConnectionGUID: B7hNonmPRVWwRvyQNgxLlA==
X-CSE-MsgGUID: vuBw1ew/Qp2/KIQrYZm25w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="57569259"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 09:52:14 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH 00/12] PF: Improve VF control
Date: Fri,  9 Aug 2024 18:51:47 +0200
Message-Id: <20240809165159.662-1-michal.wajdeczko@intel.com>
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

Our initial VF control implementation was focused on providing
a very minimal support for the VF_STATE_NOTIFY events just to
meet GuC requirements, without tracking a VF state or doing any
expected actions (like cleanup in case of the FLR notification).

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>

Michal Wajdeczko (12):
  drm/xe/pf: Add function to sanitize VF resources
  drm/xe/pf: Fix documentation formatting
  drm/xe/pf: Drop GuC notifications for non-existing VF
  drm/xe/pf: Improve VF control
  drm/xe/tests: Allow deferred function call during KUnit test
  drm/xe/tests: Add helper macro to detect if KUnit is running
  drm/xe/tests: Add helpers to call stubs out of KUnit context
  drm/xe/guc: Define stub for xe_guc_ct_send_recv()
  drm/xe/pf: Define stub for pf_sanitize_vf_resources()
  drm/xe/pf: Define stub for pf_send_vf_control_cmd()
  drm/xe/tests: Add KUnit tests for VF control state machines
  drm/xe/tests: Add KUnit tests for VF control GuC messages

 .../xe/tests/xe_gt_sriov_pf_control_kunit.c   | 1554 +++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.c   |  148 ++
 drivers/gpu/drm/xe/tests/xe_kunit_helpers.h   |   38 +
 drivers/gpu/drm/xe/tests/xe_test.h            |   77 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf.c           |    6 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   86 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h    |    1 +
 .../gpu/drm/xe/xe_gt_sriov_pf_config_types.h  |    5 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 1271 +++++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |    3 +
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  114 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |    6 +
 drivers/gpu/drm/xe/xe_guc_ct.c                |    2 +
 drivers/gpu/drm/xe/xe_guc_ct_types.h          |    5 +
 14 files changed, 3275 insertions(+), 41 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h

-- 
2.43.0

