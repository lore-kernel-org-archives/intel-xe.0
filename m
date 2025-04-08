Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECBBC369A5
	for <intel-xe@archiver.kernel.org>; Tue,  8 Apr 2025 21:31:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD4510E760;
	Tue,  8 Apr 2025 21:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IukaivEr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE8D510E760
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Apr 2025 21:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744147917; x=1775683917;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VttSyTorGNO6rt/lx4APmV2/HTgaFFLwuRU0ju6iER8=;
 b=IukaivEryZpMC+IhJAGbPWa05p/7pHxXSf3mMm7aGBD3vJ2qjPBxJEtj
 kqr5kbQ6wHG2+TeejyuSo8+IQxb6342ZX7aJCsLtPZKQp8s97/8ZDr/7I
 2GSUvb5gmKV3WQJ1DHBSR2d8YD9Ckpa5khPgIcOjn18yoqtLyYjycy1GP
 AJeBbQ+m/inB+WbZIYVdTM46n+C+w3PzYF3NMSCYBC+STt3WH9tHKT6Ow
 SC99qo2BaFmNXnWrEneiXHFXUZ58hlAAIfHkdXAeRAa5L+4mg+bNHrylK
 wWC6QR5+xLbIj47cGcTyAbg5OApNswxiIFmMhF1UogYDX3z0YfAZ1SRkG g==;
X-CSE-ConnectionGUID: TWH2dx6xTJaKUxYLQU7Erg==
X-CSE-MsgGUID: LiHRMUrySCKWXZdaDf4IGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="44851475"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="44851475"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 14:31:55 -0700
X-CSE-ConnectionGUID: 1Ljax3cwRXipY9oiBmJ7+g==
X-CSE-MsgGUID: dgId7B7EQcmMgyKRJk1ZLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="128923594"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 14:31:55 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH 0/3] Fixes for VF GuC version and guc_info debugfs
Date: Tue,  8 Apr 2025 14:31:43 -0700
Message-ID: <20250408213146.793855-1-daniele.ceraolospurio@intel.com>
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

The VF currently stores the negotiated GuC compatibility version in a
private VF struct, so all the runtime checks using the common struct in
guc->fw are not working as expected. We can fix this by copying the value
over.

This also partially fixes the guc_info debugfs, printing the correct
values for the wanted and found versions, but we do still need to stop
it from reading VF-unaccessible registers.

Note that this series is technically a v2 of [1], but the approach and
the patches themselves are changed enough that it seemed cleaner to
restart from v1.

[1] https://patchwork.freedesktop.org/series/145667/
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Daniele Ceraolo Spurio (3):
  drm/xe/vf: use uc_fw_version to store the negotiated GuC ABI
  drm/xe/vf: Store the GuC FW info in guc->fw
  drm/xe/vf: Fix guc_info debugfs for VFs

 drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 175 +++++++++++++-------
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h         |   4 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h   |  19 +--
 drivers/gpu/drm/xe/xe_guc.c                 |  44 ++---
 drivers/gpu/drm/xe/xe_guc_engine_activity.c |   2 +-
 drivers/gpu/drm/xe/xe_uc_fw.c               |  46 +++--
 drivers/gpu/drm/xe/xe_uc_fw_types.h         |   2 +
 7 files changed, 183 insertions(+), 109 deletions(-)

-- 
2.43.0

