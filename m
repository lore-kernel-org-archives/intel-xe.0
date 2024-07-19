Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8037C3DA59
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 19:06:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A73E10EC9F;
	Fri, 19 Jul 2024 19:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G+PwvDC+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED3510EC9E
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 19:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721415983; x=1752951983;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FZW6vnO3Olnr4zvk4m1o92LRqCpGzIwlpPQ3flzI7jE=;
 b=G+PwvDC+4E9/XWF62CF5aEjRMLXtlIQA4oOaf6zv2md8JxrGY36PZQW4
 8KZnNea3S4nt9WRI2rpZSPCxW01YxzBwFMB1dN9WP0JmErG3yjMDc5deN
 koBZE6Y0kWa1W18K45HnWR+UEqNHd9U64/rURwQJjYtsvSgE5lb7hmfTZ
 FSc2eBUIjR8WKT/ODZsYa5/OFU3ReJfE67CTRzaep1V3Lj5kU+93M6bI0
 RW1ea0Bzec0D1Ne3gxcJ1Zhz466wZ32+4ljtL+NQg0QcIdoD4Bpk/UsO6
 3sJM8uIDB/TPDGl57Cz10KKdfPaUBJNnFgMV95yhTC/9rX8MWvJan7U/t Q==;
X-CSE-ConnectionGUID: Idv7YTvvROCLEq7puYDV4Q==
X-CSE-MsgGUID: BSTfG6rxSKSMkF+GkQpZXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="29633404"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="29633404"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 12:06:23 -0700
X-CSE-ConnectionGUID: B3vxLiHaREy/wICAPC9vow==
X-CSE-MsgGUID: lmhVhP7kQzapsMl/wtBWvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="51286702"
Received: from dut152iclu.fm.intel.com ([10.105.23.86])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 12:06:22 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: matthew.brost@intel.com, John.C.Harrison@Intel.com, brian.welty@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 0/3] Update page fault queue size calculation
Date: Fri, 19 Jul 2024 19:06:11 +0000
Message-Id: <cover.1721415811.git.stuart.summers@intel.com>
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
v4: Bump up the size of the G2H queue as well (Matt)
v5: Make the G2H buffer size 64K (Matt)

Stuart Summers (3):
  drm/xe: Fix missing workqueue destroy in xe_gt_pagefault
  drm/xe: Use topology to determine page fault queue size
  drm/xe/guc: Bump the G2H queue size to account for page faults

 drivers/gpu/drm/xe/xe_gt_pagefault.c | 72 ++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_gt_types.h     |  9 +++-
 drivers/gpu/drm/xe/xe_guc_ct.c       | 12 ++++-
 3 files changed, 75 insertions(+), 18 deletions(-)

-- 
2.34.1

