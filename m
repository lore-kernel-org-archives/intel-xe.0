Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C30C3DA6E
	for <intel-xe@archiver.kernel.org>; Wed, 20 Dec 2023 16:19:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E5310E0E8;
	Wed, 20 Dec 2023 16:19:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D39D10E0E8
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Dec 2023 16:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703089170; x=1734625170;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=al51hFAmS1wQ5fT3vB5z4tTqKYYJyHiMQC+rx6a9sB0=;
 b=TxGHldKzxj+YDobZG7X7KiiXzslfM/JuaQmdHkPZ1eSJYpp98xmVTmZJ
 oPpjFFmAXVg0ul0hn37ikO/fYgt3XnmpjJz9upvMHGs7L6Q1NeI3upybN
 Xz2wf2IM8iV0XVXAc4c0hQ3busbriHKksD/dwo6DdIHlzC93ly8DKFhHY
 AVGSKqSxPFQKKTPkqJ1dRD8Ye9gt21P9snK+5knWNOSpOMXB7DVGnZ485
 BnVtmEUd7KY6R3iQ1S4JCK5u7kG/CYP0HexmYrUMCF+B32lTGG7S4TZqF
 TsqyBLuPa4f8JS1+af2qEFOZX4LadKXOuiPU3hX65D9heqKfTS3vzMUoW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="482023165"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; d="scan'208";a="482023165"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 08:19:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="846780847"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; d="scan'208";a="846780847"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 08:19:29 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Remove uninitialized variable from warning
Date: Wed, 20 Dec 2023 08:19:23 -0800
Message-Id: <20231220161923.3740489-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

"err" is not initialized when failing to create and add the freq0 sysfs
file. Remove it from the message. This fixes the following warning with
clang:

	../drivers/gpu/drm/xe/xe_gt_freq.c:202:30: error: variable 'err' is uninitialized when used here [-Werror,-Wuninitialized]
				 kobject_name(gt->sysfs), err);
							  ^~~

Fixes: fc5b7e3efff3 ("drm/xe: Create a xe_gt_freq component for raw management and sysfs")
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_freq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index 08eabcafe7bc..3adfa6686e7c 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -198,8 +198,8 @@ void xe_gt_freq_init(struct xe_gt *gt)
 
 	gt->freq = kobject_create_and_add("freq0", gt->sysfs);
 	if (!gt->freq) {
-		drm_warn(&xe->drm, "failed to add freq0 directory to %s, err: %d\n",
-			 kobject_name(gt->sysfs), err);
+		drm_warn(&xe->drm, "failed to add freq0 directory to %s\n",
+			 kobject_name(gt->sysfs));
 		return;
 	}
 
-- 
2.40.1

