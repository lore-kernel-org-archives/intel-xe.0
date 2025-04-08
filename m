Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8421BC369A1
	for <intel-xe@archiver.kernel.org>; Tue,  8 Apr 2025 06:46:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A6510E5D8;
	Tue,  8 Apr 2025 06:46:18 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B897910E5D8;
 Tue,  8 Apr 2025 06:46:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Revert_=22panel/auo-a030j?=
 =?utf-8?q?tn01=3A_Use_refcounted_allocation_in_place_of_devm=5Fkzalloc=28?=
 =?utf-8?q?=29=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Apr 2025 06:46:17 -0000
Message-ID: <174409477775.46296.13525132199210602133@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250408062524.1825048-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20250408062524.1825048-1-chaitanya.kumar.borah@intel.com>
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

Series: Revert "panel/auo-a030jtn01: Use refcounted allocation in place of devm_kzalloc()"
URL   : https://patchwork.freedesktop.org/series/147371/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ba851f743477ddd0e26aedc57957f5604d53c199
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Date:   Tue Apr 8 11:55:24 2025 +0530

    Revert "panel/auo-a030jtn01: Use refcounted allocation in place of devm_kzalloc()"
    
    This reverts commit 9d7d7c3c9a191864367b28e05b312ab3ac34ef0a.
    
    The patch causes build errors in our CI. Revert it till a fix is found.
    
      CC [M]  drivers/gpu/drm/solomon/ssd130x-spi.o
      CC [M]  drivers/gpu/drm/panel/panel-auo-a030jtn01.o
    drivers/gpu/drm/panel/panel-auo-a030jtn01.c: In function ‘a030jtn01_probe’:
    drivers/gpu/drm/panel/panel-auo-a030jtn01.c:203:9: error: ‘panel’ undeclared (first use in this function)
      203 |         panel = devm_drm_panel_alloc(dev, struct a030jtn01, panel,
          |         ^~~~~
    drivers/gpu/drm/panel/panel-auo-a030jtn01.c:203:9: note: each undeclared identifier is reported only once for each function it appears in
    make[6]: *** [scripts/Makefile.build:203: drivers/gpu/drm/panel/panel-auo-a030jtn01.o] Error 1
    make[5]: *** [scripts/Makefile.build:461: drivers/gpu/drm/panel] Error 2
    make[4]: *** [scripts/Makefile.build:461: drivers/gpu/drm] Error 2
    make[3]: *** [scripts/Makefile.build:461: drivers/gpu] Error 2
    make[2]: *** [scripts/Makefile.build:461: drivers] Error 2
    make[1]: *** [/home/kbuild2/kernel/Makefile:2006: .] Error 2
    make: *** [Makefile:248: __sub-make] Error 2
    
    Link: https://lore.kernel.org/all/Z_P0A9lxWD0aAdjp@ideak-desk.fi.intel.com/
    References: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14039
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
+ /mt/dim checkpatch 6fda8f56691fba89be9c617abcccb7b883938168 drm-intel
ba851f743477 Revert "panel/auo-a030jtn01: Use refcounted allocation in place of devm_kzalloc()"
-:21: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#21: 
make[6]: *** [scripts/Makefile.build:203: drivers/gpu/drm/panel/panel-auo-a030jtn01.o] Error 1

-:30: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#30: 
References: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14039

total: 0 errors, 2 warnings, 0 checks, 22 lines checked


