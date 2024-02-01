Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C8FC4828D
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 23:22:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB1C810ECD8;
	Thu,  1 Feb 2024 23:22:05 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A050310EC12;
 Thu,  1 Feb 2024 23:22:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Improve_error_path_handli?=
 =?utf-8?q?ng_for_firmware_loading?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 01 Feb 2024 23:22:04 -0000
Message-ID: <170682972466.897305.1278497096411802462@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240201224724.551130-1-lucas.demarchi@intel.com>
In-Reply-To: <20240201224724.551130-1-lucas.demarchi@intel.com>
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

Series: Improve error path handling for firmware loading
URL   : https://patchwork.freedesktop.org/series/129443/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1bb25f6953ff760bd0e6bcc2937aca5e070d8902
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Thu Feb 1 14:47:24 2024 -0800

    drm/xe: Avoid crypt message when there's no GuC definition
    
    If there's no GuC firmware entry in the table and the user didn't pass
    an override path, the error message is very crypt: xe will simply try to
    continue and then fail when submitting the default context:
    
            xe 0000:00:02.0: [drm:xe_pci_probe [xe]] XE_LUNARLAKE  64b0:0001 dgfx:0 gfx:Xe2_LPG (20.04) media:Xe2_LPM (20.00) display:no dma_m_s:46 tc:1 gscfi:0
            ...
            xe: probe of 0000:00:02.0 failed with error -22
    
    Add an explicit error message and bail out:
    
            xe 0000:00:02.0: [drm:xe_pci_probe [xe]] XE_LUNARLAKE  64b0:0001 dgfx:0 gfx:Xe2_LPG (20.04) media:Xe2_LPM (20.00) display:no dma_m_s:46 tc:1 gscfi:0
            xe 0000:00:02.0: [drm] *ERROR* No GuC firmware defined for platform
            xe 0000:00:02.0: [drm] *ERROR* GuC init failed with -2
            ...
            xe: probe of 0000:00:02.0 failed with error -2
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 18a9fefd9e05291cbe792d358bbdc04dc6d21adb drm-intel
619d06a23 drm/xe: Always allow to override firmware
1bb25f695 drm/xe: Avoid crypt message when there's no GuC definition
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
	xe 0000:00:02.0: [drm:xe_pci_probe [xe]] XE_LUNARLAKE  64b0:0001 dgfx:0 gfx:Xe2_LPG (20.04) media:Xe2_LPM (20.00) display:no dma_m_s:46 tc:1 gscfi:0

total: 0 errors, 1 warnings, 0 checks, 14 lines checked


