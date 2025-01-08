Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A43E77188
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jan 2025 10:38:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D328010E1A6;
	Wed,  8 Jan 2025 10:38:54 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D85E10E1A6;
 Wed,  8 Jan 2025 10:38:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_Survivability_mode?=
 =?utf-8?q?_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Jan 2025 10:38:53 -0000
Message-ID: <173633273351.1263802.4452998254136037271@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250108103959.1219312-1-riana.tauro@intel.com>
In-Reply-To: <20250108103959.1219312-1-riana.tauro@intel.com>
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

Series: Enable Survivability mode (rev2)
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
commit 0a0f3bca164a0b0f334ff5201a93f74514169d98
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Wed Jan 8 16:09:59 2025 +0530

    drm/xe: Initialize mei-gsc and vsec in survivability mode
    
    Initialize mei-gsc in survivability mode and disable HECI
    interrupts. Also initialize vsec in survivability mode
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch ecd15b6b721fa31b2bb150d15473f61352077e34 drm-intel
402cc7f5fb1a drm/xe: Add functions and sysfs for boot survivability
-:90: WARNING:TYPO_SPELLING: 'Auxillary' may be misspelled - perhaps 'Auxiliary'?
#90: FILE: drivers/gpu/drm/xe/xe_pcode_api.h:63:
+/* Auxillary info bits */
    ^^^^^^^^^

-:97: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#97: 
new file mode 100644

-:143: WARNING:TYPO_SPELLING: 'Auxillary' may be misspelled - perhaps 'Auxiliary'?
#143: FILE: drivers/gpu/drm/xe/xe_survivability_mode.c:42:
+ *			      Auxillary Information  - Certain failures may have information in
   			      ^^^^^^^^^

total: 0 errors, 3 warnings, 0 checks, 326 lines checked
781260b0e8a0 drm/xe: Enable Boot Survivability mode
0a0f3bca164a drm/xe: Initialize mei-gsc and vsec in survivability mode


