Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C9C5C0218F
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 22:39:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1696710E226;
	Fri, 31 Jan 2025 22:39:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hfk88PGx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DDA10E226
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 22:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738363159; x=1769899159;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Nk/P324zBYU6+r32xP5HcS7P9i3cv189sKtOZ1axoVc=;
 b=hfk88PGx4/KJpLSHW63xp6wdEXUQJfwysOAfsKUfZR+sQ5zfn61nI2bK
 53AAEIbRjD52KVtbwEQjN+79oKdG4Kw7Iwy1udcHjuK8sH5Hfs2NCzdJJ
 LUcNX2qhRvJZlVFBfihuuILJiMGTpPhWDzXR5cLwLvycfuM/4EVyAbjkB
 /Gf50+HuTSIBwu9mR7eb0KAITS3R4wTnGN0xyp5SCUm738/DzwZIJmDkI
 wmrS1BJP8s70NYfINxnr/vViQvDBDmQJ8pporRxMO1oYm7nfYIhv8Dybj
 l/FPzATiDpt25ycdrSwH1ZuO68N6/z+8qdvdaxB6Ed0k/ENiZJqxgcjxM A==;
X-CSE-ConnectionGUID: /IEeqh5eR1WzB8KmjqrmRA==
X-CSE-MsgGUID: NzbX4nebT66nt5T1Skf5ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39045142"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="39045142"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 14:39:19 -0800
X-CSE-ConnectionGUID: gJRybrd4R+ySJO+da6h4GQ==
X-CSE-MsgGUID: NS/n7Az3RD6qk6ZlAhT0HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114896740"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 14:39:19 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH] drm/xe: Remove xe_dummy_exit()
Date: Fri, 31 Jan 2025 14:39:08 -0800
Message-ID: <20250131223908.4147195-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
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

Since commit 014125c64d09 ("drm/xe: Support 'nomodeset' kernel
command-line option") the dummy exit is not needed anymore since the
caller check for a NULL pointer. Drop it.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_module.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 0f2c20e9204a2..26ec9aa02648b 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -80,10 +80,6 @@ struct init_funcs {
 	void (*exit)(void);
 };
 
-static void xe_dummy_exit(void)
-{
-}
-
 static const struct init_funcs init_funcs[] = {
 	{
 		.init = xe_check_nomodeset,
@@ -106,7 +102,6 @@ static const struct init_funcs init_funcs[] = {
 	},
 	{
 		.init = xe_pm_module_init,
-		.exit = xe_dummy_exit,
 	},
 };
 
-- 
2.48.0

