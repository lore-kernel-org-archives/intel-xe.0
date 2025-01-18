Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A50FC02185
	for <intel-xe@archiver.kernel.org>; Sat, 18 Jan 2025 20:57:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC61510E00D;
	Sat, 18 Jan 2025 20:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bhNnUUX2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B38210E17E
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Jan 2025 20:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737233854; x=1768769854;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=sLlmOpWgVkmUJ7SearVN2PZcapiSRZgGNXxsXjVDq6c=;
 b=bhNnUUX2k0GtRG/3N6yonkEER0BaJIxfYusFZ0t+iG40oT1ezDKZ6fTW
 gx4NyJ3abr0ZUpZw/mV4ZwSLUc8Yfs1rv7zobsmBKstq4l4SxxE4araTg
 YxM0IKEBm1OXq8s/XchG0qHIUAuDX9hFlZq/lXUGfg6ycVlSY/IZX/CS7
 k3PKIK5e7eE/ys3+hE5SIgB4HA464icp7j2YAL0TQ/wznk8pjmVhTKZgR
 ad/REbcYEhxNcGSfDPNjCbaDD5k98UmAw5ejMRw1kpR52H2FSCN3tnTtK
 XsC6D93Cm6rPksjnMZ2Aj79WI+6zrU6g6Cvh5W8KdlCGlyDMDff2X1OlU A==;
X-CSE-ConnectionGUID: FfYUvA7hTeiDZwa6w98M7Q==
X-CSE-MsgGUID: M3DCUWi8SPCXu+DLI0m0Mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="48637594"
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; d="scan'208";a="48637594"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2025 12:57:33 -0800
X-CSE-ConnectionGUID: Um4HxjQDQ5iZ4f7X4InwNQ==
X-CSE-MsgGUID: B3W6EoHxR2GY5LbuRjitzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="143393945"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa001.jf.intel.com with ESMTP; 18 Jan 2025 12:57:33 -0800
Received: from [10.245.96.215] (kshkilev-mobl4.ger.corp.intel.com
 [10.245.96.215])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id A2E4A32CA9
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Jan 2025 20:57:31 +0000 (GMT)
Message-ID: <ae3aef13-2796-4bb0-906e-a0d1330bbb16@intel.com>
Date: Sat, 18 Jan 2025 21:57:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBWRjogRml4IGVh?=
 =?UTF-8?Q?rly_read_of_GDMID_=28rev2=29?=
To: intel-xe@lists.freedesktop.org
References: <20241114175955.2299-1-michal.wajdeczko@intel.com>
 <173693923043.3912472.12560535588825049387@b555e5b46a47>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <173693923043.3912472.12560535588825049387@b555e5b46a47>
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



On 15.01.2025 12:07, Patchwork wrote:
> == Series Details ==
> 
> Series: VF: Fix early read of GDMID (rev2)
> URL   : https://patchwork.freedesktop.org/series/141367/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6_full -> xe-pw-141367v2_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-141367v2_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-141367v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-141367v2_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
>     - shard-bmg:          [PASS][1] -> ([INCOMPLETE][2], [PASS][3])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141367v2/shard-bmg-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141367v2/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_cursor_crc@cursor-suspend:
>     - shard-dg2-set2:     [PASS][4] -> [ABORT][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-434/igt@kms_cursor_crc@cursor-suspend.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141367v2/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-2:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][6]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141367v2/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-2.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][7]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141367v2/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-lnl:          [PASS][8] -> ([FAIL][9], [PASS][10])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-lnl-8/igt@kms_fbcon_fbt@psr-suspend.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141367v2/shard-lnl-1/igt@kms_fbcon_fbt@psr-suspend.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141367v2/shard-lnl-8/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][11] -> ([FAIL][12], [PASS][13]) +1 other test ( 1 fail, 1 pass )
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141367v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141367v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:
>     - shard-bmg:          [PASS][14] -> [FAIL][15]
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141367v2/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html
> 
>   * igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a6:
>     - shard-dg2-set2:     [PASS][16] -> [INCOMPLETE][17] +1 other test incomplete
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-464/igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a6.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141367v2/shard-dg2-433/igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a6.html
> 
>   * igt@kms_plane_lowres@tiling-4@pipe-a-dp-4:
>     - shard-dg2-set2:     [PASS][18] -> [DMESG-WARN][19] +1 other test dmesg-warn
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-436/igt@kms_plane_lowres@tiling-4@pipe-a-dp-4.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141367v2/shard-dg2-435/igt@kms_plane_lowres@tiling-4@pipe-a-dp-4.html

all KMS "regressions" look unrelated

> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-large:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][20]
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141367v2/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-large.html

and this one looks like #2472

> 
>   
> #### Warnings ####
> 
>   * igt@kms_plane_cursor@primary:
>     - shard-dg2-set2:     [FAIL][21] ([Intel XE#616]) -> [INCOMPLETE][22]
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2487-61e0f64bde73d48e3dc204c129c25e0a15f0d4e6/shard-dg2-436/igt@kms_plane_cursor@primary.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141367v2/shard-dg2-433/igt@kms_plane_cursor@primary.html
> 
>   
