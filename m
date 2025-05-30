Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A191C5B543
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 11:13:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513B310E0FC;
	Fri, 30 May 2025 11:13:27 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 206A310E0FC;
 Fri, 30 May 2025 11:13:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/hwmon=3A_Add_mailb?=
 =?utf-8?q?ox_power_limits=2C_PL2=2C_read_energy_from_PMT_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 30 May 2025 11:13:26 -0000
Message-ID: <174860360614.34978.7029914081460017967@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250529163458.2354509-1-karthik.poosa@intel.com>
In-Reply-To: <20250529163458.2354509-1-karthik.poosa@intel.com>
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

Series: drm/xe/hwmon: Add mailbox power limits, PL2, read energy from PMT (rev2)
URL   : https://patchwork.freedesktop.org/series/149651/
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
commit d38299773af2499500267596bf572fe05ccc8539
Author: Karthik Poosa <karthik.poosa@intel.com>
Date:   Thu May 29 22:04:58 2025 +0530

    drm/xe/hwmon: Expose power sysfs entries based on firmware support
    
    Enable hwmon sysfs entries (power_xxx) only when GPU firmware
    supports it.
    Previously, these entries were created if the MMIO register
    was present. Now, we enable based on the data in the register.
    
    v2: Remove a unnecessary comment. (Rodrigo)
    
    Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 5ee21c4d445a914860e59678f036866f80ebade4 drm-intel
0ddc0d7f7e76 drm/xe/hwmon: Add support to manage power limits though mailbox
2bc2256e5b32 drm/xe/hwmon: Move card reactive critical power under channel card
950c6e7e1452 drm/xe/hwmon: Add support to manage PL2 though mailbox
d7b23b2c5b66 drm/xe/hwmon: Expose powerX_cap_interval
4e885b526234 drm/xe/hwmon: Read energy status from PMT
d38299773af2 drm/xe/hwmon: Expose power sysfs entries based on firmware support


