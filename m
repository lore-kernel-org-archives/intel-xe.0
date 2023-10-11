Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25900CD6E6E
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 13:59:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E693110E4FE;
	Wed, 11 Oct 2023 13:59:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30DB210E4FB
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 13:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697032777; x=1728568777;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DMQPi0U/VHp0lUQIWmnEvmJ4/65Lfdl1gH5wWQRjv7A=;
 b=REq+HK+EmgA6lL+AgSVWM5zialNp3IKd1HqLYeSR0CY1aKpDKgU7IL6j
 z2wfyLOwnRD10Klp4zM06P08pStwVXjVGM8ppWsQp35APfutLKVXXNSCV
 J92G9mXhXh2PTAyD2Y5BryX1xm6ZMZGonoR18xSvqfJs0vDPweI8CGVPk
 4oE191ZoXpzovVsmFlMzdy8lLxaOpWNSL7q98/JVPpaAmjW9iiysDmhx9
 r6Wwpwuy2tU00S5j6DNpkX9tdWXcik/uR8dTAZU0CuIJJpaE+4o+g9emB
 7ojn7ehAFtPJlt4cDCLE3a0O7SWGE8dF3P6kVDM40KfGrRVyF1KlRn/k1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="451156183"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="451156183"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 06:59:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="753828995"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="753828995"
Received: from stahadie-mobl4.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.249.36.91])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 06:59:36 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 13:59:10 +0000
Message-Id: <20231011135926.7-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011135926.7-1-francois.dugast@intel.com>
References: <20231011135926.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC v1 01/17] fixup! drm/xe: Correlate engine and cpu
 timestamps with better accuracy
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove checkpatch warning:

    -:126: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
    #126: FILE: drivers/gpu/drm/xe/xe_query.c:108:
    +query_engine_cycles(struct xe_device *xe,
    +               struct drm_xe_device_query *query)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 77499ad5ba56..10b9878ec95a 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -105,7 +105,7 @@ __read_timestamps(struct xe_gt *gt,
 
 static int
 query_engine_cycles(struct xe_device *xe,
-		struct drm_xe_device_query *query)
+		    struct drm_xe_device_query *query)
 {
 	struct drm_xe_query_engine_cycles __user *query_ptr;
 	struct drm_xe_engine_class_instance *eci;
-- 
2.34.1

