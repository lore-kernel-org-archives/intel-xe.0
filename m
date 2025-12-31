Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DB7EE6427
	for <intel-xe@archiver.kernel.org>; Wed, 31 Dec 2025 10:32:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F8D10E122;
	Wed, 31 Dec 2025 10:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NfSL4bIg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 149B710E071;
 Wed, 31 Dec 2025 10:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767177159; x=1798713159;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rtyrRllh93Kn8QH+ebwIXomc8UDBaX0RKdzZLkGIc54=;
 b=NfSL4bIgB7vsS1O1+RAXCSHqJvBmqcjG2eluEHawNew8adVzEArpXyOB
 2hnzQuygETYHveddlmsk0iiT/qmiEI804gFqDtN0evmF3tz9xJoDS3gkN
 fqArenEYFNXPMJUkv1rJIxRvR/Q82ie9mMgpZob3gR5sl9vb2zqxSEwpd
 7ZDMZmvJvlYjaub+2q9aJGnfbnxtqkNcAYgP8m8NS899xJKy0eXSydaPI
 MpL05iQbkUMnmNVHrS5MNBN9k7pwShNq1GU+zB23+FDDON/VrRgUXkn3r
 KRUEGpuqw169Kduz1IzN/L1oaIKZj2smbbKH0AXEWCa1/J5ygeAEyeVlN A==;
X-CSE-ConnectionGUID: AHzD6ZBITuqF8PMjhS82HQ==
X-CSE-MsgGUID: eky86Qn1T02jCoW04q9nZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="67944816"
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; d="scan'208";a="67944816"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 02:32:38 -0800
X-CSE-ConnectionGUID: t0Md6hz3SO6TeUgJbEnilw==
X-CSE-MsgGUID: m6s89IVJSAWKRdTtjSSenw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; d="scan'208";a="201652986"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.201])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 02:32:36 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH] drm/i915/display: remove accidentally added empty file
Date: Wed, 31 Dec 2025 12:32:32 +0200
Message-ID: <20251231103232.627666-1-jani.nikula@intel.com>
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

intel_display_limits.c was never supposed to be added. Remove it.

Fixes: f3255cf4490e ("drm/i915/display: Add APIs to be used by gvt to get the register offsets")
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_limits.c | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/display/intel_display_limits.c

diff --git a/drivers/gpu/drm/i915/display/intel_display_limits.c b/drivers/gpu/drm/i915/display/intel_display_limits.c
deleted file mode 100644
index e69de29bb2d1..000000000000
-- 
2.47.3

