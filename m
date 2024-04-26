Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E455C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 26 Apr 2024 23:37:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5DD310EF3C;
	Fri, 26 Apr 2024 23:37:58 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7997B10EF3C;
 Fri, 26 Apr 2024 23:37:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Unmap_userptr_i?=
 =?utf-8?q?n_MMU_invalidation_notifier?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 26 Apr 2024 23:37:57 -0000
Message-ID: <171417467749.1698277.12361239113145667514@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240426233236.2077378-1-matthew.brost@intel.com>
In-Reply-To: <20240426233236.2077378-1-matthew.brost@intel.com>
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

Series: drm/xe: Unmap userptr in MMU invalidation notifier
URL   : https://patchwork.freedesktop.org/series/132978/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f8385750e67305b5cde38af684c52cd2463c4003
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Apr 26 16:32:36 2024 -0700

    drm/xe: Unmap userptr in MMU invalidation notifier
    
    To be secure, when a userptr is invalidated the pages should be dma
    unmapped ensuring the device can no longer touch the invalidated pages.
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Fixes: 12f4b58a37f4 ("drm/xe: Use hmm_range_fault to populate user pages")
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: stable@vger.kernel.org # 6.8
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch cd4e45440e6710d7a1d097cd2fbac455bdecb68a drm-intel
f8385750e673 drm/xe: Unmap userptr in MMU invalidation notifier


