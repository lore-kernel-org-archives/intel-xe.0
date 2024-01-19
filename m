Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DCEC47DAF
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 14:16:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A6D10E993;
	Fri, 19 Jan 2024 14:16:15 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C8910E0A4;
 Fri, 19 Jan 2024 14:16:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Revert_=22drm/xe/uc=3A_St?=
 =?utf-8?q?ore_firmware_binary_in_system-memory_backed_BO=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Fri, 19 Jan 2024 14:16:14 -0000
Message-ID: <170567377486.592636.4602308453513670914@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240119132548.404243-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240119132548.404243-1-rodrigo.vivi@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: Revert "drm/xe/uc: Store firmware binary in system-memory backed BO"
URL   : https://patchwork.freedesktop.org/series/128981/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e7f730565356938dd6c63cd498218fdc5d6a22b0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 447f64d901ff32c29e0d47a994910e9cb2b7d785
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Fri Jan 19 08:25:48 2024 -0500

    Revert "drm/xe/uc: Store firmware binary in system-memory backed BO"
    
    This reverts commit 48cd5ebcb645ac1bd48480cf11dced902108d306.
    
    This is breaking the GuC load after suspend cycles where the
    power was lost such as s3 and d3cold on DGFX.
    
    xe 0000:03:00.0: [drm] GuC load failed: status = 0x400000A0
    xe 0000:03:00.0: [drm] GuC load failed: status: Reset = 0,
       BootROM = 0x50, UKernel = 0x00, MIA = 0x00, Auth = 0x01
    
    Currently our suspend/resume flows only evict and restore the BOs
    living in the VRAM itself since the system memory power won't be
    lost. However, it seems that we might lose the PTEs for those
    entries. While we don't have that in place, let's ensure that we
    keep uc images in VRAM if possible.
    
    Also another concern is the impact in the resume latency of
    this case. So I wonder that if we end up moving this
    uc_fw_copy to an earlier stage where LMEM is really not yet
    available, maybe we need to later switch the uc_fw->bo to
    a VRAM for the final access and better resume times.
    
    Cc: Michał Winiarski <michal.winiarski@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 873aee20af09054189670092b2d6fe03824777b5 drm-intel
447f64d90 Revert "drm/xe/uc: Store firmware binary in system-memory backed BO"
-:10: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '48cd5ebcb645ac1bd48480cf11dced902108d306', maybe rebased or not pulled?
#10: 
This reverts commit 48cd5ebcb645ac1bd48480cf11dced902108d306.

total: 0 errors, 1 warnings, 0 checks, 16 lines checked


