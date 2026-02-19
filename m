Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC91EC531E2
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 21:39:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681CF10E759;
	Thu, 19 Feb 2026 21:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h8ktcXdj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984AD10E759;
 Thu, 19 Feb 2026 21:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771537153; x=1803073153;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wK+Scgt8j3rIrrQZOnPqpfwtY7Bs7Ykzl2GsolcF4pE=;
 b=h8ktcXdjIlG6AF1vs7IBpAZYGtWhVKbw9iWdQYicVcDHCuU5EWNLcBsT
 seR65hkHAogxXtWutO3Zr6MZjS0LVZ/ox55ZV4kXURnbsHU/rY60hjpb5
 1t47fI7DEhpCIdHD3grktbJB4O2nhfVpavbtI3/LrpEDnxS6zXmPwmMr3
 YjSAggUueWXzuSKvn4Ng1UqiOSc7C39rSTBLcA9kSRIuEP6Ewo8q/CNQi
 Yz3aNTfjwW0vfTrlBGuzcIUOHd+NKNk6hzPVrxmGFIfx7IJqz8Fnf3Epf
 FhgyLFsbEUqdEkw7EY/Gn6/HD7dQ7Vo5rzBYxYwm0zjVBM/eCrAwvDwET Q==;
X-CSE-ConnectionGUID: cNlmCDBcTIepLhp21QvyqA==
X-CSE-MsgGUID: dTXnw7pcTaSuIwY9gjZzdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="90044683"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="90044683"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 13:39:13 -0800
X-CSE-ConnectionGUID: gtHPjQtoSJa3b1uR+5so7A==
X-CSE-MsgGUID: 61cknzkbQLKQNQi5iZHX6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="212526345"
Received: from vpanait-mobl.ger.corp.intel.com (HELO
 kkoning-desktop.intel.com) ([10.245.244.197])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 13:39:10 -0800
From: Koen Koning <koen.koning@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, Joel Fernandes <joelagnelf@nvidia.com>,
 Matthew Auld <matthew.auld@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Koen Koning <koen.koning@linux.intel.com>,
 Dave Airlie <airlied@redhat.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>, stable@vger.kernel.org
Subject: [PATCH v3 1/3] gpu/buddy: fix module_init() usage
Date: Thu, 19 Feb 2026 22:38:56 +0100
Message-ID: <20260219213858.370675-2-koen.koning@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260219213858.370675-1-koen.koning@linux.intel.com>
References: <20260216111902.110286-1-koen.koning@linux.intel.com>
 <20260219213858.370675-1-koen.koning@linux.intel.com>
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

Use subsys_initcall() instead of module_init() (which compiles to
device_initcall() for built-ins) for buddy, so its initialization code
always runs before any (built-in) drivers.
This happened to work correctly so far due to the order of linking in
the Makefiles, but this should not be relied upon.

An incorrect initialization order could lead to built-in drivers that
use the buddy allocator to run into NULL pointer dereferences due to
slab_blocks being uninitialized.

Fixes: 6387a3c4b0c4 ("drm: move the buddy allocator from i915 into common drm")
Fixes: ba110db8e1bc ("gpu: Move DRM buddy allocator one level up (part two)")
Cc: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Cc: stable@vger.kernel.org
Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Koen Koning <koen.koning@linux.intel.com>
---
 drivers/gpu/buddy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/buddy.c b/drivers/gpu/buddy.c
index 603c59a2013a..81f57fdf913b 100644
--- a/drivers/gpu/buddy.c
+++ b/drivers/gpu/buddy.c
@@ -1315,7 +1315,7 @@ static int __init gpu_buddy_module_init(void)
 	return 0;
 }

-module_init(gpu_buddy_module_init);
+subsys_initcall(gpu_buddy_module_init);
 module_exit(gpu_buddy_module_exit);

 MODULE_DESCRIPTION("GPU Buddy Allocator");
--
2.48.1

