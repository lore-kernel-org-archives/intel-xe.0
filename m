Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB80C7115B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 09:42:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3734A10E2C2;
	Mon, 23 Jun 2025 09:42:47 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7519F10E2C2;
 Mon, 23 Jun 2025 09:42:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Handle_Firmware_reported_?=
 =?utf-8?q?Hardware_Errors_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 23 Jun 2025 09:42:46 -0000
Message-ID: <175067176647.100007.410382144860251879@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250623100109.1086459-1-riana.tauro@intel.com>
In-Reply-To: <20250623100109.1086459-1-riana.tauro@intel.com>
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

Series: Handle Firmware reported Hardware Errors (rev2)
URL   : https://patchwork.freedesktop.org/series/149756/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 784f3772bf87838a1a12f35269eb90b612675fb8
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Mon Jun 23 15:31:08 2025 +0530

    drm/xe/xe_hw_error: Add fault injection to trigger csc error handler
    
    Add a debugfs fault handler to trigger csc error handler that
    wedges the device and sends drm uevent
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch 5aa80933c50abb7ebb5776aea2d14762d8449c5e drm-intel
7227a67fcd78 drm: Add a firmware flash method to device wedged uevent
e5101f6dd347 drm/xe: Add a helper function to set recovery method
d50f5f724ddf drm/xe: Add support to handle hardware errors
-:39: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#39: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 174 lines checked
b52b4665c3d6 drm/xe/xe_hw_error: Handle CSC Firmware reported Hardware errors
784f3772bf87 drm/xe/xe_hw_error: Add fault injection to trigger csc error handler


