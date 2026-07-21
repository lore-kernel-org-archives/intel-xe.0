Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BACEC44532
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 23:48:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3CE10EBAC;
	Tue, 21 Jul 2026 23:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gStqdUcQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F5F310E385
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 23:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784677705; x=1816213705;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vaHFguUXgFxaaK958uqTR8CHupioN4ycBbh1pKazIzQ=;
 b=gStqdUcQvJ+WAAB6A1gZ1rQrEqywDSQo3aDzKQ+bioluaPuqZ0Lv3WyX
 ZLv7xCTZh8vlR+FEu33IAlQFCrlCOUcQz1IUKlqEXvv/j4f17x+hLYzGy
 ISvCAOH/MIvSXQXg+1EDw8UUbAdx3KdmnuSdixrBhbSPt83QeWobwt1yo
 DmZM97PrTH2/nNBiTTOyBoni7rxtRC6OSN8HNw4pfuRjvGSmUs686WJl/
 1U1wIv0sp8YCGfRslcw9j8rmMeXne/6PSkmiAr9JK5dXx9v9L18tVp16p
 c14mXuc8KPL3OZ6foJLF6i21TGqxwU9CGqm9j5KvEgdsE1z2XAA1zWwrE g==;
X-CSE-ConnectionGUID: E4sPaOAvQvKY9qRUdOTQNQ==
X-CSE-MsgGUID: 4nfqqQspTMeyacYjWZ4Kbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="87832234"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="87832234"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 16:48:23 -0700
X-CSE-ConnectionGUID: yuJgM4MeTuyovM1+moy9Lg==
X-CSE-MsgGUID: RCyQhBoZSaWtJgnXrCq78g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="259882093"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 16:48:23 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 0/3] Modify the SW tail logic in OA
Date: Tue, 21 Jul 2026 16:48:18 -0700
Message-ID: <20260721234817.2473294-5-umesh.nerlige.ramappa@intel.com>
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

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (3):
  drm/xe/xe_oa: Clear status only if relevant bits are set
  drm/xe/xe_oa: Avoid checking and setting fields in the OA report
  drm/xe/xe_oa: Add a lag to the reports that is exported to user

 drivers/gpu/drm/xe/xe_oa.c | 88 ++++++--------------------------------
 1 file changed, 12 insertions(+), 76 deletions(-)

-- 
2.51.0

