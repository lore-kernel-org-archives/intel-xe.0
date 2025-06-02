Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A831C5B549
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 10:33:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015ED895EE;
	Mon,  2 Jun 2025 10:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LfFBl9B9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA7F895EE
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 10:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748860417; x=1780396417;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G1wUeoL7Q5t739qnLdwP7OXppK71xXSZkRfxNrDJ4Ig=;
 b=LfFBl9B9U5K81o8UlTQlJY3As1HvMWasFGeHEP0gV+Sniz1gtseWmL6T
 k1ZEjZKqv0vExfJxW3qO/GgpKKnIt7qSKYqqTD1QnZUxMpNmj41kjBMsK
 p2tZsf590tRv8a9rXe6rS9Msoxt4Lf6pSLzT4NMoXP4FpQ4mhrBDx/frb
 Ww3syQne9g4bOUNjpzcb7vCKXejTb1VkbzjdBr1pHsHMDVioMB2IDcuQa
 tDQGhLyBnriYmJaTFwXMMYBFYYhhhey6eU9f1jHROrKttbezabYRaCA5/
 QSOR1nCw6V+ecXNOB0Gf4w9kHX8JDAliP8WmhZhqwB2ElzPOnf6zq8GhI A==;
X-CSE-ConnectionGUID: +MBxnFJzRm+UC8cGG+80Bg==
X-CSE-MsgGUID: fM2oOirLTt+a0xPKxdmJrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="61123321"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="61123321"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 03:33:36 -0700
X-CSE-ConnectionGUID: vgaY25GnRHKOdQfNORumhw==
X-CSE-MsgGUID: sgYK2z+TSGyudl0UhI8CGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="149651998"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.121])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 03:33:34 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/3] VF: Small updates around GGTT handling
Date: Mon,  2 Jun 2025 12:33:22 +0200
Message-Id: <20250602103325.549-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Move VF GGTT functions to a separate file and add some more checks.

Michal Wajdeczko (3):
  drm/xe/vf: Introduce helpers to access GGTT configuration
  drm/xe/vf: Move tile-related VF functions to separate file
  drm/xe/vf: Add sanity check for GGTT configuration

 drivers/gpu/drm/xe/Makefile           |   3 +-
 drivers/gpu/drm/xe/xe_ggtt.c          |   4 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c   | 279 ++++----------------------
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h   |   9 +-
 drivers/gpu/drm/xe/xe_sriov_vf.c      |   3 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf.c | 254 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tile_sriov_vf.h |  18 ++
 7 files changed, 316 insertions(+), 254 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_vf.c
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_vf.h

-- 
2.47.1

