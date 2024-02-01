Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83DDC47DB3
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 01:47:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8098110FE39;
	Thu,  1 Feb 2024 01:47:12 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9B610FE39;
 Thu,  1 Feb 2024 01:47:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_A_couple_of_VM_bind_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Thu, 01 Feb 2024 01:47:11 -0000
Message-ID: <170675203150.878359.3527977174668216260@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240201004849.2219558-1-matthew.brost@intel.com>
In-Reply-To: <20240201004849.2219558-1-matthew.brost@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: A couple of VM bind fixes
URL   : https://patchwork.freedesktop.org/series/129397/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c928b955d0f7903a5ec4f78cb80615d223d0037e
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Jan 31 16:48:49 2024 -0800

    drm/xe: Pick correct userptr VMA to repin on REMAP op failure
    
    A REMAP op is composed of 3 VMA's - unmap, prev map, and next map. When
    op_execute fails with -EAGAIN we need to update the local VMA pointer to
    the current op state and then repin the VMA if it is a userptr.
    
    Fixes a failure seen in xe_vm.munmap-style-unbind-userptr-one-partial.
    
    Fixes: b06d47be7c83 ("drm/xe: Port Xe to GPUVA")
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch cba66c6a2af4df1b9b420fbad0a9ac1e68f14030 drm-intel
92cd6745c drm/xe: Take a reference in xe_exec_queue_last_fence_get()
-:9: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'dd08ebf6c352', maybe rebased or not pulled?
#9: 
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

total: 0 errors, 1 warnings, 0 checks, 66 lines checked
c928b955d drm/xe: Pick correct userptr VMA to repin on REMAP op failure
-:12: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'b06d47be7c83', maybe rebased or not pulled?
#12: 
Fixes: b06d47be7c83 ("drm/xe: Port Xe to GPUVA")

total: 0 errors, 1 warnings, 0 checks, 30 lines checked


