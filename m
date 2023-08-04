Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E94C001DE
	for <intel-xe@archiver.kernel.org>; Fri,  4 Aug 2023 21:33:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7AE610E71C;
	Fri,  4 Aug 2023 21:33:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A5310E119
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Aug 2023 21:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691184779; x=1722720779;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=LySHJIP8nIg13Tjvd9vApzMptDNyDTErcOD/6sPKus0=;
 b=HzUYI6xdcHISZsU3Un6eSIoUlO1hRfzFBWr0eitg/cQhV0ePUivqCbHc
 JzS050ZPXr3QmwPQVZplOdASvRzkTzOTbehGescR56bGSXlZlwa+EQJI0
 ETceYNiCGuK09H8p8tEns7guDMFGyu3YOzb5AHLbhGqfXK4J4EdE2q/ki
 2DUbGxYBU9irJ4zeJOtwHzMJA6yXL4rIXN01HGa3hoZdz3Gx2kaNMXy/E
 6K4WZ2ZpRGmvsTz+A6QWOg495xcPLYVRu7sSh1vtqrVd2VJb4EgYC0cP7
 4AvCeOb3BQurUXUdqpbutWvk0tPAIdSjZcCoFjatm1zxID5dnQnJ8/v/I w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="370241003"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="370241003"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 14:32:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="820295554"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="820295554"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 14:32:54 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: jose.souza@intel.com,
 Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Date: Fri,  4 Aug 2023 14:32:52 -0700
Message-Id: <20230804213253.2381705-3-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230804213253.2381705-1-umesh.nerlige.ramappa@intel.com>
References: <20230804213253.2381705-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/xe: Set the correct type for
 xe_to_user_engine_class
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

User engine class is of type u16. Set the same type for the array used to
map xe engines to user engines.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 297e93a0eb8c..99a4800c7c53 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -19,7 +19,7 @@
 #include "xe_macros.h"
 #include "xe_ttm_vram_mgr.h"
 
-static const enum xe_engine_class xe_to_user_engine_class[] = {
+static const u16 xe_to_user_engine_class[] = {
 	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
 	[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
 	[XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
-- 
2.38.1

