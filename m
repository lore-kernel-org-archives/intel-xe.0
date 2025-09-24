Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E89CAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 18:44:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F9D10E7C1;
	Wed, 24 Sep 2025 18:44:56 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733DF10E7C0;
 Wed, 24 Sep 2025 18:44:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Use_poll=5Ftime?=
 =?utf-8?q?out=5Fus=28=29_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Sep 2025 18:44:54 -0000
Message-ID: <175873949446.362669.7174372570362492700@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250922-xe-iopoll-v4-0-06438311a63f@intel.com>
In-Reply-To: <20250922-xe-iopoll-v4-0-06438311a63f@intel.com>
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

Series: drm/xe: Use poll_timeout_us() (rev6)
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
commit 2015478b6a203dbd6504cb181e5a156c1a388b08
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Mon Sep 22 12:58:33 2025 -0700

    drm/xe/guc: Refactor GuC load to use poll_timeout_us()
    
    Currently there are 2 wait loops for loading GuC: one in
    xe_mmio_wait32_not() and one guc_wait_ucode(). Now that there's a
    generic poll_timeout_us(), refactor the code to use that to be more
    readable.
    
    Main change in behavior is that there's no exponential wait anymore:
    that is now replaced by a 10msec retry.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch a4d9163251f4832a7d34d4b59449f9a68b9b7adf drm-intel
e53860a202aa drm/xe/device: Use poll_timeout_us() to wait for lmem
812c905e7819 drm/xe/guc_pc: Use poll_timeout_us() for waiting
664899dd8d8b drm/xe/guc: Drop helper to read freq
-:61: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#61: FILE: drivers/gpu/drm/xe/xe_guc.c:1166:
+			  delta_ms, xe_guc_pc_get_act_freq(guc_pc), xe_guc_pc_get_cur_freq_fw(guc_pc),

total: 0 errors, 1 warnings, 0 checks, 43 lines checked
6a3e625181af drm/xe/guc: Extract function to print load error
2015478b6a20 drm/xe/guc: Refactor GuC load to use poll_timeout_us()


