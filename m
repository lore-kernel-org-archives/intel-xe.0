Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03CDC64EC4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 10:52:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC9910E07E;
	Fri,  3 Mar 2023 10:52:48 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DC510E07E
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 10:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677840767; x=1709376767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=khE/qkAca8xVBe459kVUHfgTAOgCaZbMQNWj+FdwDks=;
 b=l92wyXI/nVSkQEPQhgXy4muGmUj8CUnqol++6HZwbnD6WZ+q6x6sjj8z
 /wtg46XZB+q26Bj3vsnhlwNpfPH5hlyab+d723KfSVfqlN9grDjLYLCX/
 q+g/n1UMFNzVLnlSCswFaZeIGVH8Own0XqfNZ7Ehlkkw480JrmmIAm9LF
 KGXkinogBSL6E4vsPo/dD7cJ9LNp5GmEnLWQ4qoXstCgZSxPt3LAZPOzc
 4KCWx9hNtCFi8yHdoX//thcfxqNrj6YR0NK2fKl7tALk6TWPKKTSa4Cm0
 5R9fPoUSK8UJVZrqkS0bSiGUaNTV7RjyaIKPWilob3a90VivEUPPaEYTj Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="421288147"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="421288147"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 02:52:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="739467732"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="739467732"
Received: from msieb-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.184])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 02:52:39 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Mar 2023 12:52:17 +0200
Message-Id: <20230303105222.3550161-4-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303105222.3550161-1-jani.nikula@intel.com>
References: <20230303105222.3550161-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/8] drm/xe: drop unnecessary include
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Note: The intel_pm_types.h does not exist in upstream i915 anymore, and
this needs to be squashed away.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/display/intel_pm_types.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/intel_pm_types.h b/drivers/gpu/drm/xe/display/intel_pm_types.h
index 8bf1594a9d1b..0bd4b1cb9c83 100644
--- a/drivers/gpu/drm/xe/display/intel_pm_types.h
+++ b/drivers/gpu/drm/xe/display/intel_pm_types.h
@@ -8,8 +8,6 @@
 
 #include <linux/types.h>
 
-#include "display/intel_display.h"
-
 enum intel_ddb_partitioning {
 	INTEL_DDB_PART_1_2,
 	INTEL_DDB_PART_5_6, /* IVB+ */
-- 
2.39.1

