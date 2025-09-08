Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E329CCAC586
	for <intel-xe@archiver.kernel.org>; Mon,  8 Sep 2025 12:30:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A607010E507;
	Mon,  8 Sep 2025 12:30:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Usv9+SsL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 520E510E504
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Sep 2025 12:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757334637; x=1788870637;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m/HrPr7yYorVtBtxp7exajJhLFYTsrt2dKOWRO0aQJg=;
 b=Usv9+SsL8htsw/NnFcnWzYwH0gvwGS8Hx9ikBYMeG4N+5ivjud83xmHv
 IIyq6BTGLnLARuiFkdXzEaEOyURg1/8qP50sMjndL/tB0PWNXpg2THFd4
 HOaATLJoWUx3SB4d0nHO14/4tukA2R09zHX+KlqnhZKMwsiqJkgNdnkTC
 i2oaggC7ak62ezWBvDuIucOLcQWeRv7V/nW8ATjnckFFtk1ZjC9gdlI4s
 wUYp+qGONO2j6guy5Qfn2aKjV1z79pfzChlF0+ahDfErwWvUM5WbR3uUE
 kfGzOGzHBFERwXy/3Xqg/R64KdujL/pbdQy7Tbgpom+WUFYvYtkTyiCzo w==;
X-CSE-ConnectionGUID: tgttD5GwRae+osRv4fp4TQ==
X-CSE-MsgGUID: 08sfwYHKTlqzI2LFcwOf4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="59526293"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="59526293"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 05:30:37 -0700
X-CSE-ConnectionGUID: is3HWZLyTNmo0HgySIPdeA==
X-CSE-MsgGUID: WOLwoiOKQfe5oU23FjPXYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="172656374"
Received: from abaranow-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.83.253])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 05:30:35 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 0/7] Small improvements around VF CCS
Date: Mon,  8 Sep 2025 14:30:17 +0200
Message-ID: <20250908123025.747-1-michal.wajdeczko@intel.com>
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

v1: https://patchwork.freedesktop.org/series/154054/#rev1 (reviewed)
v2: add 2 more patches to move CCS data from tile to device (Michal)

Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>

Michal Wajdeczko (7):
  drm/xe/guc: Rename xe_guc_register_exec_queue
  drm/xe/guc: Use proper flag definitions when registering context
  drm/xe/vf: Drop IS_VF_CCS_INIT_NEEDED macro
  drm/xe/vf: Use single check when calling VF CCS functions
  drm/xe/bo: Add xe_bo_has_valid_ccs_bb helper
  drm/xe/vf: Move VF CCS data to xe_device
  drm/xe/vf: Move VF CCS debugfs attribute

 drivers/gpu/drm/xe/xe_bb.c                 |  4 +-
 drivers/gpu/drm/xe/xe_bo.c                 |  8 +--
 drivers/gpu/drm/xe/xe_bo.h                 | 15 +++++
 drivers/gpu/drm/xe/xe_debugfs.c            |  3 +
 drivers/gpu/drm/xe/xe_device_types.h       |  3 -
 drivers/gpu/drm/xe/xe_gt_debugfs.c         | 40 +-----------
 drivers/gpu/drm/xe/xe_guc_fwif.h           |  1 +
 drivers/gpu/drm/xe/xe_guc_submit.c         | 20 +++---
 drivers/gpu/drm/xe/xe_guc_submit.h         |  2 +-
 drivers/gpu/drm/xe/xe_pm.c                 |  4 +-
 drivers/gpu/drm/xe/xe_sriov_vf.c           | 28 ++++++++
 drivers/gpu/drm/xe/xe_sriov_vf.h           |  2 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 74 ++++++++++++++++------
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       | 17 +++++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h | 44 ++++++-------
 drivers/gpu/drm/xe/xe_sriov_vf_types.h     |  7 +-
 16 files changed, 164 insertions(+), 108 deletions(-)

-- 
2.47.1

