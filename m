Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CABA5C49EA1
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 04:16:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81BEE10E2E9;
	Tue,  6 Aug 2024 04:16:56 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2CE010E2E9;
 Tue,  6 Aug 2024 04:16:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/uapi=3A_Bring_back?=
 =?utf-8?q?_reset_uevent?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 Aug 2024 04:16:55 -0000
Message-ID: <172291781585.542238.17310284091831890226@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240806043231.624645-1-raag.jadav@intel.com>
In-Reply-To: <20240806043231.624645-1-raag.jadav@intel.com>
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

Series: drm/xe/uapi: Bring back reset uevent
URL   : https://patchwork.freedesktop.org/series/136909/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9e645341d3008ce246879af606f45d0e5d21d698
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 91bdc15465ad315c1016b5bda63b1372c40de38c
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Tue Aug 6 10:02:31 2024 +0530

    drm/xe/uapi: Bring back reset uevent
    
    Bring back uevent for gt reset failure with better uapi naming.
    With this in place we can receive failure event using udev.
    
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
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
+ /mt/dim checkpatch 28edc41db567c4c555fff23119c10d39689131c2 drm-intel
91bdc15465ad drm/xe/uapi: Bring back reset uevent
-:13: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#13: 
KERNEL[871.188570] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0 (pci)

total: 0 errors, 1 warnings, 0 checks, 68 lines checked


