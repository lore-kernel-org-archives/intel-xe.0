Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0186DC5478C
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 16:02:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B5610EE0F;
	Mon, 26 Feb 2024 16:02:16 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECED310EE0F;
 Mon, 26 Feb 2024 16:02:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Use_vmalloc_for?=
 =?utf-8?q?_array_of_bind_allocation_in_bind_IOCTL_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Feb 2024 16:02:14 -0000
Message-ID: <170896333497.299440.3063588394373947379@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240226155554.103384-1-matthew.brost@intel.com>
In-Reply-To: <20240226155554.103384-1-matthew.brost@intel.com>
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

Series: drm/xe: Use vmalloc for array of bind allocation in bind IOCTL (rev2)
URL   : https://patchwork.freedesktop.org/series/130325/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ad2b3bb3dfeeafded3d3ea5808514e49cb1e552
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1b042af42ce3a6202849d4856768880d762be9f0
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Feb 26 07:55:54 2024 -0800

    drm/xe: Use vmalloc for array of bind allocation in bind IOCTL
    
    Use vmalloc in effort to allow a user pass in a large number of binds in
    an IOCTL (mesa use case). Also use array allocations rather open coding
    the size calculation.
    
    v2: Use __GFP_ACCOUNT for allocations (Thomas)
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch c815c7fa9257eb8ff4433c43058dd292b16347eb drm-intel
1b042af42ce3 drm/xe: Use vmalloc for array of bind allocation in bind IOCTL


