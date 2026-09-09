Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F38C79F8C
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 06:28:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE86A10E07C;
	Wed,  9 Sep 2026 06:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JVIgRZ7C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09CA910E07C;
 Wed,  9 Sep 2026 06:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788935283; x=1820471283;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4vWUw5WwehYHqf4YUHiBRtU7zYrRYiATAuB5I+aY5+g=;
 b=JVIgRZ7CdtbKyc0hat6alJYombhXCzUIA7S4Al411W6K+R6s42ZXSLQp
 CPUSJ8fZ8P8rJDRG5OqCYYuWlubfTfjDAMPBUEhoieimpQ1xbGvLOi1dx
 QYrx+WRlHm4UUw1JcOdJHQAfvUGb0/h7exz9+DGhVmpLd+W90SULpLmWI
 Q2s/wgmMAtOmjr532WXHvwxfencKg9il8836pbGatjZ+Cm4D3sGL5cZSN
 2jhqxgmZBcYe0usrsVEJD39aewOjtbvvj+Bj4h6NWQi0lezrHIoHnfOod
 ZjMVH8JfyMJwD1GBLSZ9QRRjfNKwWRSPwaA1OT9Y8ml2t2BmovLOH28UD A==;
X-CSE-ConnectionGUID: ekxwMfi/TRWFnyuykCD3tw==
X-CSE-MsgGUID: 7i5QnwkNTUmCkdN0t5s0wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="88499428"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="88499428"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 23:28:03 -0700
X-CSE-ConnectionGUID: 2dQke1n7RQGdGChSu/umcg==
X-CSE-MsgGUID: C+p1AYESQUOK/wtX1n8NZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="275005618"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa004.jf.intel.com with ESMTP; 08 Sep 2026 23:28:02 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 0/2]  Fix stale selective fetch enable bit
Date: Wed,  9 Sep 2026 11:55:21 +0530
Message-Id: <20260909062523.3516962-1-nemesa.garg@intel.com>
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
 .../drm/i915/display/intel_display_types.h    |  6 +++++
 drivers/gpu/drm/i915/display/intel_psr.c      | 19 ++++++++++++++++
 .../drm/i915/display/skl_universal_plane.c    | 22 +++++++------------
 4 files changed, 42 insertions(+), 25 deletions(-)

-- 
2.25.1

