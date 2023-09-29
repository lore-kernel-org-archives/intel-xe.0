Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2EDE743F7
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 08:33:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9688B10E6CC;
	Fri, 29 Sep 2023 08:33:31 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id E3CA910E6CC;
 Fri, 29 Sep 2023 08:33:28 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E268CAADD6;
 Fri, 29 Sep 2023 08:33:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Fri, 29 Sep 2023 08:33:28 -0000
Message-ID: <169597640892.19499.13402858686218303728@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230929062420.394375-1-tejas.upadhyay@intel.com>
In-Reply-To: <20230929062420.394375-1-tejas.upadhyay@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Count_and_report_low_level_driver_errors_=28rev6=29?=
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

Series: drm/xe: Count and report low level driver errors (rev6)
URL   : https://patchwork.freedesktop.org/series/124026/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3819121eb03b39a570c6d222258ed27bb2cf99cd
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Fri Sep 29 11:54:20 2023 +0530

    drm/xe: Update counter for low level driver errors
    
    we added a low level driver error counter and incrementing on
    each occurrance. Focus is on errors that are not functionally
    affecting the system and might otherwise go unnoticed and cause
    power/performance regressions, so checking for the error
    counters should help.
    
    Importantly the intention is not to go adding new error checks,
    but to make sure the existing important error conditions are
    propagated in terms of counter under respective categories like
    below :
    Under GT:
    driver_gt_guc_communication,
    driver_gt_other_engine,
    driver_gt_other
    
    Under Tile:
    driver_ggtt,
    driver_interrupt
    
    TODO: Currently this is just a counting of errors, later these
    counters will be reported through netlink interface when it is
    implemented and ready.
    
    V5:
      - Dump err_type in string format
    V4:
      - dump err_type in drm_err log - Himal
    V2:
      - Use modified APIs
    
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch 9a795b4f0ebe6bf70b1c873e323c3e0e7e113c64 drm-intel
35fe39a20 drm/xe: Introduce low level driver error counting APIs
3819121eb drm/xe: Update counter for low level driver errors


