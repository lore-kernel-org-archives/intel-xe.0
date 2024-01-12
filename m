Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C837C4706C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 09:28:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047AB10EAB8;
	Fri, 12 Jan 2024 09:28:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 661F510EAB8
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 09:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705051722; x=1736587722;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UcfAIN6JotHUtWidjTnep3DlfX4a915G78Tgwqf7EPw=;
 b=b6bC2uli2I6VPeQm62aChnTxYbQj5UnlMQpjVV5ZofKsU6Xf+1cG7fEc
 5izOVBVnTn5jgn65KEeVQhuaknkRxxQiRE9Ku1pAcXrHlSB1/U5hRWvdP
 /XLipKicLmekwaC5eMtgCD9izWDSc60YBPSfost7KfaNq4JYr2vChNoZC
 x7+llPKLUbnurcvSsZfVbOT2o76qGOXWAAkIXoje0QqKVup9DShedUywk
 Ucu5IgZnOkfRRruxaIq4H1Ps+ByWPLWhDbbXgeCoIm+9k9RBsWnSIAmwg
 DCDO7SfjKZ9WQkYl0cRKycr2rL9/T4LiJYy2ktC+NQTr4dtdhnnHQcEI2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="12611701"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; d="scan'208";a="12611701"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 01:28:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="782972304"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; d="scan'208";a="782972304"
Received: from unknown (HELO vgovind2-mobl3.tm.intel.com) ([10.237.50.31])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 01:28:40 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v1 1/1] drm/xe: Modify the cfb size to be page size aligned
 for FBC
Date: Fri, 12 Jan 2024 11:28:03 +0200
Message-Id: <20240112092803.61664-2-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112092803.61664-1-vinod.govindapillai@intel.com>
References: <20240112092803.61664-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jouni.hogander@intel.com, ville.syrjala@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

drm_gem_private_object_init expect the object size be page size
aligned. The xe_bo create functions do not update the size for
any alignment requirements. So align cfb size to be page size
aligned in xe stolen memory handling.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
index 888e7a87a925..bd233007c1b7 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
@@ -19,6 +19,9 @@ static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
 	int err;
 	u32 flags = XE_BO_CREATE_PINNED_BIT | XE_BO_CREATE_STOLEN_BIT;
 
+	if (align)
+		size = ALIGN(size, align);
+
 	bo = xe_bo_create_locked_range(xe, xe_device_get_root_tile(xe),
 				       NULL, size, start, end,
 				       ttm_bo_type_kernel, flags);
-- 
2.34.1

