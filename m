Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886BBC55167
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jul 2026 04:00:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4D610F145;
	Fri, 31 Jul 2026 04:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b4lXJBYY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9DB610F145
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jul 2026 04:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785470415; x=1817006415;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kVAn2UoY1lLi9X5rHVF6K27HNxy4QCBYs7JxMxL1a0A=;
 b=b4lXJBYYYrJRQ0DL13FzkJj3jVO1QEXOpR/QFAcCVjL6NEwafBh1G0tQ
 aK/e3872V8t1GHrfR1mzZnqvbPtiAO/Qa1A8/uZjYV6fNqpM+yiv030wQ
 y8szWLr1Mta7KIp35/x/xilHcmz3gBp/o/fH+mZJVf56jE14ZpXmBxzgn
 alFdrCWov9tOIGsh5RWSK09RcvKzceUJURWo5DTBOtf8LKsRQiElyjW5x
 k4GqFTFBSHfA6MEG5HTHco6YfvB0ei7rvLTy6vzTWyrnksCEIsv8WmrPc
 sMJraYHzJpwPBsV6EWp6Quy/v138dMteRKCPl7uQWCal7noIgDs+XVzEy Q==;
X-CSE-ConnectionGUID: oliPqgezR3Gr/WzimFugNA==
X-CSE-MsgGUID: +b+nSpzgTWmE6SXrlG5S6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="96756099"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="96756099"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 21:00:14 -0700
X-CSE-ConnectionGUID: u7SKPVNxQYS2IZIGPEMt1w==
X-CSE-MsgGUID: ydl/HjOpRL+kVRc6npN7CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="298680093"
Received: from vkollerx-mobl.gar.corp.intel.com (HELO
 soc-5CG5233SZH.clients.intel.com) ([10.247.208.64])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 21:00:12 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: umesh.nerlige.ramappa@intel.com, matthew.brost@intel.com,
 kamil.konieczny@intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org
Cc: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Subject: [PATCH v9 0/3] drm/xe: make CTX_TIMESTAMP TOCTOU-safe and handle
 sentinels
Date: Fri, 31 Jul 2026 04:00:05 +0000
Message-ID: <20260731040004.1345502-5-gajendra.uttamchand@intel.com>
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

Fix timestamp handling for Xe LRC contexts to avoid races and false
timeout detection. This patch documents and centralises the
CONTEXT_ACTIVE sentinel and makes MMIO reads of CTX_TIMESTAMP TOCTOU-
safe by verifying the LRC-stored timestamp before and after the MMIO
read.

Fixes: d243ef6a39c6 ("drm/xe/lrc: Refactor xe_lrc_timestamp to simplify logic")

v2:
Dropped the redundant second patch (Matt Brost)

v3:
Added the Fixes tag for the original commit (Umesh Nerlige)

v4:
Added Reviewed-by for the original commit (Umesh Nerlige)
Added Acked-by for the original commit (Matt Brost)

v5:
Fix incorrect 'From:' username in commit header (Kamil)"

v6:
Fix AI review comments from sashiko.dev
 - Fix torn read of CTX_TIMESTAMP from LRC
 - Fix ABA race on engine migration in context timestamp read

v7:
Fix review comments (Vivi Rodrigo)
 - Added Assisted-by coding assistant used
 - Removed extra comments
Added ldw check additionally to avoid torn read (sashiko.dev)

v8:
Fix git am merge issue with v7 patch series

v9:
Fix AI review comments from sashiko.dev

Gajendra Uttamchand (3):
  drm/xe/lrc: document sentinel and make CTX_TIMESTAMP read TOCTOU-safe
  drm/xe/lrc: Fix torn read of CTX_TIMESTAMP from LRC
  drm/xe/lrc: Fix ABA race on engine migration in context timestamp read

 drivers/gpu/drm/xe/xe_lrc.c | 69 ++++++++++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_lrc.h |  7 ++++
 2 files changed, 60 insertions(+), 16 deletions(-)

--
2.43.0

