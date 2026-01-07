Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D75ECFD65A
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 15:54:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C583B10E626;
	Wed,  7 Jan 2026 15:54:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="glOqi2Xh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93AE10E602
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jan 2026 15:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767801274; x=1799337274;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=95vn86Z0oCs7GV/BuVg4D2/nIs1g+nCsQwJpDGjqYIY=;
 b=glOqi2XhQBxOwuI4IBN/OiAlcQBt1hsm6uDkWrr0+ZmX7MVm/DZCS+XT
 d0q0NVhPsmNmhP/FBKKDrxtG6TfkscNhhSamnXd/Ljh5ExMOlif4RYjkP
 bk7PRxcer0CoiLw24OdgpZIxV2PRNVWxFKxjvxH4Hde3tgySNk6wvR4ng
 JPToB2muH1WcPi2Tq7vw3Sc9bjHD0GOoEbN+aoCy+jPU+JzSj5fQ9L3F1
 RvtOrP+oNLTAU4JDb8m7f2oivJ/bWjw5H3YKM0fjFYKEI7O3aDNf70SHj
 iuGA6PeWyCVHjxFxSYlSvBO1J05hzpolSdZFoYQMU1FnSJzvhwxbVTPdn Q==;
X-CSE-ConnectionGUID: UuJ2UniYRBiFk7fGPhGyAg==
X-CSE-MsgGUID: yLmCkPJ+SCGeVsQcTn/I2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="56734595"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="56734595"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 07:54:33 -0800
X-CSE-ConnectionGUID: tQSQFJRDSG+dtJGmRBY13w==
X-CSE-MsgGUID: Z+6G39CgREq1EmVA0b9iRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="207109444"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.60])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 07:54:32 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 5/5] drm/xe: improve header check
Date: Wed,  7 Jan 2026 17:54:01 +0200
Message-ID: <20260107155401.2379127-5-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260107155401.2379127-1-jani.nikula@intel.com>
References: <20260107155401.2379127-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Improve header check: Remove unused -DHDRTEST. Include the header twice
to check for include guards. Run kernel-doc on the header.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 2b20c79d7ec9..b39cbb756232 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -370,7 +370,8 @@ always-$(CONFIG_DRM_XE_WERROR) += \
 	$(patsubst %.h,%.hdrtest, $(shell cd $(src) && find * -name '*.h' $(hdrtest_find_args)))
 
 quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
-      cmd_hdrtest = $(CC) -DHDRTEST $(filter-out $(CFLAGS_GCOV), $(c_flags)) -S -o /dev/null -x c /dev/null -include $<; touch $@
+      cmd_hdrtest = $(CC) $(filter-out $(CFLAGS_GCOV), $(c_flags)) -S -o /dev/null -x c /dev/null -include $< -include $<; \
+		$(srctree)/scripts/kernel-doc -none -Werror $<; touch $@
 
 $(obj)/%.hdrtest: $(src)/%.h FORCE
 	$(call if_changed_dep,hdrtest)
-- 
2.47.3

