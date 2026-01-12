Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57271D2503B
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 06:24:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1678210E2C9;
	Mon, 12 Jan 2026 06:24:16 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6591B10E2C9;
 Mon, 12 Jan 2026 06:24:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_prefetch_pa?=
 =?utf-8?q?gefault_support_for_Xe3p?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Varun Gupta" <varun.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 Jan 2026 06:24:15 -0000
Message-ID: <176819905540.144992.14219297978544911629@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260112061755.1569635-4-varun.gupta@intel.com>
In-Reply-To: <20260112061755.1569635-4-varun.gupta@intel.com>
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

Series: drm/xe: Add prefetch pagefault support for Xe3p
URL   : https://patchwork.freedesktop.org/series/159936/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9f1cb6875f3f9eb0925ed50c16100322a2df513c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b9ebb90636caa6e441623f32be84cc240cc8226e
Author: Varun Gupta <varun.gupta@intel.com>
Date:   Mon Jan 12 11:47:58 2026 +0530

    drm/xe: Add prefetch fault support for Xe3p
    
    Xe3p prefetches memory ranges and it notifies software via an additional
    bit in the page fault descriptor that the fault was caused by prefetch.
    The prefetch bit should only be in the reply if the page fault handling
    was not successful, which allows the HW to avoid generating a CAT error
    for prefetch faults.
    
    Based on original patches by Brian Welty <brian.welty@intel.com> and
    Priyanka Dandamudi <priyanka.dandamudi@intel.com>.
    
    v2: Changed comment wording from "repairs" to "handling" for clarity
        (Matt Roper)
    
    Bspec: 59311
    Originally-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Varun Gupta <varun.gupta@intel.com>
+ /mt/dim checkpatch f339d0352f5f7e023e8ff89bb18291df8dfdad6e drm-intel
299ede45b66e drm/xe: Coalesce pagefault error handling
-:9: WARNING:BAD_SIGN_OFF: Non-standard signature: Originally-by:
#9: 
Originally-by: Lucas De Marchi <lucas.demarchi@intel.com>

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
b9ebb90636ca drm/xe: Add prefetch fault support for Xe3p
-:19: WARNING:BAD_SIGN_OFF: Non-standard signature: Originally-by:
#19: 
Originally-by: Lucas De Marchi <lucas.demarchi@intel.com>

-:133: ERROR:TRAILING_WHITESPACE: trailing whitespace
#133: FILE: drivers/gpu/drm/xe/xe_pagefault_types.h:89:
+^I^I * Echo in response to suppress CAT errors on $

total: 1 errors, 1 warnings, 0 checks, 84 lines checked


