Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E111EC6FA8F
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 21:39:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB05710E182;
	Wed, 30 Aug 2023 21:39:53 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id A2D6F10E182;
 Wed, 30 Aug 2023 21:39:51 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9F4D3A02F0;
 Wed, 30 Aug 2023 21:39:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chang, Yu bruce" <yu.bruce.chang@intel.com>
Date: Wed, 30 Aug 2023 21:39:51 -0000
Message-ID: <169343159164.15232.16143677536073752646@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230830213403.16127-1-yu.bruce.chang@intel.com>
In-Reply-To: <20230830213403.16127-1-yu.bruce.chang@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Enable_scratch_page_when_page_fault_is_enabled_=28rev4?=
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

Series: drm/xe: Enable scratch page when page fault is enabled (rev4)
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
commit b73321d3650171581209ad22bdc204681ed290c4
Author: Chang, Bruce <yu.bruce.chang@intel.com>
Date:   Wed Aug 30 21:34:02 2023 +0000

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
    v3: correct error handlings.
    
    Cc: Oak Zeng <oak.zeng@intel.com>
    Cc: Brian Welty <brian.welty@intel.com>
    Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
    Cc: Stuart Summers <stuart.summers@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 4b8fbc13f29ca69fe2ce030456fab1b145bc71bc drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


