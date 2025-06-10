Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEA7C5B543
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 07:56:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4565810E48D;
	Tue, 10 Jun 2025 07:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X/O8yAMj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49EB510E491
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Jun 2025 07:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749542176; x=1781078176;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Hd6oGyMehC3ONWnD1ckR8G2/IZZqxfJpAEjn1YxLy7w=;
 b=X/O8yAMjPVzIV8BFGGOXC3vaoccO6XmpJVvRf/rQtTfZQ+HOzcRTmu7A
 LRKsrUF0bLIVIXLM3xxwNe3pOjF25+us9VyZTuIov6h7jaESW2mlIX1rj
 aYlgGbFUhrjMYgWtAG3ShubwPTW/fznj+uprWz0xkzAB2T9rh38saAvSp
 UT0WuZbPfPJRsOnYmvBTBqdELgcYidFk2RpRqpWSQliktbBhDcdC5Xs96
 NzcIa83NPrKONrEBH+zj+bISXjCAcHhyhbq0rW7/6bzKopeYaGwkDjs52
 KdmlvDigJA8ys1epMs4UevotxjdljAT/U9KzQ+0dI22FNmagRAg3o/ZdN w==;
X-CSE-ConnectionGUID: jsOmZy7MQQ+4caTWl3c4Hg==
X-CSE-MsgGUID: UA8DkNIVQq2L4mdMgwInPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51629152"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="51629152"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 00:56:16 -0700
X-CSE-ConnectionGUID: FBk6APFDS2eqxlw8uEjbTg==
X-CSE-MsgGUID: mVDAat4iS9CzlHtf2dxjMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="146667435"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.174])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 00:56:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>, intel-xe@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] Revert "drm/xe/display: use xe->display to decide
 whether to do anything"
In-Reply-To: <fc535785263b34ee08802dba3a451fb99469ca58@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250605054247.386633-1-vivek.kasireddy@intel.com>
 <fc535785263b34ee08802dba3a451fb99469ca58@intel.com>
Date: Tue, 10 Jun 2025 10:56:11 +0300
Message-ID: <27e47fe60426f4ae41e405cc9eb9ac059ddfb79f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 05 Jun 2025, Jani Nikula <jani.nikula@intel.com> wrote:
> On Wed, 04 Jun 2025, Vivek Kasireddy <vivek.kasireddy@intel.com> wrote:
>> This reverts commit 5a9f299f956ef9764f56044cfca7aafa23cea1d1.
>>
>> The following crash/regression was seen with the reverted commit
>> on a specific BMG SKU with no display capabilities:
>>
>> [  115.582833] BUG: kernel NULL pointer dereference, address: 00000000000005d0
>> [  115.589775] #PF: supervisor write access in kernel mode
>> [  115.594976] #PF: error_code(0x0002) - not-present page
>> [  115.600088] PGD 0 P4D 0
>> [  115.602617] Oops: Oops: 0002 [#1] SMP
>> [  115.606267] CPU: 14 UID: 0 PID: 1547 Comm: kworker/14:3 Tainted: G 	U      E       6.15.0-local+ #62 PREEMPT(voluntary)
>> [  115.617332] Tainted: [U]=USER, [E]=UNSIGNED_MODULE
>> [  115.622100] Hardware name: Intel Corporation Meteor Lake Client Platform/MTL-P DDR5 SODIMM SBS RVP, BIOS MTLPEMI1.R00.3471.D49.2401260852 01/26/2024
>> [  115.635314] Workqueue: pm pm_runtime_work
>> [  115.639309] RIP: 0010:_raw_spin_lock+0x17/0x30
>> [  115.662382] RSP: 0018:ffffd13f82e7bc30 EFLAGS: 00010246
>> [  115.667581] RAX: 0000000000000000 RBX: ffff8be919076000 RCX: 0000000000000002
>> [  115.674675] RDX: 0000000000000001 RSI: 000000000000004b RDI: 00000000000005d0
>> [  115.681775] RBP: ffffd13f82e7bc60 R08: ffffd13f82e7bb00 R09: ffff8beb0c1b06c0
>> [  115.688869] R10: ffff8be7c034f4c0 R11: fefefefefefefeff R12: fffffffffffffff0
>> [  115.695965] R13: ffff8be9190762e8 R14: ffff8be919077798 R15: 00000000000005d0
>> [  115.703062] FS:  0000000000000000(0000) GS:ffff8beb552b6000(0000) knlGS:0000000000000000
>> [  115.711106] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [  115.716826] CR2: 00000000000005d0 CR3: 000000024c68d002 CR4: 0000000000f72ef0
>> [  115.723921] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>> [  115.731015] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
>> [  115.738113] PKRU: 55555554
>> [  115.740816] Call Trace:
>> [  115.743258]  <TASK>
>> [  115.745363]  ? xe_display_flush_cleanup_work+0x92/0x120 [xe]
>> [  115.751102]  xe_display_pm_runtime_suspend+0x42/0x80 [xe]
>> [  115.756542]  xe_pm_runtime_suspend+0x11b/0x1b0 [xe]
>> [  115.761463]  xe_pci_runtime_suspend+0x23/0xd0 [xe]
>> [  115.766291]  pci_pm_runtime_suspend+0x6b/0x1a0
>> [  115.770717]  ? pci_pm_thaw_noirq+0xa0/0xa0
>> [  115.774797]  __rpm_callback+0x48/0x1e0
>> [  115.778531]  ? pci_pm_thaw_noirq+0xa0/0xa0
>> [  115.782614]  rpm_callback+0x66/0x70
>> [  115.786090]  ? pci_pm_thaw_noirq+0xa0/0xa0
>> [  115.790173]  rpm_suspend+0xe1/0x5e0
>> [  115.793647]  ? psi_task_switch+0xb8/0x200
>> [  115.797643]  ? finish_task_switch.isra.0+0x8d/0x270
>> [  115.802502]  pm_runtime_work+0xa6/0xc0
>> [  115.806238]  process_one_work+0x186/0x350
>> [  115.810234]  worker_thread+0x33a/0x480
>> [  115.813968]  ? process_one_work+0x350/0x350
>> [  115.818132]  kthread+0x10c/0x220
>> [  115.821350]  ? kthreads_online_cpu+0x120/0x120
>> [  115.825774]  ret_from_fork+0x3a/0x60
>> [  115.829339]  ? kthreads_online_cpu+0x120/0x120
>> [  115.833768]  ret_from_fork_asm+0x11/0x20
>> [  115.829339]  ? kthreads_online_cpu+0x120/0x120
>> [  115.833768]  ret_from_fork_asm+0x11/0x20
>> [  115.837680]  </TASK>
>> [  115.839907]  acpi_tad(E) drm(E)
>> [  115.931629] CR2: 00000000000005d0
>> [  115.934935] ---[ end trace 0000000000000000 ]---
>> [  115.939531] RIP: 0010:_raw_spin_lock+0x17/0x30
>>
>> We cannot yet use xe->display to determine whether display hardware
>> has been successfully probed/initialized or not. This is because
>> xe->display would not be set to NULL even with GPUs with no display
>> capabilities (e.g, GMD_ID_DISPLAY = 0). However, this might change
>> in the future as Xe and i915 code is unified to deal with no display
>> cases.
>>
>> Therefore, for now we have to continue to rely on xe->info.probe_display
>> (which would be set to false with display-less GPUs) to decide
>> whether to invoke any display related functions or not.
>>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
>
> Thanks, and sorry again for the trouble,
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Are you going to merge this? I think it needs to be merged via
drm-intel-next, that's where the original changes are.

BR,
Jani.


-- 
Jani Nikula, Intel
