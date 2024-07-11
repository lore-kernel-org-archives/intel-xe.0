Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF0EC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 20:48:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230E710EB95;
	Thu, 11 Jul 2024 20:48:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lKtC+J56";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B3E10EB95
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 20:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720730923; x=1752266923;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XYW8cDJcSeWImJGg9FFlr2twAtSs1JXAN6OVp+guvYU=;
 b=lKtC+J565daF1JqF+AlhUZNv1EElkhcH9OixgVCmX8Ml+OoeGVzbNxY+
 CSRpuTJSSGoU+mif5oIvVN//gzrAxy/jHM3D1mcB65yWdJ8VvI1pW0UpW
 MOlo8z9lAtRDz5uOxJZ4/DUkLXOaPKm82mL+JvraY9iQbRKASVAhbGK3i
 3o47+zBAJwoqBJvuqD4OW+Qt4TXFqxSAAXsWmcSM/eoKnn8ZpAX17zkbe
 INFsEs4jud3fnS8YytSLzqkA7Vbk/20iupSTysLMlJqqUj/lZJHuz/EQ/
 oqeHnU8cyj1Fix/34GHjSSi1bR034gv+LpWKZQfctGyZnKMjGuMnZd48F w==;
X-CSE-ConnectionGUID: No2mAHPcS1eCIzuJc23HJg==
X-CSE-MsgGUID: qkzmQUlcSDWQgBC0DyCV7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18285820"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="18285820"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 13:48:43 -0700
X-CSE-ConnectionGUID: Ok7MDy7ORwqEnCboNExI6Q==
X-CSE-MsgGUID: bn7TFD9VToe5NvbLDrzgZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="79810904"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 13:48:42 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/exec: Fix minor bug related to xe_sync_entry_cleanup
Date: Thu, 11 Jul 2024 13:48:32 -0700
Message-ID: <20240711204832.3724771-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Increment num_syncs after xe_sync_entry_parse() is successful to ensure
the xe_sync_entry_cleanup() logic under "err_syncs" label works correctly.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 2d72cdec3a0b..95c0b21096f0 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -156,8 +156,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 	vm = q->vm;
 
-	for (i = 0; i < args->num_syncs; i++) {
-		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs++],
+	for (i = 0; i < args->num_syncs; i++, num_syncs++) {
+		err = xe_sync_entry_parse(xe, xef, &syncs[i],
 					  &syncs_user[i], SYNC_PARSE_FLAG_EXEC |
 					  (xe_vm_in_lr_mode(vm) ?
 					   SYNC_PARSE_FLAG_LR_MODE : 0));
-- 
2.41.0

