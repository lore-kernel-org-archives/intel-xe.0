Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C64DC4453A
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 21:54:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25EF910E4F4;
	Wed, 22 Jul 2026 21:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SEHQxspo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B9710E4F4
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 21:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784757249; x=1816293249;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4RGJ9XAAMMperHzKGpSABC23Yy3+hRDqB7CK9HL57Vc=;
 b=SEHQxspo0l0Wksrpah52xODDILO2zgeh2JR39caRCBYFI3L5mcGfWlhB
 v/lv2MwHXcXTlIq8x1ukvCYSegg810q8x/lzX/ArtX2tVgAeE7TvzS3G6
 hHl8ZKSgXmhkGPKHmBrGnOUvr0se2u+qCGvbABm4k5CILXAZDUprZ4h8S
 sTVYEr5rmzgTEqT9xikGo/Sf7LTxovGMwinkZzNLlfGt/avwBR1ct42Eu
 FeMHT5d2RghXVGkGgGxMfIEcQ6FSVb6pE5FVIfpimHIKGNMXe0OzuKeG1
 mzVx5kOKj0DiG6HmwDhCV0d+7le7rRNKoeSc7DnE4QHngCAHD+1NmuA5K A==;
X-CSE-ConnectionGUID: A990fBVITf2rA/7H8r2qUg==
X-CSE-MsgGUID: J1jabOFARgGGyYiOxTu+eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="102950628"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; d="scan'208";a="102950628"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 14:54:09 -0700
X-CSE-ConnectionGUID: znsNHFxKSvOyxA738umifg==
X-CSE-MsgGUID: mSPJvkO1Tluk91rU3yrkqw==
X-ExtLoop1: 1
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 14:54:09 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 0/3] Modify the SW tail logic in OA
Date: Wed, 22 Jul 2026 14:54:04 -0700
Message-ID: <20260722215403.2668958-5-umesh.nerlige.ramappa@intel.com>
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

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (3):
  drm/xe/xe_oa: Clear status only if relevant bits are set
  drm/xe/xe_oa: Avoid checking and setting fields in the OA report
  drm/xe/xe_oa: Add a lag to the reports that is exported to user

 drivers/gpu/drm/xe/xe_oa.c | 94 +++++---------------------------------
 1 file changed, 12 insertions(+), 82 deletions(-)

-- 
2.51.0

