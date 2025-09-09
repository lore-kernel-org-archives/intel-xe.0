Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C65CA0FED
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 15:11:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C1A10E262;
	Tue,  9 Sep 2025 15:11:18 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A27E10E262;
 Tue,  9 Sep 2025 15:11:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_tracepoints_to_profil?=
 =?utf-8?q?e_SVM_page_faults_and_migration?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Sep 2025 15:11:17 -0000
Message-ID: <175743067762.317626.1323771574873608452@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250909150437.986365-1-francois.dugast@intel.com>
In-Reply-To: <20250909150437.986365-1-francois.dugast@intel.com>
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

Series: Add tracepoints to profile SVM page faults and migration
URL   : https://patchwork.freedesktop.org/series/154280/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1d0845ed92fe490573ba336cae046586d19a229b
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Tue Sep 9 17:03:37 2025 +0200

    drm/xe/gt_pagefault: Add tracepoints when handing page faults
    
    Add a new tracepoints when handling VMA and SVM page faults.
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch 8fe674bb9096ac6a63d4f4d57f035f045a0f98c1 drm-intel
0fce6cd49d20 drm/xe/migrate: Add tracepoint during VRAM copy
-:51: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#51: 
new file mode 100644

-:91: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#91: FILE: drivers/gpu/drm/xe/xe_trace.h:450:
+		    TP_STRUCT__entry(

-:98: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#98: FILE: drivers/gpu/drm/xe/xe_trace.h:457:
+		    TP_fast_assign(

total: 0 errors, 1 warnings, 2 checks, 91 lines checked
1d0845ed92fe drm/xe/gt_pagefault: Add tracepoints when handing page faults
-:58: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#58: 
new file mode 100644

-:111: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#111: FILE: drivers/gpu/drm/xe/xe_trace.h:482:
+		    TP_STRUCT__entry(

-:121: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#121: FILE: drivers/gpu/drm/xe/xe_trace.h:492:
+		    TP_fast_assign(

-:130: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#130: FILE: drivers/gpu/drm/xe/xe_trace.h:501:
+			      xe_hw_engine_class_to_str(

total: 0 errors, 1 warnings, 3 checks, 120 lines checked


