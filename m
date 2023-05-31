Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88973C7EE23
	for <intel-xe@archiver.kernel.org>; Wed, 31 May 2023 15:24:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D9C10E4EE;
	Wed, 31 May 2023 15:24:03 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C14B10E4EE
 for <intel-xe@lists.freedesktop.org>; Wed, 31 May 2023 15:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685546641; x=1717082641;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+5bmW6HbUusAmN8Bw23lwM3SHDO13FjorilmdBap/Hs=;
 b=Mtuwo2Bp5nCGbjYVh/cccjStORmsohrJYBVhS+rnKsiPYR0HDL63Sxs2
 BbLVbquyB15g5ZVYop5LPDaOX8QrxOK6BsUBP2GDJqMk3VrFr/Qh7kSd9
 Rf8nfevCxevkfo6tBAF+dc3EHTh21qIRrt1yEIMqcUDWzwZRFcmnLZHPM
 6RwpvP9pu1GrnGblu2sXL6fkvhfdYeV4kjlS/Opy5DLy9FvXq3jscwDp4
 uYxvyjukZw49QmWbHR1sXAje/NheNwbpV+vE+gBwkjvoF/VrBzMz18bnH
 BMDYK6Dh02gq8StPugR4I8jdLqrCJJEj9CiV9hrnUrqU4pMN0ExJVHCjq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="339865501"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="339865501"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 08:24:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="796747900"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="796747900"
Received: from amokrov-mobl1.ccr.corp.intel.com (HELO 9d3bf2d3f760.intel.com)
 ([10.251.208.253])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 08:24:00 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 31 May 2023 15:23:34 +0000
Message-Id: <20230531152338.6-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230531152338.6-1-francois.dugast@intel.com>
References: <20230531152338.6-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/5] drm/xe: Use SPDX-License-Identifier
 instead of license text
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

Replace the license text with its SPDX-License-Identifier for
quick identification of the license and consistency with the
rest of the driver.

Reported-by: Oded Gabbay <ogabbay@kernel.org>
Link: https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/uapi/drm/xe_drm.h | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index b0b80aae3ee8..ac3cfc1fb4a5 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1,26 +1,6 @@
+/* SPDX-License-Identifier: MIT */
 /*
- * Copyright 2021 Intel Corporation. All Rights Reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the
- * "Software"), to deal in the Software without restriction, including
- * without limitation the rights to use, copy, modify, merge, publish,
- * distribute, sub license, and/or sell copies of the Software, and to
- * permit persons to whom the Software is furnished to do so, subject to
- * the following conditions:
- *
- * The above copyright notice and this permission notice (including the
- * next paragraph) shall be included in all copies or substantial portions
- * of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
- * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
- * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT.
- * IN NO EVENT SHALL TUNGSTEN GRAPHICS AND/OR ITS SUPPLIERS BE LIABLE FOR
- * ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
- * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
- * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
- *
+ * Copyright © 2023 Intel Corporation
  */
 
 #ifndef _UAPI_XE_DRM_H_
-- 
2.34.1

