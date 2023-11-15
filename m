Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670F3C4332F
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 01:36:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3623D10E23C;
	Wed, 15 Nov 2023 01:36:54 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1BC7810E23C;
 Wed, 15 Nov 2023 01:36:53 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 19572A47E9;
 Wed, 15 Nov 2023 01:36:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Brian Welty" <brian.welty@intel.com>
Date: Wed, 15 Nov 2023 01:36:53 -0000
Message-ID: <170001221310.647.13243450794646558203@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231115005611.29266-1-brian.welty@intel.com>
In-Reply-To: <20231115005611.29266-1-brian.welty@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Extend_scratch_page_support_to_fault_mode?=
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

Series: drm/xe: Extend scratch page support to fault mode
URL   : https://patchwork.freedesktop.org/series/126435/
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
commit 13b46fae87a22e29fcc47ccecbe86fa522a3c8c5
Author: Brian Welty <brian.welty@intel.com>
Date:   Tue Nov 14 16:56:11 2023 -0800

    drm/xe: Extend scratch page support to fault mode
    
    The PVC HW has a limitation that the page fault due to invalid access
    will halt the corresponding EUs. So, in order to activate the debugger,
    kmd needs to setup the scratch pages to unhalt the EUs.
    
    This feature can only be enabled if scratch flag is set per VM during
    VM_CREATE. For use with EU debugger, the debugger umd will set the flag.
    
    The idea is to bind a scratch vma if the page fault is from an invalid
    access. This patch is taking advantage of null pte. After the bind, the
    user application can continue to run without causing a GPU hang or reset.
    
    In case the app will bind this scratch vma to a valid address, GPUVA
    handles all of this (e.g. it will create ops to unbind the old VMA and
    bind the new one).
    Future optimization: as we use null pte, it may not require to invalidate
    TLBs when doing unbind if all upper layer page tables are unmodified.
    
    v2: per Matt's suggestion, remove the scratch page unbind.
    v3: correct error handlings.
    v4: add test for XE_VM_FLAG_64K, and ALIGN_DOWN the address
    
    Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
    Reviewed-by: Brian Welty <brian.welty@intel.com>
    Acked-by: Stuart Summers <stuart.summers@intel.com>
    Signed-off-by: Brian Welty <brian.welty@intel.com>
+ /mt/dim checkpatch 2fe82053d916d09ffcc92bc27294c9eed4e4804b drm-intel
13b46fae8 drm/xe: Extend scratch page support to fault mode


