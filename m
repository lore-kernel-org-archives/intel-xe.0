Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7748CCAC598
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 19:11:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341D010E009;
	Wed, 17 Sep 2025 19:11:28 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37AAD10E009;
 Wed, 17 Sep 2025 19:11:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Allow_mixed_map?=
 =?utf-8?q?pings_for_userptr?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Sep 2025 19:11:27 -0000
Message-ID: <175813628721.342332.14286776779153918268@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250917182817.3995998-1-matthew.brost@intel.com>
In-Reply-To: <20250917182817.3995998-1-matthew.brost@intel.com>
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

Series: drm/xe: Allow mixed mappings for userptr
URL   : https://patchwork.freedesktop.org/series/154665/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fbd08a78c3a3bb17964db2a326514c69c1dca660
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2708dc00e4e1ec05f0c3b940cd4f15d1865ec961
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Sep 17 11:28:17 2025 -0700

    drm/xe: Allow mixed mappings for userptr
    
    Compute kernels often issue memory copies immediately after completion.
    If the memory being copied is an SVM pointer that was faulted into the
    device and then bound via userptr, it is undesirable to move that
    memory. Worse, if userptr is mixed between system and device memory, the
    bind operation may be rejected.
    
    Xe already has the necessary plumbing to support userptr with mixed
    mappings. This update modifies GPUSVM's get_pages to correctly locate
    pages in such mixed mapping scenarios.
    
    Fixes: ("9e9787414882 drm/xe/userptr: replace xe_hmm with gpusvm")
    Signed-off-bt: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 9fab6e66b0f21d7175cd687e62dedd1b2d5d2781 drm-intel
2708dc00e4e1 drm/xe: Allow mixed mappings for userptr
-:76: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 0 warnings, 0 checks, 41 lines checked


