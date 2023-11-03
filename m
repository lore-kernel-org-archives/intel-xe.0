Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974B8C0018C
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 14:36:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DAF810EA0F;
	Fri,  3 Nov 2023 14:36:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746A810EA04
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 14:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699022159; x=1730558159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c5O3pp5Ofd8GxLYSlt6KuzytD+BOz/muNu47i4TiABE=;
 b=IJMjP1eR0j1vPMk9fZdL6aRaO3LixiBKUmQEhjMWEM0gihkqEhU32E0N
 iXPPVtpJN/ajjewtEBzESNh6+Hv4Egt6P63S5lerj8S5kdA08c9055dfq
 UOlS9bhj2NIbi75jiYvlKa00mJfY8Zk/GOicv+qMouQcndN6cg9nVaNVZ
 qmqdThoXN2/ta0ChywBGpxFdGhc8GjUT0zEwf7uL12fj/i1Rrf1uf+Z3m
 gsdE5y0Q4Q/Lvl/ff3Ve4xGmV06JZpzic4x7saYLiIOlEOHDhU07NHU5G
 XV36iFW8CXPtQVUDPs00tXGgeSfJn9cYj/wXQz8pdShL6SGzrBKILcwar Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387843479"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="387843479"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1008832519"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1008832519"
Received: from mtisan-mobl1.ger.corp.intel.com (HELO 8dd9ac0a63b4.intel.com)
 ([10.249.42.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 07:35:49 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:34:39 +0000
Message-Id: <20231103143456.7-34-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
References: <20231103143456.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 33/50] fixup! drm/xe/uapi: Split xe_sync types
 from flags
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

---
 include/uapi/drm/xe_drm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index eab8c8e3b6a3..5164ed150a2e 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -969,7 +969,7 @@ struct drm_xe_sync {
 
 	/**
 	 * @timeline_value: Input for the timeline sync object. Needs to be
-	 * different than 0 when used with %DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ.
+	 * different than 0 when used with %DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ.
 	 */
 	__u64 timeline_value;
 
-- 
2.34.1

