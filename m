Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94751CA5FED
	for <intel-xe@archiver.kernel.org>; Tue,  6 Oct 2026 12:41:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5035910E38C;
	Tue,  6 Oct 2026 12:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fy/yi2+H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72ECC10E38C
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Oct 2026 12:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791290496; x=1822826496;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VRTQbf1bsVVHjqNd+pmpisAt3wCsDw7fDbilOje2EfI=;
 b=Fy/yi2+HP9VzERJnFYNe2gLrEHsOXKeoXIKXw5BUUZDTyfr+sW6QUdq7
 mCl9y83FJzVjBYUE4FUFZ4jfKorbGhnPV+aVZdnfmjoTGKndoGv6HS6MU
 rtFrpisqyvE65v6lChGrJPT+NpBCOqIUW28LaSi7QQzbA5rcd4ldh8zcb
 KIGiobIy3raHJhq63ocqLRsMOROkgnLP3q6EkiChD4B3hlo4mQxuV68DC
 AAKzlW6zS1+wa1UN6EEAPIYA2ZRGUCExH/Q9wEWd5B4xZEfiLzFKS/FJQ
 qKB6tjeVBFSa38avIE1I897CW9uPeJPnkU5R5BqiF6nUe/fvWGukQf66m A==;
X-CSE-ConnectionGUID: YS4HHS8nTjKiAqxrTYX/Bg==
X-CSE-MsgGUID: SxxT2A1ITiuzc47SABK7Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="113764991"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="113764991"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 05:41:36 -0700
X-CSE-ConnectionGUID: jU+0lsm0QUixa7iaDhMa5A==
X-CSE-MsgGUID: RUR/2woNSYG9cvNiwB1B3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="276669995"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 05:41:34 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, matthew.brost@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V2 0/4] Followup fixes for memory page offline
Date: Tue,  6 Oct 2026 18:11:26 +0530
Message-ID: <20261006124125.1560295-6-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
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

Fix earlier Sashiko comments about RCU lock and external pinning as
well as VRAM lookup for fault injection and some kernel-doc nits

v2(Himal):
- For safer side, align down addr to pagesize before injecting fault

Tejas Upadhyay (4):
  drm/xe: Clean up kernel-doc typos in VRAM manager
  drm/xe: Re-validate external pin under resv lock before VRAM purge
  drm/xe: Drop RCU list handling for VRAM bad-page tracking, use
    mgr->lock
  drm/xe: Keep VRAM fault injection within the usable range

 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 59 +++++++++++++++-------
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  4 +-
 2 files changed, 41 insertions(+), 22 deletions(-)

-- 
2.52.0

