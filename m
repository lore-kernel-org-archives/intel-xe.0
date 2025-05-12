Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B244FC3ABCB
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 22:00:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F6410E048;
	Mon, 12 May 2025 22:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kG9ozyzY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B7610E048
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 22:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747087230; x=1778623230;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TjRVKwjHzeNxYWC+XqOrkd6XGqkv+6wuEtNE5jPuAaE=;
 b=kG9ozyzYXeKVeGZYIpqQJbgXjIqwhjKmRIBb9zTUDURuQ9xkMs9xwFNL
 0oDk0DK+C+W1LelxW77KozCCG55mS0y0l01Oh51QTv8JE/EOcR4HqVgCb
 QCpR5Qi6HqtkgVN0MGWzprJ+piViAMGkZ/O1jbzVHUmIC85IAnxVd6Pma
 wHjpguYWmbJQP2ncQMb0SS8xnSpdyKxjajz1WSo53yuuMIGEudocfJ9tW
 mHGQs/BA6zq97j7YYG76PfjbA3u4AlIdxomWhPa54qehum2/NkMQF5Cub
 I5uZAhtqO9Uob5ImlfYqewcsWJ2ea37AVJG8xYuzP9Ya6VZvhD2h7+FEn w==;
X-CSE-ConnectionGUID: 0ob9BohNRXi8muSTliTYRg==
X-CSE-MsgGUID: kPppYwTLScG7fAIXDbwY6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="66317894"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="66317894"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 15:00:30 -0700
X-CSE-ConnectionGUID: ZMj2wYksSBiT5ZWNimJsUQ==
X-CSE-MsgGUID: B8jFltqeRQGJfEHwT5+3mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="137390372"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.96.179])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 15:00:27 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 0/2] Don't allocate managed BO for each policy change
Date: Tue, 13 May 2025 00:00:16 +0200
Message-Id: <20250512220018.172-1-michal.wajdeczko@intel.com>
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

We might consider adding Fixes: 6b8ef44cc0a9 ("drm/xe: Introduce the
wedged_mode debugfs") but this patch depends on later 696bfdf273ea
("drm/xe/guc: Introduce the GuC Buffer Cache")

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Michal Wajdeczko (2):
  drm/xe/guc: Unblock GuC buffer cache for all modes
  drm/xe/guc: Don't allocate managed BO for each policy change

 drivers/gpu/drm/xe/xe_guc.c     |  4 ++++
 drivers/gpu/drm/xe/xe_guc_ads.c | 27 +++++++++++++--------------
 drivers/gpu/drm/xe/xe_guc_buf.c |  4 ----
 3 files changed, 17 insertions(+), 18 deletions(-)

-- 
2.47.1

