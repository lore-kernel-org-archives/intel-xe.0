Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1308C0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 14:41:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8955C10E9A2;
	Thu, 30 Jan 2025 14:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DZi9Ccv4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E7D910E99B
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 14:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738248074; x=1769784074;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=kbMj2ewVx6z8uOBi4jB9sWToadWtA/kv5nJO6WmhE3o=;
 b=DZi9Ccv47NAhQS2jaUAp2hDRj99t9fM4R0uat1rw7ggKxHHAR0/uTVax
 rKups3XsxMLcGbAg2QGaHTgPbJ7nduTwCv8W5zUwdO+fGuD9eLYKMHJf1
 mCHfW417LesjC+qmdt3FHfX760lguNTf22qnzhL/Ni5/iwfIF9BVQKqQR
 oN96AJJ1j5c61pcnibkCsbQiOND8dO4M08p/feO0vC6PFbJgMq3EyT3Vo
 tdIchPn6x5TnGcXrffQQNWv6VNULH3cXYBe+HWFuEzdXb0xCUvmV6NbXO
 0NemoH1vD0Pj3ysyePgsn9QQ1Z9xzJNl3wiBMqrVNRi90o/rzN6leca0B w==;
X-CSE-ConnectionGUID: 0WGrRIiqQVqzLb8TfAvtAQ==
X-CSE-MsgGUID: PoQTAVVCRUyLG2Z/DwsWHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50213215"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50213215"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 06:41:14 -0800
X-CSE-ConnectionGUID: Tui52TojRaejCAPYbOJAIQ==
X-CSE-MsgGUID: Cl0QshJAQuK7bCg3l6C/nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="109904940"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa010.fm.intel.com with ESMTP; 30 Jan 2025 06:41:12 -0800
Received: from [10.245.96.215] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.96.215])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id C60482FC49
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 14:41:11 +0000 (GMT)
Message-ID: <8a6de7f5-7428-4be0-a2c8-944ef6a403f5@intel.com>
Date: Thu, 30 Jan 2025 15:41:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBQRjogTWl0aWdh?=
 =?UTF-8?Q?te_unexpected_GuC_VF_config_checks?=
To: intel-xe@lists.freedesktop.org
References: <20250129195947.764-1-michal.wajdeczko@intel.com>
 <173821155926.2729658.4957710089600267876@b555e5b46a47>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <173821155926.2729658.4957710089600267876@b555e5b46a47>
Content-Type: text/plain; charset=UTF-8
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



On 30.01.2025 05:32, Patchwork wrote:
> == Series Details ==
> 
> Series: PF: Mitigate unexpected GuC VF config checks
> URL   : https://patchwork.freedesktop.org/series/144120/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139_full -> xe-pw-144120v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-144120v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-144120v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-144120v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_hotunplug@hotrebind-lateclose:
>     - shard-dg2-set2:     [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-463/igt@core_hotunplug@hotrebind-lateclose.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-463/igt@core_hotunplug@hotrebind-lateclose.html

unrelated, from non-PF run, from the audio/sound:

<4> [201.700469] refcount_t: addition on 0; use-after-free.
<4> [201.700485] WARNING: CPU: 6 PID: 548 at lib/refcount.c:25
refcount_warn_saturate+0x12e/0x150
<4> [201.700645] Workqueue: pm pm_runtime_work
<4> [201.700653] RIP: 0010:refcount_warn_saturate+0x12e/0x150
<4> [201.700690] Call Trace:
<4> [201.700692]  <TASK>
<4> [201.700695]  ? show_regs+0x6c/0x80
<4> [201.700701]  ? __warn+0x93/0x1c0
<4> [201.700707]  ? refcount_warn_saturate+0x12e/0x150
<4> [201.700713]  ? report_bug+0x182/0x1b0
<4> [201.700720]  ? handle_bug+0x6e/0xb0
<4> [201.700725]  ? exc_invalid_op+0x18/0x80
<4> [201.700730]  ? asm_exc_invalid_op+0x1b/0x20
<4> [201.700741]  ? refcount_warn_saturate+0x12e/0x150
<4> [201.700747]  ? refcount_warn_saturate+0x12e/0x150
<4> [201.700752]  kobject_get+0x7c/0x80
<4> [201.700758]  get_device+0x13/0x30
<4> [201.700763]  snd_jack_report+0xa0/0x220 [snd]
<4> [201.700779]  ? __pfx_hda_codec_runtime_resume+0x10/0x10 [snd_hda_codec]
<4> [201.700797]  snd_hda_jack_report_sync+0x8e/0xe0 [snd_hda_codec]
<4> [201.700815]  hda_call_codec_resume+0x139/0x160 [snd_hda_codec]
<4> [201.700829]  ? __pfx_hda_codec_runtime_resume+0x10/0x10 [snd_hda_codec]
<4> [201.700843]  hda_codec_runtime_resume+0x30/0x80 [snd_hda_codec]
<4> [201.700856]  __rpm_callback+0x4d/0x170
<4> [201.700861]  ? ktime_get_mono_fast_ns+0x39/0xd0
<4> [201.700867]  ? __pfx_hda_codec_runtime_resume+0x10/0x10 [snd_hda_codec]
<4> [201.700881]  rpm_callback+0x64/0x70
<4> [201.700886]  ? __pfx_hda_codec_runtime_resume+0x10/0x10 [snd_hda_codec]
<4> [201.700899]  rpm_resume+0x594/0x790
<4> [201.700908]  pm_runtime_work+0x8c/0xf0
<4> [201.700914]  process_one_work+0x21c/0x740
<4> [201.700924]  worker_thread+0x1db/0x3c0

> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][3] +1 other test dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

unrelated, from non-PF run, from KMS:

<4> [184.185338] xe 0000:03:00.0: [drm] vblank wait timed out on crtc 0
<4> [184.185376] WARNING: CPU: 12 PID: 5724 at
drivers/gpu/drm/drm_vblank.c:1307 drm_wait_one_vblank+0x1fe/0x220


> 
>   * igt@kms_sequence@queue-busy@pipe-c-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][4]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-436/igt@kms_sequence@queue-busy@pipe-c-dp-4.html

unrelated, from non-PF run, another CI glitch ?

<7>[  253.529989] [IGT] kms_sequence: finished subtest pipe-C-DP-4, SUCCESS
<7>[  258.475150] [IGT] kms_sequence: exiting, ret=0

> 
>   * igt@xe_pm@d3hot-mmap-vram:
>     - shard-dg2-set2:     [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2571-45746920fb499b7ad35883c94ebfbedda6c40139/shard-dg2-463/igt@xe_pm@d3hot-mmap-vram.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144120v1/shard-dg2-463/igt@xe_pm@d3hot-mmap-vram.html

must be unrelated, from non-PF run,
btw, there are dmesg logs from DG2(native) and ADLP(PF-mode) and both
are suspending/resuming

Starting subtest: d3hot-mmap-vram
(xe_pm:3238) CRITICAL: Test assertion failure function test_mmap, file
../tests/intel/xe_pm.c:687:
(xe_pm:3238) CRITICAL: Failed assertion: in_d3(device, d_state)
(xe_pm:3238) CRITICAL: Last errno: 2, No such file or directory
Subtest d3hot-mmap-vram failed.


