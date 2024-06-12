Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7202FC27C78
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 01:53:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C36E910E1DA;
	Wed, 12 Jun 2024 01:53:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jhIj+1r5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A76510E1DA
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 01:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718157190; x=1749693190;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NxrODPDZfjS5kn62nf+jlvjbiexjTxHkRS1ax5XdCSw=;
 b=jhIj+1r5kSSINgTCZiTfH2c5MesBohETQ0QytdXjLWqwXmZ/Khn2U0hj
 NL0gVda1Y0TriQXUafxOxKhCky5X3l8S2VBB1edzxHeQA65GyhL/YBQng
 cSIpBsqhS7R6sXneOlt+cWMXZBhbb0aRgRCGw8cu92PVLhhDQa+rrPHpK
 SyiLHbJHiq5aXq7lP+WgWaSicT+gz5e8JOcZmzVomcJuKsWDMgTBNnnw8
 QRSJU8Ds8ocF8zKbRQUYAluZvB/gVg4blf6ejs+MFU6a5d+5ec1rO3lls
 VGth+cn52/LXjN2q3EVymb03tPCH1p/VoPLhVkAprX/CuQo1ELxHugYWN A==;
X-CSE-ConnectionGUID: u5tRyY0VTYe1LI9H8zhOBA==
X-CSE-MsgGUID: f3r0xw5pSseUQREfbFk1PQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="18733163"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="18733163"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 18:53:08 -0700
X-CSE-ConnectionGUID: ACBqpy0DRNuVpKamDShz1Q==
X-CSE-MsgGUID: 5FsFAWm2Sgu9wIxrIb+53w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="70424846"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 18:53:08 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/1] Xe OA Consolidated Diffs
Date: Tue, 11 Jun 2024 18:53:02 -0700
Message-ID: <20240612015303.2658884-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Because Xe OA changes between successive revisions are distributed across
multiple patches, I am providing a combined diff of all changes in a single
patch to help with the code review.

These changes pertain to: https://patchwork.freedesktop.org/series/121084/

Ashutosh Dixit (1):
  drm/xe/oa: Combined diff of changes between v16 and v17

 .../gpu/drm/xe/instructions/xe_mi_commands.h  |  2 -
 drivers/gpu/drm/xe/regs/xe_oa_regs.h          |  5 +-
 drivers/gpu/drm/xe/xe_device.c                |  2 -
 drivers/gpu/drm/xe/xe_guc_pc.c                |  8 +-
 drivers/gpu/drm/xe/xe_guc_pc.h                |  2 +-
 drivers/gpu/drm/xe/xe_module.c                |  1 -
 drivers/gpu/drm/xe/xe_oa.c                    | 95 +++++++++++++++----
 drivers/gpu/drm/xe/xe_oa.h                    |  2 +-
 drivers/gpu/drm/xe/xe_oa_types.h              | 23 +++--
 drivers/gpu/drm/xe/xe_perf.c                  | 27 +++++-
 drivers/gpu/drm/xe/xe_perf.h                  |  4 +-
 include/uapi/drm/xe_drm.h                     | 22 ++++-
 12 files changed, 142 insertions(+), 51 deletions(-)

-- 
2.41.0

