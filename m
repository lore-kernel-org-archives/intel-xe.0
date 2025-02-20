Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC54C021AA
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 00:12:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630FD10E098;
	Thu, 20 Feb 2025 00:12:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nwgh1jk9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8FF510E0DE
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Feb 2025 00:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740010367; x=1771546367;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z1w9i47BE1UtY4uScsMNfdaMBpzLKJuLqtJjnKJnNQs=;
 b=nwgh1jk9cKXwINuyWJ+iWjnuB/Qbs39XrihCAPLAuYQcOZ0TNOW88d64
 0KBn/VEKeN8KZlTZF8r/4mpaybGXyIyfktSzL+6N7iBSeRfNWYcU047i5
 QPjnQWjXMlrB3HGxImkcskCepXWJaxloZPhtdNQ8xye2nknUy1HSfeVdR
 wqVbnviz2Yaa3sY0wLdZdkdjgz6+jDyGM+ISg+/Vyg4EKJY30SEDm63qd
 rAaRHqHKWzzdHqntSFMfhQ0XhilOuFfLNgVUy6+3JQ6poJffAZOKFqHhE
 svFZhQ/Ru2kOy1JMbBj7m7bKwhlysDHbQATVwczEpL+LpruWLAQ/8daMN Q==;
X-CSE-ConnectionGUID: AQIGZgETS6yyEdc51fbBkg==
X-CSE-MsgGUID: I3EPfeZBRoabm5XqHk6IeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51754168"
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; d="scan'208";a="51754168"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 16:12:46 -0800
X-CSE-ConnectionGUID: 6mjzY9B8SZetnZIRad7fkQ==
X-CSE-MsgGUID: 6mdjg9wiRxOru2YYoNw4GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="145760227"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.96])
 by fmviesa001.fm.intel.com with ESMTP; 19 Feb 2025 16:12:45 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/2] drm/xe/devcoredump: Fix print typo of offset
Date: Thu, 20 Feb 2025 00:08:36 +0000
Message-Id: <20250220000837.1803317-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250220000837.1803317-1-shuicheng.lin@intel.com>
References: <20250219190739.1775077-1-shuicheng.lin@intel.com>
 <20250220000837.1803317-1-shuicheng.lin@intel.com>
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

The log should print with "offset" instead of "size".
Correct the typo in the comment.

v2: split kzalloc change and add typo fix in commit message (Lucas)

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 39fe485d2085..60d15e455017 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -237,7 +237,7 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
 
 	/*
 	 * NB: Despite passing a GFP_ flags parameter here, more allocations are done
-	 * internally using GFP_KERNEL expliictly. Hence this call must be in the worker
+	 * internally using GFP_KERNEL explicitly. Hence this call must be in the worker
 	 * thread and not in the initial capture call.
 	 */
 	dev_coredumpm_timeout(gt_to_xe(ss->gt)->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
@@ -423,7 +423,7 @@ void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix, char suffi
 	if (size & 3)
 		drm_printf(p, "Size not word aligned: %zu", size);
 	if (offset & 3)
-		drm_printf(p, "Offset not word aligned: %zu", size);
+		drm_printf(p, "Offset not word aligned: %zu", offset);
 
 	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
 	if (IS_ERR_OR_NULL(line_buff)) {
-- 
2.25.1

