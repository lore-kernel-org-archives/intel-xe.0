Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDCFC28B23
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 14:36:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0870910E053;
	Fri,  7 Mar 2025 14:36:31 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BBFC10E053;
 Fri,  7 Mar 2025 14:36:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_configfs_support_for_?=
 =?utf-8?q?survivability_mode?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Mar 2025 14:36:29 -0000
Message-ID: <174135818943.2586.7035469533826777969@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250307142446.1790715-1-riana.tauro@intel.com>
In-Reply-To: <20250307142446.1790715-1-riana.tauro@intel.com>
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

Series: Add configfs support for survivability mode
URL   : https://patchwork.freedesktop.org/series/145999/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 48de3888a0a153a62e1851dee907b3217f00905a
Author: Riana Tauro <riana.tauro@intel.com>
Date:   Fri Mar 7 19:54:45 2025 +0530

    RFC drm/xe: Enable configfs support for survivability mode
    
    Register a configfs subsystem called 'xe' to userspace that allows
    users to modify the exposed attributes. Expose survivability mode as
    an attribute that can be modified manually. This is useful if
    pcode fails to detect survivability mode and for validation
    
    To enable survivability mode for a card,
    
    echo "domain:bus:dev.fn" > /sys/bus/pci/drivers/xe/unbind
    echo "domain:bus:dev.fn" > sys/kernel/config/xe/survivability_mode
    echo "domain:bus:dev.fn" > /sys/bus/pci/drivers/xe/bind
    
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
+ /mt/dim checkpatch 066c46f28642479869d2d1dd27cc6ae476de4abc drm-intel
1dde0ff4eddd RFC drm/xe: Add configfs to enable survivability mode
-:28: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#28: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 138 lines checked
48de3888a0a1 RFC drm/xe: Enable configfs support for survivability mode
-:48: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'pdev->bus->number == bus'
#48: FILE: drivers/gpu/drm/xe/xe_configfs.c:45:
+	if ((pci_domain_nr(pdev->bus) == domain) && (pdev->bus->number == bus) &&
+	    (PCI_SLOT(pdev->devfn) == slot) && (PCI_FUNC(pdev->devfn) == function))

total: 0 errors, 0 warnings, 1 checks, 123 lines checked


