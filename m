Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38CEC2BBCA
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 02:05:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981CE10E2FE;
	Wed, 26 Jun 2024 02:05:31 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB14710E134;
 Wed, 26 Jun 2024 02:05:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_timeout_to_?=
 =?utf-8?q?preempt_fences_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Jun 2024 02:05:27 -0000
Message-ID: <171936752785.158965.17941956870013149203@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240626004137.4060806-1-matthew.brost@intel.com>
In-Reply-To: <20240626004137.4060806-1-matthew.brost@intel.com>
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

Series: drm/xe: Add timeout to preempt fences (rev4)
URL   : https://patchwork.freedesktop.org/series/135329/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 28bece941911f33a746f9644e90be15bfa49bbc0
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Jun 25 17:41:37 2024 -0700

    drm/xe: Add timeout to preempt fences
    
    To adhere to dma fencing rules that fences must signal within a
    reasonable amount of time, add a 5 second timeout to preempt fences. If
    this timeout occurs, kill the associated VM as this fatal to the VM.
    
    v2:
     - Add comment for smp_wmb (Checkpatch)
     - Fix kernel doc typo (Inspection)
     - Add comment for killed check (Niranjana)
    v3:
     - Drop smp_wmb (Matthew Auld)
     - Don't take vm->lock in preempt fence worker (Matthew Auld)
     - Drop RB given changes to patch
    
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch edccdf441f1e061f81e0d1d172aa0f37511bbe4d drm-intel
28bece941911 drm/xe: Add timeout to preempt fences


