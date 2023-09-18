Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA3CCD37B0
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 17:30:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821BD10E0E8;
	Mon, 18 Sep 2023 17:30:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C8210E0E8
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 17:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695058210; x=1726594210;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XUo8uC0kMzaLi11HNn93sP0ibkv4r/k3KeREI0GGY10=;
 b=F77a4TzDg77T0pwj2C21lw9sVhbI/QsfTa9hsmJLqDF/kLu96aWmJaUA
 t1Fjo0vpqrDgp0HDscs3Ig4b1TCLKzeK8Ln4TPGVW3dGt7/JY1TSr9dv+
 0TUY9mnQPpMhapNVzmaRUBRbbTYOMdcGm4xYCQ1qQk7PCS23EHG4y/cYd
 l1q/B9rwTv20z+7w1KmIoh5vqtIrnjTgU77mZoAtxeOR1qIcTCJoogAEc
 ORq81gpdGM0KpsF1Vrm69ydfcjhfdOgURRrDxs/CmjJpxAzVxkDoUx7Cg
 Y9hc7XWJs+l9yr4NrALRHcd8WvXdfwT78SaaKvbST8P3zcdOUcm7h+QgS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="359140650"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="359140650"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 10:30:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="919543193"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="919543193"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga005.jf.intel.com with ESMTP; 18 Sep 2023 10:30:08 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 18 Sep 2023 23:07:08 +0530
Message-ID: <20230918173711.625930-1-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/3] drm/xe: Make vga setup decode co-exist with
 Xe
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This series removes the #ifdef introduced for VGA decode setup.
Refactors the code to have a cleaner separation and co-existence
with Xe and i915.

Uma Shankar (3):
  drm/i915/display: Add a wrapper function for vga decode setup
  drm/xe: Add wrapper function for VGA decode setup
  drm/i915: Use the wrapper function for vga decode setup

 drivers/gpu/drm/i915/display/intel_vga.c    | 20 +-------------------
 drivers/gpu/drm/i915/soc/intel_gmch.c       | 14 ++++++++++++++
 drivers/gpu/drm/i915/soc/intel_gmch.h       |  1 +
 drivers/gpu/drm/xe/display/ext/i915_utils.c |  5 +++++
 drivers/gpu/drm/xe/xe_display.h             |  1 +
 5 files changed, 22 insertions(+), 19 deletions(-)

-- 
2.42.0

