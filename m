Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5EFBC3DA5D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 17:33:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C0310EC7B;
	Fri, 19 Jul 2024 17:33:40 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC8710EC7B;
 Fri, 19 Jul 2024 17:33:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Keep_device_awake_TLB_inv?=
 =?utf-8?q?alidations_and_G2H_in_flight_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 19 Jul 2024 17:33:39 -0000
Message-ID: <172141041977.291225.16339778242255897331@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240719172905.1527927-1-matthew.brost@intel.com>
In-Reply-To: <20240719172905.1527927-1-matthew.brost@intel.com>
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

Series: Keep device awake TLB invalidations and G2H in flight (rev3)
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
commit 41a3818989a16f3ed42a88c4b5a11e9e98115253
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Jul 19 10:29:05 2024 -0700

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
    v5:
     - Rebase
    v6:
     - Declare xe as local variable in xe_file_close (CI)
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Nirmoy Das <nirmoy.das@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
    Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch eb6045a759ea13e8d159bdaea423e904b9e3717b drm-intel
83237c2fbbbc drm/xe: Add xe_gt_tlb_invalidation_fence_init helper
a6ccc144bdc2 drm/xe: Drop xe_gt_tlb_invalidation_wait
1b988095b52b drm/xe: Hold a PM ref when GT TLB invalidations are inflight
41a3818989a1 drm/xe: Build PM into GuC CT layer


