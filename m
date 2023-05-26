Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EA5C7EE2E
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 00:43:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5C210E10A;
	Fri, 26 May 2023 00:43:14 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E7710E083
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 00:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685061787; x=1716597787;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=hHpb8LaXd71hYIbgpGd/sdq5UTVj0Nx28ZF/7mclKN8=;
 b=dT+pMoGslkxyTlQt07Oxd606XiDCZeZy6SvhzeI45GgmohLUXy9PHvaZ
 Iq7RZ+2gPN8Sbd6Xz996ysZvDCeJVuScNsQMgIagA7of7PtoK8GbaoczA
 yxWwYj1ur27/UZatKzp4kEuCspxvDX2oWsA/so9bEnGXsOxsnGGd7hyfk
 XHF0DSmh/kq7OEKt58siHo7Y3DzbH38VQgDF4ndzE7ZBtrmYUiyOiSmkw
 HTRB3Lgv6uTr6b/A+em1tyxT0ci5KANvSEp4NHmDBIfZZZ5Tqfc0RjiL3
 6pLXOlSoHnDem7mINiRooW/h3fVhbZf/hCqEJw/4JlEirK4/E9p+oDJLl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="357323124"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="357323124"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 17:43:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="1035155120"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="1035155120"
Received: from xiaofang-mobl2.ccr.corp.intel.com (HELO
 gjsousa-mobl2.intel.com) ([10.255.36.192])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 17:43:06 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 25 May 2023 21:42:34 -0300
Message-Id: <20230526004235.745730-2-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526004235.745730-1-gustavo.sousa@intel.com>
References: <20230526004235.745730-1-gustavo.sousa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] fixup! drm/xe/debugfs: Dump register
 save-restore tables
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

Remove repeated header inclusion.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_sr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 0312823101ad..24d9c73ef279 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -9,7 +9,6 @@
 #include <linux/align.h>
 #include <linux/string_helpers.h>
 #include <linux/xarray.h>
-#include <linux/string_helpers.h>
 
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
-- 
2.40.1

