Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C91C0218A
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jan 2025 09:16:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DDD910E37C;
	Mon, 20 Jan 2025 09:16:14 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 473BE10E37C;
 Mon, 20 Jan 2025 09:16:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_Survivability_mode?=
 =?utf-8?q?_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 20 Jan 2025 09:16:13 -0000
Message-ID: <173736457328.2052710.15163644198574712603@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250120064042.2596178-1-riana.tauro@intel.com>
In-Reply-To: <20250120064042.2596178-1-riana.tauro@intel.com>
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

Series: Enable Survivability mode (rev3)
URL   : https://patchwork.freedesktop.org/series/142464/
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
commit 693d54f863840b402dd99a62cdc45199230cc6b8
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Mon Jan 20 12:10:42 2025 +0530

    drm/xe: Initialize mei-gsc and vsec in survivability mode
    
    Initialize mei-gsc in survivability mode and disable HECI
    interrupts. Also initialize vsec in survivability mode
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 4d9c78b35c395ed49796502224f3a421b0ce65ef drm-intel
86613778c5e2 drm/xe: Add functions and sysfs for boot survivability
-:97: WARNING:TYPO_SPELLING: 'Auxillary' may be misspelled - perhaps 'Auxiliary'?
#97: FILE: drivers/gpu/drm/xe/xe_pcode_api.h:63:
+/* Auxillary info bits */
    ^^^^^^^^^

-:104: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#104: 
new file mode 100644

-:149: WARNING:TYPO_SPELLING: 'Auxillary' may be misspelled - perhaps 'Auxiliary'?
#149: FILE: drivers/gpu/drm/xe/xe_survivability_mode.c:41:
+ *			      Auxillary Information  - Certain failures may have information in
   			      ^^^^^^^^^

-:194: WARNING:TYPO_SPELLING: 'Auxillary' may be misspelled - perhaps 'Auxiliary'?
#194: FILE: drivers/gpu/drm/xe/xe_survivability_mode.c:86:
+			snprintf(name, NAME_MAX, "Auxillary Info %d", index);
 			                          ^^^^^^^^^

total: 0 errors, 4 warnings, 0 checks, 310 lines checked
4e48c8faa7e7 drm/xe: Enable Boot Survivability mode
693d54f86384 drm/xe: Initialize mei-gsc and vsec in survivability mode


