Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2ABE7849A
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 09:24:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A01B10E26D;
	Mon,  2 Oct 2023 09:24:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2A810E272
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Oct 2023 09:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696238666; x=1727774666;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SkYYP/8/StHaTiOJYD2XxHIhU3j92Pp2TnbftaEddsM=;
 b=ily+vDa9QGRB2TO+TCjyeVD/FBFrv2fOHK5fnFzOczKFcIAJVzkbJWBp
 WrYj+OcEey9MBtF6o7nmY1zouzo8eO7j+r1tIJJAsap8HFaW5MkrGa3e8
 0K+hQ1grMbwthwy3pjCcl+4hU0C6rxsPiFQRwXrglQ+qz+yWsKKKBEA46
 a625FDyh+bIVvjaMVcrPtNWNjU3mnNp/7syi2u6zcW8cOgeQROLh3z/Da
 QYlh1qsfR70UE6AbOFbstyI+alrcot2n5nyGITHNx6a1RqLN8dS3e176N
 3lfCFxKFj53DDec/+uThKkAb9Q2OdkFnRewolHrkwBadvKDR1SNskCoEy Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="449099723"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="449099723"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 02:24:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="894086163"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="894086163"
Received: from svandens-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.151])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 02:22:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  2 Oct 2023 12:24:02 +0300
Message-Id: <20231002092402.1826859-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] Revert "drm/i915: define I915 during i915 driver
 build"
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
Cc: Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit 12b98dd1eb4f2ec852dce19a01a76bf43a39bbee.

We already have commit a4ba1ea69f6b ("drm/i915: define I915 during i915
driver build") in the baseline. It defines I915 at a slightly different
place from this, so there was no conflict. This can be dropped.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 911dfb92a8c1..dec78efa452a 100644
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

