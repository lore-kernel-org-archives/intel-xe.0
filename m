Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6209E7E631
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 13:04:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8829D10E3E4;
	Tue, 26 Sep 2023 13:04:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2CBA10E3E1
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 13:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695733445; x=1727269445;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ghHimbOTF0ssEDf6PbUEApnsiEn20bvDRCwP8dYnNzo=;
 b=JwTtcoUBlU4pnpALdgggUh/7nx0HxVBwG+gLbGinIVGjV7gTwREmtsj/
 xrAHeo2HEmYKEPm2KDcWJTE/GVxTrncIPX5oR4UKIKPxnpfYiV007DmDo
 rJxtETMhFgnvI9q7cI9F6DJWwDWTUus7nLp0iV3Sk/1toaTyADWjRs1AC
 3urY1szdd8WcStoQuAXwW+NyBeESv0bPzL2GGU4qAlVEuX0xoNVFuI50e
 K/B1t32+fgxMRrYriN9CQ3MO7vEVZNMPeMK4v3UnxBACZvC5VZ6zbzq2H
 hyGER5Yrk5tG60mPyF07GfjbSKr5V/7mKXLApM17KGv5iw4VwZkABcKf5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="366617298"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="366617298"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 05:56:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="139700"
Received: from hblancoa-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.50.200])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 05:56:28 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 26 Sep 2023 12:55:33 +0000
Message-Id: <20230926125540.7-24-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230926125540.7-1-francois.dugast@intel.com>
References: <20230926125540.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 23/30] drm/xe: Extend drm_xe_vm_bind_op
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Mika Kuoppala <mika.kuoppala@linux.intel.com>

The bind api is extensible but for a single bind op, there
is not a mechanism to extend. Add extensions field to
struct drm_xe_vm_bind_op.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 include/uapi/drm/xe_drm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 026536a20253..2521ae703d30 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -657,6 +657,9 @@ struct drm_xe_vm_destroy {
 };
 
 struct drm_xe_vm_bind_op {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
 	/**
 	 * @obj: GEM object to operate on, MBZ for MAP_USERPTR, MBZ for UNMAP
 	 */
-- 
2.34.1

