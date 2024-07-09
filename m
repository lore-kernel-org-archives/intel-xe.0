Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84FDC2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 18:41:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 575F010E5CB;
	Tue,  9 Jul 2024 18:41:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V8esWL4K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA6E310E5CB
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 18:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720550474; x=1752086474;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PudKnZn4r5pYvkEUvejdJcT6/nNq+apUnaG2ETYsAGw=;
 b=V8esWL4KHwEvNgE3vvGD+zlPs2qTnhbea4uXBHzepKZS0dEsFpnqYkpJ
 JgxXrOwlpRerP+7G/0b1O9mUFqPs89Z6Td27SrLOiETyZ/rD7FY4frcvs
 rrv9g4u/AKCMaIa0vb8IFZSaZdEX6+tqXVsGMbTsGj9SjaWelSQl8p7eD
 qWu04KxZefWNdADfHJIE4IdwDgHqRypT8NL5p8ScVrBR5WuG0IFf6T4v2
 qNmQhDJG1/SzRDAJym0gnN+xeH2udQd/+vgI1uAd/XKZkxtz/HXgJWHpZ
 z2HgOfM7DhfmIq4S9V6M73RP2WFElBYqxuXlQVmMjxb4PloH+docQIS5D g==;
X-CSE-ConnectionGUID: taVjrdCMRhOlpF+tqxmKTQ==
X-CSE-MsgGUID: 4qHL2LJeQGaLes8t49Mbzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="29224332"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="29224332"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 11:41:13 -0700
X-CSE-ConnectionGUID: EpIkG8eLSzSYPJ884/8GYg==
X-CSE-MsgGUID: KaZMclTjSfm4NG84fozU4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="48686529"
Received: from dut152iclu.fm.intel.com ([10.105.23.75])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 11:41:13 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: matthew.brost@intel.com, John.C.Harrison@Intel.com, brian.welty@intel.com,
 intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 0/2] Update page fault queue size calculation
Date: Tue,  9 Jul 2024 18:40:58 +0000
Message-Id: <cover.1720550129.git.stuart.summers@intel.com>
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

Right now the page fault queue size is hard coded with an
estimated value based on legacy platforms. Add a more precise
calculation based on the number of compute resources available
which can utilize these page fault queues.

v2: Add a drm reset callback for the teardown changes and other
    suggestions from Matt.

Original series: https://patchwork.freedesktop.org/series/134694/

Stuart Summers (2):
  drm/xe: Fix missing workqueue destroy in xe_gt_pagefault
  drm/xe: Use topology to determine page fault queue size

 drivers/gpu/drm/xe/xe_gt_pagefault.c | 68 ++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_gt_types.h     |  9 +++-
 2 files changed, 62 insertions(+), 15 deletions(-)

-- 
2.34.1

