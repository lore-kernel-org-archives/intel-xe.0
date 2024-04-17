Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E308C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 19:29:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16BD10F7A7;
	Wed, 17 Apr 2024 19:29:46 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D4F10F7A7;
 Wed, 17 Apr 2024 19:29:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Refcount_VMA?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Apr 2024 19:29:45 -0000
Message-ID: <171338218555.1483277.14069848891355910215@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240417185635.1004663-1-matthew.brost@intel.com>
In-Reply-To: <20240417185635.1004663-1-matthew.brost@intel.com>
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

Series: drm/xe: Refcount VMA
URL   : https://patchwork.freedesktop.org/series/132573/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f5fb02e01091a469b6325b72a47b3a0a1e96309c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 46e264e86e89a64845694df68be40a926c2d9300
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Apr 17 11:56:35 2024 -0700

    drm/xe: Refcount VMA
    
    xe_vma is one of the few objects that doesn't currently have a refcount,
    rather an internal scheme which figures out when the VMA can be freed.
    Switch to refcount as this is the standard way to handle this and will
    future-proof the code for cases where additional refs to VMAs are
    needed.
    
    One functional change in the patch is that the freeing of the VMA is
    always done in a worker, as the final put can be done from an IRQ
    context and the freeing of a VMA is not ever in a critical path.
    
    Cc: Oak Zeng <oak.zeng@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 64a20aacb61e4ce6d8a0b3dc6e4bff72e316ffa3 drm-intel
46e264e86e89 drm/xe: Refcount VMA


