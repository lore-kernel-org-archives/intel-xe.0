Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23706C531DC
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 17:29:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA9B310E7F1;
	Tue, 20 Aug 2024 17:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Txxf84II";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7793010E7F1
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 17:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724174942; x=1755710942;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sXHu63RT1f6RczNi0BQTGIIXaq9Hk0CoRi4Z43fCQ7g=;
 b=Txxf84II4zYOT4RJAK6+oIKMpqxeIUbOAfw/U2e93GEs6dED9gf0KO01
 VjqjcB5v0avP6j0j+XxqTTnrRhTsrbYRvQ5Hz6lA2dhr7nKjoXmeNAQyu
 xMvHL2s1MIbXUZNRvUKpXsYlLa0q5IBRt5NNW6IMMdmIXS0SpSOAv6l/j
 7ahWLckBPzMSFd9MDHL52MpQywVQgNX5B03bFMtF7SV6nU2evOlW89mKn
 Jk0+fr9zg5+wabIbheEumdVxQTAhW7lVpWdS7ew6+1tmGVTW3xEsAotTK
 aueTlyZN62rEFHnwosZJ7Y4A9SrSaD1dGmRvMBTKtJv1x2MHAh2UEKjfI A==;
X-CSE-ConnectionGUID: x4dDkPagRIGY4dGtR946Jw==
X-CSE-MsgGUID: JarXxknQRXmtjTXQ6ZUUhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="26365491"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="26365491"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:29:02 -0700
X-CSE-ConnectionGUID: wIO3JichQwWvSlIT2ORHug==
X-CSE-MsgGUID: 2B8nruC5TEeHDZv2chQRnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="65651734"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:29:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/6] Driver load failure fixes 
Date: Tue, 20 Aug 2024 10:29:52 -0700
Message-Id: <20240820172958.1095143-1-matthew.brost@intel.com>
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

Sending the fixes from [1] as an individual series

[1] https://patchwork.freedesktop.org/series/137114/

Matthew Brost (6):
  drm/xe: Move ggtt_fini to devm managed
  drm/xe: Set firmware state to loadable before registering guc_fini_hw
  drm/xe: Drop warn on xe_guc_pc_gucrc_disable in guc pc fini
  drm/xe: Move hw_engine_fini to devm managed
  drm/xe: Move HuC init before GuC init
  drm/xe: Update xe_sa to use xe_managed_bo_create_pin_map

 drivers/gpu/drm/xe/xe_ggtt.c      |  4 ++--
 drivers/gpu/drm/xe/xe_guc.c       |  4 ++--
 drivers/gpu/drm/xe/xe_guc_pc.c    |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c |  4 ++--
 drivers/gpu/drm/xe/xe_sa.c        | 13 ++++++-------
 drivers/gpu/drm/xe/xe_sa_types.h  |  1 +
 drivers/gpu/drm/xe/xe_uc.c        |  8 ++++----
 7 files changed, 18 insertions(+), 18 deletions(-)

-- 
2.34.1

