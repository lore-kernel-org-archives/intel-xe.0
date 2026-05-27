Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1328FCD6E44
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 10:02:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C8310E4A3;
	Wed, 27 May 2026 10:02:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eCPdpsOL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED80410E4A3;
 Wed, 27 May 2026 10:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779876136; x=1811412136;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pNt1Sa0PwYdFM8KwzIYITHG+b0yRCmMqJM/SSwdFp4I=;
 b=eCPdpsOL5ljre971MDGkPorT/XdlR6AszNQ2BNdvldjnyqiZhb5bAmav
 c+PDakR66DdFKL2gTFV935WIUyGKo4qm9NnK2JSh2iBJHYbWW4Djd+GRd
 KtI7DulBxYUgST5RxwkLMI2wjjGNc++ZN/Z3A8WJbhQbad0YSNzCaobsY
 CbJpAQNCPPHCPmlel6oVIB/I6BI3INs38EL5CF60OQppXK9tr6tL9nksW
 2KHwRk471M3bcjgVhtYjDJNi+EJ32DML2W/beu278TTNDgC7EwC8Zx/YQ
 +XojmBX2dmEWkUvcxQTN+yx3ZZP8MoUKuWl8HNMD1HRZSRNDc2aycR9ks Q==;
X-CSE-ConnectionGUID: e5cxOlX+R+O+zdH40nVyCQ==
X-CSE-MsgGUID: lUQ/UwnKSXaRUacKvKUTZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="98277112"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="98277112"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 03:02:16 -0700
X-CSE-ConnectionGUID: Zase0xv3SQOReQNb9JcoYg==
X-CSE-MsgGUID: UlYA5DCAQXuSmY0HntG9cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="239588864"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.38])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 03:02:15 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	imre.deak@intel.com
Subject: [PATCH 0/2] drm/i915: .runtime_suspend/.runtime_resume renames for
 clarity
Date: Wed, 27 May 2026 13:02:10 +0300
Message-ID: <cover.1779876087.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Jani Nikula (2):
  drm/i915/power: add "runtime" to
    intel_display_power_{suspend,resume}() names
  drm/i915: rename intel_runtime_{suspend,resume} to
    i915_pm_runtime_{suspend,resume}

 drivers/gpu/drm/i915/display/intel_display_power.c |  4 ++--
 drivers/gpu/drm/i915/display/intel_display_power.h |  5 +++--
 drivers/gpu/drm/i915/i915_driver.c                 | 14 +++++++-------
 3 files changed, 12 insertions(+), 11 deletions(-)

-- 
2.47.3

