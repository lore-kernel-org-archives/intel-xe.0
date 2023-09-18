Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751F0C46CA1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 17:25:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE1010E29C;
	Mon, 18 Sep 2023 17:25:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BCA710E29C
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 17:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695057900; x=1726593900;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=94ogidTpJ89mKhYMflsdeY7trUpNmV6LsqOEkXV+kEQ=;
 b=ifF01v5HNxfpMOqEsYaPpLmJxmlVx4IbmYPJX4GPr/32gWawuE52q+6E
 D4InsQu7291qpRDI55A6+7g5TeR1e1NB5Ayhfk6dbm6ZxC5RUU2MHyktE
 cBNi7Th91Tka/8b1lrp9+1Fxpv9Fgw8tB5pwYC1aQIWjaYDaKdENLtwvt
 PuWxtmcwiZbZ1mrh7kc6qizIrgM3ClZen3ji9rSczhLRWL6huV6XD/wvt
 v9FmfanouC79LYbWywF3y/Zru0eLqo7cDyimKYikmg7093/9/9lb7Hd1L
 gI0d+mAsXaT6C1dG3chmPn/anfMeSKOb1X1jWmT5whrI87j/m2bfUEN3y Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="466071421"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="466071421"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 10:24:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="695592744"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="695592744"
Received: from deeptiag-mobl1.amr.corp.intel.com (HELO
 gjsousa-mobl2.intel.com) ([10.212.40.235])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 10:24:57 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 18 Sep 2023 14:24:46 -0300
Message-ID: <20230918172446.36835-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/uapi: Demote PMU kernel-doc to simple
 comment
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

The current documentation in include/uapi/drm/xe_drm.h is giving the
following error:

  $ ./scripts/kernel-doc -Werror -none include/uapi/drm/xe_drm.h
  include/uapi/drm/xe_drm.h:1057: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
   * XE PMU event config IDs
  1 warnings as Errors

Turn the offending kernel-doc into a simple comment for now to unblock
CI runs. We can turn it back to a kernel-doc later once a proper fix is
in place.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 include/uapi/drm/xe_drm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 63863eda8355..538fdbf1e81b 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1053,7 +1053,7 @@ struct drm_xe_vm_madvise {
 	__u64 reserved[2];
 };
 
-/**
+/*
  * XE PMU event config IDs
  *
  * Check 'man perf_event_open' to use these ID's in 'struct perf_event_attr'
-- 
2.42.0

