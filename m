Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFF8C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  1 Nov 2023 22:52:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B44210E10D;
	Wed,  1 Nov 2023 22:52:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C423910E10D
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Nov 2023 22:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698879165; x=1730415165;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WrL84DZ1E5zHuQv8VmBpCxQs/AlGWHY4str49bBVgwA=;
 b=QqS2ihBxiTlWrVcmku2vLygzhvmbXHaCQ47i0pIce+ecviKn5U1KZFc6
 EB4zwrimSVF0TdqOJBZBvkATifFwpw183ZTWQW4y2Dv+OwitxdjArjAxy
 94DU32bVFbolr0bsjVlQNLrLuL7+1NwyelHcCfpCPf059O7BfD5uu4RBL
 yR8bmHGqEsFKltSgUV5LP8eS/6nyZaH83esnmRbCDkeqw5MC/UZL5d9uQ
 8SwuB7vx/l3z7GuCRoM7A6zlPYLwXXAKZETspY3kL8NysBex6K7NRcqWT
 GAYB9Vt/+2y37gcOC0vo6B10xV7L0QkMxUfRSx5RaicgszFnqcr6GWUtX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="378985205"
X-IronPort-AV: E=Sophos;i="6.03,269,1694761200"; d="scan'208";a="378985205"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 15:52:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,269,1694761200"; 
   d="scan'208";a="2238423"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 15:52:45 -0700
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  1 Nov 2023 15:52:43 -0700
Message-Id: <20231101225244.3605-1-brian.welty@intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/1] Fix pagefault and access counter worker
 functions
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

Fix issue where the worker functions for handling G2H messages for
pagefaults and access counters are not run even though we have pending
fault to service.

v2:
Matt Brost asked me to resend this version 2 which requeues the worker as
alternative compared to the v1 [1]. However, this will add latency if
servicing many faults and encounter context switch when requeuing the
worker. Perhaps start here and tune this later. I put TODO comments in
the worker functions for now.

[1] https://lists.freedesktop.org/archives/intel-xe/2023-October/016683.html

Brian Welty (1):
  drm/xe: Fix pagefault and access counter worker functions

 drivers/gpu/drm/xe/xe_gt_pagefault.c | 33 ++++++++++++++++++----------
 1 file changed, 21 insertions(+), 12 deletions(-)

-- 
2.38.0

