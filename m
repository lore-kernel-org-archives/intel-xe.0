Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B1FC624D5
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 10:39:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A28610E49C;
	Wed,  2 Sep 2026 10:39:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JYcCBtbf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD9910E395
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 10:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788345590; x=1819881590;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y/h3MyywNinmWedPRQp6sGsAKXUBwTgip1gIhGwB6pw=;
 b=JYcCBtbfpErmHnTw3YQr3G2/V3TEQZEGYd6Obhmpnk/6JpR8oRcV6sWc
 q1DY5fQ0/lFE4SOeb7QhUYQBu5xCqKXA/znxJd7QEJ8VH3nF6Ibnsjsmf
 Em7QbP58pu4qWq3Taes2dVzMOW8eA7BZHJfXRqMTGnCyOyOs5GSEEJGMP
 Tev7DSl2DbWTa39gXX2ZN82qmnIvuQ9Ucw9VZBCSFZSfK0NeqwZvd76gG
 T4BKaghuPMIFpMgTYEEuohhqWdkt92F3EEBxj5U5or5/xJjALIqr+6OJf
 JU8e2dJFxWX4DP5sbQKLHE7IIlNLYwRaP7c/xNhr7tf1GzL5UPlfeUgMA A==;
X-CSE-ConnectionGUID: +Ms0pPGTTwSwlGXVYSVRpA==
X-CSE-MsgGUID: RcAqlnBOSWyxxsDiF4RFAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88556978"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="88556978"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 03:39:43 -0700
X-CSE-ConnectionGUID: FPadVDtHQKa0Kg0P4KSOOA==
X-CSE-MsgGUID: Gs8Pd1L5SwGE/Wgl+OjHUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="265667570"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.174])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 03:39:41 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, stable@kernel.org
Subject: [PATCH v2 2/5] drm/xe/vram: report FLAT_CCS base misalignment
Date: Wed,  2 Sep 2026 11:39:34 +0100
Message-ID: <20260902103931.826063-9-matthew.auld@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902103931.826063-7-matthew.auld@intel.com>
References: <20260902103931.826063-7-matthew.auld@intel.com>
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

So we can easily check if a machine had the CCS bug, when looking back
over bug reports where we have the same machine with newer kernel.

Example print for a machine with the CCS bug:

  FLAT_CCS base:27bbff800, aligned:no

v2 (Matt B):
  - Unconditionally print the base + alignment

Fixes: 37173392741c ("drm/xe/vram: fix ccs offset calculation")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: stable@kernel.org
---
 drivers/gpu/drm/xe/xe_vram.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 7b4478fb1697..56cff1e44530 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -90,6 +90,9 @@ static int get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size, u64 *poffset)
 		offset |= offset_lo << 6; /* HW view bits 31:6 */
 		offset *= num_enabled; /* convert to SW view */
 
+		drm_info(&xe->drm, "FLAT_CCS base:%llx, aligned:%s\n", offset,
+			 str_yes_no(IS_ALIGNED(offset, SZ_128K)));
+
 		/*
 		 * Everything below this offset is handed to the VRAM
 		 * allocator, so it has to be the *first* address the
-- 
2.55.0

