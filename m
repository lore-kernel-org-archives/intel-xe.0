Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781DAC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 16:27:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B9910E8CA;
	Thu,  1 Aug 2024 16:27:38 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59AB710E8CA;
 Thu,  1 Aug 2024 16:27:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Parallel_submission_of_dm?=
 =?utf-8?q?a_fence_jobs_and_LR_jobs_with_shared_hardware_resources_=28rev5?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 01 Aug 2024 16:27:37 -0000
Message-ID: <172252965736.488569.5830609488515798066@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240801125748.355078-1-francois.dugast@intel.com>
In-Reply-To: <20240801125748.355078-1-francois.dugast@intel.com>
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

Series: Parallel submission of dma fence jobs and LR jobs with shared hardware resources (rev5)
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
commit 4faf878e6ec4e55c2498a712b8e2473083e128c4
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Thu Aug 1 14:56:54 2024 +0200

    drm/xe/device: Remove unused xe_device::usm::num_vm_in_*
    
    Those counters were used to keep track of the numbers VMs in fault mode
    and in non-fault mode, to determine if the whole device was in fault mode
    or not. This is no longer needed so remove those variables and their
    usages.
    
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch abbcf7af3bd79f8729a6dba72674a81730f97f8a drm-intel
58664cac388e drm/xe/hw_engine_group: Introduce xe_hw_engine_group
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
-:60: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#60: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 195 lines checked
57a18c5a6bc5 drm/xe/guc_submit: Make suspend_wait interruptible
782fa71fb993 drm/xe/hw_engine_group: Register hw engine group's exec queues
0c203673c67c drm/xe/hw_engine_group: Add helper to suspend faulting LR jobs
ef913fa2bf10 drm/xe/exec_queue: Remove duplicated code
86c6f1c9a60c drm/xe/exec_queue: Prepare last fence for hw engine group resume context
11c436c8a4a9 drm/xe/hw_engine_group: Add helper to wait for dma fence jobs
84f734d7e7c3 drm/xe/hw_engine_group: Ensure safe transition between execution modes
4fdd62edaf3a drm/xe/exec: Switch hw engine group execution mode upon job submission
5ac1eae931cd drm/xe/guc_submit: Allow calling guc_exec_queue_resume with pending resume
b169ef15f22b drm/xe/hw_engine_group: Resume exec queues suspended by dma fence jobs
2d24a8e96277 drm/xe/vm: Remove restriction that all VMs must be faulting if one is
4faf878e6ec4 drm/xe/device: Remove unused xe_device::usm::num_vm_in_*


