Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03100CD342F
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 19:44:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882BF88867;
	Fri,  8 May 2026 19:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ITMj1m2M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 487CC88867
 for <intel-xe@lists.freedesktop.org>; Fri,  8 May 2026 19:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778269476; x=1809805476;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lHU/JvCsNQ88OnUNIwpHjS5kbHFmh/K2XBpSRglMMNY=;
 b=ITMj1m2MbZjlLd5I2pB6aLB6aquW8JNpTJanYL2vPrZBV7m+dPzfenyO
 yi2s0HZwzoB29+kW+pdt3Mw4uX+zNx/TCfNBZoXf8Epw/KqwVchMAxyHI
 vGn380k6do78lNolwDOWyOVh+dWHjbs3em645WXNhW4+d3SwdENwq3BMN
 m+ja7wCd57ChcDRiVW9aUHUHu4wgI/C6hToik4Chh2Q6n6a3j+zicRydp
 XqA6TRGgym0nr05TQSwDehYDMlOkjtpnDqt35qTWAjRIGTdcbmkI2gqjR
 jlOdNH9uYyEwzrj/LVmyaFw+aRdP65eImh+Y6N4JhFGT4t9SitSLgSm91 w==;
X-CSE-ConnectionGUID: UOeAQgFaTHSQfP8JO3PGZQ==
X-CSE-MsgGUID: ZabES8brRgeyUwRkQfwR/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="66776801"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; d="scan'208";a="66776801"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 12:44:36 -0700
X-CSE-ConnectionGUID: SrHaD5QARsWZT7aLWOFCdw==
X-CSE-MsgGUID: DxWgiaN5RMyBS8v3yBgHEg==
X-ExtLoop1: 1
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 12:44:36 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] drm/xe/multi_queue: Code refactor and cleanup
Date: Fri,  8 May 2026 12:44:27 -0700
Message-ID: <20260508194428.61819-4-niranjana.vishwanathapura@intel.com>
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

Some code refactor and cleanup patches that are already reviewed
here https://patchwork.freedesktop.org/series/165324/ (the first
2 patches). Posting them here and expedite merging.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Niranjana Vishwanathapura (2):
  drm/xe/multi_queue: Remove redundant assignment in
    guc_exec_queue_run_job
  drm/xe/multi_queue: Refactor CGP_SYNC send path

 drivers/gpu/drm/xe/xe_guc_submit.c | 69 +++++++++++-------------------
 1 file changed, 24 insertions(+), 45 deletions(-)

-- 
2.43.0

