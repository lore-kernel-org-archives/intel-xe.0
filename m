Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C4DCA5FD2
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 13:41:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF2A10E1DF;
	Thu,  1 Oct 2026 13:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gxNWqQJd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5969D10E37D
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 13:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790862068; x=1822398068;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FC0uIX5m4y2M+fC75ABH8KJvSzp6QIOOMmmHcHsk29c=;
 b=gxNWqQJdfjjEPNxbnfLoTPdkN3gsS3ePZtek8bhWbpELiYux2SYomMcM
 gtqLPsSU79T+hFwtNhnkmPPxck5itdIYfVc7RQokhzk46RuwsepcCmR0X
 E5KCzOfRf2IjCjnyoLdBSVX6ehzkNAXTB4IdZYlkLWo9X9lLKzChzbT2t
 60+BlKX+OuKoaQveMNwlaBcPYLhX0VklDMolSKWO0s0Tj1dKL9U4NorW/
 TMsKW4hbbb+IHyD0QgC1P71p7BkFIpVGCMcGkWbaq3DP5yUX2Mf7dlbdb
 raH7KNicQBOUMKgcLSOfCZ+t/F+aOHNIEYlcaxaMVs82XVtlmJxEYNqX2 A==;
X-CSE-ConnectionGUID: IoKE1bdBRO+3B7kwsIMUPQ==
X-CSE-MsgGUID: CBGeGJa6SyyN/G+nfZ4bEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="100951783"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="100951783"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 06:40:41 -0700
X-CSE-ConnectionGUID: 75zkC6zWRfyd8kOQ1sQeXw==
X-CSE-MsgGUID: hqyhyXZqRkOIOKU5/N12KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="275525131"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.244.16])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 06:40:40 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 0/2] drm/xe: Fix two bo pin/unpin accounting bugs
Date: Thu,  1 Oct 2026 15:40:16 +0200
Message-ID: <20261001134018.111553-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Two independent fixes uncovered while auditing the bo pin/unpin and
shrinker accounting paths:

1/2 fixes a double-subtraction of the shrinker's page/object
accounting on nested xe_bo_pin_external()/xe_bo_unpin_external()
calls, which can desynchronize the shrinker's counts from reality and,
due to a signed-to-unsigned interpretation in xe_shrinker_count(),
turn into a huge bogus shrinkable/purgeable page count that causes the
shrinker to be invoked excessively under memory pressure.

2/2 fixes a stale xe->pinned.late.external list entry left behind when
a bo pinned both externally and as an fb has its final unpin performed
via the fb-pin path, which bypasses pinned_link maintenance and can
lead to list corruption or a use-after-free once the bo is freed.

Both are tagged for stable.

Thomas Hellström (2):
  drm/xe: Fix shrinker accounting double-subtraction on nested external
    pins
  drm/xe: Fix stale pinned_link entry when fb-pin performs the final
    unpin

 drivers/gpu/drm/xe/display/xe_fb_pin.c |   6 +-
 drivers/gpu/drm/xe/xe_bo.c             | 110 +++++++++++++++++++------
 drivers/gpu/drm/xe/xe_bo.h             |   2 +
 3 files changed, 90 insertions(+), 28 deletions(-)

-- 
2.55.0

