Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BEFBC47422
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 12:17:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B6BB10EFA0;
	Mon, 29 Jan 2024 12:17:02 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7775B10F159;
 Mon, 29 Jan 2024 12:17:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Introduce_and_u?=
 =?utf-8?q?pdate_counter_for_low_level_driver_errors?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Mon, 29 Jan 2024 12:17:00 -0000
Message-ID: <170653062048.790843.8949376743025524564@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240129115924.2016519-1-tejas.upadhyay@intel.com>
In-Reply-To: <20240129115924.2016519-1-tejas.upadhyay@intel.com>
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

Series: drm/xe: Introduce and update counter for low level driver errors
URL   : https://patchwork.freedesktop.org/series/129266/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2d919ac662b2798c053d68d1cc16b758c61b55ca
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit fdf1ad33b8f337b30086fed9d96fcde55fac7dbc
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Mon Jan 29 17:29:24 2024 +0530

    drm/xe: Introduce and update counter for low level driver errors
    
    Introduce low level driver error counter and incrementing on
    each occurrence. Focus is on errors that are not functionally
    affecting the system and might otherwise go unnoticed and cause
    power/performance regressions, so checking for the error
    counters should help.
    
    Importantly the intention is not to go adding new error checks,
    but to make sure the existing important error conditions are
    propagated in terms of counter under respective categories like
    below :
    - GT
      - GUC COMMUNICATION
      - ENGINE OTHER
      - GT OTHER
    
    - Tile
      - GTT
      - INTERRUPT
    
    Currently this is just a counting of errors, later these
    counters will be reported through netlink interface when it is
    implemented and ready.
    
    V12:
      - Rebase and respin on top of Matt's GuC CT stats change
      - Do not report error when CT stat is cancelled
    V11:
      - Unify tlb invalidation timeout errs - Michal
      - Improve kernel doc comments - Michal
      - Improve logging output message - Michal
    V10:
      - Report and count errors from common place i.e caller - Michal
      - Fixed some minor nits - Michal
    V9:
      - Make one patch for API and counter update - Michal
      - Remove counter from places where driver load will fail - Michal
      - Remove extra \n from logging
      - Improve commit message - Aravind/Michal
    V8:
      - Correct missed ret value handling
    V7:
      - removed double couting of err - Michal
    V6:
      - move drm_err to gt and tile specific err API - Aravind
      - Use GTT naming instead of GGTT - Aravind/Niranjana
    V5:
      - Dump err_type in string format
    V4:
      - dump err_type in drm_err log - Himal
    V2:
      - Use modified APIs
    
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch a0325b172ae7077c52b074d9b531f4e3aa585d82 drm-intel
fdf1ad33b drm/xe: Introduce and update counter for low level driver errors


