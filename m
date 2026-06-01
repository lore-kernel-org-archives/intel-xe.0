Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1789CD5BD1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 08:54:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769F2112FF8;
	Mon,  1 Jun 2026 08:54:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jl/j0TF/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C65F112FF6;
 Mon,  1 Jun 2026 08:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780304055; x=1811840055;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c9HlXcEAdvTM6+CBMhetv2vX5c/8fXhmDAqJ3A10Tfg=;
 b=jl/j0TF/QboseO8L5N+TkQYEYX/shihizMYLsmNbFDB5sG/64auVZoMz
 +gVgEwzxwNJzrgPiP8WoQiblcbAjoe3xFbxgQjxARnjAoEbJi9iuXyVzD
 O+R6fVwGXCf5pG9uTb0rdpdOcpDJXO6qKd99DC2qaLucD5A7EKzGNuLxb
 tG7NdkFhd0Lwzcl68IFztWzrZFvW+eJa+TdOMmd+4u9GGiEKSPiLFaYNs
 d4rQ+3uIE9twqnRKPSrtKMNk1HrNiIP/9r/IucbhRkV6cOcjV8UNX0DaR
 AQFA20qCRgWmISg96DKyf+maO0td53SRMDndEfxGFsYm8vihiLpI2T+/3 A==;
X-CSE-ConnectionGUID: 7lNPdN+RS/6OaO1E2Rw51Q==
X-CSE-MsgGUID: 5ZdiI8NAQ0uziLpLAu8dXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="91368913"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="91368913"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 01:54:14 -0700
X-CSE-ConnectionGUID: RlVy59T6QYCSUpm0bRhQmA==
X-CSE-MsgGUID: aYLuWIu6Tl6Xu12AAiiJ/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="239110418"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa006.fm.intel.com with ESMTP; 01 Jun 2026 01:54:12 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, pranay.samala@intel.com
Subject: [v4 0/3] More Fixes for color pipeline
Date: Mon,  1 Jun 2026 13:59:50 +0530
Message-Id: <20260601082953.128539-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
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

v4:
- Remove already merged patch
  86ed2d96db19 ("drm/i915/display: Copy color pipeline from plane in the primary joiner pipe")
- drop the extra spaces before ='s (Jani)

v3:
- Re-arrange patches

v2:
- Make dependency on atomic state more explicit (Ville)
- handle blobs in hw state clear

Chaitanya Kumar Borah (3):
  drm/i915/display: Don’t use atomic state back-pointer to derive color
    pipeline
  drm/i915: Avoid programming color HW blocks for NV12 Y planes
  drm/i915: Fix color blob reference handling in intel_plane_state

 drivers/gpu/drm/i915/display/intel_cursor.c   |  2 +-
 .../drm/i915/display/intel_initial_plane.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_plane.c    | 71 ++++++++++++++-----
 drivers/gpu/drm/i915/display/intel_plane.h    |  5 +-
 4 files changed, 58 insertions(+), 22 deletions(-)

-- 
2.25.1

