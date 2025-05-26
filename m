Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8816C5AD49
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 19:51:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A2B10E3AF;
	Mon, 26 May 2025 19:51:24 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C9210E3A8;
 Mon, 26 May 2025 19:51:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/hwmon=3A_Add_mailb?=
 =?utf-8?q?ox_power_limits=2C_PL2=2C_read_energy_from_PMT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Poosa, Karthik" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 May 2025 19:51:23 -0000
Message-ID: <174828908335.21264.3184212341735937817@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250509095157.340680-1-karthik.poosa@intel.com>
In-Reply-To: <20250509095157.340680-1-karthik.poosa@intel.com>
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
URL   : https://patchwork.freedesktop.org/series/148811/
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
commit 34c54873f33a2d44bf59b783f5e81eb6e15c581f
Author: Karthik Poosa <karthik.poosa@intel.com>
Date:   Fri May 9 15:21:57 2025 +0530

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
    
    Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
    Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch 3e019cc3eaffcb7022b9de66871eabdefd6e06ff drm-intel
0a7028127a7c drm/xe/hwmon: Add support to manage power limits though mailbox
f529bf96c402 drm/xe/hwmon: Move card reactive critical power under channel card
13dbc2cf27bc drm/xe/hwmon: Add support to manage PL2 though mailbox
ded746eacde9 drm/xe/hwmon: Expose powerX_cap_interval
34c54873f33a drm/xe/hwmon: Read energy status from PMT


