Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0352AC0015E
	for <intel-xe@archiver.kernel.org>; Wed,  9 Aug 2023 19:05:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C469810E053;
	Wed,  9 Aug 2023 19:05:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF5DB10E053
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Aug 2023 19:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691607945; x=1723143945;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YcfC96uTgksM0vWe9YzZUle1SDl4MwAV2Ef76hTwhCU=;
 b=YCczNo9UyRyC99RoMHG4lZ566EtW9ib5MN+FZALbLSxQBkUHaPMXaQst
 P+mS1cjG9LRX5DLUOMiiSBvqb9c+bb9JrJmgXiawjX72UK4Psv0ABPlTd
 PbdCPPBi8QofxsqTFEIKWujzrpIQqWciVoYr6nfG2KZ8ief99PXetaDkc
 FhkM7cWogcHhLcPAuzM+w0mQV4GorXLK4v138AKJto5RiM5Q59ucw1z8a
 ZoO+9CyFFZqjGXe7Ub1EtFYjO1m5ONCw5cK3ThJtYTnxDDvtYaeHB5UfU
 aklHayQzHvVvEQZUd3kolCg/ILs9dJg/ir2/PsZnSs+Q1jqu+6m1NOedN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="402168890"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="402168890"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 12:05:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="708842301"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="708842301"
Received: from rbujor-mobl.ger.corp.intel.com (HELO localhost) ([10.252.49.48])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 12:05:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  9 Aug 2023 22:04:53 +0300
Message-Id: <20230809190453.1927134-9-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809190453.1927134-1-jani.nikula@intel.com>
References: <20230809190453.1927134-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 9/9] fixup! drm/i915/display: Remaining
 changes to make xe compile
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
Cc: jani.nikula@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Unnecessary change, drop it.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vbt_defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vbt_defs.h b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
index 001de8fe4e64..a9f44abfc9fc 100644
--- a/drivers/gpu/drm/i915/display/intel_vbt_defs.h
+++ b/drivers/gpu/drm/i915/display/intel_vbt_defs.h
@@ -30,7 +30,7 @@
  *
  * Please do NOT include anywhere else.
  */
-#if !defined(_INTEL_BIOS_PRIVATE) && !defined(HDRTEST)
+#ifndef _INTEL_BIOS_PRIVATE
 #error "intel_vbt_defs.h is private to intel_bios.c"
 #endif
 
-- 
2.39.2

