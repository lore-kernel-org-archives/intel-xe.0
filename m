Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0F6C5DF8E
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 20:07:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8813F10F3BA;
	Fri, 21 Aug 2026 20:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rsqf1W11";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9AE410E34F
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 20:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787342858; x=1818878858;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m4JMcWtUGsjAmrvoFe0gDNWF/bZx1VgBl/V1YYcr+6k=;
 b=Rsqf1W11wTnmCJdlF2/1LeA8Fx6DYiuUw8jyZZ5Z1XbdM5OPSMM87Fqk
 c1ZjcgBcYbCm3hzGlcYtUninHsk5vC8xz47g8eJBzfizIwJBxBWo2gFUY
 3Zg0EJxhWLxCpWVCFIqix3RBqXn1sKDHbu2kB+MgQjBkoVXPrGU5boJEE
 r5h2xhJy2fb7Mv/pSovIxi9HJK9+ewKnmMQVGUAoiZPn2bnNXbQGzC61O
 x80MyNn9FH5toS2YkVdm8zOdxByEzrbVai40odhgNmfoaNmQFlLaUAN+X
 oEDlhROldU98b6C4jmpunInIQP7yJB3xNkE0qfaqpm4NgU9VlDIn4qPJh w==;
X-CSE-ConnectionGUID: FLh9TV0jRBuMlt2OVpve8g==
X-CSE-MsgGUID: IPUEEeJcTT2UecSq6sD24w==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="87957213"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="87957213"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 13:07:37 -0700
X-CSE-ConnectionGUID: 6MFasjL9Q3G5lHwfGjNBiA==
X-CSE-MsgGUID: ir1+mWSMQa6pyufVQ+QQtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="266491041"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 13:07:38 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 0/3] Modify the SW tail logic in OA
Date: Fri, 21 Aug 2026 13:07:29 -0700
Message-ID: <20260821200728.1048699-5-umesh.nerlige.ramappa@intel.com>
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

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (3):
  drm/xe/xe_oa: Clear status only if relevant bits are set
  drm/xe/xe_oa: Avoid checking and setting fields in the OA report
  drm/xe/xe_oa: Add a lag to the reports that is exported to user

 drivers/gpu/drm/xe/xe_oa.c | 99 ++++++--------------------------------
 1 file changed, 16 insertions(+), 83 deletions(-)

-- 
2.51.0

