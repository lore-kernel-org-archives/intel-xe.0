Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986C3FAD3F2
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 02:50:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D37710EAE4;
	Thu, 23 Apr 2026 02:50:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KiC4hBnr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E145B10E2E8
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 02:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776912603; x=1808448603;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KnJ3ZLgN6S3cWMB0gA160ZJggI8e6079JtWtjJpeX10=;
 b=KiC4hBnr+JAVJP/lHY7UHYYuTIMF+Gj94mOsZm/lzX076CMZkylUxEhf
 Sn9f8pVU8eVS7fY6mipP/bvMM9UpkyViIgVP8GGadLNMDuK6giD5YpaX0
 EhXDdadeW9rYyUnEBmJ8DpOxHryhzLm8ZcujjCZHUVCkjdZFguOIYLkXe
 m7tjZ5SvNcNjKq1sFi/Hzsj6UAlIh3GEO6frByTidXunRKCLEKy/ZWclm
 9zkx38BX/ZP034cIHCfYq5AJ8G0jHYeK2uffuE+jj3PfKyoJa1CWQfJGx
 uBWZ9U4mFPQ4v43yrBPYsalBdMhXrMaYLZqfZt444VkTqYC/Nz8J3xaC/ A==;
X-CSE-ConnectionGUID: plNC8uJ1TpCzWF0YLTCXGw==
X-CSE-MsgGUID: 0bBvSiGgTMOVhWmL28icUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="88181149"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="88181149"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 19:50:03 -0700
X-CSE-ConnectionGUID: NckoDWeXQ6mUCIyLMvIeHA==
X-CSE-MsgGUID: gxPOl/8VTFKY5FeAkQntnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="262917965"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 19:50:02 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [RFC 0/4] drm/xe/multi_queue: Handle lost message during VF migration
Date: Wed, 22 Apr 2026 19:49:52 -0700
Message-ID: <20260423024954.1665095-6-niranjana.vishwanathapura@intel.com>
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

During VF migration, CGP_SYNC message to GuC or CGP_SYNC_DONE response
from GuC might get lost. Handle it by resending the message again.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (4):
  drm/xe/multi_queue: Remove redundant assignment in
    guc_exec_queue_run_job
  drm/xe/multi_queue: Refactor CGP_SYNC send path
  drm/xe/multi_queue: Handle VF recovery in CGP_SYNC and queue
    registration paths
  drm/xe/multi_queue: Add needs_cgp_sync mechanism for VF post-migration
    recovery

 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |   7 +-
 drivers/gpu/drm/xe/xe_guc_submit.c           | 113 +++++++++++--------
 2 files changed, 71 insertions(+), 49 deletions(-)

-- 
2.43.0

