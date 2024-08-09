Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C394DC3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 15:57:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C67110E974;
	Fri,  9 Aug 2024 15:57:40 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A000410E974;
 Fri,  9 Aug 2024 15:57:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EPatch=5Fapplied=3A_success_for_Parallel_submission_?=
 =?utf-8?q?of_dma_fence_jobs_and_LR_jobs_with_shared_hardware_resources_=28r?=
 =?utf-8?q?ev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 09 Aug 2024 15:57:39 -0000
Message-ID: <172321905964.552626.23804246514691690@2413ebb6fbb6>
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
State : success

== Summary ==

=== Applying kernel patches on branch 'drm-tip' with base: ===
Base commit: 8d0f83b389ec drm-tip: 2024y-08m-09d-08h-53m-25s UTC integration manifest
=== git am output follows ===
Applying: drm/xe/hw_engine_group: Introduce xe_hw_engine_group
Applying: drm/xe/guc_submit: Make suspend_wait interruptible
Applying: 'drm/xe/hw_engine_group: Register hw engine group's exec queues
Applying: drm/xe/hw_engine_group: Add helper to suspend faulting LR jobs
Applying: drm/xe/exec_queue: Remove duplicated code
Applying: drm/xe/exec_queue: Prepare last fence for hw engine group resume context
Applying: drm/xe/hw_engine_group: Add helper to wait for dma fence jobs
Applying: drm/xe/hw_engine_group: Ensure safe transition between execution modes
Applying: drm/xe/exec: Switch hw engine group execution mode upon job submission
Applying: drm/xe/vm: Remove restriction that all VMs must be faulting if one is
Applying: drm/xe/device: Remove unused xe_device::usm::num_vm_in_*


