Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D63CA0EE6
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 18:54:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA3F210E651;
	Tue, 19 Aug 2025 18:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dnZrQZFB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B12710E651
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 18:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755629640; x=1787165640;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NfEb/PEOYJ1dpClnUiXkyj50m2A5L8IXBOPs7mosEOQ=;
 b=dnZrQZFB94ZSDvmPYm8KfpXFydW2g9SjQueyTp5rwmDEP4PbOC5FxeNK
 glO1eyTwbdj7IDS9P9CA2sim/K8i2mOEkSziyjOOHyv8Gas+njR2BP57z
 FI4t/pp1FjwNuTmYdeYjAQHy0jk21zEmAf1nzxDu6OPHJ3xSrOdO806zH
 PR0m+hUmED0G9YbuXTo2tUKZgX7dwRX12dahdZURY6XBelgxjV0x5uB5u
 V+/1liPlr8MMt/P8pkItdqITM3/CEL6Xwx2FZ839agxt5FjfUQCa8WIgN
 RYxwZ/Gg9voTvejqlmcu50Xg1sok3jSYPMtMi821ZA35wp6Y6ZBM87KOc w==;
X-CSE-ConnectionGUID: zaH6y9MbQu6jEseQVXLIzQ==
X-CSE-MsgGUID: bXESl6WHRzupDeDVkdtJpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57952499"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="57952499"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 11:54:00 -0700
X-CSE-ConnectionGUID: YlYQ95/3Q0WzLlhofalluw==
X-CSE-MsgGUID: cXwo8c3bTL6Dw1wxzrm+pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="198922574"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 11:54:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 0/2] Enhance SVM stats
Date: Tue, 19 Aug 2025 11:53:47 -0700
Message-Id: <20250819185349.2837153-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add ability to clear GT stats and add more SVM stats for profiling.
Scripts should be able to be built on top of stats to breakdown time
spent in parts of the SVM page fault handler, bandwidth of copy engine,
etc... Will help showing concrete performance improvements when
implementing SVM optimizations.

Open suggestions of more stats. Prefetch not considered - can be done in
a follow up.

Scritpt to parse stats for reference: https://pastebin.com/rZZN5sgh

v2:
 - Include local changes missed in first rev
v3:
 - More stats after putting together script to parse
v4:
 - Rebase

Matthew Brost (2):
  drm/xe: Add clear_stats GT debugfs
  drm/xe: Add more SVM GT stats

 drivers/gpu/drm/xe/xe_gt_debugfs.c     |  22 +++
 drivers/gpu/drm/xe/xe_gt_stats.c       |  47 ++++++
 drivers/gpu/drm/xe/xe_gt_stats.h       |   1 +
 drivers/gpu/drm/xe/xe_gt_stats_types.h |  33 +++++
 drivers/gpu/drm/xe/xe_svm.c            | 194 +++++++++++++++++++++++--
 5 files changed, 288 insertions(+), 9 deletions(-)

-- 
2.34.1

