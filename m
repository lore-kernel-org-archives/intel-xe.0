Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E20BC4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 10:46:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EBFF1133AE;
	Wed, 17 Apr 2024 10:46:56 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FEC1133B2;
 Wed, 17 Apr 2024 10:46:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Modify_minimum_?=
 =?utf-8?q?of_various_scheduler_timeout_to_0=2E_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Apr 2024 10:46:55 -0000
Message-ID: <171335081568.1464913.10100528604909311584@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240412105053.1050268-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240412105053.1050268-1-himal.prasad.ghimiray@intel.com>
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

Series: drm/xe: Modify minimum of various scheduler timeout to 0. (rev5)
URL   : https://patchwork.freedesktop.org/series/130913/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
fae1e565f2e5fbb878df0dbfb24f3f7fc481a38f
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2218728b8f6491a6eeb3608027688a789b0d6ca2
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Fri Apr 12 16:20:53 2024 +0530

    drm/xe: Modify minimum of various scheduler timeout to 0.
    
    The sysman teams needs to disable preemption and timeslice to
    test exclusivity mode and are relying on setting 'timeslice_duration_us'
    and 'preempt_timeout_us' to 0 for the same. Hence set the
    min configs to 0.
    
    -v2
    Modify values in drivers/gpu/drm/xe/xe_hw_engine.h
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
    Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch 75418ec1fe7737396419e6447005b10e666aeaec drm-intel
2218728b8f64 drm/xe: Modify minimum of various scheduler timeout to 0.


