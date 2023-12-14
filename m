Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F3EC4167D
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 11:41:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05CE910E05D;
	Thu, 14 Dec 2023 11:41:24 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 261B110E05D;
 Thu, 14 Dec 2023 11:41:17 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id EC731AADFA;
 Thu, 14 Dec 2023 11:41:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_vram_freque?=
 =?utf-8?q?ncy_sysfs_attributes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sujaritha Sundaresan" <sujaritha.sundaresan@intel.com>
Date: Thu, 14 Dec 2023 11:41:16 -0000
Message-ID: <170255407696.19956.12586655552510811253@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231214111159.149984-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20231214111159.149984-1-sujaritha.sundaresan@intel.com>
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

Series: drm/xe: Add vram frequency sysfs attributes
URL   : https://patchwork.freedesktop.org/series/127800/
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
commit 5f292552a2f6d4de13e2cdbf440081acf42c3926
Author: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Date:   Thu Dec 14 16:41:59 2023 +0530

    drm/xe: Add vram frequency sysfs attributes
    
    Add vram frequency sysfs attributes under the below hierarchy;
    
    /device/tile#/freq0
                    |-rp0_freq
                    |-rpn_freq
    
    v2: Drop "vram" from attribute names (Rodrigo)
    
    v3: Add documentation for new sysfs (Riana)
        Drop prefix from XEHP_PCODE_FREQUENCY_CONFIG (Riana)
    
    v4: Create sysfs under tile#/freq0 after removal of
        physical_memsize attrbute
    
    Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
+ /mt/dim checkpatch 5cd1893366708380854f4694ae57417192458a6b drm-intel
5f292552a drm/xe: Add vram frequency sysfs attributes


