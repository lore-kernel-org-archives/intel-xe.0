Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBFDCCD1BF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 04:05:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F5310E1D6;
	Tue, 28 Oct 2025 04:05:33 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 037D510E1D1;
 Tue, 28 Oct 2025 04:05:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Pagefault_refactor_=28rev?=
 =?utf-8?q?2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 Oct 2025 04:05:32 -0000
Message-ID: <176162433200.61002.4993175668316761283@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251028035843.2488613-1-matthew.brost@intel.com>
In-Reply-To: <20251028035843.2488613-1-matthew.brost@intel.com>
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

Series: Pagefault refactor (rev2)
URL   : https://patchwork.freedesktop.org/series/156508/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f867e605613af1770f90c4b0afd4a8f06424d1f0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 05f4c3a906e5be22b70775d7bda7c25688acf82a
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Oct 27 20:58:43 2025 -0700

    drm/xe: Remove unused GT page fault code
    
    With the Xe page fault layer and GuC page layer in place, this is now
    dead code and can be removed. ACC code is also removed, but this was
    dead code.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch de43fe70c436c359e7478a5532d873f87357cb4e drm-intel
b391b45c2bdd drm/xe: Stub out new pagefault layer
-:25: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#25: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 227 lines checked
9f86bd033fc8 drm/xe: Implement xe_pagefault_init
093838c44b47 drm/xe: Implement xe_pagefault_reset
383e3fe70f66 drm/xe: Implement xe_pagefault_handler
cd7fd0d75ca2 drm/xe: Implement xe_pagefault_queue_work
065089569dea drm/xe: Add xe_guc_pagefault layer
-:95: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#95: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 187 lines checked
05f4c3a906e5 drm/xe: Remove unused GT page fault code
-:13: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#13: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 71 lines checked


