Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05646C27C53
	for <intel-xe@archiver.kernel.org>; Sat,  8 Jun 2024 00:11:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5106B10E1BF;
	Sat,  8 Jun 2024 00:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B04w7/mD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0BEF10E013;
 Sat,  8 Jun 2024 00:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717805499; x=1749341499;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OJDeyJCIT8p3HykOfAMdAZjI84mfpxSwSuKaR/8cjVg=;
 b=B04w7/mDfAUy1UGFtSvg2nI3SCjX+4132GFiyJttV1+K7FmtILPqakRB
 JtZSGICKjn2sl6ymp0c26OI7ltBVzR3GA+H0gJKHzdALKW5amU1NDOB+3
 FPmNk5Fv8LHK8tJQDaJRYyuP/haMons4W73Is3W7JpO54keffdVD69mHQ
 LMVfj7R6H1w6fWaHFDp3Z9W7N+AHg+mU429XW0qVxL30akq98rkYzxQl0
 u7UV2sfdA59aVxvTPO1h4uffmFkNHqSnuoXOhmDc0KCETJp1u6uKGBLqZ
 +QkL3PjpyWnhNYhTX8WhiU2fNQUd2tcf4tXoyufKHRn+QytGAcPQVWmo8 Q==;
X-CSE-ConnectionGUID: Y7qSuVq0Q+CvrSgxLTaLBg==
X-CSE-MsgGUID: 8Uxv96/1Sl+va0jXNAe2mQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="11971592"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="11971592"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 17:11:38 -0700
X-CSE-ConnectionGUID: sU83ycudSrm4e0xI7Dj0GQ==
X-CSE-MsgGUID: pZKr1hwjRM6EqFvOpPknrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38425420"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 17:11:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/2] Job cancel tests
Date: Fri,  7 Jun 2024 17:12:09 -0700
Message-Id: <20240608001211.2365347-1-matthew.brost@intel.com>
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

Tests following series:
[1] https://patchwork.freedesktop.org/series/134593/

Matthew Brost (2):
  xe_exec_reset: Add job cancel tests
  xe_exec_reset: Add timeslice preempt test

 tests/intel/xe_exec_reset.c | 44 ++++++++++++++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 3 deletions(-)

-- 
2.34.1

