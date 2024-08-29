Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E47FCA0EC0
	for <intel-xe@archiver.kernel.org>; Thu, 29 Aug 2024 22:12:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF6610E79F;
	Thu, 29 Aug 2024 22:12:27 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D39610E79F;
 Thu, 29 Aug 2024 22:12:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Remove_falsely_GT-centric?=
 =?utf-8?q?_design_in_pcode_and_hwmon?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 Aug 2024 22:12:26 -0000
Message-ID: <172496954624.849572.18293572559751633948@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240829220619.789159-4-matthew.d.roper@intel.com>
In-Reply-To: <20240829220619.789159-4-matthew.d.roper@intel.com>
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

Series: Remove falsely GT-centric design in pcode and hwmon
URL   : https://patchwork.freedesktop.org/series/137979/
State : success

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
commit 84fc6a08ee61549306d8fb2cb9aa0f3875a71d0e
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Thu Aug 29 15:06:22 2024 -0700

    drm/xe/hwmon: Treat hwmon as a per-device concept
    
    There's only one instance of hwmon per device, and MMIO access to it is
    always done through the root tile.  The code has been passing around a
    pointer to the root tile's primary GT, which is confusing since this
    isn't really a GT-level concept.  Replace that pointer with an xe_device
    pointer and use xe_root_mmio_gt(xe) to get a pointer when we need to do
    register MMIO.  This makes things easier to follow, and also cleans up
    the code in preparation for a much larger MMIO register access overhaul
    that's coming soon.
    
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch ba2da4a21bf2d821ddf79e6d5c9b994202156355 drm-intel
f2238c405210 drm/xe/pcode: Treat pcode as per-tile rather than per-GT
84fc6a08ee61 drm/xe/hwmon: Treat hwmon as a per-device concept


