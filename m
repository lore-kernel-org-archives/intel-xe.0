Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C19C25B75
	for <intel-xe@archiver.kernel.org>; Mon, 13 May 2024 08:42:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D224A10E505;
	Mon, 13 May 2024 08:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fU7COoRr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E62310E505
 for <intel-xe@lists.freedesktop.org>; Mon, 13 May 2024 08:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715589747; x=1747125747;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8ql3hwLRuMoY3kE8fEhRjc5Btemi0LBi0nAPbZGoy2Y=;
 b=fU7COoRruOD/U7WqynuYKyVgtLc7LUVvW6wHLWJv8/gBfE7Bc3mhZLhZ
 oF7VWnrtVU23hwWsiQMRh+1P7scMCyIUyzJRRefhPgg+HaWt2oYaS/mtz
 OIQV1bAvAdIJFvv0K2uOpE7myFwsPMDQ/SVAZXVDp8WT4eCmFqr3BKM44
 2l/0Qksk6gxmXC2J+osapMz8ac0bBwMfdLGLEDqiS6m/MYvGIvNkyTgwh
 o9ggojny1ItfsipdnzCzXJ2z7otqkRrVFj72Hl1YdrQIrwFTuBcE5VFi4
 XW6wHrRY3OvE1Oxt/2HTurL+I2SLUsKBqdS200esCR23S4yqBU94H6o+B A==;
X-CSE-ConnectionGUID: 1jtfV0L+Szm4tHJRNgrDjg==
X-CSE-MsgGUID: 8yrWrYYvSFSdSzDsoDBDNA==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11452629"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="11452629"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 01:42:27 -0700
X-CSE-ConnectionGUID: mcqz8d7QS/y9WNfUiasN/Q==
X-CSE-MsgGUID: DpQ/ZGjxRyWvfqaBDg54yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="30306515"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 01:42:25 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/4] Fix few more headers
Date: Mon, 13 May 2024 10:42:14 +0200
Message-Id: <20240513084218.2084-1-michal.wajdeczko@intel.com>
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

Michal Wajdeczko (4):
  drm/xe: Fix xe_gt_throttle_sysfs.h
  drm/xe: Fix xe_guc_ads.h
  drm/xe: Fix xe_lrc.h
  drm/xe: Fix xe_reg_sr.h

 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h | 5 +----
 drivers/gpu/drm/xe/xe_guc_ads.h           | 2 +-
 drivers/gpu/drm/xe/xe_lrc.h               | 5 ++++-
 drivers/gpu/drm/xe/xe_reg_sr.h            | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.43.0

