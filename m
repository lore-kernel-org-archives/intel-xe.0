Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C41CD98CF
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 18:48:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED23810E1BD;
	Mon, 15 Jun 2026 18:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n1uykYWx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A9210E1BD;
 Mon, 15 Jun 2026 18:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781549290; x=1813085290;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FHVqlD8oJyNk3ZNQE/w6rN5fB+A/5nVj5DFgl8lg8JU=;
 b=n1uykYWxhTZjyBKgbvxzUpkJc+b7wcB4RQfv1lcnQrVGSJiwTDM2U6yL
 Tkyt2MJRqRn34wUjCXZxY0MQZijq3/2Y7JCWOg/e7bH3UJUGKVWaQlPKW
 h04KBJvRi5NzbFdSIGE2ca0aehMPLwaYZIOItePJFc1BGpC5oyHGB0Gw2
 THVKBuGCGkGRNYaF3x/7XdbgjA8f0nSIRd8bDCgzMW81u4pOP5V1Oh/Ch
 Inso/piez0J6vIHHa7IVYMNG7hSyYzSWJupAkWoXfeNL1/rVsReZkY5oH
 MQLkF0Vk+jyeZSjxi8p4/006YzFvEpz9/awewDwMXtYYoZPPQQQA7Z2OX w==;
X-CSE-ConnectionGUID: hi2rUe/cRs22aZjaqBVE/Q==
X-CSE-MsgGUID: pQj0Mi/8TNaENiGzZfu7og==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="81438578"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="81438578"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 11:48:09 -0700
X-CSE-ConnectionGUID: oLXvBbUbTteJ2A/qktMIQw==
X-CSE-MsgGUID: EcYXha4pQY6gvdnxwk4Rng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="247628538"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.28])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 11:48:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 0/6] drm/{i915,
 xe}: display probe/remove cleanup and unification
Date: Mon, 15 Jun 2026 21:47:57 +0300
Message-ID: <cover.1781549229.git.jani.nikula@intel.com>
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

Small incremental steps towards unifying i915 and xe display probe and
remove.

Jani Nikula (6):
  drm/i915: move intel_display_device_probe() call a level higher
  drm/i915: remove superfluous checks for pdev->msi_enabled
  drm/{i915,xe}: move opregion/dram/bw init to
    intel_display_driver_probe_noirq()
  drm/xe/display: change order of
    intel_display_driver_remove_{nogem,noirq}() calls
  drm/{i915,xe}: move opregion cleanup to
    intel_display_driver_remove_nogem()
  drm/{i915,xe}: move intel_hpd_cancel_work() to
    intel_display_driver_remove_noirq()

 .../drm/i915/display/intel_display_driver.c   | 21 +++++++-
 drivers/gpu/drm/i915/i915_driver.c            | 49 +++++--------------
 drivers/gpu/drm/xe/display/xe_display.c       | 24 ++-------
 3 files changed, 36 insertions(+), 58 deletions(-)

-- 
2.47.3

