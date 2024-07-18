Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73127C3DA61
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 19:01:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4488710E817;
	Thu, 18 Jul 2024 19:01:37 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9615A10E817;
 Thu, 18 Jul 2024 19:01:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Keep_device_awake_TLB_inv?=
 =?utf-8?q?alidations_and_G2H_in_flight?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Jul 2024 19:01:36 -0000
Message-ID: <172132929660.287349.2165154085957674712@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240718185531.1500815-1-matthew.brost@intel.com>
In-Reply-To: <20240718185531.1500815-1-matthew.brost@intel.com>
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

Series: Keep device awake TLB invalidations and G2H in flight
URL   : https://patchwork.freedesktop.org/series/136256/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ce3e132caaa5b45e5e50201b574a097d130967c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b86f6051c6e1e5606f623b733ac07bbdf21db43b
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Jul 18 11:55:31 2024 -0700

    drm/xe: Build PM into GuC CT layer
    
    Take PM ref when any G2H are outstanding, drop when none are
    outstanding.
    
    To safely ensure we have PM ref when in the GuC CT layer, a PM ref needs
    to be held when scheduler messages are pending too.
    
    v2:
     - Add outer PM protections to xe_file_close (CI)
    v3:
     - Only take PM ref 0->1 and drop on 1->0 (Matthew Auld)
    v4:
     - Add assert to G2H increment function
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Nirmoy Das <nirmoy.das@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
    Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 943ad04000a54cc7fdb5347606d0ce6a93ea286d drm-intel
7ee518ea6549 drm/xe: Add xe_gt_tlb_invalidation_fence_init helper
3d26e186f147 drm/xe: Drop xe_gt_tlb_invalidation_wait
f13e5118184a drm/xe: Hold a PM ref when GT TLB invalidations are inflight
b86f6051c6e1 drm/xe: Build PM into GuC CT layer


