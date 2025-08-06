Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948ADC87FCB
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 08:12:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FFF10E131;
	Wed,  6 Aug 2025 08:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VePQrhW8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A51E010E131
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 08:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754467940; x=1786003940;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Hnzv6iinNef39MWiNqHCNXJfEuW13Ysz4QvLuoVLd2k=;
 b=VePQrhW8+lTZAQ1W1n+1R2Sgz4wTkRowS1dxQFfiS/JJyoK5RH/HAUsK
 HtumsiifJhnS5X5pMNPpIvfXm1+kH2mRk4GX/iyBnClOfZOVaoTX1/X9J
 7SrWswjI0HaDfPVBIaBRCZqKC2CZy+MyN/tRBvmZyGuLUyLM14pwAtp1j
 oAd/+n6CfmdRoFMdux5i/5T01zSbifKVugXNCOLJqXWRUd7s/i7G903W1
 CkTohxavfr/AiqEYZIQwJVZhpvjH3a/i7//aCUCpL13owDXRrFP9jeoUj
 gBh/CB7dpIJUTYW5D1+oOSDY445OofzYgdsnqv4v3gBt36l4mk5AZju0T w==;
X-CSE-ConnectionGUID: yT9xIjGbSW2uves60LObMA==
X-CSE-MsgGUID: 5FHBYZAZQw62lyQSF2fgCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="55815316"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="55815316"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 01:12:20 -0700
X-CSE-ConnectionGUID: WLvcVy6PSwu/QGITx5NYJQ==
X-CSE-MsgGUID: 80RhGkYrTsOSju8vpNb4Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164625013"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa006.fm.intel.com with ESMTP; 06 Aug 2025 01:12:19 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v3 0/2] Improve CCS save restore series
Date: Wed,  6 Aug 2025 13:59:08 +0530
Message-ID: <20250806082910.15845-1-satyanarayana.k.v.p@intel.com>
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

Previously, CCS save/restore operations created separate migration
contexts with new VM memory allocations, resulting in significant
overhead.

This series eliminates redundant context creation reusing the default
migration context by registering new execution queues for CCS save and
restore on the existing migrate VM.

Also fixed corruption issue with save/restore followed by S3/S4 cycle.

V2 -> V3:
- Fixed review comments.
- Added new commit "Scale mmio send/recv timeout for CCS save/restore with
smem size"
- Squashed "Re-register CCS save/restore contexts post S3/S4 resume" into
"Refactor CCS save/restore to use default migration context" commit as per
review comments.

V1 -> V2:
- Fix kernel-doc issues reported by patchworks.
- Added new commit "Re-register CCS save/restore contexts post S3/S4
resume"

Satyanarayana K V P (2):
  drm/xe/vf: Refactor CCS save/restore to use default migration context
  drm/xe/guc: Scale mmio send/recv timeout for CCS save/restore with
    smem size

 drivers/gpu/drm/xe/xe_guc.c                | 33 ++++++++++++++-
 drivers/gpu/drm/xe/xe_migrate.c            | 18 ++++----
 drivers/gpu/drm/xe/xe_migrate.h            |  2 +-
 drivers/gpu/drm/xe/xe_pm.c                 |  3 ++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 49 ++++++++++++----------
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  6 +--
 6 files changed, 75 insertions(+), 36 deletions(-)

-- 
2.43.0

