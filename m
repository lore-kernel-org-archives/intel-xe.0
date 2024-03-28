Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998D1CD1284
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 16:28:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 561281124D5;
	Thu, 28 Mar 2024 16:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D/SP9ua8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C821124D2
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 16:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711643303; x=1743179303;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CfyUo/87hoTmmmhJ9smM6TtfsAyN91mTpuUZqeaOSlE=;
 b=D/SP9ua8uEp/1h1USxWZYn3vIg7FvNtBVwrUVs7gQXr24m0fOR/ZKE1z
 1bR7QpfHomX1efeW4C87ayXV9/m19/AZRbp+J4xT5H5MLlutfmGwJeDa8
 wOwHIBqaB/jx5+Elc9XIYPXBdv5utmMWIUrMqpERLHZlmYyYma9/9Gqxl
 D5eyizrG42kGbWqCkY0KpgYA43Z/WbrOmiXXV+BDw64csd2NVK11LWJut
 6L0PFPD7azM/MybpLlGlToQ0eSX4V/7VeuGMLqbuxMMuGXimFjrXrPfT1
 p/hfTBy8CrLq3g6GgsoIdmjH9fb4BC1hYJafNC4SDbLH00vc8ivRyYy4y w==;
X-CSE-ConnectionGUID: WCvDvG0sShCNwhjRFBnu1w==
X-CSE-MsgGUID: sRUXiUzVTcajET553hrd9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6742954"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="6742954"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 09:28:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="16579255"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.157.82])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 09:28:22 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 0/3] Refactor GT debugfs
Date: Thu, 28 Mar 2024 17:28:05 +0100
Message-Id: <20240328162808.451-1-michal.wajdeczko@intel.com>
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

Link: https://patchwork.freedesktop.org/series/129890/#rev1

Michal Wajdeczko (3):
  drm/xe: Store pointer to struct xe_gt in gt/ debugfs directory
  drm/xe: Define helper for GT specific debugfs files
  drm/xe: Refactor GT debugfs

 drivers/gpu/drm/xe/xe_gt_debugfs.c | 209 ++++++++++++++---------------
 drivers/gpu/drm/xe/xe_gt_debugfs.h |   2 +
 2 files changed, 106 insertions(+), 105 deletions(-)

-- 
2.43.0

