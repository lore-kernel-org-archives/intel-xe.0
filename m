Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172E4C79FA1
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 22:24:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CC510EDD7;
	Tue,  8 Sep 2026 22:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nqsg60T8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD0810EDD7
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Sep 2026 22:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788906247; x=1820442247;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VJR6hlOVcRy1M86lQY45Ynmxn1SV9q1BRYEWWBwsmPY=;
 b=nqsg60T83SRCwAPyqZ2tjliAeC2jqbhpt4Tkj4rxit9fBTveaazl9k+3
 TiURKQkRnzIE4y9B9krrjAteUdCg0cv33ngB50FiVyP9kDTrckpIwFEkP
 O5zotIUATiSctDTBICOVPaGn145DVn5OkTDQ6cqtTti7hqd4gGyADctBZ
 xov45tkxPr+j9icP2OgyLBxKCr3s6p8J2faW4yIXb/edM4amUY3fZ2a+K
 pn99sBFaIlGEAaeX5jycYfNSnXUhp6jK7AIdZSarc8/b32fqPtZTyorlt
 Lr6v4ObrOeLRFE1xFkxRIKUP01/7XoqXucQZdm/xaFzv0MXSjho1glFTk Q==;
X-CSE-ConnectionGUID: HeyD+tE7SiudfTgG31s2XQ==
X-CSE-MsgGUID: Jb778yQlTnaNK8gN872NtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100677197"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="100677197"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 15:24:06 -0700
X-CSE-ConnectionGUID: d4C95GL6RSS8s8fKlz4fug==
X-CSE-MsgGUID: rPKTqF5FSMu4ohFaQUMFdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; d="scan'208";a="270638215"
Received: from unerlige-desk1.jf.intel.com ([10.24.80.43])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 15:24:07 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 0/3] Modify the SW tail logic in OA
Date: Tue,  8 Sep 2026 15:23:57 -0700
Message-ID: <20260908222356.1210175-5-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.53.0
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

 drivers/gpu/drm/xe/xe_oa.c | 111 ++++++++-----------------------------
 1 file changed, 24 insertions(+), 87 deletions(-)

-- 
2.53.0

