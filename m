Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14A1CF6BE3
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 01:04:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA1910E04B;
	Wed,  7 Jan 2026 01:04:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gy5v7dnB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A2610E04B
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jan 2026 01:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767747889; x=1799283889;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cNAGgGJgxxkouVLxlGFsx8jVuorJPGosdx4s58nULrg=;
 b=gy5v7dnBNAJyKood90075sF/8MH/pbwp8zt0YHM7P8KKt3+hkBCF5wXb
 fA/ff3TqF1z8+8AetwTPQYt4mDIk4JeCi5BkfvTIZyHL+cSzoysrIz2sv
 H8VEoMgd0Wt3Sa6Cw8jcX/3L/S3oTY9XHt1I/yXccA2nFwfvmmgSJCaVG
 VgiaiKoBE/aL/+vf5+hsBc0BSMg/cITeVbfBmORrnT5r1mtZxippWBnpX
 MVMr9E3o3rmpn6+SAeWSrNg/mOwcB5y+T260wIi+CZb/Dxc7UETKLoT+/
 No1HG3NSCisdkT5W5gZJA34Kzddt52jRnM53puSnYj/FANk9fg9Ez49Tf A==;
X-CSE-ConnectionGUID: wR0Li93AQsmDZnzqrXHapA==
X-CSE-MsgGUID: Xyfku7nXRf6rz5zLGplu9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="72964791"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="72964791"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 17:04:48 -0800
X-CSE-ConnectionGUID: uLXqgFKUS9myG9QV98zOgQ==
X-CSE-MsgGUID: mENRzXUBREei7G97TQLjRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="206937239"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa003.jf.intel.com with ESMTP; 06 Jan 2026 17:04:50 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH 0/4] Page-reclaim fixes and PRL stats addition
Date: Wed,  7 Jan 2026 09:04:48 +0800
Message-ID: <20260107010447.4125005-6-brian3.nguyen@intel.com>
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

This series provides fixes to page reclamation and additional stats
for the page reclamation feature.

Patch 1 is just a small fixup to remove a debug comment.

Patch 2 makes the distinction between PRL invalidation done as
part of a typical workflow and invalidation done to abort and
fallback to normal TLB invalidation.

Patch 3 fixes the incorrect handling of larger page sizes for PRL entry
generation. 64KB are just contigious 4KB PTE so only need to add one.
2MB also needs to be handled separately because page directory are
handled differently. Also additional handling of racy pte reads and
page walk completions before PTE.

Patch 4 adds PRL related stats to GT stats to assist in debugging and
validation of the feature.

Modifications from the fixes will slightly conflict with the addition of
stats so it seemed better to push patches as a series together.

Thanks,
Brian

v2:
 - Remove comment erroneously added in initial commit.
 - Add explicit abort func to clearly define invalidation done
   to indicate end of scope and invalidation done to abort PRL.
 - Added PRL_ABORTED_STATS. (Matthew B)

v3:
 - Convert abort function to macro. (Matthew B)
 - Reworked logic for one PRL abort handling. (Matthew B)

Brian Nguyen (4):
  drm/xe: Remove debug comment in page reclaim
  drm/xe: Add explicit abort page reclaim list
  drm/xe: Fix page reclaim entry handling for large pages
  drm/xe: Add page reclamation related stats

 drivers/gpu/drm/xe/xe_gt_stats.c       |  5 ++
 drivers/gpu/drm/xe/xe_gt_stats_types.h |  5 ++
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c  |  3 +
 drivers/gpu/drm/xe/xe_page_reclaim.c   |  2 +-
 drivers/gpu/drm/xe/xe_page_reclaim.h   | 20 ++++++
 drivers/gpu/drm/xe/xe_pt.c             | 84 ++++++++++++++++++--------
 6 files changed, 92 insertions(+), 27 deletions(-)

-- 
2.52.0

