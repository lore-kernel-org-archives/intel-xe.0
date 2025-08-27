Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A5FCA0EFF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 18:43:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC16D10E0B9;
	Wed, 27 Aug 2025 18:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P/EEvmzG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B7F10E0A0
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 18:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756320237; x=1787856237;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4JZCIZLUykfKKy0XwBwB4WTVqxwhbRF/wuICI8Ei3iI=;
 b=P/EEvmzGil63nj3XLF1SNVNmIO+XW9sTLNKlVzzVSKeDXwfV8qHmW1qj
 BMUGHsoEr5sbjXesTIXsqXndqBUydMQm811O1MqHBCQYi7b96yX91m0g4
 IKQQRJAIA1k1MIEjKqmyxIuT8sj0Sa5CFC91rfsA0EvrCBHJeKiP+x1My
 DHQMJbySt5pSuG0D6u7NsciyuA8viOzLIoo6wrhpeLIY2BGif95PC6TZx
 lQWBCEPmpAizwUgEZ0N7G7dKW4YlubMSqNr5VX2vWPVbZHOE9IILM14St
 cr2Tp1BWLFKqlFMyK21hachWZOgIOFYpAS+0+JAN8lCaUblpBmTof4v5Y A==;
X-CSE-ConnectionGUID: xxCC5i+IRhuxLWYW8jyEXA==
X-CSE-MsgGUID: RBUfIVThR5e2dqSJEkPxow==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58730610"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58730610"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 11:43:57 -0700
X-CSE-ConnectionGUID: GqRUPPdFRNWnFz0zYXc+aQ==
X-CSE-MsgGUID: b+S8/SksSe6OrjcZtb5PtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="175177198"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 11:43:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 0/2] Enhance SVM stats
Date: Wed, 27 Aug 2025 11:43:50 -0700
Message-Id: <20250827184352.175550-1-matthew.brost@intel.com>
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

Add ability to clear GT stats and add more SVM stats for profiling.
Scripts should be able to be built on top of stats to breakdown time
spent in parts of the SVM page fault handler, bandwidth of copy engine,
etc... Will help showing concrete performance improvements when
implementing SVM optimizations.

Open suggestions of more stats. Prefetch not considered - can be done in
a follow up.

Scritpt to parse stats for reference: https://pastebin.com/rZZN5sgh

v2:
 - Include local changes missed in first rev
v3:
 - More stats after putting together script to parse
v4:
 - Rebase
v5:
 - Rebase
 - Drop clear_stats entry

Matthew Brost (2):
  drm/xe: Add clearing stats to GT debugfs
  drm/xe: Add more SVM GT stats

 drivers/gpu/drm/xe/xe_gt_debugfs.c     |  25 +++-
 drivers/gpu/drm/xe/xe_gt_stats.c       |  47 ++++++
 drivers/gpu/drm/xe/xe_gt_stats.h       |   1 +
 drivers/gpu/drm/xe/xe_gt_stats_types.h |  33 +++++
 drivers/gpu/drm/xe/xe_svm.c            | 196 +++++++++++++++++++++++--
 5 files changed, 292 insertions(+), 10 deletions(-)

-- 
2.34.1

