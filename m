Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2491AC48BF6
	for <intel-xe@archiver.kernel.org>; Sun,  3 Mar 2024 13:29:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2CB210FA0D;
	Sun,  3 Mar 2024 13:29:37 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A68010F665;
 Sun,  3 Mar 2024 13:29:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_support_sharing?=
 =?utf-8?q?_VM_info_between_XE_drivers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Moti Haimovski" <mhaimovski@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 03 Mar 2024 13:29:36 -0000
Message-ID: <170947257643.486121.14836662370868999480@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240303132055.2851336-1-mhaimovski@habana.ai>
In-Reply-To: <20240303132055.2851336-1-mhaimovski@habana.ai>
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

Series: drm/xe: support sharing VM info between XE drivers (rev2)
URL   : https://patchwork.freedesktop.org/series/130639/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
4dc7d0cc630cdd9ac56065b1a22afc329345a519
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c7c030426e17a616f91aba42ad24f97e7a2a4889
Author: Bharat Jauhari <bjauhari@habana.ai>
Date:   Sun Mar 3 15:20:55 2024 +0200

    drm/xe: support sharing VM info between XE drivers
    
    This commit adds support to export a user-created VM as a FD
    to be shared between XE drivers running on the same device.
    
    There can be devices which offer multiple hardware features each
    requiring its own driver. In such case, there is always only one
    primary driver which registers itself with the device. All other
    drivers work as auxiliary drivers to the primary driver.
    Based on software use case of the application there can be a
    requirement to share virtual memory information between these drivers.
    In current  design virtual memory is exposed as an integer, this number
    is tightly coupled with the application context. In this integer form,
    VM information cannot be shared with other auxiliary drivers by the
    application.
    Taking inspiration from dma-buf framework, adding a new interface to
    export the VM id as an FD. This FD is unique across the host and
    encapsulates VM related configurations. Using this FD each application
    can opaquely share VM info with other aux drivers.
    This feature doesn't allow inter application sharing of VM information,
    its purpose is to allow application for sharing its VM with another
    driver contexts.
    
    Signed-off-by: Bharat Jauhari <bjauhari@habana.ai>
+ /mt/dim checkpatch 511ffdbe886328239e946608243048f8296fa095 drm-intel
c7c030426e17 drm/xe: support sharing VM info between XE drivers
-:333: WARNING:LONG_LINE: line length of 118 exceeds 100 columns
#333: FILE: include/uapi/drm/xe_drm.h:118:
+#define DRM_IOCTL_XE_VM_EXPORT			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_EXPORT, struct drm_xe_vm_export)

total: 0 errors, 1 warnings, 0 checks, 307 lines checked


