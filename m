Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893C2C678D4
	for <intel-xe@archiver.kernel.org>; Thu,  2 Mar 2023 14:23:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60EB410E05A;
	Thu,  2 Mar 2023 14:23:44 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E39D10E05A
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Mar 2023 14:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677767022; x=1709303022;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jVi1WLa5P5po/bQsuqUwdbMH8DDxgsbkue9z3uFepb8=;
 b=i3EngyaqEPMNsSKZA8wwLJCFPUiCH7HqkIcnUhOxR6Fl9ev2GJARIYHj
 cKNJtHOAS7KU4Pam94KUtmkBoqCz+1nwAJWKnAeVZwQoEr6k11PjlBeAl
 /YlnoH7f+9AoGO+y1fh4DVQbYG92Wp7uAzl4V1KMcbyh5eLOntleoZDP1
 J6sqMASzQn6nez/RhPGl2QlQAnKZuFMflqu0zYJS/H4Cv0qAeQdfpDtQa
 2dwfq7WZKCLq5DhjqW7oUOIItm2jVbSBlBcMyef4Gon0hd+W4oKsxGv0F
 i1A/9zx3t63qHypkBYY9WJs8no6ThnMYEIFzlOSzIFVsd1PZu1C07THPq Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="397301143"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="397301143"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 06:12:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="739086222"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="739086222"
Received: from martamon-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.129])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 06:12:48 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  2 Mar 2023 16:12:25 +0200
Message-Id: <20230302141230.2804699-4-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302141230.2804699-1-jani.nikula@intel.com>
References: <20230302141230.2804699-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/8] drm/xe: drop unnecessary include
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

The file does not exist in upstream i915 anymore.

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

