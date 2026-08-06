Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737C3C5AC7C
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 22:47:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232F310E217;
	Thu,  6 Aug 2026 22:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BLEz1Rbg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D8F10E217
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 22:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786056436; x=1817592436;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wVEVmiYqHO16R4osZ4BFwuWF9CUnp3kmUkXgCwFrtR4=;
 b=BLEz1RbgG/R2kYipTpDab2I6+aG2m+Ap75jNaTs2mEg4WjrSvvLBnp18
 k1el0mdCL9/qtfyaL3J6I92we4vRBjuXV+jyq1NA+wIlNPSijzBwNCSM+
 BdKBGjQfNN4+mBnaUW0lwon6Qo73PjOEH0jGinnwx3e1EsOX9shkt2HOk
 4qj/Kp4UIKPMy49BsGvKk9iD64B40otmQmjV+fqzAym8U6uwq/vA8ayr2
 NDXU2y3OyfdVK0YjQ/AntBgF4mRytvATtZK4KAhOqsaKLdvBW3ngZ9SAa
 jwNB8hcp0sfargbdcTQZUReOQAHpBdZLYpVjMPJEvTd6T049kd4D0UTkF A==;
X-CSE-ConnectionGUID: IaLbGDP5Tl+MXq+RUNo5zQ==
X-CSE-MsgGUID: edJFMx7+RKu7H0elLjZPhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86675963"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="86675963"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 15:47:15 -0700
X-CSE-ConnectionGUID: 7R4mmmx6RgyrxNBBqSLjZg==
X-CSE-MsgGUID: B/dCDYRXT9GZ36i2salGOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="258373136"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 15:47:15 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 0/3] Modify the SW tail logic in OA
Date: Thu,  6 Aug 2026 15:47:03 -0700
Message-ID: <20260806224702.3563031-5-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
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

OA unit updates the HW TAIL register to indicate that a new report is
available, although it does not guarantee that the report is visible in
memory. Also the currently running workload contributes to some latency
in seeing this report in memory. In the past we would set some fields in
the OA report and check if the fields are populated to non-zero values
by the HW, but this is no longer sufficient since some parts of the
report may land out of order under heavy workloads. Drop this WA and add
a new logic that just waits for a fixed number of HW TAIL report
increments before returning data to the user. User will always see the
reports lagging by this fixed number, however we do not have realtime
use cases for OAG since OAG reports are mainly post processed.

v2: Rebase
v3: Add Sashiko's review comments
v4: Rebase, checkpatch fixes

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (3):
  drm/xe/xe_oa: Clear status only if relevant bits are set
  drm/xe/xe_oa: Avoid checking and setting fields in the OA report
  drm/xe/xe_oa: Add a lag to the reports that is exported to user

 drivers/gpu/drm/xe/xe_oa.c | 95 ++++++--------------------------------
 1 file changed, 13 insertions(+), 82 deletions(-)

-- 
2.51.0

