Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D226C05023
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 07:49:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29C210EE8A;
	Fri, 12 Apr 2024 07:49:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QZl487Cu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B731E10EE8A
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 07:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712908147; x=1744444147;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wYm/q0guHiEkZHBXjtcnhUwxVBrtvVr4AYvU4bAF6hE=;
 b=QZl487Cu/yyjeEOXJlSgVnSW6NEav3akiy2UzuFtYzIEVDA0CsnV328i
 TGG3iPH9RVLFG/oc94RT2TALkiCBdjtzwPJ4MPZWw8alwTa0KQbkDC93X
 9l1EEL3jUVMwIe1TMvMceS1pbu7pSwY75h0aIhmRRRjQMQIOU8zDmZISt
 8pqBt39JnLTeBPGXbiVvNtK6uSoHTD4sxyhWWLLwWbXFh7ouGruJ4WSzQ
 8gFx2g9WkOT0s335LbCEu0J/xe8CdM7xgBVBxLh6LLiOGl3JZ8YnrcLwo
 mHxT5Qxi3SKxZr0b3/++KOW54eZ6QeDnrsX5GSqS6zir6dqQ+ceZPPKvn Q==;
X-CSE-ConnectionGUID: YeOglWsdQvS0CgQeAv5+GA==
X-CSE-MsgGUID: 87uLCHxRRoKDT/jzkHeo3A==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="11317211"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="11317211"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 00:49:07 -0700
X-CSE-ConnectionGUID: Dy9TtsyYRz+2uCezeVpH+w==
X-CSE-MsgGUID: 1yZ4qNPmQGSlwQilUGyALA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="21220730"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa009.fm.intel.com with ESMTP; 12 Apr 2024 00:49:06 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 4/7] drm/xe: Return NULL incase of drmm_add_action_or_reset
 failure
Date: Fri, 12 Apr 2024 13:32:42 +0530
Message-Id: <20240412080245.1044902-5-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412080245.1044902-1-himal.prasad.ghimiray@intel.com>
References: <20240412080245.1044902-1-himal.prasad.ghimiray@intel.com>
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

Incase of drmm_add_action_or_reset failure return NULL and no need
to print warning messages as they will be printed implictly.

Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 22 +++++--------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
index c5084d94c442..daab970f8be8 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
@@ -520,9 +520,8 @@ kobj_xe_hw_engine_class(struct xe_device *xe, struct kobject *parent, const char
 	err = drmm_add_action_or_reset(&xe->drm, kobj_xe_hw_engine_class_fini,
 				       &keclass->base);
 	if (err)
-		drm_warn(&xe->drm,
-			 "%s: drmm_add_action_or_reset failed, err: %d\n",
-			 __func__, err);
+		return NULL;
+
 	return keclass;
 }
 
@@ -553,13 +552,8 @@ static int xe_add_hw_engine_class_defaults(struct xe_device *xe,
 	if (err)
 		goto err_object;
 
-	err = drmm_add_action_or_reset(&xe->drm, hw_engine_class_defaults_fini,
-				       kobj);
-	if (err)
-		drm_warn(&xe->drm,
-			 "%s: drmm_add_action_or_reset failed, err: %d\n",
-			 __func__, err);
-	return err;
+	return drmm_add_action_or_reset(&xe->drm, hw_engine_class_defaults_fini, kobj);
+
 err_object:
 	kobject_put(kobj);
 	return err;
@@ -708,14 +702,8 @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
 			goto err_object;
 	}
 
-	err = drmm_add_action_or_reset(&xe->drm, hw_engine_class_sysfs_fini,
-				       kobj);
-	if (err)
-		drm_warn(&xe->drm,
-			 "%s: drmm_add_action_or_reset failed, err: %d\n",
-			 __func__, err);
+	return drmm_add_action_or_reset(&xe->drm, hw_engine_class_sysfs_fini, kobj);
 
-	return err;
 err_object:
 	kobject_put(kobj);
 	return err;
-- 
2.25.1

