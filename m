Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BF8C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 20:32:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6921E10F564;
	Mon, 15 Apr 2024 20:32:30 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6649210F28A;
 Mon, 15 Apr 2024 20:32:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_select_X86=5FPL?=
 =?utf-8?q?ATFORM=5FDEVICES_when_ACPI=5FWMI_is_selected?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lu Yao" <yaolu@kylinos.cn>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Apr 2024 20:32:29 -0000
Message-ID: <171321314942.1423804.2783672646404931246@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240415025215.15811-1-yaolu@kylinos.cn>
In-Reply-To: <20240415025215.15811-1-yaolu@kylinos.cn>
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

Series: drm/xe: select X86_PLATFORM_DEVICES when ACPI_WMI is selected
URL   : https://patchwork.freedesktop.org/series/132447/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35057f376b5337039b258ae4c66ed9218f4b3fb8
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4b7b5a97a4887b50951cd2718ce1417816c8eba1
Author: Lu Yao <yaolu@kylinos.cn>
Date:   Mon Apr 15 10:52:15 2024 +0800

    drm/xe: select X86_PLATFORM_DEVICES when ACPI_WMI is selected
    
    ACPI_WMI is a subitem of X86_PLATFORM_DEVICES. And X86_PLATFORM_DEVICES
    is not selected in the current Kconfig, and may cause Kconfig warnings:
    
    WARNING: unmet direct dependencies detected for ACPI_WMI
      Depends on [n]: X86_PLATFORM_DEVICES [=n] && ACPI [=y]
      Selected by [m]:
      - DRM_XE [=m] && HAS_IOMEM [=y] && DRM [=m] && PCI [=y] && MMU [=y] &&
        (m && MODULES [=y] || y && KUNIT [=y]=y) && X86 [=y] && ACPI [=y]
    
    Signed-off-by: Lu Yao <yaolu@kylinos.cn>
+ /mt/dim checkpatch 1bfe3965a846936d93b6e69385e53f1bd1c3b889 drm-intel
4b7b5a97a488 drm/xe: select X86_PLATFORM_DEVICES when ACPI_WMI is selected


