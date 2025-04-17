Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE77C369B2
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 13:02:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B6910E2C3;
	Thu, 17 Apr 2025 13:02:39 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 076F710E2C3;
 Thu, 17 Apr 2025 13:02:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/gpusvm=2C_drm/pagemap?=
 =?utf-8?q?=2C_drm/xe=3A_Restructure_migration_in_preparation_for_multi-devi?=
 =?utf-8?q?ce?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 17 Apr 2025 13:02:39 -0000
Message-ID: <174489495902.14748.8037293426016727903@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250417105113.48831-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250417105113.48831-1-thomas.hellstrom@linux.intel.com>
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

Series: drm/gpusvm, drm/pagemap, drm/xe: Restructure migration in preparation for multi-device
URL   : https://patchwork.freedesktop.org/series/147902/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 43a51730e4bd485a9eb3296a84165dbbcfd0f78c
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Thu Apr 17 12:51:13 2025 +0200

    drm/xe: Implement and use the drm_pagemap populate_mm op
    
    Add runtime PM since we might call populate_mm on a foreign device.
    Also create the VRAM bos as ttm_bo_type_kernel. This avoids the
    initial clearing and the creation of an mmap handle.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 830407db6fa5a871d1a6fcba1e51b42899ff57f6 drm-intel
518282329987 drm/gpusvm, drm/pagemap: Move migration functionality to drm_pagemap
-:925: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#925: 
new file mode 100644

-:960: WARNING:REPEATED_WORD: Possible repeated word: 'Migration'
#960: FILE: drivers/gpu/drm/drm_pagemap.c:31:
+ * DOC: Migration
+ * Migration granularity typically follows the GPU SVM range requests, but

-:1724: WARNING:CONFIG_DESCRIPTION: please write a help paragraph that fully describes the config symbol with at least 4 lines
#1724: FILE: drivers/gpu/drm/xe/Kconfig:89:
+config DRM_XE_PAGEMAP
+	bool "Enable device memory pool for SVM"
 	depends on DRM_XE_GPUSVM
 	select GET_FREE_REGION
 	default y
 	help
+	  Disable this option only if you don't want to expose local device
+	  Disable this option only if you don't want to expose local device
+	  Disable this option only if you don't want to expose local device
+	  memory for SVM. Will reduce KMD memory footprint when disabled.
+
+	  If in doubut say "Y".
 
 config DRM_XE_FORCE_PROBE
 	string "Force probe xe for selected Intel hardware IDs"

-:2143: ERROR:NO_AUTHOR_SIGN_OFF: Missing Signed-off-by: line by nominal patch author 'Matthew Brost <matthew.brost@intel.com>'

total: 1 errors, 3 warnings, 0 checks, 2035 lines checked
076dfb61950f drm/pagemap: Add a populate_mm op
43a51730e4bd drm/xe: Implement and use the drm_pagemap populate_mm op


