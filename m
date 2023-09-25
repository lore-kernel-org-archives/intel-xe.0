Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B95CE7A94
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 14:18:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F61510E256;
	Mon, 25 Sep 2023 14:18:39 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 633DC10E256;
 Mon, 25 Sep 2023 14:18:38 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 61975AADF1;
 Mon, 25 Sep 2023 14:18:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Mon, 25 Sep 2023 14:18:38 -0000
Message-ID: <169565151839.21533.7995258515292032528@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230925142409.189969-1-tejas.upadhyay@intel.com>
In-Reply-To: <20230925142409.189969-1-tejas.upadhyay@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Count_and_report_low_level_driver_errors_=28rev2=29?=
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

Series: drm/xe: Count and report low level driver errors (rev2)
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
commit e91dce910bf01cbe2400573818e5e6bf831aa6af
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Mon Sep 25 19:54:09 2023 +0530

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
    
    V2:
      - Use modified APIs
    
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch 6378241543c29ce3a7df5828323f1684b4bb19e3 drm-intel
10bacc51c drm/xe: Indroduce low level driver error counting APIs
e91dce910 drm/xe: Update counter for low level driver errors


