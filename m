Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC48CCD184
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 01:56:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC9B10E354;
	Mon, 13 Oct 2025 01:56:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ISPbMCtj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3656010E352
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 01:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760320586; x=1791856586;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rkim+wmDy3SIzitvQ0QxAYgg+NQWuINEV+BU7UxodaQ=;
 b=ISPbMCtjO8J+JYDQXziDQRGS/B9k2g1TuSOVQI1FWP0wquFo+cCIjhaC
 TA+lXRz4AobH+ZvYhiHYW2U0nkayWHtZI02MacCbZm/YeEs1DJGSmbqi4
 PXUjlMc0kAqYhQrkI1MObERNkHJe7WRePhXx77ZEDZtFT84D9B3fLCmhV
 LEodVxqcpVb/8DiR8KnsRRBpNCJWrBFypBgC0gC4vlaEKCT1Exe8iIiIF
 zEOqu+Tqcfm57VPRMmVCHTzE+h9IirKnTIq5eSQkbDfs60Pmnhoae6Zpz
 m9BKuWyUhcTp8qCHJcSToxhtCVvnwdyv1wVpI10zjqoy+yftPfxQESA75 A==;
X-CSE-ConnectionGUID: PODkCReYR+WP3ug6cCDTbw==
X-CSE-MsgGUID: aOH/dgG5RQG0DD/q0+IOVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="65074672"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="65074672"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 18:56:26 -0700
X-CSE-ConnectionGUID: IMpcsAtFTRKAGOrbjz4SAQ==
X-CSE-MsgGUID: LkQz1TKBTDSSJvKK7B2gxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="181892719"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2025 18:56:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, matthew.auld@intel.com, simon.richter@hogyros.de
Subject: [PATCH v4 0/2] Different page size handle in migrate layer 
Date: Sun, 12 Oct 2025 18:56:18 -0700
Message-Id: <20251013015620.4115242-1-matthew.brost@intel.com>
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

Handle non-4K PAGE_SIZE and use 2M GPU pages when possible.

Matt

Matthew Brost (2):
  drm/xe: Fix build_pt_update_batch_sram for non-4K PAGE_SIZE
  drm/xe: Enable 2M pages in xe_migrate_vram

 drivers/gpu/drm/xe/xe_migrate.c | 70 ++++++++++++++++++++++++++++-----
 1 file changed, 60 insertions(+), 10 deletions(-)

-- 
2.34.1

