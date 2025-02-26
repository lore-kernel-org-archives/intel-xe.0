Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68B8C021BE
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 01:53:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807F210E842;
	Wed, 26 Feb 2025 01:53:01 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22EC210E842;
 Wed, 26 Feb 2025 01:53:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_support_for_EU_stall_?=
 =?utf-8?q?sampling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harish Chegondi" <harish.chegondi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Feb 2025 01:53:00 -0000
Message-ID: <174053478013.2162564.9387630365377741740@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1740533885.git.harish.chegondi@intel.com>
In-Reply-To: <cover.1740533885.git.harish.chegondi@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/145443/
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
commit ede14a57e92b1da8491d55148eaa0d054692344b
Author: Harish Chegondi <harish.chegondi@intel.com>
Date:   Tue Feb 25 17:47:12 2025 -0800

    drm/xe/eustall: Add workaround 22016596838 which applies to PVC.
    
    Add PVC workaround 22016596838 that disables EU DOP gating
    during EU stall sampling.
    
    Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
    Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 9527883f549b856628618a497d153e515752b457 drm-intel
1aa9ee4c16b8 drm/xe/topology: Add a function to find the index of the last enabled DSS in a mask
6311d451f94b drm/xe/uapi: Introduce API for EU stall sampling
-:62: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#62: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 321 lines checked
695de8747bb6 drm/xe/eustall: Add support to init, enable and disable EU stall sampling
-:36: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#36: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 501 lines checked
5e2906125ca0 drm/xe/eustall: Add support to read() and poll() EU stall data
11251598815f drm/xe/eustall: Add support to handle dropped EU stall data
3db0184b1f97 drm/xe/eustall: Add EU stall sampling support for Xe2
06fabc2ab6a3 drm/xe/uapi: Add a device query to get EU stall sampling information
ede14a57e92b drm/xe/eustall: Add workaround 22016596838 which applies to PVC.


