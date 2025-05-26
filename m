Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AF0C5AE59
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 23:50:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D2010E41F;
	Mon, 26 May 2025 23:50:29 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BD110E41F;
 Mon, 26 May 2025 23:50:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/hwmon=3A_Add_mailb?=
 =?utf-8?q?ox_power_limits=2C_PL2=2C_read_energy_from_PMT_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Poosa, Karthik" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 May 2025 23:50:28 -0000
Message-ID: <174830342810.21444.6490892172393660142@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250513044728.630455-1-karthik.poosa@intel.com>
In-Reply-To: <20250513044728.630455-1-karthik.poosa@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/148926/
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
commit 98effc7fdba04b375d022a56dab7da8c664c7cae
Author: Karthik Poosa <karthik.poosa@intel.com>
Date:   Tue May 13 10:17:28 2025 +0530

    drm/xe/hwmon: Read energy status from PMT
    
    Read card and package energy status using pmt apis instead
    of xe_mmio for supported platforms.
    Enable Battlemage to read energy from PMT.
    
    v2:
     - Remove unused has_pmt_energy field. (Badal)
     - Use GENMASK to extract energy data. (Badal)
    
    v3:
     - Move PMT energy register offset and GENMASK to xe_pmt.h
     - Address review comments. (Jani)
    
    v4:
     - Remove unnecessary debug print. (Badal)
    
    v5:
     - Resolve an unused variable warning.
     - Add a return value check.
    
    Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
    Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch 3e019cc3eaffcb7022b9de66871eabdefd6e06ff drm-intel
254a96cab04f drm/xe/hwmon: Add support to manage power limits though mailbox
a4f8621714fb drm/xe/hwmon: Move card reactive critical power under channel card
63c842052062 drm/xe/hwmon: Add support to manage PL2 though mailbox
d8c0b1c9a901 drm/xe/hwmon: Expose powerX_cap_interval
98effc7fdba0 drm/xe/hwmon: Read energy status from PMT


