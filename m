Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551BCC52D7C
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 07:47:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22FA710E06C;
	Mon, 12 Aug 2024 07:47:43 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B994410E06C;
 Mon, 12 Aug 2024 07:47:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/uapi=3A_Bring_back?=
 =?utf-8?q?_reset_uevent_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 Aug 2024 07:47:42 -0000
Message-ID: <172344886275.593902.671487827166028519@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240812074812.1457164-1-raag.jadav@intel.com>
In-Reply-To: <20240812074812.1457164-1-raag.jadav@intel.com>
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

Series: drm/xe/uapi: Bring back reset uevent (rev2)
URL   : https://patchwork.freedesktop.org/series/136909/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6f08695ef26754b232692ea6788ec34fb59987da
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Mon Aug 12 13:18:12 2024 +0530

    drm/xe/uapi: Bring back reset uevent
    
    This was dropped in commit 77a0d4d1cea2 ("drm/xe/uapi: Remove reset
    uevent for now") as part of refactoring.
    
    Now that we have better uapi semantics and naming for the uevent,
    bring it back. With this in place, userspace will be notified of
    wedged device along with its reason.
    
    $ udevadm monitor --property --kernel
    monitor will print the received events for:
    KERNEL - the kernel uevent
    
    KERNEL[871.188570] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0 (pci)
    ACTION=change
    DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0
    SUBSYSTEM=pci
    DEVICE_STATUS=NEEDS_RESET
    REASON=GT_RESET_FAILED
    TILE_ID=0
    GT_ID=0
    DRIVER=xe
    PCI_CLASS=30000
    PCI_ID=8086:56B1
    PCI_SUBSYS_ID=8086:1210
    PCI_SLOT_NAME=0000:03:00.0
    MODALIAS=pci:v00008086d000056B1sv00008086sd00001210bc03sc00i00
    SEQNUM=6104
    
    v2: Change authorship to Himal (Aravind)
        Add uevent for all device wedged cases (Aravind)
    
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
+ /mt/dim checkpatch ac6319ef8c6027f0fc65b71b614a8312aed19423 drm-intel
6f08695ef267 drm/xe/uapi: Bring back reset uevent
-:17: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#17: 
KERNEL[871.188570] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0 (pci)

total: 0 errors, 1 warnings, 0 checks, 169 lines checked


