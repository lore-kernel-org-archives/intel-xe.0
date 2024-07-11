Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E9FC3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 17:36:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D674610E298;
	Thu, 11 Jul 2024 17:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gfwg9K9X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3605810E298
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 17:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720719397; x=1752255397;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mX/7CzD/lzDdawgNK7zQv3AypJVjcuHd/hXtjkF+txA=;
 b=gfwg9K9Xxtu5Q4L/BrCUnpf6zZDPzRYjt6j3IsDDu8vv9fpGXbchY72S
 Y7d3AYo3msIC1HZG0Dxi+mrL4KTTtct/+dHy/Cogu9dROK2j2EgWxGHwH
 4eiffNMmgwfw9SAYPlDExHL95XzRo8UjwLjWc6BQa+ny8wu8JALFRxVAb
 1cQAasr8O0KhjkBLx697HQYTYia2CCPW2jQFLR4uJirMBWnNbfYUfyYdV
 u9UKlzv3Eae2L5dSlP16OpnAhO2q6PNxvjv/T+HMUBX5rwSQm+NGQMqm1
 3/W4CX0yV9eBSzZUtcoJU0OO1M3oVNj/Gf0nTxm2vnZ9z3tpJw5nV4Hw7 g==;
X-CSE-ConnectionGUID: MtM1vmdUS7KC4Jom138ajA==
X-CSE-MsgGUID: DXiVKTcDS3OE3pw2WDqApg==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="29534484"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="29534484"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 10:36:37 -0700
X-CSE-ConnectionGUID: 0TGhGt4jTb+5nY3iG061TQ==
X-CSE-MsgGUID: 6sivey6IRLSAxf3oTSgavw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="79768367"
Received: from live-gta-imageloader.fm.intel.com (HELO
 DUT152ICLU.fm.intel.com) ([10.105.23.81])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 10:36:36 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: matthew.brost@intel.com, John.C.Harrison@Intel.com, brian.welty@intel.com,
 intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 0/2] Update page fault queue size calculation
Date: Thu, 11 Jul 2024 17:36:27 +0000
Message-Id: <cover.1720718987.git.stuart.summers@intel.com>
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
v3: Add a pf_wq destroy when the access counter wq allocation
    fails (Rodrigo) and pf queue size calculation adjustment (Matt)

Original series: https://patchwork.freedesktop.org/series/134694/

Stuart Summers (2):
  drm/xe: Fix missing workqueue destroy in xe_gt_pagefault
  drm/xe: Use topology to determine page fault queue size

 drivers/gpu/drm/xe/xe_gt_pagefault.c | 72 ++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_gt_types.h     |  9 +++-
 2 files changed, 65 insertions(+), 16 deletions(-)

-- 
2.34.1

