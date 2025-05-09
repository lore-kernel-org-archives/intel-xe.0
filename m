Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0906EC3ABBC
	for <intel-xe@archiver.kernel.org>; Fri,  9 May 2025 05:59:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A669010E9AB;
	Fri,  9 May 2025 05:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VwtmPzjH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB38510E9AB
 for <intel-xe@lists.freedesktop.org>; Fri,  9 May 2025 05:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746770376; x=1778306376;
 h=message-id:date:mime-version:subject:to:references:cc:
 from:in-reply-to:content-transfer-encoding;
 bh=ErCMV9pSZ3+DFR9YaOhMl1wqwJgmVaHp1OtyABdJsT4=;
 b=VwtmPzjH4c7/4XECuS4LHiENEaQuTuP4i/0awcgNXBgigefkJzUe1CKH
 IlY/fY6z0YcOHTWfw2ANsW5cbB+m4c0ew+s9YzN19s0vRJOt5e/EcAlVE
 dvLZpO5WGtLNeDa23KUBfg2noppEJspyf/OKZXLi6dOVGYA3NbUZri36H
 tmh1RKnVu760WLuJNwlJ2y8Ammm1Yv2WKqnCkEB/Z0t1qIeIpjIkafYUA
 Lm4TSDybsHvvSDb3Ifnw33Hm4724fbwJTGbp1vC8plskM36gSxywIfNv6
 vRD5Bqsv6BsultVLWmD8M6O95MATD8EGUjPU/LQZelCvvYE9LiH0LL+Jf g==;
X-CSE-ConnectionGUID: 4vvj2wDjSAOzVRJM9o+zvA==
X-CSE-MsgGUID: sEoqvhm0TxOaCdHsSCvm0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="47841391"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="47841391"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 22:59:36 -0700
X-CSE-ConnectionGUID: qQ+VhELTTfqck59B64eK9g==
X-CSE-MsgGUID: pDtogeHeQEaP6l4txfyNNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="167457249"
Received: from ajhaver-mobl2.gar.corp.intel.com (HELO [10.247.206.167])
 ([10.247.206.167])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 22:59:35 -0700
Message-ID: <cd7dbc7d-92eb-408e-853c-42d4863d5ef9@intel.com>
Date: Fri, 9 May 2025 11:29:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/xe2h?=
 =?UTF-8?Q?pg=3A_Add_Wa=5F22021007897_=28rev2=29?=
To: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
References: <20250507101112.4678-1-aradhya.bhatia@intel.com>
 <174662138562.55006.10156344592184635538@c664b1dc75d1>
Content-Language: en-US
Cc: intel-xe@lists.freedesktop.org
From: Aradhya Bhatia <aradhya.bhatia@intel.com>
In-Reply-To: <174662138562.55006.10156344592184635538@c664b1dc75d1>
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

Hi,

Thank you for your comments and reviews!

On 07-05-2025 18:06, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/xe2hpg: Add Wa_22021007897 (rev2)
> URL   : https://patchwork.freedesktop.org/series/148672/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4_FULL -> xe-pw-148672v2_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-148672v2_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-148672v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-148672v2_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-bmg:          [PASS][1] -> [DMESG-WARN][2] +9 other tests dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_hdr@static-swap:
>     - shard-bmg:          [PASS][3] -> [SKIP][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_hdr@static-swap.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-6/igt@kms_hdr@static-swap.html
> 
>   * igt@xe_exec_capture@reset:
>     - shard-dg2-set2:     [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-432/igt@xe_exec_capture@reset.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-435/igt@xe_exec_capture@reset.html
> 
>   * igt@xe_exec_threads@threads-cm-fd-userptr-rebind:
>     - shard-dg2-set2:     [PASS][7] -> [INCOMPLETE][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@xe_exec_threads@threads-cm-fd-userptr-rebind.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-432/igt@xe_exec_threads@threads-cm-fd-userptr-rebind.html

These possible regressions do not seem to be relevant to the patch.

I believe the patch is ready to be merged.


Additionally, would it be possible to make the substitution of the word
platform to IP in the commit message (as suggested by Gustavo in [0])
while the patch gets merged?

Regards
Aradhya


[0]:
https://patchwork.freedesktop.org/patch/652088/?series=148672&rev=2#comment_1193231

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-148672v2_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:
>     - shard-dg2-set2:     [PASS][9] -> [SKIP][10] ([Intel XE#4208] / [Intel XE#4618])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html
> 
>   * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:
>     - shard-adlp:         [PASS][11] -> [FAIL][12] ([Intel XE#3884])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-8/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-8/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2327]) +3 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
>     - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1124]) +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [PASS][15] -> [DMESG-FAIL][16] ([Intel XE#4543]) +2 other tests dmesg-fail
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#1124]) +7 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#619])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2314] / [Intel XE#2894])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#367])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#367])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2887]) +6 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#787]) +111 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-2:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#3432]) +1 other test skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][27] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#787]) +11 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2325]) +1 other test skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-single:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2252]) +3 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_chamelium_frames@hdmi-crc-single.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
>     - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#373]) +1 other test skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
> 
>   * igt@kms_content_protection@atomic@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][32] ([Intel XE#1178])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_content_protection@atomic@pipe-a-dp-4.html
> 
>   * igt@kms_content_protection@type1:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2341])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_content_protection@type1.html
> 
>   * igt@kms_cursor_crc@async-cursor-crc-position-change:
>     - shard-bmg:          [PASS][34] -> [SKIP][35] ([Intel XE#2320])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_cursor_crc@async-cursor-crc-position-change.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-6/igt@kms_cursor_crc@async-cursor-crc-position-change.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2321])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2320]) +2 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-128x42:
>     - shard-dg2-set2:     [PASS][38] -> [SKIP][39] ([Intel XE#4208] / [i915#2575]) +7 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-128x42.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-128x42.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
>     - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#2291]) +2 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2375])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][43] -> [FAIL][44] ([Intel XE#3321]) +1 other test fail
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
>     - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#310]) +2 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
>     - shard-dg2-set2:     [PASS][46] -> [FAIL][47] ([Intel XE#301] / [Intel XE#3321]) +2 other tests fail
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>     - shard-lnl:          [PASS][48] -> [FAIL][49] ([Intel XE#301]) +1 other test fail
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
>     - shard-dg2-set2:     [PASS][50] -> [FAIL][51] ([Intel XE#301]) +5 other tests fail
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
> 
>   * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1:
>     - shard-adlp:         [PASS][52] -> [FAIL][53] ([Intel XE#2882]) +1 other test fail
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html
> 
>   * igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a3:
>     - shard-bmg:          [PASS][54] -> [FAIL][55] ([Intel XE#2882]) +4 other tests fail
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a3.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a3.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2293] / [Intel XE#2380])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2293])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
>     - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#455]) +2 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2311]) +13 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#656]) +5 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#4141]) +6 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#651]) +2 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2313]) +14 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
>     - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#653])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2350])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2502])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_getfb@getfb-reject-ccs.html
> 
>   * igt@kms_hdr@bpc-switch-suspend:
>     - shard-bmg:          [PASS][67] -> [SKIP][68] ([Intel XE#4883])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_hdr@bpc-switch-suspend.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-6/igt@kms_hdr@bpc-switch-suspend.html
> 
>   * igt@kms_joiner@basic-force-big-joiner:
>     - shard-bmg:          [PASS][69] -> [SKIP][70] ([Intel XE#3012])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_joiner@basic-force-big-joiner.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-5/igt@kms_joiner@basic-force-big-joiner.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend:
>     - shard-adlp:         [PASS][71] -> [DMESG-WARN][72] ([Intel XE#4173]) +2 other tests dmesg-warn
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend.html
> 
>   * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][73] ([Intel XE#616])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
> 
>   * igt@kms_plane_lowres@tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2393])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html
> 
>   * igt@kms_plane_multiple@2x-tiling-none:
>     - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#4596])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_plane_multiple@2x-tiling-none.html
> 
>   * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>     - shard-bmg:          [PASS][76] -> [SKIP][77] ([Intel XE#2571])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
>     - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#2763]) +2 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
>     - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
>     - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2763]) +9 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-adlp:         [PASS][81] -> [FAIL][82] ([Intel XE#718])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2505])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
>     - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#1489]) +4 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1489]) +1 other test skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr@fbc-psr-primary-render:
>     - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#2850] / [Intel XE#929])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_psr@fbc-psr-primary-render.html
> 
>   * igt@kms_psr@fbc-psr2-primary-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_psr@fbc-psr2-primary-blt.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#2939])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#3414])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_scaling_modes@scaling-mode-full-aspect:
>     - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2413])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-full-aspect.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          NOTRUN -> [FAIL][91] ([Intel XE#1729])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#330])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-bmg:          [PASS][93] -> [INCOMPLETE][94] ([Intel XE#4488]) +1 other test incomplete
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-5/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@kms_vrr@cmrr@pipe-a-edp-1:
>     - shard-lnl:          [PASS][95] -> [FAIL][96] ([Intel XE#4459]) +1 other test fail
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> 
>   * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>     - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#756]) +1 other test skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> 
>   * igt@xe_eudebug@discovery-race-vmbind:
>     - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#4837]) +5 other tests skip
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@xe_eudebug@discovery-race-vmbind.html
> 
>   * igt@xe_eudebug_online@reset-with-attention:
>     - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#4837]) +2 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@xe_eudebug_online@reset-with-attention.html
> 
>   * igt@xe_eudebug_sriov@deny-eudebug:
>     - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#4518])
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@xe_eudebug_sriov@deny-eudebug.html
> 
>   * igt@xe_evict@evict-beng-large-external-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@xe_evict@evict-beng-large-external-cm.html
> 
>   * igt@xe_evict@evict-beng-small-multi-vm:
>     - shard-bmg:          [PASS][102] -> [DMESG-WARN][103] ([Intel XE#1473] / [Intel XE#3428])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@xe_evict@evict-beng-small-multi-vm.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-6/igt@xe_evict@evict-beng-small-multi-vm.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
>     - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#688])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
>     - shard-dg2-set2:     [PASS][105] -> [SKIP][106] ([Intel XE#1392]) +1 other test skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
>     - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2322]) +4 other tests skip
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr:
>     - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#1392])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-lnl-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch:
>     - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#288])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch.html
> 
>   * igt@xe_exec_system_allocator@process-many-large-new-busy:
>     - shard-bmg:          [PASS][110] -> [DMESG-WARN][111] ([Intel XE#3428]) +5 other tests dmesg-warn
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@xe_exec_system_allocator@process-many-large-new-busy.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-6/igt@xe_exec_system_allocator@process-many-large-new-busy.html
> 
>   * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-nomemset:
>     - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#4915]) +30 other tests skip
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:
>     - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#4943]) +12 other tests skip
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
>     - shard-lnl:          [PASS][114] -> [FAIL][115] ([Intel XE#4937])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
> 
>   * igt@xe_mmap@pci-membarrier-bad-pagesize:
>     - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#4045])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@xe_mmap@pci-membarrier-bad-pagesize.html
> 
>   * igt@xe_oa@syncs-userptr-wait-cfg:
>     - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@xe_oa@syncs-userptr-wait-cfg.html
> 
>   * igt@xe_pm@d3cold-multiple-execs:
>     - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2284])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@xe_pm@d3cold-multiple-execs.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#2284] / [Intel XE#366])
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-lnl-3/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-lnl:          [PASS][120] -> [ABORT][121] ([Intel XE#1794])
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-lnl-3/igt@xe_pm@s4-exec-after.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-lnl-2/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-adlp:         [PASS][122] -> [ABORT][123] ([Intel XE#1794]) +1 other test abort
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-1/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_pmu@gt-frequency:
>     - shard-dg2-set2:     [PASS][124] -> [FAIL][125] ([Intel XE#4817]) +1 other test fail
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-434/igt@xe_pmu@gt-frequency.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-435/igt@xe_pmu@gt-frequency.html
> 
>   * igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:
>     - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#4733])
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-1/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html
> 
>   * igt@xe_vm@munmap-style-unbind-many-either-side-partial:
>     - shard-dg2-set2:     [PASS][127] -> [SKIP][128] ([Intel XE#4208]) +26 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [DMESG-FAIL][129] ([Intel XE#4543]) -> [PASS][130] +1 other test pass
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [INCOMPLETE][131] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][132]
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>     - shard-dg2-set2:     [FAIL][133] ([Intel XE#301]) -> [PASS][134]
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
>     - shard-bmg:          [FAIL][135] ([Intel XE#3321]) -> [PASS][136]
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>     - shard-bmg:          [SKIP][137] ([Intel XE#2316]) -> [PASS][138] +2 other tests pass
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
>     - shard-lnl:          [FAIL][139] ([Intel XE#301]) -> [PASS][140] +1 other test pass
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
> 
>   * igt@kms_setmode@basic@pipe-b-edp-1:
>     - shard-lnl:          [FAIL][141] ([Intel XE#2883]) -> [PASS][142] +2 other tests pass
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html
> 
>   * igt@kms_setmode@clone-exclusive-crtc:
>     - shard-bmg:          [SKIP][143] ([Intel XE#1435]) -> [PASS][144]
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-5/igt@kms_setmode@clone-exclusive-crtc.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html
> 
>   * igt@testdisplay:
>     - shard-bmg:          [DMESG-WARN][145] ([Intel XE#3428]) -> [PASS][146] +6 other tests pass
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-6/igt@testdisplay.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-8/igt@testdisplay.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
>     - shard-dg2-set2:     [SKIP][147] ([Intel XE#1392]) -> [PASS][148] +5 other tests pass
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-435/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
> 
>   * igt@xe_pm@s2idle-basic-exec:
>     - shard-adlp:         [DMESG-WARN][149] ([Intel XE#4173]) -> [PASS][150] +8 other tests pass
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-3/igt@xe_pm@s2idle-basic-exec.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-3/igt@xe_pm@s2idle-basic-exec.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-adlp:         [ABORT][151] ([Intel XE#1794]) -> [PASS][152]
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-adlp-1/igt@xe_pm@s4-basic-exec.html
> 
>   * igt@xe_pm@s4-vm-bind-prefetch:
>     - shard-lnl:          [ABORT][153] ([Intel XE#1794]) -> [PASS][154]
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-lnl-3/igt@xe_pm@s4-vm-bind-prefetch.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][155] ([Intel XE#1124]) -> [SKIP][156] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][157] ([Intel XE#2191]) -> [SKIP][158] ([Intel XE#4208] / [i915#2575])
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     [SKIP][159] ([Intel XE#2907]) -> [SKIP][160] ([Intel XE#4208]) +2 other tests skip
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][161] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][162] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-limited-range:
>     - shard-dg2-set2:     [SKIP][163] ([Intel XE#306]) -> [SKIP][164] ([Intel XE#4208] / [i915#2575])
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_chamelium_color@ctm-limited-range.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_chamelium_color@ctm-limited-range.html
> 
>   * igt@kms_chamelium_hpd@common-hpd-after-suspend:
>     - shard-dg2-set2:     [SKIP][165] ([Intel XE#373]) -> [SKIP][166] ([Intel XE#4208] / [i915#2575]) +1 other test skip
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-bmg:          [TIMEOUT][167] ([Intel XE#4862]) -> [FAIL][168] ([Intel XE#1178]) +1 other test fail
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-6/igt@kms_content_protection@atomic.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-8/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-dg2-set2:     [SKIP][169] ([Intel XE#307]) -> [SKIP][170] ([Intel XE#4208] / [i915#2575])
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-1.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_content_protection@lic-type-0:
>     - shard-bmg:          [FAIL][171] ([Intel XE#1178]) -> [SKIP][172] ([Intel XE#2341])
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_content_protection@lic-type-0.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-5/igt@kms_content_protection@lic-type-0.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
>     - shard-dg2-set2:     [SKIP][173] ([Intel XE#455]) -> [SKIP][174] ([Intel XE#4208])
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
>     - shard-bmg:          [SKIP][175] ([Intel XE#2312]) -> [SKIP][176] ([Intel XE#4141]) +2 other tests skip
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
>     - shard-bmg:          [SKIP][177] ([Intel XE#4141]) -> [SKIP][178] ([Intel XE#2312]) +5 other tests skip
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render:
>     - shard-dg2-set2:     [SKIP][179] ([Intel XE#651]) -> [SKIP][180] ([Intel XE#4208])
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
>     - shard-bmg:          [SKIP][181] ([Intel XE#2311]) -> [SKIP][182] ([Intel XE#2312]) +8 other tests skip
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
>     - shard-bmg:          [SKIP][183] ([Intel XE#2312]) -> [SKIP][184] ([Intel XE#2311]) +3 other tests skip
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
>     - shard-bmg:          [SKIP][185] ([Intel XE#2313]) -> [SKIP][186] ([Intel XE#2312]) +8 other tests skip
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][187] ([Intel XE#653]) -> [SKIP][188] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
>     - shard-bmg:          [SKIP][189] ([Intel XE#2312]) -> [SKIP][190] ([Intel XE#2313]) +3 other tests skip
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
>     - shard-dg2-set2:     [SKIP][191] ([Intel XE#653]) -> [SKIP][192] ([Intel XE#4208]) +3 other tests skip
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][193] ([Intel XE#3544]) -> [SKIP][194] ([Intel XE#3374] / [Intel XE#3544])
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-bmg:          [SKIP][195] ([Intel XE#2493]) -> [SKIP][196] ([Intel XE#4596])
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-yf.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-dg2-set2:     [SKIP][197] ([Intel XE#870]) -> [SKIP][198] ([Intel XE#4208])
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_pm_backlight@fade-with-dpms.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-dg2-set2:     [SKIP][199] ([Intel XE#1129]) -> [SKIP][200] ([Intel XE#2351] / [Intel XE#4208])
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
>     - shard-dg2-set2:     [SKIP][201] ([Intel XE#1489]) -> [SKIP][202] ([Intel XE#4208]) +1 other test skip
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr@fbc-psr2-basic:
>     - shard-dg2-set2:     [SKIP][203] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][204] ([Intel XE#4208]) +1 other test skip
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@kms_psr@fbc-psr2-basic.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@kms_psr@fbc-psr2-basic.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][205] ([Intel XE#2509]) -> [SKIP][206] ([Intel XE#2426])
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfd:
>     - shard-dg2-set2:     [SKIP][207] ([Intel XE#1126]) -> [SKIP][208] ([Intel XE#4208])
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfd.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfd.html
> 
>   * igt@xe_eudebug_online@tdctl-parameters:
>     - shard-dg2-set2:     [SKIP][209] ([Intel XE#4837]) -> [SKIP][210] ([Intel XE#4208])
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@xe_eudebug_online@tdctl-parameters.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@xe_eudebug_online@tdctl-parameters.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue:
>     - shard-dg2-set2:     [SKIP][211] ([Intel XE#288]) -> [SKIP][212] ([Intel XE#4208]) +1 other test skip
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html
> 
>   * igt@xe_exec_system_allocator@threads-many-new-race-nomemset:
>     - shard-dg2-set2:     [SKIP][213] ([Intel XE#4915]) -> [SKIP][214] ([Intel XE#4208]) +17 other tests skip
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@xe_exec_system_allocator@threads-many-new-race-nomemset.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@xe_exec_system_allocator@threads-many-new-race-nomemset.html
> 
>   * igt@xe_oa@buffer-size:
>     - shard-dg2-set2:     [SKIP][215] ([Intel XE#4501]) -> [SKIP][216] ([Intel XE#4208])
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@xe_oa@buffer-size.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@xe_oa@buffer-size.html
> 
>   * igt@xe_oa@syncs-syncobj-wait-cfg:
>     - shard-dg2-set2:     [SKIP][217] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) -> [SKIP][218] ([Intel XE#4208])
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@xe_oa@syncs-syncobj-wait-cfg.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@xe_oa@syncs-syncobj-wait-cfg.html
> 
>   * igt@xe_render_copy@render-stress-1-copies:
>     - shard-dg2-set2:     [SKIP][219] ([Intel XE#4814]) -> [SKIP][220] ([Intel XE#4208])
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4/shard-dg2-435/igt@xe_render_copy@render-stress-1-copies.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/shard-dg2-464/igt@xe_render_copy@render-stress-1-copies.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
>   [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
>   [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
>   [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
>   [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
>   [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>   [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
>   [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
>   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
>   [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
>   [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>   [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
>   [Intel XE#4488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488
>   [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
>   [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
>   [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
>   [Intel XE#4817]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4817
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4862
>   [Intel XE#4883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4883
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#4937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4 -> xe-pw-148672v2
> 
>   IGT_8354: 59f7153426484367f58edfafb6567ce4e6a9e499 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-3044-b5600d5671f0e468c0c73bc7a1de942097ddaab4: b5600d5671f0e468c0c73bc7a1de942097ddaab4
>   xe-pw-148672v2: 148672v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148672v2/index.html
> 

