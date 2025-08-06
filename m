Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16653C87FCA
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 06:36:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC04A10E3A6;
	Wed,  6 Aug 2025 06:36:19 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7925710E3A6;
 Wed,  6 Aug 2025 06:36:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Pagefault_refactor=2C_fin?=
 =?utf-8?q?e_grained_fault_locking=2C_threaded_prefetch?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 Aug 2025 06:36:18 -0000
Message-ID: <175446217849.215948.452389601059936198@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250806062242.1090416-1-matthew.brost@intel.com>
In-Reply-To: <20250806062242.1090416-1-matthew.brost@intel.com>
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

Series: Pagefault refactor, fine grained fault locking, threaded prefetch
URL   : https://patchwork.freedesktop.org/series/152565/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c298eac5978c38dcc62a70c0d73c91765e7cc296
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7ee7c0e5458c479b4896cf904e810b14b1953536
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Aug 5 23:22:42 2025 -0700

    drm/xe: Add num_pf_queue modparam
    
    Enable quick experiment to see how number of page fault queues affects
    performance.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch d636513f71664d86e9205b92a45bd8b21ea67a2b drm-intel
f491b29a011e drm/xe: Stub out new pagefault layer
-:25: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#25: 
new file mode 100644

-:223: WARNING:TYPO_SPELLING: 'acknowledgement' may be misspelled - perhaps 'acknowledgment'?
#223: FILE: drivers/gpu/drm/xe/xe_pagefault_types.h:100:
+		 * acknowledgement to formulate response to HW/FW interface.
 		   ^^^^^^^^^^^^^^^

total: 0 errors, 2 warnings, 0 checks, 214 lines checked
a506cb47dffa drm/xe: Implement xe_pagefault_init
5e7c9be76dc1 drm/xe: Implement xe_pagefault_reset
0789190d741c drm/xe: Implement xe_pagefault_handler
99c1fae0ffc3 drm/xe: Implement xe_pagefault_queue_work
90f57ccf361e drm/xe: Add xe_guc_pagefault layer
-:97: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#97: 
new file mode 100644

-:179: WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#179: FILE: drivers/gpu/drm/xe/xe_guc_pagefault.c:78:
+	pf.consumer.access_type = FIELD_GET(PFD_ACCESS_TYPE, msg[2]);;

-:240: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 2 warnings, 0 checks, 185 lines checked
a9748a3e20af drm/xe: Remove unused GT page fault code
-:13: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#13: 
deleted file mode 100644

total: 0 errors, 1 warnings, 0 checks, 71 lines checked
df42d2ed34f0 drm/xe: Fine grained page fault locking
-:752: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Matthew Brost <matthew.brost@intel.com>' != 'Signed-off-by: Matthew Brost <atthew.brost@intel.com>'

total: 0 errors, 1 warnings, 0 checks, 644 lines checked
b90179a168fb drm/xe: Allow prefetch-only VM bind IOCTLs to use VM read lock
78b8cb96d86e drm/xe: Thread prefetch of SVM ranges
7ee7c0e5458c drm/xe: Add num_pf_queue modparam


