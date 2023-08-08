Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD799C001B0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 11:46:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94ECC10E3D8;
	Tue,  8 Aug 2023 11:46:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E07D10E3D8
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 11:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691495175; x=1723031175;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vptzzRdXXSnF9pPRmUJKSKQ3weFdQHxZlW9Z1rNYqHw=;
 b=D19xTwqdnQ/V0+gbis22W3VsVJa1ehonjIxowgy3j4RdktiNwIITTmfq
 wbUkJca1jmPiYJOYovrnfeR2TwgukCYmf8rWbKE/nKNKHX9ynzh8nxUsy
 6MlzeA0elWpgeGyPPnGRs6vR1NJRhY3Od1/rvmRmB1Xcw5zAMjA74w5W8
 qp/TWFVvO5sdNhEd+Xi9zCxYxTTsVEOmVD3ouMq8cw80HG5lt+njUdAXo
 qdOyVcctrw0EBzDzSD2mHGUy8BhHcaFbR6QcmqHMAJHQssWDbz1zfFgIS
 Q47xK5xG6ctuqk8uiys2RbbY6q2MMDfzQ69rqg+ODf+B7M3Jsfgfg7SU4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="401758772"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="401758772"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 04:46:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="905196720"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="905196720"
Received: from sschwar3-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.49.159])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 04:46:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  8 Aug 2023 14:45:34 +0300
Message-Id: <20230808114535.1600595-8-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230808114535.1600595-1-jani.nikula@intel.com>
References: <20230808114535.1600595-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 8/9] fixup! drm/xe/display: Implement display
 support
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
Cc: jani.nikula@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

There's a stray $(cflags-display) in the hdrtest command. Remove.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index a05bd3d3179f..a46da8a59b14 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -256,7 +256,7 @@ always-$(CONFIG_DRM_XE_WERROR) += \
 	$(patsubst %.h,%.hdrtest, $(shell cd $(srctree)/$(src) && find * -name '*.h' $(hdrtest_find_args)))
 
 quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
-      cmd_hdrtest = $(CC) -DHDRTEST $(filter-out $(CFLAGS_GCOV), $(c_flags)) $(cflags-display) -S -o /dev/null -x c /dev/null -include $<; touch $@
+      cmd_hdrtest = $(CC) -DHDRTEST $(filter-out $(CFLAGS_GCOV), $(c_flags)) -S -o /dev/null -x c /dev/null -include $<; touch $@
 
 $(obj)/%.hdrtest: $(src)/%.h FORCE
 	$(call if_changed_dep,hdrtest)
-- 
2.39.2

