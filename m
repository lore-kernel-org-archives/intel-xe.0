Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D238C5DF7D
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 04:51:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A51410F1ED;
	Fri, 21 Aug 2026 04:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dq7xI5qX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14DE110E27B;
 Fri, 21 Aug 2026 04:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787287863; x=1818823863;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZC3lh4Y44No1fHzKiEzEx3dIY3RI/hY8ckMr44+X7TI=;
 b=dq7xI5qXUVwhPEHd4tFBL3auCjgxjuhuf0lfDDDlRMhtjH34LzGlSssE
 byoLNW5DQyvFIVf8kjxaf+jn5qzYwDdn2aqasHDle32lE4XOaOI5RoyTe
 /Sf7aOSXtF2c1GDdJRDaHqnwsJ8dsFEft1jGfmo9VVUw7PjSPTzIZm7s9
 HXuvwJqU4osK39fzK9DJJJpIqa42GTifl4W1RgI1NF0tmeh31KjlGjFhS
 ZocvXSs9lZK56eMn7CYFhHPCtCinNtwtOwB+T2kqEgYisUu4png6I9Jar
 d09AGKXyn1EYiucCDBNgJs/FrNkscp6+VEcdZOSQoh5MXwJJO6IOfDA0d w==;
X-CSE-ConnectionGUID: aLJV0macRjaWR3nAs9MJEg==
X-CSE-MsgGUID: h2l+ADTJQguahxFSxqDfZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87893827"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="87893827"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 21:51:02 -0700
X-CSE-ConnectionGUID: ga1BXetwT5CS3hZFyWfAaA==
X-CSE-MsgGUID: P2WiD8oLQMCT0FlQWo7NvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="266291071"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa007.jf.intel.com with ESMTP; 20 Aug 2026 21:51:01 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 0/6] Enable joiner cursor fast updates
Date: Fri, 21 Aug 2026 10:17:49 +0530
Message-Id: <20260821044755.2234490-1-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
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

     This series enables the cursor fast path for joiner mode
and adds the missing secondary-plane handling to keep updates
correct and synchronized.

Nemesa Garg (6):
  drm/i915/cursor: Check joiner cursor commit status
  drm/i915/cursor: Add helper to update cursor plane
  drm/i915/cursor: Handle secondary cursor state
  drm/i915/cursor: Program secondary cursor planes
  drm/i915/cursor: Schedule cursor unpin per joined pipe
  drm/i915/cursor: Allow joiner cursor fast path update

 drivers/gpu/drm/i915/display/intel_cursor.c | 282 +++++++++++++++-----
 1 file changed, 212 insertions(+), 70 deletions(-)

-- 
2.25.1

