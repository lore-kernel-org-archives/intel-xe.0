Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D23EE7717D
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 23:33:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C74210E58B;
	Mon,  9 Dec 2024 23:33:57 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B6110E360;
 Mon,  9 Dec 2024 23:33:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_reg=5Fsr/whitelist_fixes_?=
 =?utf-8?q?and_refactors_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Dec 2024 23:33:56 -0000
Message-ID: <173378723679.637196.8853890414948571809@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241209232739.147417-1-lucas.demarchi@intel.com>
In-Reply-To: <20241209232739.147417-1-lucas.demarchi@intel.com>
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

Series: reg_sr/whitelist fixes and refactors (rev2)
URL   : https://patchwork.freedesktop.org/series/142195/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1df3f61cedb7bf72904716f9850454acb8b98396
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Mon Dec 9 15:27:39 2024 -0800

    drm/xe: Apply whitelist to engine save-restore
    
    Instead of handling the whitelist directly in the GuC ADS
    initialization, make it follow the same logic as other engine registers
    that are save-restored. Main benefit is that then the SW tracking then
    shows it in debugfs and there's no risk of an engine workaround to write
    to the same nopriv register that is being passed directly to GuC.
    
    This means that xe_reg_whitelist_process_engine() only has to process
    the RTP and convert them to entries for the hwe.  With that all the
    registers should be covered by xe_reg_sr_apply_mmio() to write to the HW
    and there's no special handling in GuC ADS to also add these registers
    to the list of registers that is passed to GuC.
    
    Example for DG2:
    
            # cat  /sys/kernel/debug/dri/0000\:03\:00.0/gt0/register-save-restore
            ...
            Engine
            rcs0
                    ...
                    REG[0x24d0] clr=0xffffffff set=0x1000dafc masked=no mcr=no
                    REG[0x24d4] clr=0xffffffff set=0x1000db01 masked=no mcr=no
                    REG[0x24d8] clr=0xffffffff set=0x0000db1c masked=no mcr=no
            ...
            Whitelist
            rcs0
                    REG[0xdafc-0xdaff]: allow read access
                    REG[0xdb00-0xdb1f]: allow read access
                    REG[0xdb1c-0xdb1f]: allow rw access
    
    v2:
      - Use ~0u for clr bits so it's just a write (Matt Roper)
      - Simplify helpers now that unused slots are not written
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 9d12021e081c72b18c31bda175fb9a43f1d005fc drm-intel
d34d6936d35c drm/xe/reg_sr: Remove register pool
fc4e15c17fd3 drm/xe: Introduce xe_gt_dbg_printer()
40d6a7a793ab drm/xe/reg_sr: Convert whitelist to gt logging
6face06f66e6 drm/xe/reg_sr: Stop setting all whitelist slots
1df3f61cedb7 drm/xe: Apply whitelist to engine save-restore


