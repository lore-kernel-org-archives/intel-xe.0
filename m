Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6955C3DA60
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 07:10:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9E610E584;
	Thu, 18 Jul 2024 07:10:01 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF12510E584;
 Thu, 18 Jul 2024 07:09:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Keep_device_awake_during_?=
 =?utf-8?q?GT_TLB_invalidations_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Jul 2024 07:09:59 -0000
Message-ID: <172128659997.272061.13324136413077244429@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240718065935.1451330-1-matthew.brost@intel.com>
In-Reply-To: <20240718065935.1451330-1-matthew.brost@intel.com>
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

Series: Keep device awake during GT TLB invalidations (rev3)
URL   : https://patchwork.freedesktop.org/series/136219/
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
commit b640351c51ce2f9674db61c25b82dfdf65513a51
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Jul 17 23:59:35 2024 -0700

    drm/xe: Hold a PM ref when GT TLB invalidations are inflight
    
    Avoid GT TLB invalidation timeouts by holding a PM ref when
    invalidations are inflight.
    
    v2:
     - Drop PM ref before signaling fence (CI)
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Nirmoy Das <nirmoy.das@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch c2610cb0857b1e68f684691f6d3e7fb110f7149f drm-intel
7dfc39006c0b drm/xe: Add xe_gt_tlb_invalidation_fence_init helper
af9147346fc8 drm/xe: Drop xe_gt_tlb_invalidation_wait
b640351c51ce drm/xe: Hold a PM ref when GT TLB invalidations are inflight


