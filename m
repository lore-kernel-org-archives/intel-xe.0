Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33477D3F095
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 16:43:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC5489612;
	Wed, 28 Jan 2026 16:43:10 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B87D89612;
 Wed, 28 Jan 2026 16:43:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_prefetch_fault_suppor?=
 =?utf-8?q?t_for_Xe3p?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Varun Gupta" <varun.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Jan 2026 16:43:09 -0000
Message-ID: <176961858937.200694.17003730656901859855@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260128091153.25543-1-varun.gupta@intel.com>
In-Reply-To: <20260128091153.25543-1-varun.gupta@intel.com>
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

Series: Add prefetch fault support for Xe3p
URL   : https://patchwork.freedesktop.org/series/160745/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 89b0d254a0c3394db300d4cf968c5aaca438276a
Author: Varun Gupta <varun.gupta@intel.com>
Date:   Wed Jan 28 14:41:53 2026 +0530

    drm/xe: Add prefetch fault support for Xe3p
    
    Xe3p hardware prefetches memory ranges and notifies software via an
    additional bit (bit 11) in the page fault descriptor that the fault
    was caused by prefetch.
    
    Extract the prefetch bit from the fault descriptor and echo it in the
    response (bit 6) only when the page fault handling fails. This allows
    the HW to suppress CAT errors for unsuccessful prefetch faults.
    
    For prefetch faults that fail, increment stats counter without verbose
    logging to avoid spamming the log. Clear the prefetch bit on successful
    handling so it's not echoed in the response.
    
    Based on original patches by Brian Welty <brian.welty@intel.com> and
    Priyanka Dandamudi <priyanka.dandamudi@intel.com>.
    
    Bspec: 59311
    Originally-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Varun Gupta <varun.gupta@intel.com>
+ /mt/dim checkpatch 8059f097e25f736bb3da09af6a9b283079abfd4f drm-intel
6901f6ad6fb8 drm/xe: Add counter for invalid prefetch pagefaults
-:9: WARNING:BAD_SIGN_OFF: Non-standard signature: Originally-by:
#9: 
Originally-by: Lucas De Marchi <lucas.demarchi@intel.com>

total: 0 errors, 1 warnings, 0 checks, 14 lines checked
89b0d254a0c3 drm/xe: Add prefetch fault support for Xe3p
-:22: WARNING:BAD_SIGN_OFF: Non-standard signature: Originally-by:
#22: 
Originally-by: Lucas De Marchi <lucas.demarchi@intel.com>

-:83: WARNING:BRACES: braces {} are not necessary for any arm of this statement
#83: FILE: drivers/gpu/drm/xe/xe_pagefault.c:262:
+			if (!pf.consumer.prefetch) {
[...]
+			} else {
[...]

-:86: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#86: FILE: drivers/gpu/drm/xe/xe_pagefault.c:265:
+				xe_gt_stats_incr(pf.gt, XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT, 1);

total: 0 errors, 3 warnings, 0 checks, 68 lines checked


