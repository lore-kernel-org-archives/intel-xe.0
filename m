Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E450C25B10
	for <intel-xe@archiver.kernel.org>; Wed,  1 May 2024 22:32:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9877C10F397;
	Wed,  1 May 2024 22:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CyAadVaI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775A910E7BF
 for <intel-xe@lists.freedesktop.org>; Wed,  1 May 2024 22:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714602763; x=1746138763;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=08xSDNKsnbM3Q1gJAYuVgFTTDjIdwlxMTluQmvZzLz4=;
 b=CyAadVaIH1uusZN683SadxHltev6Wqhy0c03Cj9BjoVphkQakn6OzZb6
 c5GBfjRWrZu4KOLiWFR8Z+sNBeZS3XsqCzn23eVi3CCaS6vgGB1T89glb
 Tle7w4Hz81CguAadAb/JfPUeT1vyUZhKv5tjOJgCx90v32JjVvOjWGywN
 E2YXE00X6R99WfQy2VpyGnjUORXwdzCFmPwA8kWPJEz7w9+ECz3iLjUm+
 sgTk1gfOYQddZlnoXXMu6Iy3B++q5j9jyWpUC1/tGgxpEbe9iZxs3vMUT
 MvUveK+r97E6ijxPUOpYqqYmXmzu4zh5KHPxLdMUJPlHwgRCCkS8IubCZ g==;
X-CSE-ConnectionGUID: VUEJ3aGRTJSvb/2Wl9sDCQ==
X-CSE-MsgGUID: 9bqDjyRVRp2VcmP1VXmppQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10180938"
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; d="scan'208";a="10180938"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 15:32:42 -0700
X-CSE-ConnectionGUID: l5QYFJrOS3GzBihmozW+Bg==
X-CSE-MsgGUID: Q7tY7ByITGah3c94XJ8Teg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; d="scan'208";a="31399899"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.34.25])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 15:32:41 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/2] Define generic helpers for manipulating macro arguments
Date: Thu,  2 May 2024 00:32:19 +0200
Message-Id: <20240501223221.2395-1-michal.wajdeczko@intel.com>
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

Michal Wajdeczko (2):
  args.h: add more helpers for manipulating macro arguments
  drm/xe/rtp: Prefer helper macros from args.h

 drivers/gpu/drm/xe/xe_rtp.h         |   4 +-
 drivers/gpu/drm/xe/xe_rtp_helpers.h |  26 +++----
 include/linux/args.h                | 103 ++++++++++++++++++++++++++++
 3 files changed, 115 insertions(+), 18 deletions(-)

-- 
2.43.0

