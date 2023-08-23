Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C4BEE49A0
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 09:00:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D2D10E3FE;
	Wed, 23 Aug 2023 09:00:16 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 38F3410E3FE;
 Wed, 23 Aug 2023 09:00:14 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 32F3EAADD6;
 Wed, 23 Aug 2023 09:00:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Date: Wed, 23 Aug 2023 09:00:14 -0000
Message-ID: <169278121420.16625.15404472740729021879@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230823085842.1440523-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230823085842.1440523-1-himal.prasad.ghimiray@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Su?=
 =?utf-8?q?pporting_RAS_on_XE_=28rev4=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Supporting RAS on XE (rev4)
URL   : https://patchwork.freedesktop.org/series/122257/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e700ea2f248a75138759bcb443affeef4a2d1991
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 40f6806a6984e456c897c738a230bb9a1559bf1b
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Wed Aug 23 14:28:42 2023 +0530

    drm/xe: Process fatal hardware errors.
    
    Fatal errors are reported as PCIe errors. When a PCIe error is asserted,
    the OS will perform a device warm reset which causes the driver to reload.
    The error registers are sticky and the values are maintained through a
    warm reset. We read these registers during the boot flow of the driver and
    increment the respective error counters.
    
    Bspec: 53076
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
+ /mt/dim checkpatch 3a964d06598874329aab6f8db7fd52840135d568 drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


