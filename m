Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AE2C3601A
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 05:06:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB84F10E00C;
	Mon,  7 Apr 2025 05:06:04 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8335410E00C;
 Mon,  7 Apr 2025 05:06:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_configfs_support_for_?=
 =?utf-8?q?survivability_mode_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 07 Apr 2025 05:06:03 -0000
Message-ID: <174400236353.41729.12770963250084141649@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250407051414.1651616-1-riana.tauro@intel.com>
In-Reply-To: <20250407051414.1651616-1-riana.tauro@intel.com>
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

Series: Add configfs support for survivability mode (rev4)
URL   : https://patchwork.freedesktop.org/series/145999/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a4c9110ce0dcafb16d77b6eb56e1353a77ae54cd
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Mon Apr 7 10:44:13 2025 +0530

    drm/xe: Enable configfs support for survivability mode
    
    Enable survivability mode if supported and configfs attribute is set.
    Enabling survivability mode manually is useful in cases where pcode does
    not detect failure, validation and for IFR (in-field-repair).
    
    To set configfs survivability mode attribute for a device
    
    echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
    
    The card enters survivability mode if supported
    
    v2: add a log if survivability mode is enabled for unsupported
        platforms (Rodrigo)
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch c4fc93b0ec49f4b0105c142502b7d1d5de379950 drm-intel
4d5cdbdc6bc7 drm/xe: Add configfs to enable survivability mode
-:38: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#38: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 242 lines checked
ca57a6ed884d drm/xe: Add documentation for survivability mode
a4c9110ce0dc drm/xe: Enable configfs support for survivability mode


