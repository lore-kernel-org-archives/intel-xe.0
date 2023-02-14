Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F77C64ED9
	for <intel-xe@archiver.kernel.org>; Tue, 14 Feb 2023 11:24:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2550810E88F;
	Tue, 14 Feb 2023 11:24:01 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3801710E88F
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Feb 2023 11:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676373837; x=1707909837;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ktTtEk0m/h4fC5kqFPt04tWKylVlxVxwXG8glejpU0A=;
 b=O1gGeh8H9kMQsjqhgIxNKwHQ/wWIG33ocx6HR3ZupRGenqUJYmJ5nyJg
 hm2c82IEOcDOVJx1aX4KAUyCecexwN28ngcf3nLAgF4WTx7irKsZbsR6N
 prcjVdl0c4tW2A73TW3kpf7K0Md9DWHdvT15yyRkARKMdlZUbvrF+ftJo
 KAP1M6iQ+8fym2TOTBxhi+eotkUwIrAHfFLF0bIur/rIXvKfdWifhr/F5
 GIJCgFPNz7MnZ09c7Mcg3D8vkSD9ic8ho9kt0YqLya9FVt0GXmINodL1V
 ywJWlIP/lPv2IEFxoZNYfaZYwwAsyZy+qNCxZ18ynieLDs8idWIcD7qRV Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="332450057"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="332450057"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 03:23:51 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="732863222"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="732863222"
Received: from achurkin-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.18.173])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 03:23:50 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 14 Feb 2023 11:21:26 +0000
Message-Id: <20230214112136.162380-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214112136.162380-1-matthew.auld@intel.com>
References: <20230214112136.162380-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 05/15] drm/xe/bo: explicitly reject zero sized BO
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

In the depths of ttm, when allocating the vma node this should result in
-ENOSPC it seems. However we should probably rather reject as part of
our own ioctl sanity checking, and then treat as programmer error in the
lower levels.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 9b7b9c8f84be..98716b56498f 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -962,6 +962,9 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	/* Only kernel objects should set GT */
 	XE_BUG_ON(gt && type != ttm_bo_type_kernel);
 
+	if (XE_WARN_ON(!size))
+		return ERR_PTR(-EINVAL);
+
 	if (!bo) {
 		bo = xe_bo_alloc();
 		if (IS_ERR(bo))
@@ -1516,6 +1519,9 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_ERR(xe, args->handle))
 		return -EINVAL;
 
+	if (XE_IOCTL_ERR(xe, !args->size))
+		return -EINVAL;
+
 	if (XE_IOCTL_ERR(xe, args->size > SIZE_MAX))
 		return -EINVAL;
 
-- 
2.39.1

