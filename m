Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC79C83F1A
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 17:32:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036E210E221;
	Mon, 14 Jul 2025 17:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TEfg6t//";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 584D210E08E
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Jul 2025 17:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752514319; x=1784050319;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DI2FIVc3EySc+P6MASVbgsTyUY8gzIV5WweBkw21L2s=;
 b=TEfg6t//qYHL5S84phwgVIis4pUszbYdX7rdBo6K6J3Q+r4JuEElDIyx
 7XiC2mN/DAAwVn4Dw72WkmoMvF5WCTARvjT/IiwlFIGlg4fsK2UoGrrwa
 h9VtHdTuUIb8sNLsDmOCjbkU0+e2ndD5qAS6rFnhpurIkSPxoSpLcuzks
 Sl93H9ogmP3XdyxmSXj71/7zqc86rgtwnE3hKZaOWfFdiPL/H6/gOXasd
 euDHCPq4N/4dzbZrV0Ysd99YdnJjGC8KJYjYFy1v5I8H9MHL+JNkrgOqK
 DXBeXndw88bMIDYzOkeF+1P1h9053am/amfM9hIrtqW6nIWmJDmCw/ZF6 w==;
X-CSE-ConnectionGUID: +Rmtc6YZSMidsh/9JvW29Q==
X-CSE-MsgGUID: SJdnKYqwTAa51f8NA/Pflw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="72167068"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="72167068"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 10:31:59 -0700
X-CSE-ConnectionGUID: xhuk19GLRlu+5SxtBjZP3g==
X-CSE-MsgGUID: 3mFytG79QKKi9Fhx8TGYcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="180689766"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 10:31:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.mrozek@intel.com, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 matthew.auld@intel.com
Subject: [PATCH 0/3] SVM compression fixes 
Date: Mon, 14 Jul 2025 10:33:39 -0700
Message-Id: <20250714173342.2997396-1-matthew.brost@intel.com>
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

Compression is broken for SVM and for devcoredump when reading out BOs.

Marking the first two patches as fixes. One option could be to drop
patch 1 and proceed with just the last two patches as fixes, if we
decide we're confident in SVM with compression.

Tested with [1]. The append memory copy compression sections fail on
drm-tip and pass after this series.

Matt

[1] https://patchwork.freedesktop.org/series/151581/

Matthew Brost (3):
  drm/xe: Disable compression on SVM
  drm/xe: Update xe_migrate_vram to support compression
  drm/xe: Enable compressed memory for SVM

 drivers/gpu/drm/xe/xe_migrate.c | 37 ++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)

-- 
2.34.1

