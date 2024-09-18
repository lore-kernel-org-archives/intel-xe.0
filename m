Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D9FCDD54F
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 19:13:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C135E10E626;
	Wed, 18 Sep 2024 19:13:12 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 243A710E626;
 Wed, 18 Sep 2024 19:13:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/debugfs=3A_Display?=
 =?utf-8?q?_gpuva_info_in_debugfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Sep 2024 19:13:11 -0000
Message-ID: <172668679114.1027297.16797235103466962963@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240918164545.3955824-1-oak.zeng@intel.com>
In-Reply-To: <20240918164545.3955824-1-oak.zeng@intel.com>
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

Series: drm/xe/debugfs: Display gpuva info in debugfs
URL   : https://patchwork.freedesktop.org/series/138834/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3aa8f80ee39eec3a3b1d95c47ccd32bcacf03834
Author: Oak Zeng <oak.zeng@intel.com>
Date:   Wed Sep 18 12:45:45 2024 -0400

    drm/xe/debugfs: Display gpuva info in debugfs
    
    Add debugfs entry to display all the gpuva that is bound to the
    device. This is done by walking all the VMs created for each device
    process, and display va information of each VM. This is useful for
    gpuvm debugging. With this change, user can display gpuva info
    as below:
    
    root@DUT7279PVC:/home/gta# cat /sys/kernel/debug/dri/0/gpuvas
    Process "your process name" GPU VA space
    DRM GPU VA space (Xe VM) [0x0000000000000000;0x0200000000000000]
    Kernel reserved node [0x0000000000000000;0x0000000000000000]
    
     VAs | start              | range              | end                | object             | object offset
    -------------------------------------------------------------------------------------------------------------
         | 0x0000000000000000 | 0x00007ffff5db7000 | 0x00007ffff5db7000 | 0x0000000000000000 | 0x0000000000000000
         | 0x00007ffff5db7000 | 0x0000000000001000 | 0x00007ffff5db8000 | 0x0000000000000000 | 0x00007ffff5db7000
         | 0x00007ffff5db8000 | 0x00ff80000a248000 | 0x0100000000000000 | 0x0000000000000000 | 0x0000000000000000
    
    Signed-off-by: Oak Zeng <oak.zeng@intel.com>
+ /mt/dim checkpatch 15aeb2cced25e1bfa15f1aa538247d79cf8b0a05 drm-intel
3aa8f80ee39e drm/xe/debugfs: Display gpuva info in debugfs
-:17: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#17: 
 VAs | start              | range              | end                | object             | object offset

total: 0 errors, 1 warnings, 0 checks, 59 lines checked


