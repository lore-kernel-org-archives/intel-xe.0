Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D9DCA0FED
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 16:08:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B512510E7AF;
	Tue,  9 Sep 2025 16:08:07 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3285C10E7AF;
 Tue,  9 Sep 2025 16:08:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Use_poll=5Ftime?=
 =?utf-8?q?out=5Fus=28=29_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Sep 2025 16:08:07 -0000
Message-ID: <175743408720.318924.9979207919932137743@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250909-xe-iopoll-v2-0-4c7ae9726e8e@intel.com>
In-Reply-To: <20250909-xe-iopoll-v2-0-4c7ae9726e8e@intel.com>
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

Series: drm/xe: Use poll_timeout_us() (rev3)
URL   : https://patchwork.freedesktop.org/series/153671/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 35a5bacded599e1b725d4a5088e55124b624964f
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Tue Sep 9 09:02:38 2025 -0700

    drm/xe/guc: Refactor GuC load to use poll_timeout_us()
    
    Currently there are 2 wait loops for loading GuC: one in
    xe_mmio_wait32_not() and one guc_wait_ucode(). Now that there's a
    generic poll_timeout_us(), refactor the code to use that and be more
    readable.
    
    Main change in behavior is that there's no exponential wait anymore:
    that is now replaced by a 10msec retry.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 1fb3cbc03a96e88d351cad925b63edb16a5768ee drm-intel
c817e360177d drm/xe/device: Use poll_timeout_us() to wait for lmem
0aaddcdac160 drm/xe/guc_pc: Use poll_timeout_us() for waiting
a8661f7e0943 drm/xe/guc: Drop helper to read freq
-:60: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#60: FILE: drivers/gpu/drm/xe/xe_guc.c:1168:
+			  delta_ms, xe_guc_pc_get_act_freq(guc_pc), xe_guc_pc_get_cur_freq_fw(guc_pc),

total: 0 errors, 1 warnings, 0 checks, 43 lines checked
35a5bacded59 drm/xe/guc: Refactor GuC load to use poll_timeout_us()


