Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E07CE7BD95
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 11:20:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A0D10E22F;
	Mon, 16 Feb 2026 11:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cnedxLlL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9037610E01F;
 Mon, 16 Feb 2026 11:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771240824; x=1802776824;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gdd/LccZpTfF0adixAHRJSX02OqE/Er4bRIEhHZ3SSk=;
 b=cnedxLlLwFf1jjMsRkRgH/VjJ8DKvAK9IE8DHrSnuSZqi+9nK1Qshqf+
 ENptxxpJPjLMq8emrLKgwy6BA1ksTYNrGK3E85llF+Sx0gU72E+yAKGyO
 7conSqcUbYiVjiBZzg6SvMCDEe4o3R2/m2aNadPR7n7wnMOhRTcmMnTCY
 2j3XnIwT7LggvihlgfryUwUVKcBTERNkk+AC5qhMw9QncTSDzmd9lh101
 yVxIG2bRRm//Agv5tm6rsJUsUsxHABmY8mPcXvlB/Rm+EUJg6HzGiCNUN
 G6fr+Cd0f5XavimA9L6+FrW/hqQDoYyvjLUWKVZJwTm5OrIMb0r4bKTSo A==;
X-CSE-ConnectionGUID: ktR6SJo4Qd69Y9k3ToNVjA==
X-CSE-MsgGUID: 6iN2gzL9RJ6QvOwWpqvWYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72226322"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="72226322"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 03:20:24 -0800
X-CSE-ConnectionGUID: MRjEZWEGRTCSmb75kBehlQ==
X-CSE-MsgGUID: VHKINJ3lTfyItItW7wk1YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="212816685"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO
 kkoning-desktop.intel.com) ([10.245.244.241])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 03:20:22 -0800
From: Koen Koning <koen.koning@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Koen Koning <koen.koning@linux.intel.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Dave Airlie <airlied@redhat.com>,
 intel-xe@lists.freedesktop.org,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2] gpu: Fix uninitialized buddy for built-in drivers
Date: Mon, 16 Feb 2026 12:19:01 +0100
Message-ID: <20260216111902.110286-1-koen.koning@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260213152047.179628-1-koen.koning@linux.intel.com>
References: <20260213152047.179628-1-koen.koning@linux.intel.com>
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

Use subsys_initcall instead of module_init for the GPU buddy allocator,
so its initialization code runs before any gpu drivers.
Otherwise, a built-in driver that tries to use the buddy allocator will
run into a kernel NULL pointer dereference because slab_blocks is
uninitialized.

Specifically, this fixes drm/xe (as built-in) running into a kernel
panic during boot, because it uses buddy during device probe.

Fixes: ba110db8e1bc ("gpu: Move DRM buddy allocator one level up (part two)")
Cc: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: intel-xe@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Koen Koning <koen.koning@linux.intel.com>
---
v2: use subsys_initcall instead of relying on (fragile) Makefile ordering
    (suggested by Joel Fernandes <joelagnelf@nvidia.com>)
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

