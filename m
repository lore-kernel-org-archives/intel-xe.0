Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FC8C021B0
	for <intel-xe@archiver.kernel.org>; Wed, 19 Feb 2025 17:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B283110E34F;
	Wed, 19 Feb 2025 17:05:19 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E986110E34F;
 Wed, 19 Feb 2025 17:05:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xe=5Fdrm=5Fclient?=
 =?utf-8?q?=3A_Add_per_drm_client_reset_stats_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Feb 2025 17:05:18 -0000
Message-ID: <173998471895.4052635.8281326045711080983@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250219162340.116499-1-jonathan.cavitt@intel.com>
In-Reply-To: <20250219162340.116499-1-jonathan.cavitt@intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe/xe_drm_client: Add per drm client reset stats (rev3)
URL   : https://patchwork.freedesktop.org/series/144903/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 904eb8dc7dc7ca51ad55388cddb01b5595d9e710
Author: Jonathan Cavitt <jonathan.cavitt@intel.com>
Date:   Wed Feb 19 16:23:40 2025 +0000

    drm/xe/xe_query: Add support for per-drm-client reset stat querying
    
    Add support for userspace to query per drm client reset stats via the
    query ioctl.  This includes the number of engine resets the drm client
    has observed, as well as a list of up to the last 50 relevant exec
    queue bans and their associated causal pagefaults (if they exists).
    
    v2: Report EOPNOTSUPP if CONFIG_PROC_FS is not set in the kernel
        config, as it is required to trace the reset count and exec
        queue bans.
    
    Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch cdb6a0fd9cbfc26c75833c6f7a43eefa10c70144 drm-intel
32d445768e64 drm/xe/xe_exec_queue: Add ID param to exec queue struct
6476e133c0ca drm/xe/xe_gt_pagefault: Migrate pagefault struct to header
ef489f23e429 drm/xe/xe_drm_client: Add per drm client pagefault info
-:63: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kzalloc(sizeof(*b)...) over kzalloc(sizeof(struct blame)...)
#63: FILE: drivers/gpu/drm/xe/xe_drm_client.c:185:
+	b = kzalloc(sizeof(struct blame), GFP_KERNEL);

-:74: WARNING:LINE_SPACING: Missing a blank line after declarations
#74: FILE: drivers/gpu/drm/xe/xe_drm_client.c:196:
+		struct blame *rem = list_first_entry(&client->blame_list, struct blame, list);
+		free_blame(rem);

-:86: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kzalloc(sizeof(*pf)...) over kzalloc(sizeof(struct pagefault)...)
#86: FILE: drivers/gpu/drm/xe/xe_drm_client.c:208:
+		pf = kzalloc(sizeof(struct pagefault), GFP_KERNEL);

-:109: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#109: FILE: drivers/gpu/drm/xe/xe_drm_client.c:231:
+
+}

-:232: WARNING:NEEDLESS_IF: kfree(NULL) is safe and this check is probably not required
#232: FILE: drivers/gpu/drm/xe/xe_gt_pagefault.c:342:
+		if (hwe->pf.info)
+			kfree(hwe->pf.info);

-:233: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kzalloc(sizeof(*hwe->pf.info)...) over kzalloc(sizeof(struct pagefault)...)
#233: FILE: drivers/gpu/drm/xe/xe_gt_pagefault.c:343:
+		hwe->pf.info = kzalloc(sizeof(struct pagefault), GFP_KERNEL);

-:303: WARNING:NEEDLESS_IF: kfree(NULL) is safe and this check is probably not required
#303: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:2003:
+	if (hwe->pf.info) {
+		kfree(hwe->pf.info);

-:304: CHECK:ALLOC_SIZEOF_STRUCT: Prefer kzalloc(sizeof(*hwe->pf.info)...) over kzalloc(sizeof(struct pagefault)...)
#304: FILE: drivers/gpu/drm/xe/xe_guc_submit.c:2004:
+		hwe->pf.info = kzalloc(sizeof(struct pagefault), GFP_KERNEL);

total: 0 errors, 3 warnings, 5 checks, 289 lines checked
2002b067e1de drm/xe/xe_drm_client: Add per drm client reset stats
3dbade0e3fba drm/xe/xe_query: Pass drm file to query funcs
904eb8dc7dc7 drm/xe/xe_query: Add support for per-drm-client reset stat querying


