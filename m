Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5985DCD0426
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 23:33:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D2010E447;
	Mon,  5 Jan 2026 23:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dp5NbvTm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D3610E43F
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 23:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767656035; x=1799192035;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ta2b0YJYfoaU+WSX7rGfIE32VOgcXqvtAxHnfefjt+E=;
 b=Dp5NbvTmDWsYxM8DQF1SlFw3Qsg+6BWfy1c+rmkQmyHsFUOlXtGS8DVA
 GPRdJIjVx1cl3e5Om3MbrR7ExeIB7PMCAyFccH+u+AEXzUeNMryazNw0q
 wB8Z8ZfRN2D65u1yVdIzajAef96hXPkQcFMp9TWqfoL4hXnPi43qYTlGn
 xxVO9wiPfhQcKvVjNd41OrQ3vl04sSuWYCVQkDJWHfq9YuxIpcMTeg5dY
 cU2BbGcT2y6BfhjHRfxt8bEwGBT7vwohtK/sMZ1JZRWysFNneCa01zQ2P
 pUR7/pJFaul98sgDp6vuWWahaSTn3SVK6i3Iq3UqbyumSetdnH2zfUXke g==;
X-CSE-ConnectionGUID: H7+Z7iHUT6SKhysssa4Etg==
X-CSE-MsgGUID: 901Jh9yTRBaXyVUs1c16pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69066958"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="69066958"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 15:33:54 -0800
X-CSE-ConnectionGUID: QSGCaonvTdWyA0WUYtyKvg==
X-CSE-MsgGUID: 7n0Mkd14RTqhrBbWj4Brhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="233199121"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa002.jf.intel.com with ESMTP; 05 Jan 2026 15:33:54 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH 0/4] Page-reclaim fixes and PRL stats addition
Date: Tue,  6 Jan 2026 07:33:52 +0800
Message-ID: <20260105233351.3753716-6-brian3.nguyen@intel.com>
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
 - Added PRL_ABORTED_STATS../

Brian Nguyen (4):
  drm/xe: Remove debug comment in page reclaim
  drm/xe: Add explicit abort page reclaim list
  drm/xe: Fix page reclaim entry handling for large pages
  drm/xe: Add page reclamation related stats

 drivers/gpu/drm/xe/xe_gt_stats.c       |  5 ++
 drivers/gpu/drm/xe/xe_gt_stats_types.h |  5 ++
 drivers/gpu/drm/xe/xe_guc_tlb_inval.c  |  3 +
 drivers/gpu/drm/xe/xe_page_reclaim.c   | 26 ++++++++-
 drivers/gpu/drm/xe/xe_page_reclaim.h   |  3 +
 drivers/gpu/drm/xe/xe_pt.c             | 76 +++++++++++++++++---------
 drivers/gpu/drm/xe/xe_tlb_inval_job.c  |  2 +-
 7 files changed, 92 insertions(+), 28 deletions(-)

-- 
2.52.0

