Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A139CCD193
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 09:49:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13BBC10E102;
	Mon, 20 Oct 2025 09:49:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OU0Ge1Ps";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F06F10E102
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 09:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760953773; x=1792489773;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=dBbcxaY897YlZZplitoQRmO5I160KxD3Jn5P+/f1ZuM=;
 b=OU0Ge1PsYtRZDC27KiXvCSNXs4UpCQuG9xFAQIm7wHBylqbnremC0BP0
 wGx+TW1dyTszkMV13ydJOhWJiSEh6jeM6lZEi+QTdEyOXtKv+S2gx8gXA
 IEqI3rqKwSP7NDimm6c30pp4+yP9ilrKPFL99YkkscO1awbTfY1IcjRyA
 LARDCHx05SSk0sR8eQaQsGd3FpdrsXW0ANwg03JvFvWavyUESNXA7g5ck
 Rp5kgK78mWC2pBsxTCzR5QoCRO0/T97amL2XBfRcLaLphbGJeQiqJMXOm
 +kBym24uV9yvfCZ1sXdiUURpnkZDfsbUgMXCoddj6f5rTWdu5IGOxHaym A==;
X-CSE-ConnectionGUID: GE1hYgrFSfuGhA04QDjtJg==
X-CSE-MsgGUID: iyMuqwRCQeCdVkQMa2sXBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="66705293"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="66705293"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 02:49:32 -0700
X-CSE-ConnectionGUID: 4257flecRVSxPbytrPpTGQ==
X-CSE-MsgGUID: j3mxKBSYR5e+YDzqhNiMQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="220438106"
Received: from unknown (HELO [172.28.182.166]) ([172.28.182.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 02:49:31 -0700
Message-ID: <ba4aaf73-3890-4f20-9ea2-82fe47510d4e@linux.intel.com>
Date: Mon, 20 Oct 2025 11:49:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBQRjogVXBkYXRl?=
 =?UTF-8?Q?_auto-provisioning?=
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20251015091211.592-1-michal.wajdeczko@intel.com>
 <176056635246.19067.3887030686772278274@97596180aaec>
 <2e239734-4b93-4beb-9d6e-ffe688ec10bc@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <2e239734-4b93-4beb-9d6e-ffe688ec10bc@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 10/16/2025 12:55 PM, Michal Wajdeczko wrote:
>
> On 10/16/2025 12:12 AM, Patchwork wrote:
>> *Patch Details*
>> *Series:*	PF: Update auto-provisioning
>> *URL:*	https://patchwork.freedesktop.org/series/155971/ <https://patchwork.freedesktop.org/series/155971/>
>> *State:*	failure
>> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155971v1/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155971v1/index.html>
>>
>>
>>    CI Bug Log - changes from xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a_FULL -> xe-pw-155971v1_FULL
>>
>>
>>      Summary
>>
>> *FAILURE*
>>
>> Serious unknown changes coming with xe-pw-155971v1_FULL absolutely need to be
>> verified manually.
>>
>> If you think the reported changes have nothing to do with the changes
>> introduced in xe-pw-155971v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>> to document this new failure mode, which will reduce false positives in CI.
>>
>>
>>      Participating hosts (4 -> 4)
>>
>> No changes in participating hosts
>>
>>
>>      Possible new issues
>>
>> Here are the unknown changes that may have been introduced in xe-pw-155971v1_FULL:
>>
>>
>>        IGT changes
>>
>>
>>          Possible regressions
>>
>>    *
>>
>>      igt@kms_big_fb@linear-8bpp-rotate-180:
>>
>>        o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-3/igt@kms_big_fb@linear-8bpp-rotate-180.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155971v1/shard-bmg-8/igt@kms_big_fb@linear-8bpp-rotate-180.html> +22 other tests fail
> unrelated
>
> (kms_big_fb:12070) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=16384, height=16384, format=C8  (0x20203843), modifier=0x0, size=0)
> (kms_big_fb:12070) igt_kms-CRITICAL: Test assertion failure function kmstest_dumb_create, file ../lib/igt_kms.c:1316:
> (kms_big_fb:12070) igt_kms-CRITICAL: Failed assertion: igt_ioctl((fd), ((((2U|1U) << (((0+8)+8)+14)) | ((('d')) << (0+8)) | (((0xB2)) << 0) | ((((sizeof(struct drm_mode_create_dumb)))) << ((0+8)+8)))), (&create)) == 0
> (kms_big_fb:12070) igt_kms-CRITICAL: Last errno: 12, Cannot allocate memory
>
>
>>    *
>>
>>      igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0:
>>
>>        o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155971v1/shard-bmg-4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html> +4 other tests fail
>>    *
>>
>>      igt@kms_color@legacy-gamma@pipe-a-dp-2:
>>
>>        o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-1/igt@kms_color@legacy-gamma@pipe-a-dp-2.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155971v1/shard-bmg-6/igt@kms_color@legacy-gamma@pipe-a-dp-2.html>
>>    *
>>
>>      igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
>>
>>        o shard-adlp: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155971v1/shard-adlp-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html> +1 other test fail
> unrelated
>
> (kms_cursor_legacy:2966) CRITICAL: Test assertion failure function cursor_vs_flip, file ../tests/kms_cursor_legacy.c:1387:
> (kms_cursor_legacy:2966) CRITICAL: Failed assertion: igt_ioctl((display->drm_fd), ((((2U|1U) << (((0+8)+8)+14)) | ((('d')) << (0+8)) | (((0xA3)) << 0) | ((((sizeof(struct drm_mode_cursor)))) << ((0+8)+8)))), (&arg[i & 1])) == 0
> (kms_cursor_legacy:2966) CRITICAL: Last errno: 28, No space left on device
>
>
>>    *
>>
>>      igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-2:
>>
>>        o shard-bmg: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155971v1/shard-bmg-3/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-2.html> +1 other test abort
> unrelated
>
> <4> [462.803151] xe 0000:03:00.0: [drm] Assertion `!(bo->flags & ((((1UL))) << (19))) || !iosys_map_is_null(&bo->vmap)` failed!
> platform: BATTLEMAGE subplatform: 7
> graphics: Xe2_HPG 20.01 step A0
> media: Xe2_HPM 13.01 step A1
> <4> [462.803185] WARNING: CPU: 1 PID: 3847 at drivers/gpu/drm/xe/xe_bo_evict.c:217 xe_bo_restore_and_map_ggtt+0x22c/0x260 [xe]
> <4> [462.803496] RIP: 0010:xe_bo_restore_and_map_ggtt+0x22c/0x260 [xe]
> <4> [462.803633] Call Trace:
> <4> [462.803635]  <TASK>
> <4> [462.803648]  xe_bo_apply_to_pinned+0xdf/0x220 [xe]
> <4> [462.803748]  ? __pfx_xe_bo_restore_and_map_ggtt+0x10/0x10 [xe]
> <4> [462.803848]  xe_bo_restore_late+0x2d/0x130 [xe]
> <4> [462.803943]  xe_pm_resume+0x21d/0x440 [xe]
> <4> [462.804117]  ? pci_read_config_word+0x27/0x50
> <4> [462.804126]  ? __pci_set_master+0x33/0xe0
> <4> [462.804141]  xe_pci_resume+0x60/0x70 [xe]
>
>
>
>>    *
>>
>>      igt@xe_compute_preempt@compute-preempt-many-all-ram:
>>
>>        o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155971v1/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many-all-ram.html>
> unrelated
>
> <4> [388.734979] xe 0000:03:00.0: [drm] VM worker error: -12
>
>
>>    *
>>
>>      igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
>>
>>        o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155971v1/shard-bmg-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html>
>>    *
>>
>>      igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
>>
>>        o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-bmg-5/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155971v1/shard-bmg-7/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html> +6 other tests abort
>
> unrelated
>
> <1> [331.175806] BUG: kernel NULL pointer dereference, address: 0000000000000001
> <1> [331.175819] #PF: supervisor read access in kernel mode
> <1> [331.175824] #PF: error_code(0x0000) - not-present page
> <4> [331.175857] RIP: 0010:xe_vm_insert_vma+0x1c/0x1b0 [xe]
> <4> [331.176097] Call Trace:
> <4> [331.176100]  <TASK>
> <4> [331.176103]  ? vm_bind_ioctl_ops_create+0xa9/0x8d0 [xe]
> <4> [331.176361]  ? lock_is_held_type+0xa3/0x130
> <4> [331.176371]  vm_bind_ioctl_ops_parse+0x709/0xa00 [xe]
> <4> [331.176541]  xe_vm_bind_ioctl+0x1103/0x1850 [xe]
> <4> [331.176728]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
> <4> [331.176950]  drm_ioctl_kernel+0xb3/0x120
> <4> [331.176958]  ? drm_ioctl_kernel+0xb3/0x120
> <4> [331.176965]  drm_ioctl+0x2d4/0x5a0
> <4> [331.176970]  ? __pfx_xe_vm_bind_ioctl+0x10/0x10 [xe]
> <4> [331.177144]  ? trace_hardirqs_on+0x1e/0xd0
> <4> [331.177150]  ? _raw_spin_unlock_irqrestore+0x51/0x80
> <4> [331.177156]  ? __pm_runtime_resume+0x5b/0x90
> <4> [331.177163]  ? xe_pm_runtime_get_ioctl+0x61/0x150 [xe]
> <4> [331.177249]  xe_drm_ioctl+0x53/0x80 [xe]
>
>
>>    *
>>
>>      igt@xe_sriov_auto_provisioning@fair-allocation:
>>
>>        o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a/shard-adlp-2/igt@xe_sriov_auto_provisioning@fair-allocation.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155971v1/shard-adlp-8/igt@xe_sriov_auto_provisioning@fair-allocation.html>
> but
>
> Test requirement not met in function __igt_unique____real_main316, file ../tests/intel/xe_sriov_auto_provisioning.c:343:
> Test requirement: !(ret)
> contexts_provisioned: Failed ranges check on gt0 (-34)
>
> this is now somehow expected, as it looks that some earlier test did some tweaks in the VFs provisioning causing 'auto' mode to be disabled:
>
> <7>[  344.422273] xe 0000:00:02.0: [drm:pf_update_policy_bool [xe]] PF: Tile0: GT0: policy key 0x8001 'sched_if_idle' updated to 'disabled'
> <7>[  344.422465] xe 0000:00:02.0: [drm:xe_sriov_pf_provision_set_mode [xe]] PF: mode auto changed to custom by sched_if_idle_set [xe]
>
> so there is no more VFs auto-unprovisioning, and some of VFs resources may remain allocated and must be explicitly released by the test
>
> FYI: @Marcin

There are two tests, xe_pmu and xe_sriov_scheduling, which switch to 
custom mode due to scheduling parameter modifications. These are 
addressed by the series.

>>    *
>>
>>      igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
>>
>>        o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155971v1/shard-adlp-6/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html>
>>
>>
