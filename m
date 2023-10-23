Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B6BC004C0
	for <intel-xe@archiver.kernel.org>; Mon, 23 Oct 2023 16:53:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 380FB10E15B;
	Mon, 23 Oct 2023 16:53:14 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0D70F10E15B;
 Mon, 23 Oct 2023 16:53:12 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 0C062A7DFF;
 Mon, 23 Oct 2023 16:53:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Welty, Brian" <brian.welty@intel.com>
Date: Mon, 23 Oct 2023 16:53:12 -0000
Message-ID: <169807999204.19839.6380551230111185325@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231019173343.17987-1-brian.welty@intel.com>
In-Reply-To: <20231019173343.17987-1-brian.welty@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_fi?=
 =?utf-8?q?xup!_drm/xe=3A_Convert_pagefaulting_code_to_use_drm=5Fexec?=
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

Series: fixup! drm/xe: Convert pagefaulting code to use drm_exec
URL   : https://patchwork.freedesktop.org/series/125357/
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
commit f5e97a2363f9a84fe28d78185b1d78deab011457
Author: Brian Welty <brian.welty@intel.com>
Date:   Thu Oct 19 10:33:43 2023 -0700

    fixup! drm/xe: Convert pagefaulting code to use drm_exec
    
    Remove unneeded num_shared argument to xe_pf_begin().
    Per discussion w/ Matthew Brost, we request to preallocate 2 fence slots
    from xe_vm_prepare_vma() for binding and potential move.
    This should be hardcoded to 2, and not use tile_count which just happens
    to be correct on PVC platform.
    
    Signed-off-by: Brian Welty <brian.welty@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch a0a80950176b39dbc76f8faa92fddf6caaa06191 drm-intel
f5e97a236 fixup! drm/xe: Convert pagefaulting code to use drm_exec


