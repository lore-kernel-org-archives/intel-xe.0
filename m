Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F347AC30659
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 19:59:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AECC010E302;
	Tue, 25 Jun 2024 19:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g8w3xsR7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 632C010E302
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 19:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719345549; x=1750881549;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4vbXkhKLJOXEqGpzAAfbI0jPb0TV9HU1oGizu5neeHI=;
 b=g8w3xsR7mZeonAZPtePSIilulFUtQkC/9qR6jx6pxg+IoZ5WxpljQ2p0
 y24pRtiBgtzRpmTAxEPpYvk2cDxffS9j8BvnjEmoSzVBoERGd8c+znC8G
 wtJjOoRvNwG41n61alQ7VIdOx2dCMioY8PeohTmSxY4ETxHkpO8Rsn6sa
 H6UyLlmNFqagUrkwGuEVLfwU9rIY8lDE6B6JUkFELDr02qQbDcCNnsSW9
 6cm4BSf6pqOiajSyiROk8P6txheAXSUOvtr06QyTliKQtdMtakB2JLfzf
 +IfJ7vffzcza/jN44JWiCYML1I9wewN7r5RPVb1KCgnupdHvgjjUAYkHI w==;
X-CSE-ConnectionGUID: 3MOGa7RmTry+8/J4SDEiQQ==
X-CSE-MsgGUID: UfTz8II2QQ2cYFt/6osnhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="27528089"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="27528089"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 12:59:08 -0700
X-CSE-ConnectionGUID: Q5GWhz8ZQFCGed5s9BtC6A==
X-CSE-MsgGUID: SvG9NGdqS1+UgteZf6oqUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="43737232"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 12:59:09 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] drm/xe/oa: Add NO_PREEMPT property
Date: Tue, 25 Jun 2024 12:59:02 -0700
Message-ID: <20240625195904.757272-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Add DRM_XE_OA_PROPERTY_NO_PREEMPT property. This is intended to be Xe GuC
equivalent of i915 property DRM_I915_PERF_PROP_HOLD_PREEMPTION.

Ashutosh Dixit (2):
  drm/xe/oa: Allow stream enable/disable functions to return error
  drm/xe/oa: Allow preemption to be disabled on the stream exec queue

 drivers/gpu/drm/xe/xe_oa.c       | 104 ++++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_oa_types.h |   3 +
 include/uapi/drm/xe_drm.h        |   6 ++
 3 files changed, 98 insertions(+), 15 deletions(-)

-- 
2.41.0

