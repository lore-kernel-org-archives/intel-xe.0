Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0494FC3064D
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 05:55:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A200010E1C8;
	Tue, 25 Jun 2024 05:55:26 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F9310E1C8;
 Tue, 25 Jun 2024 05:55:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_timeout_to_?=
 =?utf-8?q?preempt_fences_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jun 2024 05:55:25 -0000
Message-ID: <171929492533.154922.1113718149223946725@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240625055120.3997338-1-matthew.brost@intel.com>
In-Reply-To: <20240625055120.3997338-1-matthew.brost@intel.com>
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

Series: drm/xe: Add timeout to preempt fences (rev3)
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
commit 19eadee7632178f80a9937d9422de38b49155e61
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Jun 24 22:51:20 2024 -0700

    drm/xe: Add timeout to preempt fences
    
    To adhere to dma fencing rules that fences must signal within a
    reasonable amount of time, add a 5 second timeout to preempt fences. If
    this timeout occurs, kill the associated VM as this fatal to the VM.
    
    v2:
     - Add comment for smp_wmb (Checkpatch)
     - Fix kernel doc typo (Inspection)
     - Add comment for killed check (Niranjana)
    
    Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
+ /mt/dim checkpatch cf83cd8ff370955a504fdf1388ea6e257da76a8b drm-intel
19eadee76321 drm/xe: Add timeout to preempt fences


