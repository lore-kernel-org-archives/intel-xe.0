Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34076C5DF94
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 22:23:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B39E910F3E0;
	Fri, 21 Aug 2026 22:23:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FYW6NqWC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED88210E283
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 22:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787351025; x=1818887025;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ve5Y0tRY5b4HyQzrTQVKNpFnSEXA/qSIiJymXGVe9Zs=;
 b=FYW6NqWCoE0I8kO74JzOMa98RCfn2fYpzkhIUlhvgMsZwYLd8sB3bXGD
 wy1Inf01IxWIM49jBDsmgm9wjecqfXjEgL3A2XPORjHFHXjDK+IB4dOBN
 fNBOUMJk42XvRRc+uOp2En5j4AjfNh+/LFiRsgH/cu11Yg/xzkosqPdc6
 gmABKz6z7s6sj9iWZqC2lIs3O0BhV6Z196/NIDsTtv9Rkf0J3NKt5hnJH
 I7giDCFNPxbj2bhBkIt//n3o8f0iQeT/iZ/BFyXMp0UUZsz51M9G+xLF6
 iYPUSdmQtkbPYMrGpbGFwkh5QcvZm4lJmofI2VoomPDS3uxXLx4YyzlRZ A==;
X-CSE-ConnectionGUID: j98wi8QQRceoxV9R75iNRQ==
X-CSE-MsgGUID: SCrljbxdTaO7WMFNEJHuzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="90420767"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="90420767"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 15:23:45 -0700
X-CSE-ConnectionGUID: q8OiBHzARt+NMRBz5edW+g==
X-CSE-MsgGUID: wN7IDo8zS3OuZ3/Y2YuAqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="263198167"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 15:23:44 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 0/3] Modify the SW tail logic in OA
Date: Fri, 21 Aug 2026 15:23:39 -0700
Message-ID: <20260821222338.1053887-5-umesh.nerlige.ramappa@intel.com>
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
v5: Add Ashutosh's review comments
v6: Add Sashiko's review comment

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (3):
  drm/xe/xe_oa: Clear status only if relevant bits are set
  drm/xe/xe_oa: Avoid checking and setting fields in the OA report
  drm/xe/xe_oa: Add a lag to the reports that is exported to user

 drivers/gpu/drm/xe/xe_oa.c | 108 ++++++++-----------------------------
 1 file changed, 21 insertions(+), 87 deletions(-)

-- 
2.51.0

