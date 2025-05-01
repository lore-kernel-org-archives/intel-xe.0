Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715FCC369DC
	for <intel-xe@archiver.kernel.org>; Thu,  1 May 2025 01:29:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C49210E819;
	Thu,  1 May 2025 01:29:57 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD57F10E812;
 Thu,  1 May 2025 01:29:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_fix_devcoredump?=
 =?utf-8?q?_chunk_alignmnent_calculation_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 01 May 2025 01:29:55 -0000
Message-ID: <174606299591.31955.4636438027085538700@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250501012545.1045247-1-matthew.brost@intel.com>
In-Reply-To: <20250501012545.1045247-1-matthew.brost@intel.com>
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

Series: drm/xe: fix devcoredump chunk alignmnent calculation (rev2)
URL   : https://patchwork.freedesktop.org/series/148393/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8d34d415374ef089dc754c8176c381e64b4e9be1
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Wed Apr 30 18:25:45 2025 -0700

    drm/xe: fix devcoredump chunk alignmnent calculation
    
    The device core dumps are copied in 1.5GB chunks, which leads to a
    link-time error on 32-bit builds because of the 64-bit division not
    getting trivially turned into mask and shift operations:
    
    ERROR: modpost: "__moddi3" [drivers/gpu/drm/xe/xe.ko] undefined!
    
    On top of this, I noticed that the ALIGN_DOWN() usage here cannot
    work because that is only defined for power-of-two alignments.
    Change ALIGN_DOWN into an explicit div_u64_rem() that avoids the
    link error and hopefully produces the right results.
    
    Doing a 1.5GB kvmalloc() does seem a bit suspicious as well, e.g.
    this will clearly fail on any 32-bit platform and is also likely
    to run out of memory on 64-bit systems under memory pressure, so
    using a much smaller power-of-two chunk size might be a good idea
    instead.
    
    v2:
     - Always call div_u64_rem (Matt)
    
    Reported-by: kernel test robot <lkp@intel.com>
    Closes:  https://lore.kernel.org/oe-kbuild-all/202504251238.JsNgFeFc-lkp@intel.com/
    Fixes: c4a2e5f865b7 ("drm/xe: Add devcoredump chunking")
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 16612b54f368e7a6a1a170d3f2ecb1fd005ae55c drm-intel
8d34d415374e drm/xe: fix devcoredump chunk alignmnent calculation


