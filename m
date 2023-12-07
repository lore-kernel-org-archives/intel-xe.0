Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256C9C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 23:11:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E86E310E0D5;
	Thu,  7 Dec 2023 23:11:35 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id BC37610E0D5;
 Thu,  7 Dec 2023 23:11:33 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id B8FAFAADD5;
 Thu,  7 Dec 2023 23:11:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_memory_sysfs_director?=
 =?utf-8?q?y_and_attributes_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sujaritha Sundaresan" <sujaritha.sundaresan@intel.com>
Date: Thu, 07 Dec 2023 23:11:33 -0000
Message-ID: <170199069375.28721.14154955362440474789@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231207151739.1241374-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20231207151739.1241374-1-sujaritha.sundaresan@intel.com>
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

Series: Add memory sysfs directory and attributes (rev3)
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
commit 6e4eee09d997b402e1a3c4482407e37bee202e83
Author: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Date:   Thu Dec 7 20:47:39 2023 +0530

    drm/xe: Add vram frequency sysfs attributes
    
    Add vram frequency sysfs attributes under the below hierarchy;
    
    /device/tile<n>/memory/freq
                            |-rp0_freq
                            |-rpn_freq
    
    v2: Drop "vram" from attribute names (Rodrigo)
    
    v3: Add documentation for new sysfs (Riana)
        Drop prefix from XEHP_PCODE_FREQUENCY_CONFIG (Riana)
    
    Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
+ /mt/dim checkpatch 2fb92bd630cfa05b0c63fb268f0f5ebce08cce54 drm-intel
929776c11 drm/xe: Add a new memory directory under tile
-:62: WARNING:BRACES: braces {} are not necessary for single statement blocks
#62: FILE: drivers/gpu/drm/xe/xe_tile_sysfs.c:72:
+	if (!kobj) {
+		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
+	}

total: 0 errors, 1 warnings, 0 checks, 47 lines checked
6e4eee09d drm/xe: Add vram frequency sysfs attributes
-:60: WARNING:LONG_LINE_COMMENT: line length of 101 exceeds 100 columns
#60: FILE: drivers/gpu/drm/xe/xe_tile_sysfs.c:24:
+ * device/tile#/memory/freq/rp0_freq - The Render Performance (RP) 0 level, which is the maximum one.

-:61: WARNING:LONG_LINE_COMMENT: line length of 101 exceeds 100 columns
#61: FILE: drivers/gpu/drm/xe/xe_tile_sysfs.c:25:
+ * device/tile#/memory/freq/rpn_freq - The Render Performance (RP) N level, which is the minimal one.

total: 0 errors, 2 warnings, 0 checks, 117 lines checked


