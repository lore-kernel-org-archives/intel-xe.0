Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90366C4828F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Feb 2024 07:45:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A099E10E310;
	Thu,  8 Feb 2024 07:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fsLMUKHo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4DFE10E1DB;
 Thu,  8 Feb 2024 07:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707378317; x=1738914317;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=roVpI7QEG+N3Gp757y+PaAvh5MTMMTwStLishWClXg8=;
 b=fsLMUKHobw0l02PjV4u+HlFomM4aJnF9Qb98q1OBYNCBMuK5fgqiLBm+
 IAWZ+P/aUDcqcrK3VvGavabIouIF3l0cA8g21VbR85rCsJp7XFhC0lqWj
 on/cId/lffGdS2kI8/SfgHucb8zibQqsrK/8JEZNbs/tkVFcXelgz71eB
 /6Gyn2VqMTOAlNuHHQHWmBCUAHF7tQB73AncUERqLY0rIpt22ghkwXHUJ
 IUDuVzfUg/LmdKEg6kNbd+o5AskjRqfoxk3+QmWydy6+m488rCanfGdG0
 LYsxHai+7Y1wC8nuJlo+onvOQYtQBKhWHiwmwA1jPfY9zzKJ3WqIIx/R3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="12242634"
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; d="scan'208";a="12242634"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 23:45:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="6195645"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 23:45:16 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 0/3] Fixed-type GENMASK/BIT
Date: Wed,  7 Feb 2024 23:45:18 -0800
Message-ID: <20240208074521.577076-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

ove the implementation of REG_GENMASK/REG_BIT to a more appropriate
place to be shared by i915, xe and possibly other parts of the kernel.

For now this re-defines the old macros. In future we may start using the
new macros directly, but that's a more intrusive search-and-replace.

Changes from v2:

	- Document both in commit message and code about the strict type
	  checking and give examples how it´d break with invalid params.

v1: https://lore.kernel.org/intel-xe/20230509051403.2748545-1-lucas.demarchi@intel.com/
v2: https://lore.kernel.org/intel-xe/20240124050205.3646390-1-lucas.demarchi@intel.com

Lucas De Marchi (2):
  bits: Introduce fixed-type BIT
  drm/i915: Convert REG_GENMASK* to fixed-width GENMASK_*

Yury Norov (1):
  bits: introduce fixed-type genmasks

 drivers/gpu/drm/i915/i915_reg_defs.h | 108 +++------------------------
 include/linux/bitops.h               |   1 -
 include/linux/bits.h                 |  51 ++++++++++---
 3 files changed, 51 insertions(+), 109 deletions(-)

-- 
2.43.0

