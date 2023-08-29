Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50D7C6FA8F
	for <intel-xe@archiver.kernel.org>; Tue, 29 Aug 2023 23:19:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310D010E4A1;
	Tue, 29 Aug 2023 23:19:40 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id CFFA110E4A1;
 Tue, 29 Aug 2023 23:19:38 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CC129AADDD;
 Tue, 29 Aug 2023 23:19:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chang, Bruce" <yu.bruce.chang@intel.com>
Date: Tue, 29 Aug 2023 23:19:38 -0000
Message-ID: <169335117883.16746.9587448964781964484@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230829231648.4438-1-yu.bruce.chang@intel.com>
In-Reply-To: <20230829231648.4438-1-yu.bruce.chang@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Enable_scratch_page_when_page_fault_is_enabled_=28rev3?=
 =?utf-8?q?=29?=
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

Series: drm/xe: Enable scratch page when page fault is enabled (rev3)
URL   : https://patchwork.freedesktop.org/series/120480/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e700ea2f248a75138759bcb443affeef4a2d1991
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 56b21602b625d9f87ac414b48ecb136a6402250f
Author: Chang, Bruce <yu.bruce.chang@intel.com>
Date:   Tue Aug 29 23:16:48 2023 +0000

    drm/xe: Enable scratch page when page fault is enabled
    
    The PVC HW has a limitation that the page fault due to invalid access
    will halt the corresponding EUs. So, in order to activate the debugger,
    kmd needs to setup the scratch pages to unhalt the EUs.
    
    This feature can only be enabled if scratch flag is set per VM. So, once
    EU debugger is running, the debugger umd will set the scratch flag,
    otherwise, this flag should not be set. So, in regular run, this feature
    will not be activated.
    
    The idea is to bind a scratch vma if the page fault is from an
    invalid access. This patch is taking advantage of null pte.
    After the bind, the user app can continue to run without causing a
    fatal failure or reset and stop.
    
    In case the app will bind this scratch vma to a valid address, GPUVA
    handles all of this (e.g. it will create ops to unbind the old
    VMA, bind the new one).
    
    This patch only kicks in when there is a failure for both page fault
    and bind, so it should have no impact to regular code path. On
    another hand, it uses actual page tables instead of special scratch
    page tables, so it may not require to invalidate TLBs when doing
    unbind if all upper layer page tables are still being used.
    
    tested on new scratch igt tests which will be sent out for review.
    
    v2: per Matt's suggestion, remove the scratch page unbind.
    
    Cc: Oak Zeng <oak.zeng@intel.com>
    Cc: Brian Welty <brian.welty@intel.com>
    Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
    Cc: Stuart Summers <stuart.summers@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 7af4e65956a8d0346547567b534d49acf30085e0 drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


