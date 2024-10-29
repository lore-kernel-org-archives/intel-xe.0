Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37280D5B854
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 00:32:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B5610E58A;
	Tue, 29 Oct 2024 00:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C5uRfYHa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A4110E259
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 00:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730161918; x=1761697918;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WJYNuUkfoIY0fuhAlk5B3kykISlMZV1n6DLV9exkKGs=;
 b=C5uRfYHaGaUeUS4SGhZYu5vWbAws2SAHypaMYeGVjXpyg0qymUR34uP/
 TJHluXk9YhUfBo2NxNKlXPM1gu7GepdN6HikylC7GohTlqTa6yOJ3QDc2
 CsUewxu4jrXIe9yyLLC5PlrKotEO4e9i68uSN62YMDojNW5QzHwTIRW7X
 ZgFClcC6jhx7kPhD+FkxMMTQy5U0dJs45RKAc/e51k/0RWYza9duPjJZC
 iz1bK/9ELQo0pPQOKcTG9plbH6MromdtCHWXbaXvSPlFjz8lUoB1DkaZI
 4jdcWXoaQOsIJMoj5aRnWqiguL2A1xcDxYerTIeTgKliJEj6npccZnyLp A==;
X-CSE-ConnectionGUID: uG/rSDvHRvmhEipNXL5IHw==
X-CSE-MsgGUID: TC2/WZC5Su6gPfHVWx9dFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52337959"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="52337959"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 17:31:58 -0700
X-CSE-ConnectionGUID: +sKj0X1lTEilWUnorAZPbA==
X-CSE-MsgGUID: 3lFGHrEjQHGeLXAraHq4OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; d="scan'208";a="119244298"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 17:31:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, umesh.nerlige.ramappa@intel.com,
 riana.tauro@intel.com
Subject: [PATCH 0/3] Suspend, resume, and d3cold tweaks
Date: Mon, 28 Oct 2024 17:32:21 -0700
Message-Id: <20241029003224.2257439-1-matthew.brost@intel.com>
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

Some low hanging issues to improve suspend, resume, and d3cold.

On BMG xe_pm.d3cold-multiple-execs went from taking ~200s to ~60s.

This will also pave the way to spliting GuC CT state into multiple
BOs mixing system and VRAM placememts. 

Matthew Brost (3):
  drm/xe: Add XE_BO_FLAG_PINNED_WONTNEED
  drm/xe: Restore system memory GGTT mappings
  drm/xe: Add XE_BO_FLAG_PINNED_NEED_LOAD

 drivers/gpu/drm/xe/xe_bo.c                 |  44 +++++---
 drivers/gpu/drm/xe/xe_bo.h                 |   2 +
 drivers/gpu/drm/xe/xe_bo_evict.c           | 118 ++++++++++++++++-----
 drivers/gpu/drm/xe/xe_ggtt.c               |   2 +-
 drivers/gpu/drm/xe/xe_gsc.c                |   1 +
 drivers/gpu/drm/xe/xe_gsc_proxy.c          |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |   1 +
 drivers/gpu/drm/xe/xe_guc_ads.c            |   3 +-
 drivers/gpu/drm/xe/xe_guc_ct.c             |   3 +-
 drivers/gpu/drm/xe/xe_guc_log.c            |   3 +-
 drivers/gpu/drm/xe/xe_guc_pc.c             |   3 +-
 drivers/gpu/drm/xe/xe_huc.c                |   1 +
 drivers/gpu/drm/xe/xe_hw_engine.c          |   1 +
 drivers/gpu/drm/xe/xe_lmtt.c               |   1 +
 drivers/gpu/drm/xe/xe_lrc.c                |   3 +
 drivers/gpu/drm/xe/xe_memirq.c             |   1 +
 drivers/gpu/drm/xe/xe_migrate.c            |   1 +
 drivers/gpu/drm/xe/xe_sa.c                 |   3 +-
 drivers/gpu/drm/xe/xe_uc_fw.c              |   1 +
 19 files changed, 145 insertions(+), 48 deletions(-)

-- 
2.34.1

