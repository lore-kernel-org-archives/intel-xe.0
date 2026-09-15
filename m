Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316AAC88E75
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 11:14:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73AE10FB82;
	Tue, 15 Sep 2026 11:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EdozbyUK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9A410FB86
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 11:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789470884; x=1821006884;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1iKSSbF9FYzvabET8LzmRn3U+JxB0hqSZMcyhd8LCjw=;
 b=EdozbyUKZsPxTo+aCkxugRd2N3/J9R4dW5NNDXtZij3LGy/U2d0+qb7+
 7MHB/4MFk+I5ovF3jbfQGDwNTgdT2F3+ZP9iOqcXhrOH83CxSFtnNTaKR
 H3jBrqMpQAfk76L0xcWAWwKT0A8/5X2s23V3bxGMDxeyRGYLhfl7/TRIG
 kOI8PdMGlS8QdwPEzyNkpvr3Cxkz1Z/b/O263fncRZI9apee9s/b3oRya
 tEVAhxBzNzlrZ1b32ieWcB5ffDDquRWRfuZrWTB+QNiGpPorAVF0huEEi
 QommhpKgQqNLLrDQwxWNNapjrvITBOFbXh6+3yXGf/f0ZY5EfkY+1kjGF Q==;
X-CSE-ConnectionGUID: 5iVt2QYlSou1oNY8r+l7AQ==
X-CSE-MsgGUID: nJT23MuLRBCfFidf+5cxNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89856137"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89856137"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 04:14:44 -0700
X-CSE-ConnectionGUID: GBP7zsorRaiOhbiicOghfQ==
X-CSE-MsgGUID: VcLJ+rBEQUGeHxIK1jd0pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1204419"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa011.fm.intel.com with ESMTP; 15 Sep 2026 04:14:43 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, vinay.belgaumkar@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms
Date: Tue, 15 Sep 2026 16:43:12 +0530
Message-ID: <20260915111314.564847-1-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
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

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

This series adds Wa_14025941587 (minimum IDLEDLY floor) for Xe2, Xe3 and
Xe3p and hardens the shared adjust_idledly() helper it builds on.

Patch 1 fixes three pre-existing corner cases in adjust_idledly() that
can panic or misprogram RING_IDLEDLY.
(timestamp_base == 0 divide-by-zero, IDLE_WAIT_TIME == 0 underflow, and
u32 overflow in the tick<->ns conversions).

Patch 2 applies Wa_14025941587 on top of the hardened helper.

Patch1 v2:
Avoid redundant warn for unknown crystal clock.

Patch2 v8:
Round up (DIV_ROUND_UP_ULL) the Wa_14025941587 minimum conversion instead,
so the tick-quantized delay cannot round back below 5 us.

Tangudu Tilak Tirumalesh (2):
  drm/xe: harden adjust_idledly() against divide-by-zero and overflow
  drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms

 drivers/gpu/drm/xe/xe_guc_ads.c    |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c  | 73 +++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_wa_oob.rules |  2 +
 3 files changed, 65 insertions(+), 12 deletions(-)

-- 
2.46.0

