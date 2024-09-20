Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FA3C78838
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 13:03:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E47F10E14D;
	Fri, 20 Sep 2024 13:03:25 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CB110E835;
 Fri, 20 Sep 2024 13:03:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=5Fsubmit=3A_fi?=
 =?utf-8?q?x_UAF_in_run=5Fjob=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Sep 2024 13:03:24 -0000
Message-ID: <172683740455.1050759.443003722135848996@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240920123806.176709-2-matthew.auld@intel.com>
In-Reply-To: <20240920123806.176709-2-matthew.auld@intel.com>
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

Series: drm/xe/guc_submit: fix UAF in run_job()
URL   : https://patchwork.freedesktop.org/series/138921/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1399505f067805ab5ca078b22782d8c574e897a5
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Fri Sep 20 13:38:07 2024 +0100

    drm/xe/guc_submit: fix UAF in run_job()
    
    The initial kref from dma_fence_init() should match up with whatever
    signals the fence, however here we are submitting the job first to the
    hw and only then grabbing the extra ref and even then we touch some
    fence state before this. This might be too late if the fence is
    signalled before we can grab the extra ref. Rather always grab the
    refcount early before we do the submission part.
    
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2811
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: <stable@vger.kernel.org> # v6.8+
+ /mt/dim checkpatch 128ccc5f71d7b9d84ce8f0651aa713ae490f4990 drm-intel
1399505f0678 drm/xe/guc_submit: fix UAF in run_job()


