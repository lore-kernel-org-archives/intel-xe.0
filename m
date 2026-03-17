Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4638F33806
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 06:35:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9D410E0E3;
	Tue, 17 Mar 2026 06:35:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LgezvlUZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6041F10E0E3;
 Tue, 17 Mar 2026 06:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773729344; x=1805265344;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g9fDVapjW5nW56UnoXv5ZBXMUvIwrE2mjTPz4RbSm5Q=;
 b=LgezvlUZV9ar77N217zp807N1EWtX1cav/wzJ29/ieO6qCOoENwGFeK7
 1WUP2ievZjfCdspzxgwPTs3bwkzZiamoEWjyhM8lEMtSerLHCPx8KpJY8
 hFR9vzLbNQcqWXIhRoZZMt/YEH7npybmTw1lxZ9YoI3TRSy9rBJJQuMwa
 QYkGDRJ2wZpTMSHWilJete2+ayd4bcLmt2De69Kt1KxM5JTW46CcNmREi
 QbYqG+SrYDPJQR+8OzXH857tUQ2cQYtc+Q8NSndnWmnjEYvWDBoN8iIxe
 Orbb6IHrI+FuJpZpQtlI6kdRXcWxxoXTPYRdW32RqCKlUbmKDC+wowIph g==;
X-CSE-ConnectionGUID: 40DKdIaOR2m9eMwtqmBe8g==
X-CSE-MsgGUID: tHuq7QvvSv6LJ6JYkiolhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="85834455"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="85834455"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 23:35:44 -0700
X-CSE-ConnectionGUID: 2k0vw5aQTFal7YltqmkHZQ==
X-CSE-MsgGUID: Ywnm+vtrRn+k677D8X5f9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="222105306"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 23:35:42 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH v4 0/2] drm/i915/dmc: Update PIPEDMC interrupt mask
Date: Tue, 17 Mar 2026 12:07:11 +0530
Message-ID: <20260317063713.3288576-1-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
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

On display version 35+ the PIPEDMC_ATS_FAULT and
PIPEDMC_GTT_FAULT interrupt bits are no longer defined.
Update the interrupt mask accordingly and enable the
PIPEDMC_ERROR interrupt.

Changes in v2:
- Move PIPEDMC_ERROR interrupt enable to a separate patch (Ville Syrjala)
Changes in v3:
- Add Bspec reference (Suraj Kandpal)
Changes in v4:
- Add TODO to check the enablement of PIPEDMC_ERROR on PTL (Suraj Kandpal)

Dibin Moolakadan Subrahmanian (2):
  drm/i915/dmc: Remove invalid PIPEDMC interrupt bits
  drm/i915/dmc: Enable PIPEDMC_ERROR interrupt

 drivers/gpu/drm/i915/display/intel_dmc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

-- 
2.43.0

