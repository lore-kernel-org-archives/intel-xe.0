Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2532C3600B
	for <intel-xe@archiver.kernel.org>; Mon, 24 Mar 2025 13:29:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93FE10E3F3;
	Mon, 24 Mar 2025 13:29:59 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744C610E3F2;
 Mon, 24 Mar 2025 13:29:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/svm=3A_fix_derefer?=
 =?utf-8?q?encing_error_pointer_in_drm=5Fgpusvm=5Frange=5Falloc=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harshit Mogalapalli" <harshit.m.mogalapalli@oracle.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Mar 2025 13:29:59 -0000
Message-ID: <174282299942.72225.18036223141347564611@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250323124907.3946370-1-harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20250323124907.3946370-1-harshit.m.mogalapalli@oracle.com>
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

Series: drm/xe/svm: fix dereferencing error pointer in drm_gpusvm_range_alloc()
URL   : https://patchwork.freedesktop.org/series/146665/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0a20d9e42fc234626a3290109f1b9e6b0e5beed9
Author: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Date:   Sun Mar 23 05:49:06 2025 -0700

    drm/xe/svm: fix dereferencing error pointer in drm_gpusvm_range_alloc()
    
    xe_svm_range_alloc() returns ERR_PTR(-ENOMEM) on failure and there is a
    dereference of "range" after that:
    
            -->     range->gpusvm = gpusvm;
    
    In xe_svm_range_alloc(), when memory allocation fails return NULL
    instead to handle this situation.
    
    Fixes: 99624bdff867 ("drm/gpusvm: Add support for GPU Shared Virtual Memory")
    Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
    Closes: https://lore.kernel.org/all/adaef4dd-5866-48ca-bc22-4a1ddef20381@stanley.mountain/
    Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
+ /mt/dim checkpatch c21be2ca9276fb42e3a8ef9abd96235b745f403c drm-intel
0a20d9e42fc2 drm/xe/svm: fix dereferencing error pointer in drm_gpusvm_range_alloc()


