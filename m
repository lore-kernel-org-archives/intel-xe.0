Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FBFFE51F1
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 09:24:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C6B10E5CF;
	Fri, 24 Apr 2026 09:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XFxjV71Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DBC410E3B0;
 Fri, 24 Apr 2026 09:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777022665; x=1808558665;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9mJg1O+fAJaXsHtBx5s6vCKcpJdWT/94Yh0TkVURRJk=;
 b=XFxjV71Ye6q1vtDP6ufXH5MfjBxKkbY2c04kDy2jQXLKLYoF7+8cPJFT
 s13Oe+aBZL8kv1do3xB2BGxDTdAlFNrwVPBHlJNmR21y7cr5eehNjQbwW
 OTkRvGh4Zu5RibzQdtd2+vTEOWhy/fubUoIc6lJHgvgqWEH23WXsnpqgn
 m7zXAM3rZcD5pTnw//mkbiEVnRGOKwX/Lmx1jAsqxO39O068tXAeaVeDY
 mAouPzpezwnpRW49gqS6Pte2VWFIHm7ZCg1P9arMQ8UJ/vyKTXygM5ukB
 qq+spLVy9ocK882yujAZo1nL3CMKh1YQR2QRWB3YqIUmHy0BQHrEh8PEa Q==;
X-CSE-ConnectionGUID: qBXKktMcTm2igUedLdtS3g==
X-CSE-MsgGUID: ODrZa1UJTY2gbvpz0H7J8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="81607522"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="81607522"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 02:24:25 -0700
X-CSE-ConnectionGUID: QAbKk7QwRwuZI3AcES7gXg==
X-CSE-MsgGUID: rLNbFQd6R5+rdssdomNgnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="271029264"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 02:24:24 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 0/3] Fix AS SDP and VRR handling for DP branch devices
Date: Fri, 24 Apr 2026 14:39:39 +0530
Message-ID: <20260424090942.3060291-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This is a subset of patches separated from the series at
https://patchwork.freedesktop.org/series/164512/ for merging.

Currently VRR is not supported for DP branch devices, but AS SDP
handling don't fully reflect that. This small series fixes that.

Ankit Nautiyal (3):
  drm/i915/vrr: Avoid vrr for PCON with HDMI2.1 sink
  drm/i915/dp: Add a helper to decide if AS SDP can be used
  drm/i915/dp: Skip AS SDP for DP branch devices

 drivers/gpu/drm/i915/display/intel_dp.c  | 22 +++++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_vrr.c | 10 ++++++++++
 2 files changed, 31 insertions(+), 1 deletion(-)

-- 
2.45.2

