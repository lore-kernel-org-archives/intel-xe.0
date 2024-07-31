Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CE4C3DA7F
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 14:31:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4ED10E63A;
	Wed, 31 Jul 2024 14:30:59 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8CC10E63A;
 Wed, 31 Jul 2024 14:30:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Parallel_submission_of_dm?=
 =?utf-8?q?a_fence_jobs_and_LR_jobs_with_shared_hardware_resources_=28rev3?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 31 Jul 2024 14:30:58 -0000
Message-ID: <172243625870.468143.14084354612933322409@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240731142349.4101307-1-francois.dugast@intel.com>
In-Reply-To: <20240731142349.4101307-1-francois.dugast@intel.com>
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

Series: Parallel submission of dma fence jobs and LR jobs with shared hardware resources (rev3)
URL   : https://patchwork.freedesktop.org/series/136192/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
7b537a014c4c1a32250e342541870b03977fa7a4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit bd16e2764a5587e294c7733d6eddda90b96a3164
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Wed Jul 31 16:21:47 2024 +0200

    drm/xe/device: Remove unused xe_device::usm::num_vm_in_*
    
    Those counters were used to keep track of the numbers VMs in fault mode
    and in non-fault mode, to determine if the whole device was in fault mode
    or not. This is no longer needed so remove those variables and their
    usages.
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch 2a74e6714291a2c9cf26c08f729d5feb203e8338 drm-intel
1745fb9ecd33 drm/xe/hw_engine_group: Introduce xe_hw_engine_group
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:52: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#52: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 194 lines checked
eaedd426f748 drm/xe/guc_submit: Make suspend_wait interruptible
5e0f489c48c5 drm/xe/hw_engine_group: Register hw engine group's exec queues
6ac8fcff6919 drm/xe/hw_engine_group: Add helper to suspend faulting LR jobs
26eada891e02 drm/xe/exec_queue: Remove duplicated code
e9add734ff98 drm/xe/exec_queue: Prepare last fence for hw engine group resume context
f2691fe9551a drm/xe/hw_engine_group: Add helper to wait for dma fence jobs
caf0857fbb9a drm/xe/hw_engine_group: Ensure safe transition between execution modes
c919c06952ed drm/xe/exec: Switch hw engine group execution mode upon job submission
daee64c4f931 drm/xe/guc_submit: Allow calling guc_exec_queue_resume with pending resume
baf6aa17a0d8 drm/xe/hw_engine_group: Resume exec queues suspended by dma fence jobs
0e49895dfc1a drm/xe/vm: Remove restriction that all VMs must be faulting if one is
bd16e2764a55 drm/xe/device: Remove unused xe_device::usm::num_vm_in_*


