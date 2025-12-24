Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7EEE776FA
	for <intel-xe@archiver.kernel.org>; Wed, 24 Dec 2025 23:36:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B0531134CB;
	Wed, 24 Dec 2025 23:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KmcRWo42";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DFA41134CB
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Dec 2025 23:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766619402; x=1798155402;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tITGOaUC3vkPtlkIHmAN6SNrYLL7DtIAsoHcLIjvOdM=;
 b=KmcRWo42MoCoeIuMJ+ZTCVPOsfIATwtne7ZnmOQI9dKAJwhOSaN8j66Z
 dH2cFToGCHahRxLKfXf146AK4sgxOJbLwTNWYWEED9EAk6AyZRsTofUGv
 IuYFG3ge6d4qO3kSRuce1bfcRFoWGGpJEFMknqP0jlSxzE7qgg3recSEF
 pV1hey+/rx3HfkRQoptchHBGMIo3Z6uvn541CYXTkzlNVR9aQ4bd3QwYU
 cOAdYgY9EeeBUCxTACNYluuAzGV2BVbEDyWOS14JCi1yvbJS6zxUtFr0b
 fcb4+L469PNgZkUjlUapGJ/dCqNKqGIaGsGOeCQuDk+NbcjkMHiCpdLUa g==;
X-CSE-ConnectionGUID: lpGcfbUNRQuKi7ryl/q9Kw==
X-CSE-MsgGUID: jOBWbj3lTH+sYLQMQvTXCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="56007858"
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; d="scan'208";a="56007858"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 15:36:41 -0800
X-CSE-ConnectionGUID: JiQ3fCWwStaWUl4s0cRRbw==
X-CSE-MsgGUID: +BzV1nIjRle7qd1wZ+hNkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; d="scan'208";a="237502909"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa001.jf.intel.com with ESMTP; 24 Dec 2025 15:36:40 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH 0/2] Page-reclaim fixes and PRL stats addition
Date: Thu, 25 Dec 2025 07:36:39 +0800
Message-ID: <20251224233638.1535283-4-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.52.0
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

This series provides fixes to PRL generation and additional stats
for the page reclamation feature.

Patch 1 fixes the incorrect handling of larger page sizes for PRL entry
generation. 64KB are just contigious 4KB PTE so only need to add one.
2MB also needs to be handled separately because page directory are
handled differently. Also additional handling of racy pte reads and
page walk completions before PTE.

Patch 2 adds PRL related stats to GT stats to assist in debugging and
validation of the feature.

Modifications from the fixes will slightly conflict with the addition of
stats so it seemed better to push both patches as a series together.

Thanks,
Brian

Brian Nguyen (2):
  drm/xe: Fix page reclaim entry handling for large pages
  drm/xe: Add page reclamation related stats

 drivers/gpu/drm/xe/xe_gt_stats.c       |  4 +++
 drivers/gpu/drm/xe/xe_gt_stats_types.h |  4 +++
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c  |  3 ++
 drivers/gpu/drm/xe/xe_pt.c             | 49 ++++++++++++++++++--------
 4 files changed, 46 insertions(+), 14 deletions(-)

-- 
2.52.0

