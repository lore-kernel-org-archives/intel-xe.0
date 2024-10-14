Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E34FCF259D
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 06:05:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 497C010E26F;
	Mon, 14 Oct 2024 06:05:42 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63BD10E26F;
 Mon, 14 Oct 2024 06:05:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_support_for_EU_stall_?=
 =?utf-8?q?sampling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harish Chegondi" <harish.chegondi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 14 Oct 2024 06:05:41 -0000
Message-ID: <172888594180.1246137.12130932924788726920@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1728884074.git.harish.chegondi@intel.com>
In-Reply-To: <cover.1728884074.git.harish.chegondi@intel.com>
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

Series: Add support for EU stall sampling
URL   : https://patchwork.freedesktop.org/series/139931/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit efa383a27ce5e1b57104a7a40d8e2b302e3a193b
Author: Harish Chegondi <harish.chegondi@intel.com>
Date:   Sun Oct 13 23:00:36 2024 -0700

    drm/xe/eustall: Add workaround 22016596838 which applies to PVC.
    
    Add PVC workaround 22016596838 that disables EU DOP gating
    during EU stall sampling.
    
    Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
+ /mt/dim checkpatch 61475267a6e1ec41d171c840a833dc1a2c1bcf06 drm-intel
73a49bb5f832 drm/xe/topology: Add a function to find the index of the last DSS in a mask
-:8: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

total: 0 errors, 1 warnings, 0 checks, 24 lines checked
0770768b4cc6 drm/xe/eustall: Introduce API for EU stall sampling
-:45: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#45: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 380 lines checked
47242a6e64bb drm/xe/eustall: Implement EU stall sampling APIs
-:24: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#24: 
new file mode 100644

-:172: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'write_ptr != read_ptr'
#172: FILE: drivers/gpu/drm/xe/xe_eu_stall.c:238:
+		if ((write_ptr != read_ptr) && !min_data_present) {

-:980: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#980: FILE: drivers/gpu/drm/xe/xe_trace.h:433:
+	    TP_STRUCT__entry(

-:990: CHECK:OPEN_ENDED_LINE: Lines should not end with a '('
#990: FILE: drivers/gpu/drm/xe/xe_trace.h:443:
+	    TP_fast_assign(

total: 0 errors, 1 warnings, 3 checks, 945 lines checked
8e4ecc16e82c drm/xe/query: Add a device query to get EU stall data information
efa383a27ce5 drm/xe/eustall: Add workaround 22016596838 which applies to PVC.


