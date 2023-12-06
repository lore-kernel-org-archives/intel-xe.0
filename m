Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F33C10DC1
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 09:46:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C52110E682;
	Wed,  6 Dec 2023 09:46:40 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0DD4A10E6DB;
 Wed,  6 Dec 2023 09:46:39 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 0A343AADD1;
 Wed,  6 Dec 2023 09:46:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
Date: Wed, 06 Dec 2023 09:46:39 -0000
Message-ID: <170185599903.26423.15431750662251239942@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231206044735.966213-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20231206044735.966213-1-sujaritha.sundaresan@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Ad?=
 =?utf-8?q?d_memory_sysfs_directory_and_attributes_=28rev2=29?=
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

Series: Add memory sysfs directory and attributes (rev2)
URL   : https://patchwork.freedesktop.org/series/126871/
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
commit 20aacf3b455f7eb5f8d7e7611e501cf72699d030
Author: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Date:   Wed Dec 6 10:17:35 2023 +0530

    drm/xe: Add vram frequency sysfs attributes
    
    Add vram frequency sysfs attributes under the below hierarchy;
    
    /device/tile<n>/memory/freq
                            |-rp0_freq
                            |-rpn_freq
    
    v2: Drop "vram" from attribute names (Rodrigo)
    
    Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
+ /mt/dim checkpatch 9d76164e08c68a3d5d081ff7b07c15a2cadf741a drm-intel
2662196a5 drm/xe: Add a new memory directory under tile
20aacf3b4 drm/xe: Add vram frequency sysfs attributes
-:59: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#59: FILE: drivers/gpu/drm/xe/xe_tile_sysfs.c:44:
+static ssize_t rp0_freq_show(struct device *kdev, struct device_attribute *attr,
+				  char *buf)

-:83: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#83: FILE: drivers/gpu/drm/xe/xe_tile_sysfs.c:68:
+static ssize_t rpn_freq_show(struct device *kdev, struct device_attribute *attr,
+				  char *buf)

total: 0 errors, 0 warnings, 2 checks, 107 lines checked


