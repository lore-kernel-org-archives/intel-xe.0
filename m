Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE62C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 18:38:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B06510E171;
	Tue, 28 Nov 2023 18:38:52 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 193FA10E171;
 Tue, 28 Nov 2023 18:38:51 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1455BAA3D8;
 Tue, 28 Nov 2023 18:38:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Date: Tue, 28 Nov 2023 18:38:51 -0000
Message-ID: <170119673108.8219.10078694547936736372@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231128154118.2915150-1-badal.nilawar@intel.com>
In-Reply-To: <20231128154118.2915150-1-badal.nilawar@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe/dgfx=3A_Release_mmap_mappings_on_rpm_suspend_=28rev2=29?=
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

Series: drm/xe/dgfx: Release mmap mappings on rpm suspend (rev2)
URL   : https://patchwork.freedesktop.org/series/122860/
State : success

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
commit 4b54330b7cf280336c13fcc3220b0d3a27aeeef8
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Tue Nov 28 21:11:18 2023 +0530

    drm/xe/dgfx: Release mmap mappings on rpm suspend
    
    Release all mmap mappings for all vram objects which are associated
    with userfault such that, while pcie function in D3hot, any access
    to memory mappings will raise a userfault.
    
    Upon userfault, in order to access memory mappings, if graphics
    function is in D3 then runtime resume of dgpu will be triggered to
    transition to D0.
    
    v2:
      - Add lock dep assertion before updating vram_userfault_count (Rodrigo)
      - Avoid iomem check before bo migration check as bo can migrate
        to system memory (Matthew Auld)
    
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Anshuman Gupta <anshuman.gupta@intel.com>
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
+ /mt/dim checkpatch b06c9f366cd09b888be061d23eecffed7139c09b drm-intel
4b54330b7 drm/xe/dgfx: Release mmap mappings on rpm suspend


