Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269DCC021A4
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 19:36:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1DA310E21F;
	Wed, 12 Feb 2025 19:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c1TW1wvh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786B810E978
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 19:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739388996; x=1770924996;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NF2UWCZf0DZE6jWSki0/ayjaBVbAxf83QEiTV25wjmc=;
 b=c1TW1wvh1baZWv/ufT0ReDGY0AchFsnd686pF8EcmCMOtE+ICdoSFuml
 7K+l+OwRpbrNXuUOd7ROXD9dIICih3HzLqEi5D6fdYxAkJ+abOeDBzUxe
 0dSbR0MmaaYcHVSNgtV1CNnYWmbbPxTt9QJ6tyI1/Ps0qmKJlYdhWUso7
 1We+ojoBQ5FQnzL4j4iHelzehJKiYOmqhfDLcD1Cg7AioZMC8ltQ0LvxP
 dArHFpksgF93cxjlkGvVltBvj4wGfBUA9gerYq572f3JIDu3dJKd5mS7J
 v4lxc6+8nqXZcBTqAWPe0UMg2fKswXknZ5s5i/u+ZP+qdfE9jTqI//f3u g==;
X-CSE-ConnectionGUID: 5BLlVionTgSYAne5WPLKMQ==
X-CSE-MsgGUID: ej5drMnrRR+IoySzFf5yhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40184253"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40184253"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 11:36:36 -0800
X-CSE-ConnectionGUID: t93x4GRZQAGpt6fHeY4CkQ==
X-CSE-MsgGUID: nDSVJXJDSc+MMMHquG6Cng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="113437889"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 11:36:36 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4 12/13] drm/xe/pmu: Fail probe if xe_pmu_register() fails
Date: Wed, 12 Feb 2025 11:35:59 -0800
Message-ID: <20250212193600.475089-13-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212193600.475089-1-lucas.demarchi@intel.com>
References: <20250212193600.475089-1-lucas.demarchi@intel.com>
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

Now that previous callers in xe_device_probe() are handling the errors,
that can be done for xe_pmu_register() as well.

Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 22c9de08b927c..7469bbcdc65f2 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -889,7 +889,9 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
-	xe_pmu_register(&xe->pmu);
+	err = xe_pmu_register(&xe->pmu);
+	if (err)
+		goto err_unregister_display;
 
 	xe_debugfs_register(xe);
 
-- 
2.48.1

