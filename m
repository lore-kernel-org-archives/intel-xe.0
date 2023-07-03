Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DB7EB64DC
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jul 2023 09:13:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30EE910E1E8;
	Mon,  3 Jul 2023 09:13:22 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D3BA10E0CB
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jul 2023 09:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688375600; x=1719911600;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FXtHKvQmtleEYQj0+mTtps63GOKoLLydaR5qo09Lt8M=;
 b=FUq4r8yLbhmyKX9/xsmjGxZtAH9WETztSMeefmlbl8g/gkN/Ij9akwF7
 mXeZ+Jg2b47d8yc/5UlnZDQIUMxMpzlsnZC5iiASVaSNLosBvUKTYQQ0c
 /q+A8Rs7ZcjZsnYQ+C4RhYxfTw394OQh5BOtrv86RjRhy9+ThNOwbOvmu
 C5uLxU803gXKIdKzjsew4+uBKqfd/idl9UpDiI4zR9NQz87MPssKt6idI
 fzUE0ZFKGs02iquNlQBMlnWRkqEkT1IN9xufOgojzZoFRVk0rooB0CYC6
 d6bH04VgkJtxYiMIRqD9dVf+DrYN7aRGptiM5924Xqu+FVoJ+LAYkiBMf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="361692023"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="361692023"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2023 02:13:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="892489233"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="892489233"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga005.jf.intel.com with ESMTP; 03 Jul 2023 02:13:17 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  3 Jul 2023 14:49:32 +0530
Message-Id: <20230703091933.3832500-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: make kobject type struct as constant
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

Since commit ee6d3dd4ed48 ("driver core: make kobj_type constant.")
the driver core allows the usage of const struct kobj_type.

Take advantage of this to constify the structure definition to prevent
modification at runtime.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
index 13570987a756..2c47059bef42 100644
--- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
@@ -17,7 +17,7 @@ static void xe_gt_sysfs_kobj_release(struct kobject *kobj)
 	kfree(kobj);
 }
 
-static struct kobj_type xe_gt_sysfs_kobj_type = {
+static const struct kobj_type xe_gt_sysfs_kobj_type = {
 	.release = xe_gt_sysfs_kobj_release,
 	.sysfs_ops = &kobj_sysfs_ops,
 };
-- 
2.25.1

