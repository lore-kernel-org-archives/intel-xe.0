Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1628DC4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 16:28:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9ADA10E0F4;
	Wed,  6 Dec 2023 16:28:18 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id EAF2710E0F4;
 Wed,  6 Dec 2023 16:28:16 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D7739AA917;
 Wed,  6 Dec 2023 16:28:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Date: Wed, 06 Dec 2023 16:28:16 -0000
Message-ID: <170188009687.26424.15130802002390548501@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231206133421.3295163-1-badal.nilawar@intel.com>
In-Reply-To: <20231206133421.3295163-1-badal.nilawar@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Ha?=
 =?utf-8?q?ndle_mmap_with_D3?=
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

Series: Handle mmap with D3
URL   : https://patchwork.freedesktop.org/series/127432/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 14a69294e56e6f2d275e677b7270af5fa5256fd5
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Wed Dec 6 19:04:21 2023 +0530

    drm/xe/dgfx: Release mmap mappings on rpm suspend
    
    Release all mmap mappings for all vram objects which are associated
    with userfault such that, while pcie function in D3hot, any access
    to memory mappings will raise a userfault.
    
    Upon userfault, in order to access memory mappings, if graphics
    function is in D3 then runtime resume of dgpu will be triggered to
    transition to D0.
    
    Previous commit has blocked the rpm but let's make sure that rpm
    does not get blocked for headed cards(client's parts).
    Above pagefault approach will be  useful for headed cards to save the
    power when display is off and there are active mmap mappings.
    
    v2:
      - Add lock dep assertion before updating vram_userfault_count (Rodrigo)
      - Avoid iomem check before bo migration check as bo can migrate
        to system memory (Matthew Auld)
    v3:
      - Apply pagefault approach for headed cards.
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Anshuman Gupta <anshuman.gupta@intel.com>
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch 9d76164e08c68a3d5d081ff7b07c15a2cadf741a drm-intel
7377d3711 drm/xe/dgfx: Block rpm for active mmap mappings
14a69294e drm/xe/dgfx: Release mmap mappings on rpm suspend
-:83: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#83: FILE: drivers/gpu/drm/xe/xe_bo.c:1176:
+	if (INTEL_DISPLAY_ENABLED(xe) && ret == VM_FAULT_NOPAGE && bo && !bo->vram_userfault_count) {

total: 0 errors, 1 warnings, 0 checks, 178 lines checked


