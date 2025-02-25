Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB853C021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 09:35:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77EE410E5EF;
	Tue, 25 Feb 2025 09:35:44 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD3110E5E8;
 Tue, 25 Feb 2025 09:35:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_support_for_EU_stall_?=
 =?utf-8?q?sampling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harish Chegondi" <harish.chegondi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Feb 2025 09:35:43 -0000
Message-ID: <174047614383.1913542.14153032201297155294@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1740474556.git.harish.chegondi@intel.com>
In-Reply-To: <cover.1740474556.git.harish.chegondi@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/145387/
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
commit de6200880a8aab243dbdcc2691ab06dd6af170c1
Author: Harish Chegondi <harish.chegondi@intel.com>
Date:   Tue Feb 25 01:20:25 2025 -0800

    drm/xe/eustall: Add workaround 22016596838 which applies to PVC.
    
    Add PVC workaround 22016596838 that disables EU DOP gating
    during EU stall sampling.
    
    Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
    Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 32ff724d21f3ec064db2d1a034c47a76d800382f drm-intel
d23b7601a1f6 drm/xe/topology: Add a function to find the index of the last enabled DSS in a mask
c043daf5c0ff drm/xe/uapi: Introduce API for EU stall sampling
-:62: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#62: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 321 lines checked
85daf9b1083a drm/xe/eustall: Add support to init, enable and disable EU stall sampling
-:36: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#36: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 501 lines checked
dd63686d2d12 drm/xe/eustall: Add support to read() and poll() EU stall data
31de070f39e7 drm/xe/eustall: Add support to handle dropped EU stall data
2184440359d6 drm/xe/eustall: Add EU stall sampling support for Xe2
442aea3eb16d drm/xe/uapi: Add a device query to get EU stall sampling information
de6200880a8a drm/xe/eustall: Add workaround 22016596838 which applies to PVC.


