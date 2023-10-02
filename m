Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF69E784AF
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 10:24:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D095E10E278;
	Mon,  2 Oct 2023 10:24:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C105210E27A
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Oct 2023 10:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696242268; x=1727778268;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MMgjam6eBMOS9458XVbSfflzc2UXRuqiSA07rZ6FtYM=;
 b=IEo7rPRDZBZm8P1GCfdHlEc4CW2PVNnlJfbaTZiiOfhowKPpblfiykx5
 vuM7yPNkt7uYo84i2tLfRW72IaVWhFQjN8w++M9Y/ryH/peR4mmRgOAKF
 lDIhZvx47qyQ9hxMB58Fyv/9hFWLEoUOgybJS3LLJI0sg1AleF/iRKde3
 bqsaP1OD85Eg2PNtzgqEdKqO1NrWDfPPwSrCC8qdZzkDIIlN+I1GyHWg0
 ru/M9WJZYgzHFl/lPlm79Kwco3LjNvlBrsj3Vu4cPsfdw17K1m2WLy8R3
 V+gbeR9hdLhfE3jtcst7/RNBsW+tfAgnyd+4pntb/ij70NVZ0c1nKAMjT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="468894349"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="468894349"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 03:24:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="744075756"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="744075756"
Received: from apascali-mobl3.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.221.122])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 03:24:15 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  2 Oct 2023 13:23:56 +0300
Message-Id: <20231002102359.3740026-2-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231002102359.3740026-1-jouni.hogander@intel.com>
References: <20231002102359.3740026-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 1/4] drm/xe: Add empty def for
 i915_gem_object_flush_if_display
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We don't need i915_gem_object_flush_if_display on Xe side. Add empty
define to tackle compilation errors with display code where it's used.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 5090bdd1e462..e5e8173433c3 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -316,6 +316,8 @@ static inline unsigned int xe_sg_segment_size(struct device *dev)
 	return round_down(max / 2, PAGE_SIZE);
 }
 
+#define i915_gem_object_flush_if_display(obj)		((void)(obj))
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 /**
  * xe_bo_is_mem_type - Whether the bo currently resides in the given
-- 
2.34.1

