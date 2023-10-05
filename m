Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D55E936ED
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 00:31:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F0410E14B;
	Thu,  5 Oct 2023 00:31:57 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id C1F3010E3B5;
 Thu,  5 Oct 2023 00:31:55 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C08A6AADE8;
 Thu,  5 Oct 2023 00:31:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: fei.yang@intel.com
Date: Thu, 05 Oct 2023 00:31:55 -0000
Message-ID: <169646591578.7514.10231122771908185426@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231004234721.2076190-1-fei.yang@intel.com>
In-Reply-To: <20231004234721.2076190-1-fei.yang@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_don=27t_repin_a_userptr_if_mm_is_closed?=
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

Series: drm/xe: don't repin a userptr if mm is closed
URL   : https://patchwork.freedesktop.org/series/124643/
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
commit 99266be2e35ffaeeeb59b036a1c225420540f8a9
Author: Fei Yang <fei.yang@intel.com>
Date:   Wed Oct 4 16:47:21 2023 -0700

    drm/xe: don't repin a userptr if mm is closed
    
    Ran into a problem where xe_vma_userptr_pin_pages failed with -EFAULT
    due to the mmu_notifier.mm had been closed. In such case, the userptr
    vma should not had been added to the invalidated list in the first
    place.
    
    Signed-off-by: Fei Yang <fei.yang@intel.com>
+ /mt/dim checkpatch 925411c583c351c1a54c7a27fc96e0c64f1554af drm-intel
99266be2e drm/xe: don't repin a userptr if mm is closed


