Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BAFC77B7D
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 12:12:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA1110E48C;
	Wed, 10 May 2023 12:12:36 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D88C810E48A
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 12:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683720754; x=1715256754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2JEzNyVdMZc/hLo1OJswhWHDH8QN5G+hLYNtkQmOHPc=;
 b=OOf1o9woWf0PTWN60mo6Y91+68Js7EL8IfY9YbGo3rjAzInfZ2qIYtf2
 0G7pOCJnTd5Jc1HIUrUThsP/gOeCKIIa0z7feDZG/dNoCNyei7evljfvl
 KGi+V+dSudVsQ9wldHdGOdxvjfD2lxIiDfautylL+xIqphH+gVIVD0x2e
 55KNuTEiQcowXrIWWI69reKprYl+Vqcs3DX3fYfHVrBLji5T79l6lDLyi
 zwsmgONu3ZDR+DGR8IX3YHJ+HKS5UeRU3odQPLup9ENpMLhWMFcQC603k
 OLfuETmJWoU/uDvBw6mvYO/OrB5V2xmh7SW1w98OpYIS7ZckZmZfOPruZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="353268126"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="353268126"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:12:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="788906224"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="788906224"
Received: from iisaev-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.62.141])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:12:31 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 15:11:38 +0300
Message-Id: <20230510121152.736148-10-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230510121152.736148-1-jouni.hogander@intel.com>
References: <20230510121152.736148-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH v2 09/23] drm/xe: Add frontbuffer
 setter/getter for xe_bo
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
Cc: jani.nikula@intel.com, rodrigo.vivi@kernel.org,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 ville.syrjala@linux.intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Xe is not carrying frontbuffer pointer in xe_bo. Define it's getter as
NULL.  Setter simply returns pointer which was provided as a
parameter.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 7e111332c35a..27a264c8258f 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -296,6 +296,15 @@ void xe_bo_put_commit(struct llist_head *deferred);
 
 struct sg_table *xe_bo_get_sg(struct xe_bo *bo);
 
+#define i915_gem_object_get_frontbuffer(obj) NULL
+
+static inline struct intel_frontbuffer *
+i915_gem_object_set_frontbuffer(struct xe_bo *bo,
+				struct intel_frontbuffer *front)
+{
+	return front;
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 /**
  * xe_bo_is_mem_type - Whether the bo currently resides in the given
-- 
2.34.1

