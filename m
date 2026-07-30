Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B40C55165
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 23:36:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1534410F0FF;
	Thu, 30 Jul 2026 23:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZL+01JHP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F9110F0EE
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 23:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785454553; x=1816990553;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4CSyntgchm9a4rUctlonCpzyDZMNPMmL96gR8jJiwJE=;
 b=ZL+01JHPWNSGOXFDR47y+hx3txCdaSgWdNh2Opy98GmAf4pU8v2/jljK
 +o4DDQ0/cBpntZuvQ70SmRlDCuMv56W0rtx5mtFLlkk6n1LYQEAkqomSO
 CCnKfSR/zPVOVdpMCPheFLTwQqOf1JDBwTCyiGYkEym+QOnq8i6MHDMCJ
 tqf/yDc+90ATl8gq/w8ABQPlqF09RiXtBzGKUpjCVhLIixY5hPWAL4YbI
 L7c1TUvJ8ZEGCXn7ZUIc49LHs56QHts5UREo/HOKabF8S9bPrQbPaHmdg
 c4JiTzsCmskH3VDnw1N+GxXgggPuxe6JBQqNXCrxb5T04FcUAORVlMt+R A==;
X-CSE-ConnectionGUID: 7cPNky3FQxyHqOgR7ht1WQ==
X-CSE-MsgGUID: Lk7fnh9lTK6mQf8A+qMhiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="103619702"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="103619702"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 16:35:53 -0700
X-CSE-ConnectionGUID: fFaBOVVsTLWRLymMb8mk3A==
X-CSE-MsgGUID: a9phRKqNSWeGDbMacbFiZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="257759653"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 16:35:52 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 0/3] Modify the SW tail logic in OA
Date: Thu, 30 Jul 2026 16:35:40 -0700
Message-ID: <20260730233539.3140839-5-umesh.nerlige.ramappa@intel.com>
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

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (3):
  drm/xe/xe_oa: Clear status only if relevant bits are set
  drm/xe/xe_oa: Avoid checking and setting fields in the OA report
  drm/xe/xe_oa: Add a lag to the reports that is exported to user

 drivers/gpu/drm/xe/xe_oa.c | 94 +++++---------------------------------
 1 file changed, 12 insertions(+), 82 deletions(-)

-- 
2.51.0

