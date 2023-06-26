Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 953A2EB64DC
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 08:25:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D06A10E0BB;
	Mon, 26 Jun 2023 08:25:30 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4015210E0BB
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 08:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687767927; x=1719303927;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fQSdf+X5/KwzYGFDB+pSR+JxiqWWBxbquRBMLdxMv5s=;
 b=c5LxvaAP6gi8P4LpIy6OsOnerP5/tZ+kTc3Tg4o0j7c/livnpzcy/oQK
 Vbsjv8akv/iXajnj3uSYRcA2lnvBOu6NBoyl3lVYwi/Jtm0yGC+u6TROs
 oNVbo0n94UxqIDu4r95+AxxzVWFICls4CjWQSiWBe8bukdnHWU4PnACeL
 eTmYnigPF+1FPhYQPYrYV3lbOwfdaorEUpPt2ecU55bXeTZ+9f6HCVcB7
 OGGMQakodk4t3y3tLLf4GOD9oiShdreZ9mwM8LzqXYaBffLGAGCDW5vSm
 vwqfEyZ6sxlguGngfo2FZHxlo1+3BqsM11CvOrw7ROVzHYHdlZE9CA8hY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="340800969"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="340800969"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 01:25:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="693405196"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="693405196"
Received: from cbrady5x-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.8.226])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 01:25:23 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 26 Jun 2023 09:25:08 +0100
Message-ID: <20230626082506.12638-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230626082506.12638-3-matthew.auld@intel.com>
References: <20230626082506.12638-3-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/2] drm/doc: include xe_drm.h
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
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Make sure the uapi gets picked up by the normal docs build.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 Documentation/gpu/driver-uapi.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/gpu/driver-uapi.rst b/Documentation/gpu/driver-uapi.rst
index 4411e6919a3d..79f255cf7b10 100644
--- a/Documentation/gpu/driver-uapi.rst
+++ b/Documentation/gpu/driver-uapi.rst
@@ -6,3 +6,8 @@ drm/i915 uAPI
 =============
 
 .. kernel-doc:: include/uapi/drm/i915_drm.h
+
+drm/xe uAPI
+===========
+
+.. kernel-doc:: include/uapi/drm/xe_drm.h
-- 
2.41.0

