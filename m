Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78888C48BEB
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 03:46:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44DDE10E868;
	Thu, 22 Feb 2024 03:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RPsfJU0s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD3310E866
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 03:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708573600; x=1740109600;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7ZRwhHwgfnkyuFaHUDPsap3P/c2BrbBTK3HhdlJ60dw=;
 b=RPsfJU0sydy6d0CRmuPP8F04BBTfKTxO7pt92bVrm8oBlx/8JfBqFIaW
 mAgShCnGrPdNoxgPNVoeDL26hxbsU2o5Zzgub4KR8aVyoXt/3dpqoMSmI
 dunlwLZuXzffiq8WcikTina4uki3LEpE00UFLikwHrxIz/ozyJh0BRNNG
 Tm8+4E0rkkuDcimPVqvrYrQDjBW9SXOvC9pft7AvwNByYuXOQO69F4Ws8
 05SOUEDlcHlGgWBT1z9zTZsOwhxdhfGAAPdcm3XfARhcqG5MGYl3qJd/j
 LqEdinYEhMCC0R/oYrjVXydubPupfykK2jxURRmC1PWjk6KVV8LBYARNg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2914025"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="2914025"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 19:46:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="10038513"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 19:46:40 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 0/2] Fix execlist mode
Date: Wed, 21 Feb 2024 19:47:22 -0800
Message-Id: <20240222034725.3835064-1-matthew.brost@intel.com>
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

Matthew Brost (2):
  drm/xe: Fix execlist splat
  drm/xe: Don't issue TLB invalidations for VMAs if using execlists

 drivers/gpu/drm/xe/xe_execlist.c |  2 +-
 drivers/gpu/drm/xe/xe_pt.c       | 32 +++++++++++++++++++-------------
 2 files changed, 20 insertions(+), 14 deletions(-)

-- 
2.34.1

