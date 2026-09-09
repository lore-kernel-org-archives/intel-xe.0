Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B21C79FB7
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 16:20:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEDDC10F223;
	Wed,  9 Sep 2026 16:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="by20QbJx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD9E10F223
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 16:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788970812; x=1820506812;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BpA5g4tK7D+E0THl2uWPv6J1ldQ8xx9ezgV2HBhAuRY=;
 b=by20QbJxX3xaLKtzdDzywfda3J8IxJs9y8EuXaI2uqph8WKMTXFgmOXq
 NhOy1ZylzKmi1rccoVk6EcD7kwMHz25WbDYMdkgALMxw46/Re8++PBbhh
 V3ue5IJMA6cLTD37WO3JmoenaXU8+27oKF0aaotyParP3rtwQ5njlsxue
 nFCgmFg+jH6JFKwiUjE6H3AiG2ekhQhKUXxI08wl77zcirgIqoSk7Wrty
 SAgWkVNYO7QQGwD2W9tCRgdEim1W8S63ceymFuViKNEhT3qvIEaDVhKGf
 gpDO4ci79LvjXFmxJj27YlafRZfxWfUVvWL71PkCWPcZFNQy6uacbq3DD A==;
X-CSE-ConnectionGUID: J5lZPJ4BQX6YyCp/n56+rg==
X-CSE-MsgGUID: oKeAf6T9Tla3W9+ICAbSAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="91920620"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="91920620"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:20:12 -0700
X-CSE-ConnectionGUID: DV0M//kjQAaI/0LhTWWeXw==
X-CSE-MsgGUID: 8Ytbb1aiTviVLCsh9fN3MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="273339990"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa004.fm.intel.com with ESMTP; 09 Sep 2026 09:20:10 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, vinay.belgaumkar@intel.com,
 tejas.upadhyay@intel.com, gustavo.sousa@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms
Date: Wed,  9 Sep 2026 21:48:42 +0530
Message-ID: <20260909161844.125147-1-tilak.tirumalesh.tangudu@intel.com>
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
Fix fourth issue by clamp with a floor (DIV_ROUND_DOWN_ULL) so the 
programmed delay stays strictly below maxcnt.

Patch2 v8:
Round up (DIV_ROUND_UP_ULL) the Wa_14025941587 minimum conversion instead,
so the tick-quantized delay cannot round back below 5 us.

Tangudu Tilak Tirumalesh (2):
  drm/xe: harden adjust_idledly() against divide-by-zero and overflow
  drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms

 drivers/gpu/drm/xe/xe_guc_ads.c    |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c  | 75 +++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_wa_oob.rules |  2 +
 3 files changed, 67 insertions(+), 12 deletions(-)

-- 
2.46.0

