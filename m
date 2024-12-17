Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C84E7717F
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 15:35:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8976810E0B1;
	Tue, 17 Dec 2024 15:35:51 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8627910E0F3;
 Tue, 17 Dec 2024 15:35:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_support_for_EU_stall_?=
 =?utf-8?q?sampling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harish Chegondi" <harish.chegondi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Dec 2024 15:35:50 -0000
Message-ID: <173444975054.3857503.13003601636906860796@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1734427624.git.harish.chegondi@intel.com>
In-Reply-To: <cover.1734427624.git.harish.chegondi@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/142707/
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
commit 1e09b8771b3d89227d9e596e116f398cf7ae8760
Author: Harish Chegondi <harish.chegondi@intel.com>
Date:   Tue Dec 17 01:46:57 2024 -0800

    drm/xe/eustall: Add workaround 22016596838 which applies to PVC.
    
    Add PVC workaround 22016596838 that disables EU DOP gating
    during EU stall sampling.
    
    Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
+ /mt/dim checkpatch a26c76ecbab35133f08c0eac7b6b2261ffcd75c7 drm-intel
8b61e223b72c drm/xe/topology: Add a function to find the index of the last enabled DSS in a mask
dedbdc598e71 drm/xe/uapi: Introduce API for EU stall sampling
-:53: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#53: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 387 lines checked
d76518d8321d drm/xe/eustall: Implement EU stall sampling APIs for Xe_HPC
-:23: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#23: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 1001 lines checked
5d8bac4d16a7 drm/xe/eustall: Return -EIO error from read() if HW drops data
798e40f283f4 drm/xe/eustall: Add EU stall sampling support for Xe2
d76819d7eba6 drm/xe/uapi: Add a device query to get EU stall sampling information
1e09b8771b3d drm/xe/eustall: Add workaround 22016596838 which applies to PVC.


