Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A20CCD98CE
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 07:09:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF55610F2A9;
	Fri, 12 Jun 2026 07:09:53 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A8910F2BE;
 Fri, 12 Jun 2026 07:09:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Fix_buffer_?=
 =?utf-8?q?overflow_in_steered_register_list_allocation_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 12 Jun 2026 07:09:52 -0000
Message-ID: <178124819292.72091.13144913558966020152@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260612070401.543305-2-tejas.upadhyay@intel.com>
In-Reply-To: <20260612070401.543305-2-tejas.upadhyay@intel.com>
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

Series: drm/xe/guc: Fix buffer overflow in steered register list allocation (rev2)
URL   : https://patchwork.freedesktop.org/series/168151/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f8eb826d15aa470b52bfb62e60c4547fcf5d3de8
Author: Tejas Upadhyay <tejas.upadhyay@intel.com>
Date:   Fri Jun 12 12:34:02 2026 +0530

    drm/xe/guc: Fix buffer overflow in steered register list allocation
    
    The size calculation for the steered register extarray uses only the
    geometry DSS mask (g_dss_mask) to determine the number of entries to
    allocate:
    
      total = bitmap_weight(gt->fuse_topo.g_dss_mask, ...) * steer_reg_num;
    
    However, the filling loop uses for_each_dss_steering(), which iterates
    over for_each_dss(), defined as the union of g_dss_mask and c_dss_mask
    (geometry + compute DSS). On platforms with compute-only DSS bits, the
    loop writes past the allocated buffer, corrupting adjacent slab objects.
    
    This manifests as list_del corruption and SLUB redzone overwrites during
    drm_managed_release on device unbind, since the overflow corrupts the
    drmres list_head of neighboring allocations.
    
    Fix by computing the allocation size using the union of both DSS masks,
    matching the iteration pattern of for_each_dss_steering().
    
    Fixes: b170d696c1e2 ("drm/xe/guc: Add XE_LP steered register lists")
    Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/8049
    Cc: Zhanjun Dong <zhanjun.dong@intel.com>
    Cc: stable@vger.kernel.org
    Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Assisted-by: GitHub Copilot:Claude Opus 4.6
+ /mt/dim checkpatch 9ce63e3d9903982c053b125686abcb7a84357ed4 drm-intel
f8eb826d15aa drm/xe/guc: Fix buffer overflow in steered register list allocation
-:30: WARNING:BAD_SIGN_OFF: Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format
#30: 
Assisted-by: GitHub Copilot:Claude Opus 4.6

total: 0 errors, 1 warnings, 0 checks, 16 lines checked


