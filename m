Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282C1C04FFF
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 17:58:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F2CE10F6FF;
	Fri, 12 Apr 2024 17:58:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m5aOoQD5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F41310F698
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 17:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712944715; x=1744480715;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WQq/WwYjktSU2f9yzobA6zlDhAbIpmbkG7IRaZi3lhs=;
 b=m5aOoQD5SplnH/jdqtOVO4z5PqiTWcswX0kzngywBazgMU3iWCwUhect
 sUv64A9K/MbVRcY8l79tGEErf1EJ9fIFV7oIQYPRWNyReSO4CBOzDnmRh
 fuh881ad3E1J8Blg/PYyAl/iL4upNoq97ItF/rF9QcqTM/RdNDyBA+uIH
 nzXjPkFQ0DcLah60j+wospeJQlpvFi8Bb5Nw/ThRattazJaKAwZ+KlWWM
 B4KG5t6D4+lj9HFFgR/dkt3PSsKRr77BgfpEcgzvDH+SrZ+Vrs5NurLfx
 CHhIdoc7Im3/dKDG7wlyqDsigrbxiWd+4Wt3sB/LVKCbx0wSjMSLj/ooJ g==;
X-CSE-ConnectionGUID: utzqlquDRliKwTIZ0oPrtQ==
X-CSE-MsgGUID: 0/2p8asFQemrZGh4NgcZNw==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8628135"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="8628135"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 10:58:35 -0700
X-CSE-ConnectionGUID: zAfYg+UgTMSyf6GqG5l9Og==
X-CSE-MsgGUID: gwbS5jHlRCGdH3NgLBqglA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="21369107"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa007.fm.intel.com with ESMTP; 12 Apr 2024 10:58:33 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 4/7] drm/xe: Return NULL in case of
 drmm_add_action_or_reset failure
Date: Fri, 12 Apr 2024 23:42:08 +0530
Message-Id: <20240412181211.1155732-5-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412181211.1155732-1-himal.prasad.ghimiray@intel.com>
References: <20240412181211.1155732-1-himal.prasad.ghimiray@intel.com>
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

In case of drmm_add_action_or_reset failure return NULL and no need
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

