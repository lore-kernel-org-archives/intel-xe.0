Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC05F3D33C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 17:15:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DEB10E2C7;
	Thu,  5 Mar 2026 17:15:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hI55UxMg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038D510E2C7
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 17:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772730948; x=1804266948;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=quFJZUBImHJW+GdcIpMRNkt7qgNlXcv6q3KPMmicNmU=;
 b=hI55UxMgflQRd4x3cd+6Enl/k9VX31v68qJyfNxXvpt74w8UltdT8W9U
 OZrqWIaQU491sWf1irTWgXzuw5JfOfhgRZjJxv50HF7h7BttmYKyEFMuX
 r5BU9QXSkYgSXw6vhjjJKh3+TO1uqbKRNz4Qobg9muK1LLrHDNrBcogHc
 5VOn851cqlkqleth/yB+WXCdQzRvPrb3cX8HPzSno+yDZaTwF/BqqUgfM
 LTrHn0QSqwqQwI+iUPSByiKllTGyKGzjW/SyUGJWPbw/fwRll7shJmN92
 UMfvlkiwocW5ODM/EYFWoR7U6iyUjdA5iGQXD/5LFYmwK3EDc18+qNQQi g==;
X-CSE-ConnectionGUID: N6gaM5VbSAS2jZOMa6NUvA==
X-CSE-MsgGUID: 7HiwehjMSI682OVAB80HUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73874636"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="73874636"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 09:15:48 -0800
X-CSE-ConnectionGUID: tdSGqHS+StGkhKq4RqRdNw==
X-CSE-MsgGUID: Zx+/zCm6Tja1sDwO8fPcDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="223231257"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.192])
 by orviesa004.jf.intel.com with ESMTP; 05 Mar 2026 09:15:48 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Brian Nguyen <brian3.nguyen@intel.com>
Subject: [PATCH v4 0/3] Page Reclamation Fixes
Date: Thu,  5 Mar 2026 17:15:47 +0000
Message-ID: <20260305171546.67691-5-brian3.nguyen@intel.com>
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

A few changes to the page reclamation code. Fix up the PRL generation and
move the page reclaim done handler to its own function.

Thanks,
Brian

v2:
 - Update non-leaf handling.
 - Re-add assert for non-leaf.git 

v3:
 - Modify secondary PRL abort to check non-leaf levels. (Matthew B)
 - In the case of NULL VMA, there should be no corresponding
   PRL entry, so leverage existing skip logic to skip over.

v4:
 - Rebase to get CI results.

Brian Nguyen (3):
  drm/xe: Skip over non leaf pte for PRL generation
  drm/xe: Move page reclaim done_handler to own func
  drm/xe: Skip adding PRL entry to NULL VMA

 drivers/gpu/drm/xe/xe_guc_ct.c       | 23 ++++++-----------
 drivers/gpu/drm/xe/xe_page_reclaim.c | 26 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_page_reclaim.h |  3 +++
 drivers/gpu/drm/xe/xe_pt.c           | 38 +++++++++++++++++++++-------
 4 files changed, 66 insertions(+), 24 deletions(-)

-- 
2.43.0

