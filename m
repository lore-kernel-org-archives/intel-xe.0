Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599C0C2D0CD
	for <intel-xe@archiver.kernel.org>; Mon, 19 May 2025 05:56:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279B210E3AF;
	Mon, 19 May 2025 05:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BGfKY7LA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EBEA10E35B
 for <intel-xe@lists.freedesktop.org>; Mon, 19 May 2025 05:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747634189; x=1779170189;
 h=message-id:date:mime-version:subject:to:references:cc:
 from:in-reply-to:content-transfer-encoding;
 bh=Mg9789XXtBXRg+4RXz3DC5vmV+W1UWG8EKlhjUHaQoM=;
 b=BGfKY7LA/R9Mnpg2h0Az43eLLeSSSrHbA75cgDlDQGVHwiwY737R+uL9
 Aq1AXkJyKG8gsiUkkaQbpl2nQSxsq70H+R1n+MxnVtRiNqnWy5wdF7IlN
 bqBYbz1zloHvKWQ7LLXeK0HjYnGe8NOKipWBkfRKuO3AnqcitoDAXmv8r
 R4hF7qJjdm4YbUZmyM3jAPBSM6Jsqn+Letrf/GU98O/BTBn8APZX0Mx+i
 XVQUNu/qrPUun8118XFSfHRrPpGOxJxAmNACN22Vhq6gJ9na/9jNO+HHL
 PT7b947NKRYqyPhrB5+k+bS23X8YUEYRWugAYf8mpO4puN12FJUsyNG22 Q==;
X-CSE-ConnectionGUID: HV8PAcPWQFW9egWHB5JYmA==
X-CSE-MsgGUID: SIEALSBzR5iVF4KcFN8bTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="37136345"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="37136345"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2025 22:56:26 -0700
X-CSE-ConnectionGUID: mNG07ZSpQrqTlxVCExPNwg==
X-CSE-MsgGUID: fKUJFSd2QuGiV5EJp0gH/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="144516394"
Received: from ranaarun-mobl1.gar.corp.intel.com (HELO [10.247.226.153])
 ([10.247.226.153])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2025 22:56:24 -0700
Message-ID: <fc864a7f-4446-4a03-9266-38e975373118@intel.com>
Date: Mon, 19 May 2025 11:26:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKckyBYZS5DSS5GdWxsOiBzdWNjZXNzIGZvciBkcm0veGU6IERl?=
 =?UTF-8?Q?fault_auto=5Flink=5Fdowngrade_status_to_false_=28rev2=29?=
To: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
References: <20250516124355.4872-1-aradhya.bhatia@intel.com>
 <174747513881.90963.12862941237366051590@c664b1dc75d1>
Content-Language: en-US
Cc: intel-xe@lists.freedesktop.org
From: Aradhya Bhatia <aradhya.bhatia@intel.com>
In-Reply-To: <174747513881.90963.12862941237366051590@c664b1dc75d1>
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

On 17-05-2025 15:15, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Default auto_link_downgrade status to false (rev2)
> URL   : https://patchwork.freedesktop.org/series/149101/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2_FULL -> xe-pw-149101v2_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 

No issues/possible regressions were found with this patch.


Regards
Aradhya

>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-149101v2_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-adlp:         [PASS][1] -> [FAIL][2] ([Intel XE#3908]) +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327]) +2 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#1124]) +4 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [PASS][5] -> [DMESG-FAIL][6] ([Intel XE#4543]) +1 other test dmesg-fail
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2328])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2314] / [Intel XE#2894])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#367])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2887]) +9 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#3432])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#455] / [Intel XE#787]) +25 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#787]) +181 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>     - shard-dg2-set2:     [PASS][15] -> [INCOMPLETE][16] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
>     - shard-dg2-set2:     [PASS][17] -> [INCOMPLETE][18] ([Intel XE#3124])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][19] -> [DMESG-WARN][20] ([Intel XE#1727] / [Intel XE#3113])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][21] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_chamelium_color@ctm-green-to-red:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2325])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_chamelium_color@ctm-green-to-red.html
> 
>   * igt@kms_chamelium_edid@dp-edid-resolution-list:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2252]) +3 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-resolution-list.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2390])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@legacy@pipe-a-dp-2:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][25] ([Intel XE#1178])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-432/igt@kms_content_protection@legacy@pipe-a-dp-2.html
>     - shard-bmg:          NOTRUN -> [FAIL][26] ([Intel XE#1178])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-2/igt@kms_content_protection@legacy@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-32x32:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2320])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-32x32.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>     - shard-bmg:          [PASS][28] -> [SKIP][29] ([Intel XE#2291]) +2 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:
>     - shard-bmg:          [PASS][30] -> [DMESG-WARN][31] ([Intel XE#3428])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2286])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#1508])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#4156])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2373])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#1138])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
>     - shard-bmg:          NOTRUN -> [FAIL][37] ([Intel XE#3321]) +3 other tests fail
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a2-dp2:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][38] ([Intel XE#301]) +3 other tests fail
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a2-dp2.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-interruptible:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2316]) +1 other test skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html
> 
>   * igt@kms_flip@2x-nonexisting-fb:
>     - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#2316]) +2 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
>     - shard-dg2-set2:     [PASS][42] -> [FAIL][43] ([Intel XE#301] / [Intel XE#3321])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:
>     - shard-dg2-set2:     [PASS][44] -> [FAIL][45] ([Intel XE#301]) +2 other tests fail
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:
>     - shard-bmg:          [PASS][46] -> [FAIL][47] ([Intel XE#3321]) +1 other test fail
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html
> 
>   * igt@kms_flip@plain-flip-ts-check-interruptible:
>     - shard-dg2-set2:     [PASS][48] -> [FAIL][49] ([Intel XE#2882])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-dg2-464/igt@kms_flip@plain-flip-ts-check-interruptible.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-432/igt@kms_flip@plain-flip-ts-check-interruptible.html
> 
>   * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a2:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][50] ([Intel XE#886]) +1 other test fail
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-432/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a2.html
> 
>   * igt@kms_flip@wf_vblank-ts-check:
>     - shard-dg2-set2:     [PASS][51] -> [FAIL][52] ([Intel XE#886])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-dg2-435/igt@kms_flip@wf_vblank-ts-check.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-432/igt@kms_flip@wf_vblank-ts-check.html
> 
>   * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3:
>     - shard-bmg:          [PASS][53] -> [FAIL][54] ([Intel XE#2882]) +1 other test fail
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-8/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a3.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2293]) +1 other test skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2311]) +13 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#656])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>     - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#4141]) +6 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2312]) +9 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2313]) +11 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_plane_multiple@tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#5020])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_plane_multiple@tiling-y.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
>     - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2763]) +4 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#870])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_pm_backlight@fade.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#1489]) +2 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2387])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@psr2-sprite-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_psr@psr2-sprite-blt.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2330])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_setmode@basic:
>     - shard-adlp:         [PASS][69] -> [FAIL][70] ([Intel XE#2883]) +2 other tests fail
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-3/igt@kms_setmode@basic.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-adlp-4/igt@kms_setmode@basic.html
> 
>   * igt@kms_vrr@seamless-rr-switch-vrr:
>     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#1499])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-vrr.html
> 
>   * igt@xe_eudebug@basic-client-th:
>     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#4837]) +6 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@xe_eudebug@basic-client-th.html
> 
>   * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind:
>     - shard-adlp:         [PASS][73] -> [DMESG-WARN][74] ([Intel XE#4173]) +9 other tests dmesg-warn
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-8/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-adlp-1/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
>     - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2322]) +3 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
>     - shard-dg2-set2:     [PASS][76] -> [SKIP][77] ([Intel XE#1392]) +9 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
> 
>   * igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge:
>     - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#4943]) +10 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@xe_exec_system_allocator@process-many-execqueues-mmap-huge.html
> 
>   * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-nomemset:
>     - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#4915]) +4 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-adlp-6/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-nomemset.html
> 
>   * igt@xe_oa@non-sampling-read-error:
>     - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-adlp-6/igt@xe_oa@non-sampling-read-error.html
> 
>   * igt@xe_peer2peer@write:
>     - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2427])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-5/igt@xe_peer2peer@write.html
> 
>   * igt@xe_pm@s2idle-d3cold-basic-exec:
>     - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2284]) +1 other test skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@xe_pm@s2idle-d3cold-basic-exec.html
> 
>   * igt@xe_pmu@gt-frequency:
>     - shard-dg2-set2:     [PASS][83] -> [FAIL][84] ([Intel XE#4817]) +1 other test fail
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-dg2-432/igt@xe_pmu@gt-frequency.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-432/igt@xe_pmu@gt-frequency.html
> 
>   * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
>     - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#4733])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html
> 
>   * igt@xe_query@multigpu-query-invalid-cs-cycles:
>     - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#944]) +1 other test skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@xe_query@multigpu-query-invalid-cs-cycles.html
> 
>   * igt@xe_sriov_flr@flr-vfs-parallel:
>     - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#4273])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@xe_sriov_flr@flr-vfs-parallel.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:
>     - shard-adlp:         [DMESG-WARN][88] ([Intel XE#4173]) -> [PASS][89]
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-2/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-adlp-3/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
>     - shard-adlp:         [FAIL][90] ([Intel XE#827]) -> [PASS][91] +1 other test pass
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
>     - shard-adlp:         [FAIL][92] ([Intel XE#3908]) -> [PASS][93] +1 other test pass
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [DMESG-FAIL][94] ([Intel XE#4543]) -> [PASS][95]
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>     - shard-bmg:          [SKIP][96] ([Intel XE#2291]) -> [PASS][97] +2 other tests pass
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-atomic:
>     - shard-bmg:          [FAIL][98] ([Intel XE#2188]) -> [PASS][99]
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
>     - shard-bmg:          [FAIL][100] ([Intel XE#3321]) -> [PASS][101]
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a2-dp2:
>     - shard-dg2-set2:     [FAIL][102] ([Intel XE#301]) -> [PASS][103]
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a2-dp2.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a2-dp2.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate:
>     - shard-bmg:          [SKIP][104] ([Intel XE#2316]) -> [PASS][105] +4 other tests pass
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check:
>     - shard-dg2-set2:     [FAIL][106] ([Intel XE#886]) -> [PASS][107]
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-dg2-432/igt@kms_flip@2x-wf_vblank-ts-check.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-433/igt@kms_flip@2x-wf_vblank-ts-check.html
> 
>   * igt@kms_flip@flip-vs-dpms-on-nop-interruptible:
>     - shard-bmg:          [FAIL][108] ([Intel XE#886]) -> [PASS][109]
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-6/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html
> 
>   * igt@kms_flip@flip-vs-dpms-on-nop-interruptible@d-hdmi-a3:
>     - shard-bmg:          [FAIL][110] -> [PASS][111] +1 other test pass
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-6/igt@kms_flip@flip-vs-dpms-on-nop-interruptible@d-hdmi-a3.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@kms_flip@flip-vs-dpms-on-nop-interruptible@d-hdmi-a3.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-adlp:         [DMESG-WARN][112] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][113] +2 other tests pass
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-2/igt@kms_flip@flip-vs-suspend.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-adlp-3/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3:
>     - shard-bmg:          [FAIL][114] ([Intel XE#2882]) -> [PASS][115] +3 other tests pass
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-4/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html
> 
>   * igt@kms_plane_multiple@2x-tiling-4:
>     - shard-bmg:          [SKIP][116] ([Intel XE#4596]) -> [PASS][117]
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc:
>     - shard-bmg:          [SKIP][118] ([Intel XE#1435]) -> [PASS][119]
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-bmg:          [ABORT][120] ([Intel XE#4979]) -> [PASS][121] +1 other test pass
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-2:
>     - shard-bmg:          [DMESG-WARN][122] ([Intel XE#3428]) -> [PASS][123]
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-2.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-2.html
> 
>   * igt@xe_exec_basic@multigpu-once-null:
>     - shard-dg2-set2:     [SKIP][124] ([Intel XE#1392]) -> [PASS][125] +3 other tests pass
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-433/igt@xe_exec_basic@multigpu-once-null.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
>     - shard-bmg:          [ABORT][126] -> [PASS][127]
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
> 
>   * igt@xe_module_load@many-reload:
>     - shard-bmg:          [INCOMPLETE][128] -> [PASS][129]
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-1/igt@xe_module_load@many-reload.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-1/igt@xe_module_load@many-reload.html
> 
>   * igt@xe_pm@s3-vm-bind-prefetch:
>     - shard-bmg:          [DMESG-WARN][130] ([Intel XE#3428] / [Intel XE#569]) -> [PASS][131]
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-6/igt@xe_pm@s3-vm-bind-prefetch.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-2/igt@xe_pm@s3-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-adlp:         [ABORT][132] ([Intel XE#1794]) -> [PASS][133]
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-adlp-9/igt@xe_pm@s4-mocs.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-adlp-6/igt@xe_pm@s4-mocs.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     [INCOMPLETE][134] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [INCOMPLETE][135] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-bmg:          [SKIP][136] ([Intel XE#2341]) -> [FAIL][137] ([Intel XE#1178])
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-6/igt@kms_content_protection@legacy.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-2/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:
>     - shard-bmg:          [SKIP][138] ([Intel XE#2312]) -> [SKIP][139] ([Intel XE#2311]) +7 other tests skip
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
>     - shard-bmg:          [SKIP][140] ([Intel XE#4141]) -> [SKIP][141] ([Intel XE#2312])
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
>     - shard-bmg:          [SKIP][142] ([Intel XE#2312]) -> [SKIP][143] ([Intel XE#4141]) +4 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
>     - shard-bmg:          [SKIP][144] ([Intel XE#2311]) -> [SKIP][145] ([Intel XE#2312]) +8 other tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
>     - shard-bmg:          [SKIP][146] ([Intel XE#2312]) -> [SKIP][147] ([Intel XE#2313]) +5 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
>     - shard-bmg:          [SKIP][148] ([Intel XE#2313]) -> [SKIP][149] ([Intel XE#2312]) +7 other tests skip
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#2188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2188
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>   [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>   [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
>   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
>   [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
>   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>   [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
>   [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>   [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
>   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>   [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4817]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4817
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#4979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4979
>   [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
>   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2 -> xe-pw-149101v2
> 
>   IGT_8365: 8365
>   xe-3100-6d2dd85ba4eb3df89dc816c03b5bf81a470865b2: 6d2dd85ba4eb3df89dc816c03b5bf81a470865b2
>   xe-pw-149101v2: 149101v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149101v2/index.html
> 

