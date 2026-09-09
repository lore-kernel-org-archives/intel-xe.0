Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D25EC79FAD
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 11:06:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDAA10E180;
	Wed,  9 Sep 2026 11:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MXLHXE1b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C501610E16B;
 Wed,  9 Sep 2026 11:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788951967; x=1820487967;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=k8EcJ8owXN+8bU1/aPgdSS/1mYSPvRri/Cm/zA2G0ZQ=;
 b=MXLHXE1br6oN+3piyEggeObc5swSX1PZRP1GXy7amN/fZsM3Cwsn6N+L
 Xsol3uOPP23KZpFA39uzxpSBJX46Q6GRlWLvF8BWqCq1JatvSnmi6qwnv
 CsEvB47rMrqsqjjdeBEZl5ajSgZQiWfzUROvC7QT8ZdqRVyNQ3KzuRiP6
 inofXsEKk/J/TT3P6YjFJOwnuKqmHRQ8TXJh3xQ9PNr3nYlac7ywEbofG
 x/FlnyuOdGlkuCh6s5bvvJOyDRZXSgwby2ViQgDBcPLXrHrZGp+Dt2ZTP
 2pZ6ayIMuylbsLjzsiqAd9ohr6WEjwzn+njF7vYP94YpM8sHYAoejYSBT Q==;
X-CSE-ConnectionGUID: Kegj3wqPQ3yG3KglZn4+pA==
X-CSE-MsgGUID: MOIBt/6NRh2Kvedes9LqwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="91888656"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="91888656"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 04:06:07 -0700
X-CSE-ConnectionGUID: DJtzJxjPS9mBTqQe5Q84ww==
X-CSE-MsgGUID: 9RqoDdGlSGKMJ9c0YL3Klw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="275425311"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa005.jf.intel.com with ESMTP; 09 Sep 2026 04:06:06 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 0/2]  Fix stale selective fetch enable bit
Date: Wed,  9 Sep 2026 16:33:30 +0530
Message-Id: <20260909110332.3528029-1-nemesa.garg@intel.com>
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

Selective fetch is dropped while pipe CRC is active, but the per-plane
SEL_FETCH_PLANE_CTL()/SEL_FETCH_CUR_CTL() enable bits stay set in
hardware. A plane disabled during that window never gets its bit cleared,
since the disable path is guarded by enable_psr2_sel_fetch. When selective
fetch returns, hardware keeps fetching for a plane that is gone and holds
its DDB range.

Commit 7f1172a2ac0d ("drm/i915/display: Clear SEL_FETCH_PLANE_CTL on
plane disable") fixed that by swapping the guard for
HAS_PSR2_SEL_FETCH(), but that caused unclaimed register access on
pipes driving HDMI.

Patch 1 reverts it. Patch 2 clears the bits at the point selective fetch
is turned off instead. Atomic check has both the old and the new crtc
state, so record the transition there and let the plane and cursor arm
paths write the registers to 0 for that commit.

Nemesa Garg (2):
  Revert "drm/i915/display: Clear SEL_FETCH_PLANE_CTL on plane disable"
  drm/i915/psr: Clear stale sel fetch enable bits on sel fetch disable

 drivers/gpu/drm/i915/display/intel_cursor.c   | 20 ++++++++---------
 .../drm/i915/display/intel_display_types.h    |  2 ++
 drivers/gpu/drm/i915/display/intel_psr.c      | 15 +++++++++++++
 .../drm/i915/display/skl_universal_plane.c    | 22 +++++++------------
 4 files changed, 34 insertions(+), 25 deletions(-)

-- 
2.25.1

