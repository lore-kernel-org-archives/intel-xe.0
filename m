Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6614AC48BEB
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 03:59:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 215D210E3AE;
	Thu, 22 Feb 2024 03:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d4IJ4GxO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C2B10E864
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 03:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708574360; x=1740110360;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=abZDFxHqifpb1xjzduBTge1DHvdeUGoH82FEuiKYS8s=;
 b=d4IJ4GxOoPhAtKKSWxlm/cUhzWg2crCXkBdWolSn1e3BM151PzobK6es
 Yq1hNYjOfveuSnITyI11ZLarHUZyV1yb/GMCQiSfZAKPdngmu//78w5G2
 Th+YQAVdaCFhzC3gVqMMvWVpNI0cWPSBO1THvvZMbzkf05BLt4EpGtVjd
 runMFYfUQNUETI6cITg6jA0SEj32bdW6G/gmYrlHcCVEFhXgQSOTNsq9D
 omHf1yeoqlVw9VXqMVvQHRruXQ76mRQJ6rbMvYgaXLZnd9Bl9XY+rJOGD
 EWgt3xtw8N44WRhFhWL2XuaZ8QAIaHzO6+J52I560+WSJa6ZsltynHaux A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="14198954"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="14198954"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 19:59:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="913442880"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="913442880"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 19:59:10 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 0/2] Fix execlist mode
Date: Wed, 21 Feb 2024 19:59:04 -0800
Message-Id: <20240222035906.3835257-1-matthew.brost@intel.com>
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

While not supported, execlist mode shouldn't be totally broken either.
Fix execlist mode so some basic tests work without a kernel panic (e.g.
xe_exec_basic.once-basic)

v2: send with correct patches 

Matthew Brost (2):
  drm/xe: Fix execlist splat
  drm/xe: Don't issue TLB invalidations for VMAs if using execlists

 drivers/gpu/drm/xe/xe_execlist.c |  2 +-
 drivers/gpu/drm/xe/xe_pt.c       | 32 +++++++++++++++++++-------------
 2 files changed, 20 insertions(+), 14 deletions(-)

-- 
2.34.1

