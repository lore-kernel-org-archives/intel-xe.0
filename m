Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5644C36010
	for <intel-xe@archiver.kernel.org>; Thu, 27 Mar 2025 16:25:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C34210E059;
	Thu, 27 Mar 2025 16:25:01 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E4210E059;
 Thu, 27 Mar 2025 16:25:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/d3cold=3A_Set_powe?=
 =?utf-8?q?r_state_to_D3Cold_during_s2idle/s3?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Mar 2025 16:25:00 -0000
Message-ID: <174309270013.11772.753847254907735149@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250327161914.432552-1-badal.nilawar@intel.com>
In-Reply-To: <20250327161914.432552-1-badal.nilawar@intel.com>
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

Series: drm/xe/d3cold: Set power state to D3Cold during s2idle/s3
URL   : https://patchwork.freedesktop.org/series/146883/
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
commit 5ee52feb97e6c4dbe62c5729af652b7feadd73b9
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Thu Mar 27 21:49:14 2025 +0530

    drm/xe/d3cold: Set power state to D3Cold during s2idle/s3
    
    According to pci core guidelines, pci_save_config is recommended when the
    driver explicitly needs to set the pci power state. As of now xe kmd is
    only doing pci_save_config while entering to s2idle/s3 state, which makes
    pci core think that device driver has already applied required pci power
    state. This leads to GPU remain in D0 state. To fix the issue setting
    the pci power state to D3Cold.
    
    Fixes:dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
    Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
+ /mt/dim checkpatch 6b12f0606e27042adf3ad16f57a837682d081158 drm-intel
5ee52feb97e6 drm/xe/d3cold: Set power state to D3Cold during s2idle/s3
-:13: WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12+ chars of sha1> ("<title line>")' - ie: 'Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")'
#13: 
Fixes:dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

total: 0 errors, 1 warnings, 0 checks, 7 lines checked


