Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 548CCC52D70
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 19:36:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4E310E3E1;
	Tue,  6 Aug 2024 19:36:51 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B456710E3E1;
 Tue,  6 Aug 2024 19:36:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Parallel_submission_of_dm?=
 =?utf-8?q?a_fence_jobs_and_LR_jobs_with_shared_hardware_resources_=28rev6?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 Aug 2024 19:36:49 -0000
Message-ID: <172297300973.544252.12649149268550526912@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240806192739.1076344-1-francois.dugast@intel.com>
In-Reply-To: <20240806192739.1076344-1-francois.dugast@intel.com>
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

Series: Parallel submission of dma fence jobs and LR jobs with shared hardware resources (rev6)
URL   : https://patchwork.freedesktop.org/series/136192/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
66551fd1be58212fb46d0bc97f2e5ae43c69b733
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 380e8b1d05ae6a81c38451277bb2ca3f7187a616
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Tue Aug 6 21:27:11 2024 +0200

    drm/xe/device: Remove unused xe_device::usm::num_vm_in_*
    
    Those counters were used to keep track of the numbers VMs in fault mode
    and in non-fault mode, to determine if the whole device was in fault mode
    or not. This is no longer needed so remove those variables and their
    usages.
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch 566483e0e0e0c2079789850d593701170659e292 drm-intel
f1a27f3fbfbb drm/xe/hw_engine_group: Introduce xe_hw_engine_group
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
-:62: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#62: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 198 lines checked
d66341764953 drm/xe/guc_submit: Make suspend_wait interruptible
ab3a0d7cfa5f drm/xe/hw_engine_group: Register hw engine group's exec queues
c80205e3ba8a drm/xe/hw_engine_group: Add helper to suspend faulting LR jobs
c52462cce150 drm/xe/exec_queue: Remove duplicated code
2cb383e20224 drm/xe/exec_queue: Prepare last fence for hw engine group resume context
9a8c4616ca35 drm/xe/hw_engine_group: Add helper to wait for dma fence jobs
06f4f19b9db9 drm/xe/hw_engine_group: Ensure safe transition between execution modes
60056a9804bb drm/xe/exec: Switch hw engine group execution mode upon job submission
14b74b8f506c drm/xe/guc_submit: Allow calling guc_exec_queue_resume with pending resume
d1560819c7d4 drm/xe/hw_engine_group: Resume exec queues suspended by dma fence jobs
dbae38b9b7e3 drm/xe/vm: Remove restriction that all VMs must be faulting if one is
380e8b1d05ae drm/xe/device: Remove unused xe_device::usm::num_vm_in_*


