Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64AA9CD98C7
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 16:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23EAA10EFEE;
	Thu, 11 Jun 2026 16:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YY6hm3YK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0181E10EFEE
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 16:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781194671; x=1812730671;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iGc4GohhvhVczZkrU1i8OoIcKz6vhpsaJdJPYBAVNh8=;
 b=YY6hm3YKpYl0eFyunpSOIU+0PT9ivr9Sic+xL3FasYIuhwUTRk+gRm6Y
 X69HTIU+cbUC8GrGdIEmvhgpmAXEhau/wHmA07hAboCnIIum8qFpRYf4/
 rGwGT3c4+GiXkukEchTDgDa/Kq+/g+h5hE/3fJRUJ6IjmaOgAeDepXzs/
 5Pskx6eBXyqOXIZQsKC2Dkd0OSg7BeJMxYi4hk4eXId9cM58AlTDlvClc
 3Z8GJmxhr8F1as3paAdwWWs8F0ALLdCfGrdxHuDhQGTHwE2ciOjC2eBPx
 RZX4PDxGjrOPxycvKetLLpEOb9jcSM8WrCvk4c0uEuDd1HvUR9S7+6CgH A==;
X-CSE-ConnectionGUID: lvKgZXK7TPmAf52k0WL6wQ==
X-CSE-MsgGUID: +Zc4pOe6TqqTAX2Swm6b6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93402991"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="93402991"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 09:17:51 -0700
X-CSE-ConnectionGUID: f1JAbFfDSuScSOUvkGjtWQ==
X-CSE-MsgGUID: Mp8H3MvfTAGC1eTjItMBhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="251617043"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.170])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 09:17:50 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v6 04/10] drm/xe/hw_engine: don't open code is_usm_hwe()
Date: Thu, 11 Jun 2026 17:16:39 +0100
Message-ID: <20260611161634.506476-16-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611161634.506476-12-matthew.auld@intel.com>
References: <20260611161634.506476-12-matthew.auld@intel.com>
MIME-Version: 1.0
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

Prefer is_usm_hwe() here.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 98265293f2dc..12cf07a1f76d 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -1035,8 +1035,7 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
 	    hwe->logical_instance >= gt->ccs_mode)
 		return true;
 
-	return xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
-		hwe->instance == gt->usm.reserved_bcs_instance;
+	return xe_gt_is_usm_hwe(gt, hwe);
 }
 
 const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
-- 
2.54.0

