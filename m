Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FAC7C0219E
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 23:53:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A2810E401;
	Mon, 10 Feb 2025 23:53:31 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9CA10E401;
 Mon, 10 Feb 2025 23:53:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/pf=3A_Release_all_?=
 =?utf-8?q?VFs_configs_on_device_removal?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Feb 2025 23:53:29 -0000
Message-ID: <173923160951.547860.9770394869497521849@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250210225944.984-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250210225944.984-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/pf: Release all VFs configs on device removal
URL   : https://patchwork.freedesktop.org/series/144628/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 829763b6e7d53f927f4b61942f84ab35475ea0c0
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Mon Feb 10 23:59:44 2025 +0100

    drm/xe/pf: Release all VFs configs on device removal
    
    If we try to manually provision VFs using debugfs and then we
    try to unload the driver, we will see complains like:
    
     [ ] Memory manager not clean during takedown.
     [ ] RIP: 0010:drm_mm_takedown+0x3f/0x100
     [ ] [drm:drm_mm_takedown] *ERROR* node [fedff000 + 00001000]: inserted at
          drm_mm_insert_node_in_range+0x2bd/0x520
          xe_ggtt_node_insert+0x52/0x90 [xe]
          pf_provision_vf_ggtt+0x1fa/0xac0 [xe]
          xe_gt_sriov_pf_config_set_ggtt+0x79/0x7a0 [xe]
          ggtt_set+0x53/0x80 [xe]
          simple_attr_write_xsigned.isra.0+0xd2/0x150
          simple_attr_write+0x14/0x30
          debugfs_attr_write+0x4e/0x80
    
     [ ] xe 0000:00:02.0: [drm] *ERROR* GT0: GUC ID manager unclean (1/65535)
     [ ] xe 0000:00:02.0: [drm] GT0:      total 65535
     [ ] xe 0000:00:02.0: [drm] GT0:      used 1
     [ ] xe 0000:00:02.0: [drm] GT0:      range 65534..65534 (1)
    
     [ ] xe 0000:00:02.0: [drm] *ERROR* GT0: GuC doorbells manager unclean (1/256)
     [ ] xe 0000:00:02.0: [drm] GT0:      count: 256
     [ ] xe 0000:00:02.0: [drm] GT0:      available range: 1..255 (255)
     [ ] xe 0000:00:02.0: [drm] GT0:      available total: 255
     [ ] xe 0000:00:02.0: [drm] GT0:      reserved range: 0..0 (1)
     [ ] xe 0000:00:02.0: [drm] GT0:      reserved total: 1
    
    This could be easily fixed by adding config release action.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 2fc58ab10139895686001c7e1ee247f15226abc4 drm-intel
829763b6e7d5 drm/xe/pf: Release all VFs configs on device removal
-:26: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#26: 
 [ ] xe 0000:00:02.0: [drm] *ERROR* GT0: GuC doorbells manager unclean (1/256)

total: 0 errors, 1 warnings, 0 checks, 50 lines checked


