Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836D0C30653
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jul 2024 04:21:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E0210E8AB;
	Thu,  4 Jul 2024 04:21:56 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F5510E8AB;
 Thu,  4 Jul 2024 04:21:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Convert_multiple_bind_ops?=
 =?utf-8?q?_to_1_job_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Jul 2024 04:21:55 -0000
Message-ID: <172006691552.27753.17725878181023291346@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240704041652.272920-1-matthew.brost@intel.com>
In-Reply-To: <20240704041652.272920-1-matthew.brost@intel.com>
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

Series: Convert multiple bind ops to 1 job (rev8)
URL   : https://patchwork.freedesktop.org/series/133034/
State : warning

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
commit 4109dbad192805c529bafd49b490886688b69cb9
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Jul 3 21:16:52 2024 -0700

    drm/xe: Add VM bind IOCTL error injection
    
    Add VM bind IOCTL error injection which steals MSB of the bind flags
    field which if set injects errors at various points in the VM bind
    IOCTL. Intended to validate error paths. Enabled by CONFIG_DRM_XE_DEBUG.
    
    v4:
     - Change define layout (Jonathan)
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch 73af7ac6d6ae23cd3f24b60e6ebaa3a81b2b1d5b drm-intel
0915a9a24962 drm/xe: s/xe_tile_migrate_engine/xe_tile_migrate_exec_queue
b4167338056b drm/xe: Add xe_vm_pgtable_update_op to xe_vma_ops
eeb9e627f14c drm/xe: Add xe_exec_queue_last_fence_test_dep
1ad8bccdf668 drm/xe: Convert multiple bind ops into single job
-:281: ERROR:TRAILING_WHITESPACE: trailing whitespace
#281: FILE: drivers/gpu/drm/xe/xe_migrate.c:1279:
+^I^Ibatch_size += 6 * (num_updates / MAX_PTE_PER_SDI + 1) $

total: 1 errors, 0 warnings, 0 checks, 2570 lines checked
a917dab19a20 drm/xe: Update VM trace events
d27b93dfec76 drm/xe: Update PT layer with better error handling
4109dbad1928 drm/xe: Add VM bind IOCTL error injection


