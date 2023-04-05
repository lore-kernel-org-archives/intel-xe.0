Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23032C7619A
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 15:39:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D9710E9FD;
	Wed,  5 Apr 2023 15:39:49 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB3C10E9FD
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 15:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680709187; x=1712245187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZT+cKt91BYuGnwHgmrH9K3X2oZmw/3j5tbfB/Cut1Q4=;
 b=kN1IJc141tivnet/2gLocKv8OFf1lyPdslOKWVCYtGYe2vtRSx/wUnsc
 0mo7LbuWgyTsHHP6e/e+P3PRTzm+Xw0nFVV95dYDDptfqOHjch29HrQX8
 Pn9Hoe69TO8DFFTGFH0mraTFMgfSESG18cSYm0mTY7ERVRoWGgvSKu4YF
 pMJlaqLcKBpzBO8U3N8htn21g7GUffAlPlSB5FvjsPcqbauEDmckVxG7r
 MAKw8Za8EZltpZ4ZVKQFxhboRBQyA1Q7axZIos6142CdFyVtJCgo25tp5
 5Xh5jZLR81QCTb1N5lQlSb+ChjITL5a3i8iFDWkcyXrIFgTcBmrwgyoiE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="322865017"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="322865017"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:39:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="680326910"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; d="scan'208";a="680326910"
Received: from dlemiech-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.43.158])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:39:31 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  5 Apr 2023 18:39:00 +0300
Message-Id: <20230405153920.926583-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405153920.926583-1-jani.nikula@intel.com>
References: <20230405153920.926583-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 01/21] fixup! drm/i915/display: Set
 DISPLAY_MMIO_BASE to 0 for xe
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
Cc: tvrtko.ursulin@linux.intel.com, Jani Nikula <jani.nikula@intel.com>,
 joonas.lahtinen@linux.intel.com, lucas.demarchi@intel.com, daniel@ffwll.ch,
 rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We'll want to add the -DI915 separately.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 09a8106c284b..057ef22fa9c6 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -12,7 +12,7 @@
 # Note the danger in using -Wall -Wextra is that when CI updates gcc we
 # will most likely get a sudden build breakage... Hopefully we will fix
 # new warnings before CI updates!
-subdir-ccflags-y := -Wall -Wextra -DI915
+subdir-ccflags-y := -Wall -Wextra
 subdir-ccflags-y += -Wno-format-security
 subdir-ccflags-y += -Wno-unused-parameter
 subdir-ccflags-y += -Wno-type-limits
-- 
2.39.2

