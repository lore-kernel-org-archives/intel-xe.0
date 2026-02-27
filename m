Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B06FD9E26
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 01:42:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B52010EA18;
	Fri, 27 Feb 2026 01:42:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HnVHkLIy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972BA10EA18
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 01:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772156533; x=1803692533;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XrV3ndvbcE2hl/V4La13HmlSnpJFlxRBcocTIMKBK3o=;
 b=HnVHkLIy44U2ByrocwxJkpIBpGK8DKjBmiQVVb6Ic0S7COsIdYk5UEle
 1ePRIBx68n6+tuY/hHU+opyiU0kDx7J8ld5PIK+rQ+C7l+xY1EHqfEd/y
 huSvr6NyjzgOKYP9aJsLZB1QB3KK2MOgPjd3J1df7mo1Rf5i7JkzmS5yf
 ry4tWhY727pN8ov243e0ZshltSwJjBA55tP/UABJDjSnjE0jsuljHu7VJ
 WfoSZG9IPYdd4aFw8tktcnW4lCKjtsjj3VkqPtf8sD5VBdvPNi1bmEb0P
 NdEMGmaq2NLNCkkCQtEPcKKLXkZH0l9nGxuuTCvk32wi7uDEJU9lKvS38 g==;
X-CSE-ConnectionGUID: Y5tg9ROIT9ewDnyhuNlRAw==
X-CSE-MsgGUID: ME5wQC7oTlCm+JWCOPAmnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="90641299"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="90641299"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 17:42:13 -0800
X-CSE-ConnectionGUID: Yb3kdxVySiuGPg0bD+eYOA==
X-CSE-MsgGUID: C52igMI/ROGrD/ZpP0Munw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="220890783"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.192])
 by orviesa003.jf.intel.com with ESMTP; 26 Feb 2026 17:42:13 -0800
From: Brian Nguyen <brian3.nguyen@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Brian Nguyen <brian3.nguyen@intel.com>
Subject: [PATCH v2 0/2] Page Reclamation Fixes
Date: Fri, 27 Feb 2026 01:42:13 +0000
Message-ID: <20260227014212.992363-4-brian3.nguyen@intel.com>
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

A few changes to the page reclamation code. Fix up the PRL generation and
move the page reclaim done handler to its own function.

Thanks,
Brian

v2:
 - Update non-leaf handling.
 - Readd assert for non-leaf.

Brian Nguyen (2):
  drm/xe: Skip over non leaf pte for PRL generation
  drm/xe: Move page reclaim done_handler to own func

 drivers/gpu/drm/xe/xe_guc_ct.c       | 23 +++++++------------
 drivers/gpu/drm/xe/xe_page_reclaim.c | 20 ++++++++++++++++
 drivers/gpu/drm/xe/xe_page_reclaim.h |  3 +++
 drivers/gpu/drm/xe/xe_pt.c           | 34 ++++++++++++++++++++++------
 4 files changed, 58 insertions(+), 22 deletions(-)

-- 
2.43.0

