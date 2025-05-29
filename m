Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF49C5AD49
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 10:40:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A88910E010;
	Thu, 29 May 2025 10:40:52 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C6810E1B7;
 Thu, 29 May 2025 10:40:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/hwmon=3A_Add_mailb?=
 =?utf-8?q?ox_power_limits=2C_PL2=2C_read_energy_from_PMT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 May 2025 10:40:50 -0000
Message-ID: <174851525068.31242.5811789387236176167@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250529103430.2348053-1-karthik.poosa@intel.com>
In-Reply-To: <20250529103430.2348053-1-karthik.poosa@intel.com>
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

Series: drm/xe/hwmon: Add mailbox power limits, PL2, read energy from PMT
URL   : https://patchwork.freedesktop.org/series/149633/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 237f34e657b8c03f1fe04f5845a08f9e1fcea958
Author: Karthik Poosa <karthik.poosa@intel.com>
Date:   Thu May 29 16:04:30 2025 +0530

    drm/xe/hwmon: Expose power sysfs entries based on firmware support
    
    Enable hwmon sysfs entries (power_xxx) only when GPU firmware
    supports it.
    Previously, these entries were created if the MMIO register
    was present. Now, we enable based on the data in the register.
    
    Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
+ /mt/dim checkpatch bf0749a9930efe943554c3f73454d03c43779d15 drm-intel
a7ee74d7e742 drm/xe/hwmon: Add support to manage power limits though mailbox
9137abcf2c06 drm/xe/hwmon: Move card reactive critical power under channel card
4705a4fd5547 drm/xe/hwmon: Add support to manage PL2 though mailbox
8761bd193484 drm/xe/hwmon: Expose powerX_cap_interval
6854ee505580 drm/xe/hwmon: Read energy status from PMT
237f34e657b8 drm/xe/hwmon: Expose power sysfs entries based on firmware support


