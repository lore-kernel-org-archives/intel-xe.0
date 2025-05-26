Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC45C54FB3
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 20:13:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFEB310E3D0;
	Mon, 26 May 2025 20:13:33 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331AE10E3D0;
 Mon, 26 May 2025 20:13:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/hwmon=3A_Add_mailb?=
 =?utf-8?q?ox_power_limits=2C_PL2=2C_read_energy_from_PMT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Poosa, Karthik" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 May 2025 20:13:33 -0000
Message-ID: <174829041311.21406.14071217892020948107@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250509135103.345303-1-karthik.poosa@intel.com>
In-Reply-To: <20250509135103.345303-1-karthik.poosa@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/148819/
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
commit 6e696d19b3e323073b0aa7f4d29b5c0b52ccb3e4
Author: Karthik Poosa <karthik.poosa@intel.com>
Date:   Fri May 9 19:21:03 2025 +0530

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
    
    Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
    Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch 3e019cc3eaffcb7022b9de66871eabdefd6e06ff drm-intel
6e49c1b5bda8 drm/xe/hwmon: Add support to manage power limits though mailbox
772c5e8c10c6 drm/xe/hwmon: Move card reactive critical power under channel card
201ec5b3b806 drm/xe/hwmon: Add support to manage PL2 though mailbox
84a29498213e drm/xe/hwmon: Expose powerX_cap_interval
6e696d19b3e3 drm/xe/hwmon: Read energy status from PMT


