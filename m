Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB0EC3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 10:43:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8E710E1BE;
	Thu,  3 Apr 2025 10:43:19 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0AF310E1BE;
 Thu,  3 Apr 2025 10:43:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_configfs_support_for_?=
 =?utf-8?q?survivability_mode_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Apr 2025 10:43:17 -0000
Message-ID: <174367699771.32001.13224753536249423052@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250403102555.1265786-1-riana.tauro@intel.com>
In-Reply-To: <20250403102555.1265786-1-riana.tauro@intel.com>
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

Series: Add configfs support for survivability mode (rev3)
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
commit f1f43429a58aaaa29f9763667aff78f2817fba40
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Thu Apr 3 15:55:53 2025 +0530

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
+ /mt/dim checkpatch 135e2838ed7d44d880e7e19971b1234e6ae04ded drm-intel
3ab1b92c6a32 drm/xe: Add configfs to enable survivability mode
-:35: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#35: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 244 lines checked
810749ef1b5e drm/xe: add documentation for survivability mode
f1f43429a58a drm/xe: Enable configfs support for survivability mode


