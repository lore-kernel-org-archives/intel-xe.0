Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6CC4ECE577
	for <intel-xe@archiver.kernel.org>; Mon,  9 Sep 2024 18:26:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A464D10E630;
	Mon,  9 Sep 2024 18:26:09 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F108C10E630;
 Mon,  9 Sep 2024 18:26:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Drop_xe=5Fmark?=
 =?utf-8?q?=5Frange=5Faccessed_in_HMM_layer?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Sep 2024 18:26:07 -0000
Message-ID: <172590636798.977626.11822316493616005499@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240909182128.585364-1-matthew.brost@intel.com>
In-Reply-To: <20240909182128.585364-1-matthew.brost@intel.com>
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

Series: drm/xe: Drop xe_mark_range_accessed in HMM layer
URL   : https://patchwork.freedesktop.org/series/138425/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e210a07ea43d39fb3482d99527f1689fd8d01ece
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Sep 9 11:21:28 2024 -0700

    drm/xe: Drop xe_mark_range_accessed in HMM layer
    
    Not needed as hmm_range_fault does this and also as pages returned from
    hmm_range_fault could move while mmap lock is dropped and not not
    holding notifier lock. Page corruption showed up in similar code paths
    in SVM work.
    
    Fixes: 81e058a3e7fd ("drm/xe: Introduce helper to populate userptr")
    Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch bd6c4b2266ebc908d55e8ec3f419b832ebdc3945 drm-intel
e210a07ea43d drm/xe: Drop xe_mark_range_accessed in HMM layer
-:7: WARNING:REPEATED_WORD: Possible repeated word: 'not'
#7: 
hmm_range_fault could move while mmap lock is dropped and not not

total: 0 errors, 1 warnings, 0 checks, 37 lines checked


