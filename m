Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216EAC4332F
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 22:18:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD5910E450;
	Mon,  6 Nov 2023 22:18:49 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 31A0910E451;
 Mon,  6 Nov 2023 22:18:48 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2FE02AADD1;
 Mon,  6 Nov 2023 22:18:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Brian Welty" <brian.welty@intel.com>
Date: Mon, 06 Nov 2023 22:18:48 -0000
Message-ID: <169930912819.20422.10267449286599922368@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231106221538.14505-1-brian.welty@intel.com>
In-Reply-To: <20231106221538.14505-1-brian.welty@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Fix_unbind_of_unaccessed_VMA_=28fault_mode=29?=
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

Series: drm/xe: Fix unbind of unaccessed VMA (fault mode)
URL   : https://patchwork.freedesktop.org/series/126042/
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
commit 15becb2c4e6153b3219831beb6a22e67d91081e8
Author: Brian Welty <brian.welty@intel.com>
Date:   Mon Nov 6 14:15:38 2023 -0800

    drm/xe: Fix unbind of unaccessed VMA (fault mode)
    
    In fault mode, page table binding is deferred until fault handler.
    Thus vma->tile_present will be unset unless the VMA is accessed by GPU.
    
    During a later unbind, the logic doesn't account for the fact that local
    fence variable will be NULL in this case, leading to pass NULL into
    dma_fence_add_callback() and causing few WARN_ONs to print to console.
    The fix is already present in the code, just hoist the fence variable
    computation to be done earlier.
    
    Resolves warnings seen with igt@xe_exec_fault_mode@once-invalid-fault
    
    Signed-off-by: Brian Welty <brian.welty@intel.com>
+ /mt/dim checkpatch 5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b drm-intel
15becb2c4 drm/xe: Fix unbind of unaccessed VMA (fault mode)


