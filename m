Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98884C52D7C
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 15:58:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AECB10E977;
	Fri,  9 Aug 2024 15:58:04 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F8C10E977;
 Fri,  9 Aug 2024 15:58:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Parallel_submission_of_dm?=
 =?utf-8?q?a_fence_jobs_and_LR_jobs_with_shared_hardware_resources_=28rev9?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 09 Aug 2024 15:58:03 -0000
Message-ID: <172321908321.552626.12367315927467097763@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240809155156.1955925-1-francois.dugast@intel.com>
In-Reply-To: <20240809155156.1955925-1-francois.dugast@intel.com>
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

Series: Parallel submission of dma fence jobs and LR jobs with shared hardware resources (rev9)
URL   : https://patchwork.freedesktop.org/series/136192/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
dc547930fbb1350eaf6bde84653b9ac973a411db
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit acc3670b378a47dd9ed43e9ade35c701fac42fd4
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Fri Aug 9 17:51:36 2024 +0200

    drm/xe/device: Remove unused xe_device::usm::num_vm_in_*
    
    Those counters were used to keep track of the numbers VMs in fault mode
    and in non-fault mode, to determine if the whole device was in fault mode
    or not. This is no longer needed so remove those variables and their
    usages.
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 8d0f83b389ec64b9f7f9b2ee241fc352346868f1 drm-intel
80e0da88affc drm/xe/hw_engine_group: Introduce xe_hw_engine_group
-:65: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#65: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 200 lines checked
602f46ad6bf5 drm/xe/guc_submit: Make suspend_wait interruptible
88d07852185d 'drm/xe/hw_engine_group: Register hw engine group's exec queues
c58a63d9746a drm/xe/hw_engine_group: Add helper to suspend faulting LR jobs
0dab30a1fe21 drm/xe/exec_queue: Remove duplicated code
362cd264b7b7 drm/xe/exec_queue: Prepare last fence for hw engine group resume context
015906945d14 drm/xe/hw_engine_group: Add helper to wait for dma fence jobs
3a7e715e8a5c drm/xe/hw_engine_group: Ensure safe transition between execution modes
4a8b7f709077 drm/xe/exec: Switch hw engine group execution mode upon job submission
b8925c9b296c drm/xe/vm: Remove restriction that all VMs must be faulting if one is
acc3670b378a drm/xe/device: Remove unused xe_device::usm::num_vm_in_*


