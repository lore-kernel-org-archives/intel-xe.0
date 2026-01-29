Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DCED73EA8
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 23:41:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D690A10E1C8;
	Thu, 29 Jan 2026 23:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dKe8mVrp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DDEC10E1C8
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 23:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769730101; x=1801266101;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S9t9BC0fLh02sRbJGAHGbB76dGwcD0hUrPc1BwDp3lk=;
 b=dKe8mVrp8Lfj2uh4Hqo0xiHIjc4sbbAHJSr41ZcjgZoxLcGOLalTizy9
 EIqj3VRhzg52A37D2ioAIMrQqqW5X/rZ8ccRaj47v3Sfc4bkb/yLSqnJ+
 Sd2shC/rt0FI71Hd3kef6SUiumGJypCaSXIOMilZlYfSA/YkcVJ6HUwcd
 3zsf/h+TE0Lk81veqY0J00XdjNrWTH8hZTKUcQvF3rgsvZRiAinrmQhDh
 Bwf1n3MvHbswic0cPeCUJzJ7R5JLsQyqn7HjEZQVCV2FmZ6ctAzeAxJze
 lGFx9qSspl3fYc8FP9G3ddip8xCjP0LhwJ52XNQBCZfVnl8bYsPN6kNEE w==;
X-CSE-ConnectionGUID: 6quPUCT3SbaE0h8kn00PJw==
X-CSE-MsgGUID: bnTkduMhSpKIaJ/Hn6f4MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="58560070"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="58560070"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 15:41:41 -0800
X-CSE-ConnectionGUID: DF5uacXwTMy2d+ACAReg5Q==
X-CSE-MsgGUID: kAQCSzLwRnaFVSDsWuOwXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="213201737"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa005.fm.intel.com with ESMTP; 29 Jan 2026 15:41:40 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 1/3] drm/xe: Fix kerneldoc for xe_migrate_exec_queue
Date: Thu, 29 Jan 2026 23:38:36 +0000
Message-ID: <20260129233834.419977-6-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260129233834.419977-5-shuicheng.lin@intel.com>
References: <20260129233834.419977-5-shuicheng.lin@intel.com>
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

Correct the function name in the kerneldoc.
It is for below warning:
"Warning: drivers/gpu/drm/xe/xe_migrate.c:1262 expecting prototype for
xe_get_migrate_exec_queue(). Prototype was for xe_migrate_exec_queue()
instead"

Fixes: 916ee4704a865 ("drm/xe/vf: Register CCS read/write contexts with Guc")
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 6e202428aac2..078a9bc2821d 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1254,7 +1254,7 @@ void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
 }
 
 /**
- * xe_get_migrate_exec_queue() - Get the execution queue from migrate context.
+ * xe_migrate_exec_queue() - Get the execution queue from migrate context.
  * @migrate: Migrate context.
  *
  * Return: Pointer to execution queue on success, error on failure
-- 
2.50.1

