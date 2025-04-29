Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5089CC369DC
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 10:11:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479AF10E41B;
	Tue, 29 Apr 2025 10:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DRUsw3B0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D0C10E41B
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 10:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745921507; x=1777457507;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=551SzDQyJAZw+pwMpuvYiqL7Zk0Td3VGIoYq8QSy1no=;
 b=DRUsw3B0e+lkm3YN+oY5Z1Tmw3sgwC6GhumP/G4LYYvLcdjK4YpvxvXB
 AFfQZCll2V/RP7VzQXoldUdE3Wu0fMUD9zFTd4WUqByawKysMWKc4Gile
 wfu4UAGV1y7rOPuPYsDMmXhraUOlhdLDjbfIm9gCAzXAEOSuziaNxN28s
 3L3WjFpIRRfl/CgmdwIn2fSRtyy9qgdd5NfaHfs8CQPm0pkA7WJpe2RVk
 0FIMoEFnNDMFznvYJnp9y3qIrxmUP1MPETtKP7StwqZDpYhO8P+og3T/o
 6QZw74mVRwPggKeW+GkooQYAQawbviggzaClQGLAiqwgS7x44ExrXNE82 Q==;
X-CSE-ConnectionGUID: /76Hp5tzRFu9e2YvVlkM9w==
X-CSE-MsgGUID: 1aaw6z+TTrKtppuWCB7BGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58522995"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="58522995"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 03:11:45 -0700
X-CSE-ConnectionGUID: iPg6IYcyQdOKOntPfrptJA==
X-CSE-MsgGUID: pSO978QXShGDxoUsS2dmig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="171019376"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.244.224])
 ([10.245.244.224])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 03:11:44 -0700
Message-ID: <6163d30d-af67-4a9c-8ed6-f172f3011bef@intel.com>
Date: Tue, 29 Apr 2025 11:11:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGU6IERv?=
 =?UTF-8?Q?_not_print_timedout_job_message_on_killed_exec_queues?=
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20250428175505.935694-1-matthew.brost@intel.com>
 <174587319493.22056.7891850136061357679@c664b1dc75d1>
 <aA/ugJMtc5H1VDcN@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <aA/ugJMtc5H1VDcN@lstrano-desk.jf.intel.com>
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

On 28/04/2025 22:09, Matthew Brost wrote:
> On Mon, Apr 28, 2025 at 08:46:34PM +0000, Patchwork wrote:
>> == Series Details ==
>>
>> Series: drm/xe: Do not print timedout job message on killed exec queues
>> URL   : https://patchwork.freedesktop.org/series/148376/
>> State : failure
>>
>> == Summary ==
>>
>> CI Bug Log - changes from xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed_FULL -> xe-pw-148376v1_FULL
>> ====================================================
>>
>> Summary
>> -------
>>
>>    **FAILURE**
>>
>>    Serious unknown changes coming with xe-pw-148376v1_FULL absolutely need to be
>>    verified manually.
>>    
>>    If you think the reported changes have nothing to do with the changes
>>    introduced in xe-pw-148376v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>>    to document this new failure mode, which will reduce false positives in CI.
>>
>>    
>>
>> Participating hosts (4 -> 4)
>> ------------------------------
>>
>>    No changes in participating hosts
>>
>> Possible new issues
>> -------------------
>>
>>    Here are the unknown changes that may have been introduced in xe-pw-148376v1_FULL:
>>
>> ### IGT changes ###
>>
>> #### Possible regressions ####
>>
>>    * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
>>      - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2]
>>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
>>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
>>
>>    * igt@xe_exec_system_allocator@process-many-large-mmap-new-huge-nomemset:
>>      - shard-lnl:          NOTRUN -> [FAIL][3] +2 other tests fail
>>     [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-3/igt@xe_exec_system_allocator@process-many-large-mmap-new-huge-nomemset.html
> 
> We either need to blacklist *huge* sections in our CI runs as this don't
> work without explictly enabling huge TLB via the below command - it
> needs to be run at least once before these sections will work.
> 
> echo 128 >  /proc/sys/vm/nr_hugepages

Would it make sense to drop hugetlb and instead cut over to THP with 
madvise(map, ..., MADV_HUGEPAGE) for this test?

> 
> Matt
> 
>>
>>    
>> #### Warnings ####
>>
>>    * igt@testdisplay:
>>      - shard-dg2-set2:     [ABORT][4] ([Intel XE#2705]) -> [ABORT][5]
>>     [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-dg2-464/igt@testdisplay.html
>>     [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-432/igt@testdisplay.html
>>
>>    
>> New tests
>> ---------
>>
>>    New tests have been introduced between xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed_FULL and xe-pw-148376v1_FULL:
>>
>> ### New IGT tests (2) ###
>>
>>    * igt@kms_cursor_edge_walk@64x64-top-edge@pipe-a-dp-2:
>>      - Statuses : 1 pass(s)
>>      - Exec time: [3.43] s
>>
>>    * igt@kms_cursor_edge_walk@64x64-top-edge@pipe-d-dp-2:
>>      - Statuses : 1 pass(s)
>>      - Exec time: [3.31] s
>>
>>    
>>
>> Known issues
>> ------------
>>
>>    Here are the changes found in xe-pw-148376v1_FULL that come from known issues:
>>
>> ### IGT changes ###
>>
>> #### Issues hit ####
>>
>>    * igt@kms_3d:
>>      - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1465])
>>     [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-2/igt@kms_3d.html
>>
>>    * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>>      - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1466])
>>     [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>>
>>    * igt@kms_async_flips@async-flip-suspend-resume:
>>      - shard-adlp:         [PASS][8] -> [DMESG-WARN][9] ([Intel XE#4543]) +2 other tests dmesg-warn
>>     [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-3/igt@kms_async_flips@async-flip-suspend-resume.html
>>     [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume.html
>>
>>    * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:
>>      - shard-lnl:          NOTRUN -> [FAIL][10] ([Intel XE#911])
>>     [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html
>>
>>    * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-6-4-mc-ccs:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#3767]) +7 other tests skip
>>     [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-6-4-mc-ccs.html
>>
>>    * igt@kms_async_flips@invalid-async-flip-atomic:
>>      - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#3768])
>>     [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-1/igt@kms_async_flips@invalid-async-flip-atomic.html
>>      - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#3768])
>>     [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-4/igt@kms_async_flips@invalid-async-flip-atomic.html
>>
>>    * igt@kms_atomic@plane-immutable-zpos:
>>      - shard-dg2-set2:     [PASS][14] -> [SKIP][15] ([Intel XE#4208] / [i915#2575]) +6 other tests skip
>>     [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-dg2-436/igt@kms_atomic@plane-immutable-zpos.html
>>     [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-464/igt@kms_atomic@plane-immutable-zpos.html
>>
>>    * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-4:
>>      - shard-dg2-set2:     [PASS][16] -> [INCOMPLETE][17] ([Intel XE#2613]) +1 other test incomplete
>>     [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-4.html
>>     [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-4.html
>>
>>    * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>>      - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#3658]) +1 other test skip
>>     [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>>
>>    * igt@kms_big_fb@linear-32bpp-rotate-90:
>>      - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2327])
>>     [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotate-90.html
>>
>>    * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#316]) +2 other tests skip
>>     [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
>>      - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1407]) +2 other tests skip
>>     [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-8/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
>>
>>    * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
>>      - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1124]) +12 other tests skip
>>     [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
>>
>>    * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>>      - shard-adlp:         [PASS][23] -> [DMESG-FAIL][24] ([Intel XE#4543]) +5 other tests dmesg-fail
>>     [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>>     [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>>
>>    * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
>>      - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1124])
>>     [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
>>      - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#1124]) +5 other tests skip
>>     [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
>>
>>    * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1124]) +12 other tests skip
>>     [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>>
>>    * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#367]) +3 other tests skip
>>     [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
>>
>>    * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>>      - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#367])
>>     [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-4/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
>>
>>    * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
>>      - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1512])
>>     [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
>>
>>    * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
>>      - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#367])
>>     [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-6/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
>>
>>    * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
>>      - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#455] / [Intel XE#787]) +8 other tests skip
>>     [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html
>>
>>    * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
>>      - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#2887]) +16 other tests skip
>>     [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-7/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html
>>
>>    * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
>>      - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#787]) +20 other tests skip
>>     [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-9/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html
>>
>>    * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#455] / [Intel XE#787]) +25 other tests skip
>>     [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html
>>
>>    * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
>>      - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2887]) +7 other tests skip
>>     [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-1/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
>>
>>    * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#787]) +125 other tests skip
>>     [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
>>
>>    * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>>      - shard-dg2-set2:     [PASS][38] -> [INCOMPLETE][39] ([Intel XE#3862])
>>     [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
>>     [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
>>
>>    * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
>>      - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#3432])
>>     [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
>>
>>    * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
>>      - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#2669]) +3 other tests skip
>>     [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-1/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
>>
>>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
>>      - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][42] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
>>     [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html
>>
>>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>>      - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][43] ([Intel XE#1727] / [Intel XE#3113])
>>     [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>>
>>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-2:
>>      - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][44] ([Intel XE#3113])
>>     [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-2.html
>>
>>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
>>      - shard-dg2-set2:     [PASS][45] -> [INCOMPLETE][46] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
>>     [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
>>     [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
>>
>>    * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#2907])
>>     [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
>>
>>    * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
>>      - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
>>     [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html
>>
>>    * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
>>      - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#4417]) +3 other tests skip
>>     [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-7/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html
>>
>>    * igt@kms_chamelium_color@ctm-limited-range:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#306])
>>     [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-466/igt@kms_chamelium_color@ctm-limited-range.html
>>
>>    * igt@kms_chamelium_color@ctm-red-to-blue:
>>      - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2325])
>>     [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-1/igt@kms_chamelium_color@ctm-red-to-blue.html
>>      - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#306])
>>     [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-8/igt@kms_chamelium_color@ctm-red-to-blue.html
>>
>>    * igt@kms_chamelium_frames@dp-crc-single:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#373]) +9 other tests skip
>>     [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-435/igt@kms_chamelium_frames@dp-crc-single.html
>>
>>    * igt@kms_chamelium_frames@hdmi-crc-multiple:
>>      - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#373])
>>     [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-4/igt@kms_chamelium_frames@hdmi-crc-multiple.html
>>
>>    * igt@kms_chamelium_frames@hdmi-frame-dump:
>>      - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2252]) +2 other tests skip
>>     [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-4/igt@kms_chamelium_frames@hdmi-frame-dump.html
>>
>>    * igt@kms_chamelium_hpd@hdmi-hpd:
>>      - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#373]) +9 other tests skip
>>     [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-3/igt@kms_chamelium_hpd@hdmi-hpd.html
>>
>>    * igt@kms_content_protection@legacy:
>>      - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#455])
>>     [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-3/igt@kms_content_protection@legacy.html
>>      - shard-bmg:          NOTRUN -> [FAIL][58] ([Intel XE#1178]) +3 other tests fail
>>     [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-1/igt@kms_content_protection@legacy.html
>>      - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#3278]) +2 other tests skip
>>     [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-4/igt@kms_content_protection@legacy.html
>>
>>    * igt@kms_content_protection@srm@pipe-a-dp-4:
>>      - shard-dg2-set2:     NOTRUN -> [FAIL][60] ([Intel XE#1178]) +2 other tests fail
>>     [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-464/igt@kms_content_protection@srm@pipe-a-dp-4.html
>>
>>    * igt@kms_content_protection@uevent@pipe-a-dp-2:
>>      - shard-bmg:          NOTRUN -> [FAIL][61] ([Intel XE#1188])
>>     [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-6/igt@kms_content_protection@uevent@pipe-a-dp-2.html
>>
>>    * igt@kms_cursor_crc@cursor-onscreen-512x512:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#308])
>>     [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>>      - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#2321]) +1 other test skip
>>     [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>>      - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#308])
>>     [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>>      - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2321])
>>     [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>>
>>    * igt@kms_cursor_crc@cursor-sliding-256x85:
>>      - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2320]) +1 other test skip
>>     [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-256x85.html
>>      - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#1424]) +2 other tests skip
>>     [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-256x85.html
>>
>>    * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#323])
>>     [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
>>
>>    * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>>      - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#309]) +4 other tests skip
>>     [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>>
>>    * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>>      - shard-bmg:          [PASS][70] -> [SKIP][71] ([Intel XE#2291]) +4 other tests skip
>>     [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
>>     [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
>>
>>    * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>>      - shard-bmg:          [PASS][72] -> [FAIL][73] ([Intel XE#1475])
>>     [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>>     [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>>
>>    * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:
>>      - shard-bmg:          [PASS][74] -> [DMESG-WARN][75] ([Intel XE#3428])
>>     [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html
>>     [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html
>>
>>    * igt@kms_dp_linktrain_fallback@dsc-fallback:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#4331])
>>     [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-464/igt@kms_dp_linktrain_fallback@dsc-fallback.html
>>
>>    * igt@kms_dsc@dsc-with-output-formats:
>>      - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#2244])
>>     [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-4/igt@kms_dsc@dsc-with-output-formats.html
>>
>>    * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
>>      - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#4422])
>>     [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
>>      - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#4422])
>>     [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
>>
>>    * igt@kms_feature_discovery@display-3x:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#703])
>>     [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-434/igt@kms_feature_discovery@display-3x.html
>>
>>    * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-dp2-hdmi-a3:
>>      - shard-bmg:          NOTRUN -> [FAIL][81] ([Intel XE#2882])
>>     [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-dp2-hdmi-a3.html
>>
>>    * igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:
>>      - shard-bmg:          [PASS][82] -> [FAIL][83] ([Intel XE#3321])
>>     [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html
>>     [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html
>>
>>    * igt@kms_flip@2x-flip-vs-wf_vblank:
>>      - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#310])
>>     [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-8/igt@kms_flip@2x-flip-vs-wf_vblank.html
>>
>>    * igt@kms_flip@2x-nonexisting-fb:
>>      - shard-bmg:          [PASS][85] -> [SKIP][86] ([Intel XE#2316]) +7 other tests skip
>>     [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html
>>     [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html
>>
>>    * igt@kms_flip@2x-plain-flip-ts-check:
>>      - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1421]) +5 other tests skip
>>     [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-4/igt@kms_flip@2x-plain-flip-ts-check.html
>>
>>    * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a6-dp4:
>>      - shard-dg2-set2:     [PASS][88] -> [FAIL][89] ([Intel XE#886]) +1 other test fail
>>     [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-dg2-434/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a6-dp4.html
>>     [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-433/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-hdmi-a6-dp4.html
>>
>>    * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
>>      - shard-lnl:          [PASS][90] -> [FAIL][91] ([Intel XE#301])
>>     [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
>>     [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
>>
>>    * igt@kms_flip@flip-vs-suspend-interruptible:
>>      - shard-bmg:          [PASS][92] -> [INCOMPLETE][93] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
>>     [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html
>>     [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html
>>
>>    * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>>      - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#1401] / [Intel XE#1745]) +3 other tests skip
>>     [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
>>
>>    * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
>>      - shard-lnl:          NOTRUN -> [FAIL][95] ([Intel XE#4683]) +1 other test fail
>>     [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
>>
>>    * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:
>>      - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#1401]) +3 other tests skip
>>     [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html
>>
>>    * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#2351] / [Intel XE#4208])
>>     [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
>>
>>    * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#455]) +13 other tests skip
>>     [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
>>
>>    * igt@kms_force_connector_basic@force-connector-state:
>>      - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#352]) +1 other test skip
>>     [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-3/igt@kms_force_connector_basic@force-connector-state.html
>>
>>    * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#651]) +32 other tests skip
>>     [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
>>
>>    * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
>>      - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#651]) +9 other tests skip
>>     [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html
>>      - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#651])
>>     [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html
>>
>>    * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render:
>>      - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2311]) +9 other tests skip
>>     [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-render.html
>>
>>    * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-plflip-blt:
>>      - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2312]) +2 other tests skip
>>     [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-plflip-blt.html
>>
>>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
>>      - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#656]) +3 other tests skip
>>     [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
>>
>>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>>      - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#4141]) +3 other tests skip
>>     [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>>
>>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
>>      - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2313]) +6 other tests skip
>>     [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
>>
>>    * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#653]) +30 other tests skip
>>     [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
>>
>>    * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
>>      - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#656]) +36 other tests skip
>>     [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html
>>
>>    * igt@kms_hdr@static-swap:
>>      - shard-bmg:          [PASS][110] -> [SKIP][111] ([Intel XE#1503]) +2 other tests skip
>>     [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-5/igt@kms_hdr@static-swap.html
>>     [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-4/igt@kms_hdr@static-swap.html
>>      - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#1503])
>>     [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-3/igt@kms_hdr@static-swap.html
>>
>>    * igt@kms_lease@cursor-implicit-plane@pipe-a-hdmi-a-1:
>>      - shard-adlp:         NOTRUN -> [DMESG-WARN][113] ([Intel XE#4173])
>>     [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-1/igt@kms_lease@cursor-implicit-plane@pipe-a-hdmi-a-1.html
>>
>>    * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>>      - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#356])
>>     [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>>
>>    * igt@kms_plane@plane-panning-bottom-right-suspend:
>>      - shard-adlp:         [PASS][115] -> [DMESG-WARN][116] ([Intel XE#4173]) +1 other test dmesg-warn
>>     [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend.html
>>     [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-4/igt@kms_plane@plane-panning-bottom-right-suspend.html
>>
>>    * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
>>      - shard-dg2-set2:     NOTRUN -> [FAIL][117] ([Intel XE#616]) +4 other tests fail
>>     [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
>>
>>    * igt@kms_plane_multiple@2x-tiling-y:
>>      - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#4596])
>>     [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html
>>      - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#4596])
>>     [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-1/igt@kms_plane_multiple@2x-tiling-y.html
>>
>>    * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
>>     [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
>>
>>    * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#2763]) +2 other tests skip
>>     [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html
>>
>>    * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c:
>>      - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#2763]) +15 other tests skip
>>     [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c.html
>>
>>    * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>>      - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2763]) +9 other tests skip
>>     [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
>>
>>    * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:
>>      - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#2763]) +2 other tests skip
>>     [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html
>>
>>    * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d:
>>      - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#2763] / [Intel XE#455])
>>     [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d.html
>>
>>    * igt@kms_pm_dc@dc5-psr:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#1129])
>>     [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html
>>
>>    * igt@kms_pm_rpm@modeset-lpsp-stress:
>>      - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) +1 other test skip
>>     [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress.html
>>
>>    * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
>>      - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#2893]) +3 other tests skip
>>     [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
>>
>>    * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#1489]) +8 other tests skip
>>     [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
>>
>>    * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
>>      - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#1489])
>>     [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
>>
>>    * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
>>      - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#2893] / [Intel XE#4608]) +2 other tests skip
>>     [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
>>
>>    * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:
>>      - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#4608]) +6 other tests skip
>>     [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1.html
>>
>>    * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
>>      - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#1489]) +4 other tests skip
>>     [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
>>
>>    * igt@kms_psr2_su@page_flip-nv12:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#1122])
>>     [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html
>>      - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#1128])
>>     [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-5/igt@kms_psr2_su@page_flip-nv12.html
>>
>>    * igt@kms_psr@fbc-psr-no-drrs:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#2850] / [Intel XE#929]) +15 other tests skip
>>     [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-432/igt@kms_psr@fbc-psr-no-drrs.html
>>
>>    * igt@kms_psr@fbc-psr2-primary-blt:
>>      - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
>>     [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-8/igt@kms_psr@fbc-psr2-primary-blt.html
>>
>>    * igt@kms_psr@fbc-psr2-primary-blt@edp-1:
>>      - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#4609]) +3 other tests skip
>>     [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-6/igt@kms_psr@fbc-psr2-primary-blt@edp-1.html
>>
>>    * igt@kms_psr@fbc-psr2-primary-page-flip:
>>      - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#2850] / [Intel XE#929])
>>     [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-4/igt@kms_psr@fbc-psr2-primary-page-flip.html
>>
>>    * igt@kms_psr@pr-primary-blt:
>>      - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#1406]) +6 other tests skip
>>     [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-1/igt@kms_psr@pr-primary-blt.html
>>
>>    * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>>      - shard-lnl:          [PASS][141] -> [SKIP][142] ([Intel XE#4692])
>>     [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-lnl-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>>     [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>>
>>    * igt@kms_rotation_crc@primary-rotation-270:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#3414])
>>     [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-270.html
>>      - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#3414] / [Intel XE#3904])
>>     [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-6/igt@kms_rotation_crc@primary-rotation-270.html
>>
>>    * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>>      - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2330])
>>     [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
>>      - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#1127])
>>     [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
>>
>>    * igt@kms_setmode@invalid-clone-exclusive-crtc:
>>      - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#1435])
>>     [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html
>>      - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#1435])
>>     [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html
>>
>>    * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#1500])
>>     [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>>
>>    * igt@kms_tv_load_detect@load-detect:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#330])
>>     [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html
>>
>>    * igt@kms_vblank@invalid:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#4208] / [i915#2575]) +1 other test skip
>>     [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-464/igt@kms_vblank@invalid.html
>>
>>    * igt@kms_vrr@cmrr:
>>      - shard-adlp:         NOTRUN -> [SKIP][152] ([Intel XE#2168])
>>     [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-1/igt@kms_vrr@cmrr.html
>>      - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#2168])
>>     [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-3/igt@kms_vrr@cmrr.html
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][154] ([Intel XE#2168])
>>     [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-435/igt@kms_vrr@cmrr.html
>>
>>    * igt@kms_vrr@flip-dpms:
>>      - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#1499])
>>     [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-3/igt@kms_vrr@flip-dpms.html
>>
>>    * igt@kms_writeback@writeback-pixel-formats:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#756])
>>     [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-466/igt@kms_writeback@writeback-pixel-formats.html
>>
>>    * igt@sriov_basic@enable-vfs-autoprobe-off:
>>      - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#1091] / [Intel XE#2849])
>>     [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-4/igt@sriov_basic@enable-vfs-autoprobe-off.html
>>
>>    * igt@xe_compute_preempt@compute-preempt-many:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#1280] / [Intel XE#455]) +3 other tests skip
>>     [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-435/igt@xe_compute_preempt@compute-preempt-many.html
>>
>>    * igt@xe_copy_basic@mem-copy-linear-0xfffe:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][159] ([Intel XE#1123])
>>     [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
>>
>>    * igt@xe_eu_stall@invalid-event-report-count:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][160] ([Intel XE#4497]) +1 other test skip
>>     [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-435/igt@xe_eu_stall@invalid-event-report-count.html
>>
>>    * igt@xe_eudebug@discovery-race:
>>      - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#4837]) +3 other tests skip
>>     [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-6/igt@xe_eudebug@discovery-race.html
>>
>>    * igt@xe_eudebug@vm-bind-clear-faultable:
>>      - shard-lnl:          NOTRUN -> [SKIP][162] ([Intel XE#4837]) +9 other tests skip
>>     [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-3/igt@xe_eudebug@vm-bind-clear-faultable.html
>>
>>    * igt@xe_eudebug_online@resume-dss:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#4837]) +13 other tests skip
>>     [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-466/igt@xe_eudebug_online@resume-dss.html
>>
>>    * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
>>      - shard-lnl:          NOTRUN -> [SKIP][164] ([Intel XE#688]) +4 other tests skip
>>     [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html
>>
>>    * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
>>      - shard-dg2-set2:     [PASS][165] -> [SKIP][166] ([Intel XE#1392]) +3 other tests skip
>>     [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-dg2-434/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
>>     [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
>>
>>    * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
>>      - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#2322])
>>     [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html
>>
>>    * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
>>      - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#1392]) +4 other tests skip
>>     [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
>>
>>    * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][169] ([Intel XE#1392])
>>     [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html
>>
>>    * igt@xe_exec_basic@no-exec-basic-defer-bind:
>>      - shard-dg2-set2:     [PASS][170] -> [SKIP][171] ([Intel XE#4208]) +9 other tests skip
>>     [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-dg2-436/igt@xe_exec_basic@no-exec-basic-defer-bind.html
>>     [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-464/igt@xe_exec_basic@no-exec-basic-defer-bind.html
>>
>>    * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][172] ([Intel XE#288]) +20 other tests skip
>>     [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html
>>
>>    * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][173] ([Intel XE#2360])
>>     [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
>>
>>    * igt@xe_exec_system_allocator@fault-benchmark:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][174] ([Intel XE#4208]) +8 other tests skip
>>     [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-464/igt@xe_exec_system_allocator@fault-benchmark.html
>>
>>    * igt@xe_exec_system_allocator@process-many-large-mmap-new-nomemset:
>>      - shard-adlp:         NOTRUN -> [SKIP][175] ([Intel XE#4915]) +6 other tests skip
>>     [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-8/igt@xe_exec_system_allocator@process-many-large-mmap-new-nomemset.html
>>
>>    * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][176] ([Intel XE#4915]) +182 other tests skip
>>     [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-432/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset.html
>>
>>    * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge-nomemset:
>>      - shard-lnl:          NOTRUN -> [FAIL][177] ([Intel XE#4914]) +18 other tests fail
>>     [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-huge-nomemset.html
>>
>>    * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:
>>      - shard-bmg:          NOTRUN -> [FAIL][178] ([Intel XE#4914]) +6 other tests fail
>>     [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html
>>
>>    * igt@xe_noexec_ping_pong:
>>      - shard-lnl:          NOTRUN -> [SKIP][179] ([Intel XE#379])
>>     [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-2/igt@xe_noexec_ping_pong.html
>>
>>    * igt@xe_oa@closed-fd-and-unmapped-access:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][180] ([Intel XE#2541] / [Intel XE#3573]) +5 other tests skip
>>     [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-433/igt@xe_oa@closed-fd-and-unmapped-access.html
>>
>>    * igt@xe_oa@syncs-syncobj-wait-cfg:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][181] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
>>     [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-432/igt@xe_oa@syncs-syncobj-wait-cfg.html
>>
>>    * igt@xe_peer2peer@read:
>>      - shard-lnl:          NOTRUN -> [SKIP][182] ([Intel XE#1061])
>>     [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-4/igt@xe_peer2peer@read.html
>>
>>    * igt@xe_pm@d3cold-basic:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][183] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
>>     [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-464/igt@xe_pm@d3cold-basic.html
>>
>>    * igt@xe_pm@d3cold-multiple-execs:
>>      - shard-bmg:          NOTRUN -> [SKIP][184] ([Intel XE#2284])
>>     [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-7/igt@xe_pm@d3cold-multiple-execs.html
>>      - shard-lnl:          NOTRUN -> [SKIP][185] ([Intel XE#2284] / [Intel XE#366])
>>     [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-5/igt@xe_pm@d3cold-multiple-execs.html
>>
>>    * igt@xe_pm@s3-basic-exec:
>>      - shard-lnl:          NOTRUN -> [SKIP][186] ([Intel XE#584]) +1 other test skip
>>     [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-1/igt@xe_pm@s3-basic-exec.html
>>
>>    * igt@xe_pm@s4-exec-after:
>>      - shard-adlp:         [PASS][187] -> [ABORT][188] ([Intel XE#1794])
>>     [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-1/igt@xe_pm@s4-exec-after.html
>>     [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html
>>
>>    * igt@xe_pm@s4-mocs:
>>      - shard-lnl:          NOTRUN -> [ABORT][189] ([Intel XE#1794])
>>     [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-2/igt@xe_pm@s4-mocs.html
>>
>>    * igt@xe_pmu@gt-frequency:
>>      - shard-dg2-set2:     [PASS][190] -> [FAIL][191] ([Intel XE#4817]) +1 other test fail
>>     [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-dg2-464/igt@xe_pmu@gt-frequency.html
>>     [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-432/igt@xe_pmu@gt-frequency.html
>>
>>    * igt@xe_pxp@pxp-termination-key-update-post-rpm:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][192] ([Intel XE#4733]) +2 other tests skip
>>     [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-432/igt@xe_pxp@pxp-termination-key-update-post-rpm.html
>>
>>    * igt@xe_query@multigpu-query-topology:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][193] ([Intel XE#944]) +2 other tests skip
>>     [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-464/igt@xe_query@multigpu-query-topology.html
>>
>>    * igt@xe_query@multigpu-query-uc-fw-version-huc:
>>      - shard-lnl:          NOTRUN -> [SKIP][194] ([Intel XE#944]) +1 other test skip
>>     [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-7/igt@xe_query@multigpu-query-uc-fw-version-huc.html
>>
>>    * igt@xe_sriov_auto_provisioning@fair-allocation:
>>      - shard-lnl:          NOTRUN -> [SKIP][195] ([Intel XE#4130])
>>     [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-8/igt@xe_sriov_auto_provisioning@fair-allocation.html
>>      - shard-bmg:          NOTRUN -> [SKIP][196] ([Intel XE#4130])
>>     [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-1/igt@xe_sriov_auto_provisioning@fair-allocation.html
>>
>>    * igt@xe_sriov_flr@flr-vfs-parallel:
>>      - shard-dg2-set2:     NOTRUN -> [SKIP][197] ([Intel XE#4273])
>>     [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-432/igt@xe_sriov_flr@flr-vfs-parallel.html
>>
>>    
>> #### Possible fixes ####
>>
>>    * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on:
>>      - shard-adlp:         [SKIP][198] ([Intel XE#4618]) -> [PASS][199]
>>     [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-9/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html
>>     [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-3/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html
>>
>>    * igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-d-hdmi-a-1-y:
>>      - shard-adlp:         [DMESG-WARN][200] ([Intel XE#4543]) -> [PASS][201] +3 other tests pass
>>     [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-d-hdmi-a-1-y.html
>>     [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-d-hdmi-a-1-y.html
>>
>>    * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
>>      - shard-adlp:         [SKIP][202] -> [PASS][203] +48 other tests pass
>>     [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
>>     [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
>>
>>    * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
>>      - shard-bmg:          [SKIP][204] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][205]
>>     [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
>>     [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
>>
>>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
>>      - shard-dg2-set2:     [INCOMPLETE][206] ([Intel XE#3113] / [Intel XE#4212]) -> [PASS][207]
>>     [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
>>     [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
>>
>>    * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>>      - shard-bmg:          [SKIP][208] ([Intel XE#2291]) -> [PASS][209] +3 other tests pass
>>     [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
>>     [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
>>
>>    * igt@kms_feature_discovery@display-2x:
>>      - shard-bmg:          [SKIP][210] ([Intel XE#2373]) -> [PASS][211]
>>     [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-4/igt@kms_feature_discovery@display-2x.html
>>     [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-2/igt@kms_feature_discovery@display-2x.html
>>
>>    * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
>>      - shard-bmg:          [FAIL][212] ([Intel XE#3321]) -> [PASS][213] +5 other tests pass
>>     [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
>>     [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
>>
>>    * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
>>      - shard-dg2-set2:     [FAIL][214] ([Intel XE#301]) -> [PASS][215] +5 other tests pass
>>     [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
>>     [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
>>
>>    * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
>>      - shard-bmg:          [SKIP][216] ([Intel XE#2316]) -> [PASS][217] +6 other tests pass
>>     [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
>>     [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
>>
>>    * igt@kms_flip@blocking-wf_vblank:
>>      - shard-dg2-set2:     [FAIL][218] ([Intel XE#2882]) -> [PASS][219]
>>     [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-dg2-432/igt@kms_flip@blocking-wf_vblank.html
>>     [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-433/igt@kms_flip@blocking-wf_vblank.html
>>
>>    * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
>>      - shard-adlp:         [DMESG-WARN][220] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][221] +2 other tests pass
>>     [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
>>     [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
>>
>>    * igt@kms_flip@flip-vs-suspend@d-dp4:
>>      - shard-dg2-set2:     [INCOMPLETE][222] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][223] +1 other test pass
>>     [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html
>>     [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-435/igt@kms_flip@flip-vs-suspend@d-dp4.html
>>
>>    * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
>>      - shard-adlp:         [DMESG-FAIL][224] ([Intel XE#4543]) -> [PASS][225] +7 other tests pass
>>     [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
>>     [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
>>
>>    * igt@kms_plane_multiple@2x-tiling-4:
>>      - shard-bmg:          [SKIP][226] ([Intel XE#4596]) -> [PASS][227]
>>     [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html
>>     [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4.html
>>
>>    * igt@kms_pm_dc@dc6-psr:
>>      - shard-lnl:          [FAIL][228] ([Intel XE#718]) -> [PASS][229] +1 other test pass
>>     [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html
>>     [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html
>>
>>    * igt@kms_vblank@wait-idle:
>>      - shard-adlp:         [DMESG-WARN][230] ([Intel XE#4173]) -> [PASS][231]
>>     [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-4/igt@kms_vblank@wait-idle.html
>>     [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-4/igt@kms_vblank@wait-idle.html
>>
>>    * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
>>      - shard-dg2-set2:     [SKIP][232] ([Intel XE#1392]) -> [PASS][233] +4 other tests pass
>>     [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
>>     [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-433/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
>>
>>    * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
>>      - shard-lnl:          [FAIL][234] -> [PASS][235]
>>     [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
>>     [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
>>
>>    * igt@xe_pm@s4-basic-exec:
>>      - shard-lnl:          [ABORT][236] ([Intel XE#1794]) -> [PASS][237]
>>     [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
>>     [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-lnl-7/igt@xe_pm@s4-basic-exec.html
>>
>>    
>> #### Warnings ####
>>
>>    * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>>      - shard-adlp:         [SKIP][238] -> [SKIP][239] ([Intel XE#1124]) +1 other test skip
>>     [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>>     [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>>
>>    * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
>>      - shard-adlp:         [SKIP][240] -> [DMESG-FAIL][241] ([Intel XE#4543])
>>     [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-9/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
>>     [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-1/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
>>
>>    * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:
>>      - shard-adlp:         [DMESG-FAIL][242] ([Intel XE#4543]) -> [FAIL][243] ([Intel XE#1874])
>>     [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html
>>     [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html
>>
>>    * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>>      - shard-adlp:         [SKIP][244] ([Intel XE#2351]) -> [SKIP][245] ([Intel XE#1124])
>>     [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>>     [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>>
>>    * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
>>      - shard-adlp:         [SKIP][246] -> [SKIP][247] ([Intel XE#455] / [Intel XE#787]) +4 other tests skip
>>     [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-9/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
>>     [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
>>
>>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>>      - shard-dg2-set2:     [INCOMPLETE][248] ([Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345]) -> [INCOMPLETE][249] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
>>     [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>>     [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>>
>>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>>      - shard-dg2-set2:     [INCOMPLETE][250] ([Intel XE#2705] / [Intel XE#4212]) -> [INCOMPLETE][251] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
>>     [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>>     [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>>
>>    * igt@kms_chamelium_color@ctm-red-to-blue:
>>      - shard-adlp:         [SKIP][252] -> [SKIP][253] ([Intel XE#306])
>>     [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-9/igt@kms_chamelium_color@ctm-red-to-blue.html
>>     [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-4/igt@kms_chamelium_color@ctm-red-to-blue.html
>>
>>    * igt@kms_chamelium_frames@hdmi-frame-dump:
>>      - shard-adlp:         [SKIP][254] -> [SKIP][255] ([Intel XE#373])
>>     [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-9/igt@kms_chamelium_frames@hdmi-frame-dump.html
>>     [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-9/igt@kms_chamelium_frames@hdmi-frame-dump.html
>>
>>    * igt@kms_content_protection@atomic:
>>      - shard-bmg:          [FAIL][256] ([Intel XE#1178]) -> [SKIP][257] ([Intel XE#2341])
>>     [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-2/igt@kms_content_protection@atomic.html
>>     [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-4/igt@kms_content_protection@atomic.html
>>
>>    * igt@kms_content_protection@srm:
>>      - shard-bmg:          [SKIP][258] ([Intel XE#2341]) -> [FAIL][259] ([Intel XE#1178]) +1 other test fail
>>     [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-4/igt@kms_content_protection@srm.html
>>     [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-8/igt@kms_content_protection@srm.html
>>
>>    * igt@kms_content_protection@uevent:
>>      - shard-bmg:          [SKIP][260] ([Intel XE#2341]) -> [FAIL][261] ([Intel XE#1188])
>>     [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-4/igt@kms_content_protection@uevent.html
>>     [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-6/igt@kms_content_protection@uevent.html
>>
>>    * igt@kms_cursor_crc@cursor-offscreen-32x32:
>>      - shard-adlp:         [SKIP][262] -> [SKIP][263] ([Intel XE#455]) +3 other tests skip
>>     [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-9/igt@kms_cursor_crc@cursor-offscreen-32x32.html
>>     [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-2/igt@kms_cursor_crc@cursor-offscreen-32x32.html
>>
>>    * igt@kms_cursor_crc@cursor-onscreen-512x170:
>>      - shard-dg2-set2:     [SKIP][264] ([Intel XE#308]) -> [SKIP][265] ([Intel XE#4208] / [i915#2575])
>>     [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html
>>     [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x170.html
>>
>>    * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
>>      - shard-adlp:         [SKIP][266] -> [SKIP][267] ([Intel XE#309])
>>     [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-9/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
>>     [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
>>
>>    * igt@kms_display_modes@extended-mode-basic:
>>      - shard-adlp:         [SKIP][268] -> [SKIP][269] ([Intel XE#4302])
>>     [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-9/igt@kms_display_modes@extended-mode-basic.html
>>     [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-1/igt@kms_display_modes@extended-mode-basic.html
>>
>>    * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
>>      - shard-adlp:         [SKIP][270] -> [SKIP][271] ([Intel XE#4422])
>>     [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-9/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
>>     [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
>>
>>    * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
>>      - shard-bmg:          [SKIP][272] ([Intel XE#2316]) -> [FAIL][273] ([Intel XE#2882])
>>     [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
>>     [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
>>
>>    * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
>>      - shard-adlp:         [SKIP][274] -> [SKIP][275] ([Intel XE#310]) +1 other test skip
>>     [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-9/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
>>     [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-9/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
>>
>>    * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>>      - shard-dg2-set2:     [FAIL][276] ([Intel XE#301]) -> [SKIP][277] ([Intel XE#4208] / [i915#2575])
>>     [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
>>     [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
>>
>>    * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
>>      - shard-dg2-set2:     [SKIP][278] ([Intel XE#455]) -> [SKIP][279] ([Intel XE#4208])
>>     [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
>>     [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
>>
>>    * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-render:
>>      - shard-adlp:         [SKIP][280] -> [SKIP][281] ([Intel XE#651]) +1 other test skip
>>     [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-render.html
>>     [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-render.html
>>
>>    * igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:
>>      - shard-dg2-set2:     [SKIP][282] ([Intel XE#651]) -> [SKIP][283] ([Intel XE#4208]) +3 other tests skip
>>     [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html
>>     [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html
>>
>>    * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:
>>      - shard-adlp:         [SKIP][284] ([Intel XE#2351]) -> [SKIP][285] ([Intel XE#651])
>>     [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html
>>     [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html
>>
>>    * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>>      - shard-bmg:          [SKIP][286] ([Intel XE#2311]) -> [SKIP][287] ([Intel XE#2312]) +10 other tests skip
>>     [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>>     [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>>
>>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
>>      - shard-bmg:          [SKIP][288] ([Intel XE#4141]) -> [SKIP][289] ([Intel XE#2312]) +6 other tests skip
>>     [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
>>     [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
>>
>>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>>      - shard-bmg:          [SKIP][290] ([Intel XE#2312]) -> [SKIP][291] ([Intel XE#4141]) +6 other tests skip
>>     [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
>>     [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
>>
>>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>>      - shard-adlp:         [SKIP][292] ([Intel XE#2351]) -> [SKIP][293] ([Intel XE#656]) +2 other tests skip
>>     [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>>     [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>>
>>    * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>>      - shard-bmg:          [SKIP][294] ([Intel XE#2312]) -> [SKIP][295] ([Intel XE#2311]) +21 other tests skip
>>     [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
>>     [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
>>
>>    * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>>      - shard-dg2-set2:     [SKIP][296] ([Intel XE#653]) -> [SKIP][297] ([Intel XE#4208]) +2 other tests skip
>>     [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
>>     [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
>>
>>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
>>      - shard-adlp:         [SKIP][298] -> [SKIP][299] ([Intel XE#656]) +7 other tests skip
>>     [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
>>     [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
>>
>>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
>>      - shard-bmg:          [SKIP][300] ([Intel XE#2312]) -> [SKIP][301] ([Intel XE#2313]) +14 other tests skip
>>     [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
>>     [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
>>
>>    * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
>>      - shard-adlp:         [SKIP][302] -> [SKIP][303] ([Intel XE#653])
>>     [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html
>>     [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html
>>
>>    * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>>      - shard-bmg:          [SKIP][304] ([Intel XE#2313]) -> [SKIP][305] ([Intel XE#2312]) +16 other tests skip
>>     [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
>>     [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
>>
>>    * igt@kms_lease@cursor-implicit-plane:
>>      - shard-adlp:         [SKIP][306] -> [DMESG-WARN][307] ([Intel XE#4173])
>>     [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-9/igt@kms_lease@cursor-implicit-plane.html
>>     [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-1/igt@kms_lease@cursor-implicit-plane.html
>>
>>    * igt@kms_plane_multiple@2x-tiling-y:
>>      - shard-adlp:         [SKIP][308] -> [SKIP][309] ([Intel XE#4596])
>>     [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-9/igt@kms_plane_multiple@2x-tiling-y.html
>>     [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-9/igt@kms_plane_multiple@2x-tiling-y.html
>>
>>    * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>>      - shard-adlp:         [SKIP][310] -> [SKIP][311] ([Intel XE#2763] / [Intel XE#455])
>>     [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
>>     [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
>>
>>    * igt@kms_pm_backlight@fade:
>>      - shard-dg2-set2:     [SKIP][312] ([Intel XE#870]) -> [SKIP][313] ([Intel XE#4208])
>>     [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-dg2-434/igt@kms_pm_backlight@fade.html
>>     [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-464/igt@kms_pm_backlight@fade.html
>>
>>    * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
>>      - shard-adlp:         [SKIP][314] -> [SKIP][315] ([Intel XE#1489]) +2 other tests skip
>>     [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-9/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html
>>     [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html
>>
>>    * igt@kms_psr@fbc-pr-cursor-plane-move:
>>      - shard-dg2-set2:     [SKIP][316] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][317] ([Intel XE#4208])
>>     [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-dg2-436/igt@kms_psr@fbc-pr-cursor-plane-move.html
>>     [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-464/igt@kms_psr@fbc-pr-cursor-plane-move.html
>>
>>    * igt@kms_psr@fbc-psr2-primary-blt:
>>      - shard-adlp:         [SKIP][318] -> [SKIP][319] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
>>     [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-9/igt@kms_psr@fbc-psr2-primary-blt.html
>>     [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-4/igt@kms_psr@fbc-psr2-primary-blt.html
>>
>>    * igt@kms_rotation_crc@multiplane-rotation:
>>      - shard-adlp:         [SKIP][320] -> [FAIL][321] ([Intel XE#1874])
>>     [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-9/igt@kms_rotation_crc@multiplane-rotation.html
>>     [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-6/igt@kms_rotation_crc@multiplane-rotation.html
>>
>>    * igt@xe_copy_basic@mem-set-linear-0x369:
>>      - shard-adlp:         [SKIP][322] -> [SKIP][323] ([Intel XE#1126])
>>     [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-9/igt@xe_copy_basic@mem-set-linear-0x369.html
>>     [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-1/igt@xe_copy_basic@mem-set-linear-0x369.html
>>
>>    * igt@xe_copy_basic@mem-set-linear-0x3fff:
>>      - shard-dg2-set2:     [SKIP][324] ([Intel XE#1126]) -> [SKIP][325] ([Intel XE#4208])
>>     [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html
>>     [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0x3fff.html
>>
>>    * igt@xe_eudebug@basic-vm-bind-extended:
>>      - shard-dg2-set2:     [SKIP][326] ([Intel XE#4837]) -> [SKIP][327] ([Intel XE#4208])
>>     [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-extended.html
>>     [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-464/igt@xe_eudebug@basic-vm-bind-extended.html
>>
>>    * igt@xe_eudebug@vm-bind-clear:
>>      - shard-adlp:         [SKIP][328] -> [SKIP][329] ([Intel XE#4837]) +2 other tests skip
>>     [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-9/igt@xe_eudebug@vm-bind-clear.html
>>     [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-8/igt@xe_eudebug@vm-bind-clear.html
>>
>>    * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
>>      - shard-adlp:         [SKIP][330] -> [SKIP][331] ([Intel XE#688])
>>     [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html
>>     [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html
>>
>>    * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
>>      - shard-adlp:         [SKIP][332] -> [SKIP][333] ([Intel XE#1392]) +1 other test skip
>>     [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html
>>     [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html
>>
>>    * igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm:
>>      - shard-adlp:         [SKIP][334] -> [SKIP][335] ([Intel XE#288]) +5 other tests skip
>>     [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-9/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm.html
>>     [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-2/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm.html
>>
>>    * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-imm:
>>      - shard-dg2-set2:     [SKIP][336] ([Intel XE#288]) -> [SKIP][337] ([Intel XE#4208]) +2 other tests skip
>>     [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-imm.html
>>     [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-464/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-imm.html
>>
>>    * igt@xe_exec_system_allocator@many-execqueues-mmap-file-nomemset:
>>      - shard-dg2-set2:     [SKIP][338] ([Intel XE#4915]) -> [SKIP][339] ([Intel XE#4208]) +12 other tests skip
>>     [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-dg2-466/igt@xe_exec_system_allocator@many-execqueues-mmap-file-nomemset.html
>>     [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-464/igt@xe_exec_system_allocator@many-execqueues-mmap-file-nomemset.html
>>
>>    * igt@xe_exec_system_allocator@many-large-execqueues-malloc-mlock:
>>      - shard-adlp:         [SKIP][340] -> [SKIP][341] ([Intel XE#4915]) +37 other tests skip
>>     [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-9/igt@xe_exec_system_allocator@many-large-execqueues-malloc-mlock.html
>>     [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-2/igt@xe_exec_system_allocator@many-large-execqueues-malloc-mlock.html
>>
>>    * igt@xe_module_load@load:
>>      - shard-bmg:          ([PASS][342], [PASS][343], [PASS][344], [PASS][345], [PASS][346], [PASS][347], [PASS][348], [PASS][349], [PASS][350], [PASS][351], [PASS][352], [PASS][353], [PASS][354], [PASS][355], [PASS][356], [PASS][357], [PASS][358], [PASS][359], [PASS][360], [PASS][361], [SKIP][362], [PASS][363], [PASS][364], [PASS][365], [PASS][366], [PASS][367]) ([Intel XE#2457]) -> ([PASS][368], [PASS][369], [PASS][370], [PASS][371], [PASS][372], [PASS][373], [PASS][374], [DMESG-WARN][375], [PASS][376], [PASS][377], [PASS][378], [PASS][379], [PASS][380], [PASS][381], [PASS][382], [PASS][383], [PASS][384], [PASS][385], [PASS][386], [SKIP][387], [PASS][388], [PASS][389], [PASS][390], [PASS][391], [PASS][392], [PASS][393]) ([Intel XE#2457] / [Intel XE#3428])
>>     [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-1/igt@xe_module_load@load.html
>>     [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-2/igt@xe_module_load@load.html
>>     [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-2/igt@xe_module_load@load.html
>>     [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-5/igt@xe_module_load@load.html
>>     [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-7/igt@xe_module_load@load.html
>>     [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-5/igt@xe_module_load@load.html
>>     [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-7/igt@xe_module_load@load.html
>>     [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-4/igt@xe_module_load@load.html
>>     [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-5/igt@xe_module_load@load.html
>>     [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-4/igt@xe_module_load@load.html
>>     [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-4/igt@xe_module_load@load.html
>>     [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-4/igt@xe_module_load@load.html
>>     [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-1/igt@xe_module_load@load.html
>>     [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-1/igt@xe_module_load@load.html
>>     [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-3/igt@xe_module_load@load.html
>>     [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-3/igt@xe_module_load@load.html
>>     [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-2/igt@xe_module_load@load.html
>>     [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-8/igt@xe_module_load@load.html
>>     [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-5/igt@xe_module_load@load.html
>>     [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-8/igt@xe_module_load@load.html
>>     [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-7/igt@xe_module_load@load.html
>>     [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-6/igt@xe_module_load@load.html
>>     [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-6/igt@xe_module_load@load.html
>>     [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-8/igt@xe_module_load@load.html
>>     [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-6/igt@xe_module_load@load.html
>>     [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-bmg-6/igt@xe_module_load@load.html
>>     [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-8/igt@xe_module_load@load.html
>>     [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-8/igt@xe_module_load@load.html
>>     [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-8/igt@xe_module_load@load.html
>>     [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-2/igt@xe_module_load@load.html
>>     [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-2/igt@xe_module_load@load.html
>>     [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-6/igt@xe_module_load@load.html
>>     [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-6/igt@xe_module_load@load.html
>>     [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-6/igt@xe_module_load@load.html
>>     [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-2/igt@xe_module_load@load.html
>>     [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-3/igt@xe_module_load@load.html
>>     [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-1/igt@xe_module_load@load.html
>>     [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-6/igt@xe_module_load@load.html
>>     [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-1/igt@xe_module_load@load.html
>>     [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-1/igt@xe_module_load@load.html
>>     [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-7/igt@xe_module_load@load.html
>>     [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-7/igt@xe_module_load@load.html
>>     [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-7/igt@xe_module_load@load.html
>>     [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-5/igt@xe_module_load@load.html
>>     [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-5/igt@xe_module_load@load.html
>>     [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-8/igt@xe_module_load@load.html
>>     [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-3/igt@xe_module_load@load.html
>>     [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-4/igt@xe_module_load@load.html
>>     [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-4/igt@xe_module_load@load.html
>>     [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-3/igt@xe_module_load@load.html
>>     [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-4/igt@xe_module_load@load.html
>>     [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-bmg-5/igt@xe_module_load@load.html
>>
>>    * igt@xe_oa@invalid-oa-exponent:
>>      - shard-adlp:         [SKIP][394] -> [SKIP][395] ([Intel XE#2541] / [Intel XE#3573])
>>     [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-9/igt@xe_oa@invalid-oa-exponent.html
>>     [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-3/igt@xe_oa@invalid-oa-exponent.html
>>
>>    * igt@xe_oa@syncs-userptr-wait-cfg:
>>      - shard-dg2-set2:     [SKIP][396] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) -> [SKIP][397] ([Intel XE#4208])
>>     [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-dg2-435/igt@xe_oa@syncs-userptr-wait-cfg.html
>>     [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-464/igt@xe_oa@syncs-userptr-wait-cfg.html
>>
>>    * igt@xe_peer2peer@write:
>>      - shard-dg2-set2:     [FAIL][398] ([Intel XE#1173]) -> [SKIP][399] ([Intel XE#1061])
>>     [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-dg2-434/igt@xe_peer2peer@write.html
>>     [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-432/igt@xe_peer2peer@write.html
>>
>>    * igt@xe_pm@d3cold-multiple-execs:
>>      - shard-adlp:         [SKIP][400] -> [SKIP][401] ([Intel XE#2284] / [Intel XE#366])
>>     [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-9/igt@xe_pm@d3cold-multiple-execs.html
>>     [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-6/igt@xe_pm@d3cold-multiple-execs.html
>>
>>    * igt@xe_query@multigpu-query-pxp-status:
>>      - shard-adlp:         [SKIP][402] -> [SKIP][403] ([Intel XE#944])
>>     [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-adlp-9/igt@xe_query@multigpu-query-pxp-status.html
>>     [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-adlp-3/igt@xe_query@multigpu-query-pxp-status.html
>>      - shard-dg2-set2:     [SKIP][404] ([Intel XE#944]) -> [SKIP][405] ([Intel XE#4208])
>>     [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed/shard-dg2-432/igt@xe_query@multigpu-query-pxp-status.html
>>     [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/shard-dg2-464/igt@xe_query@multigpu-query-pxp-status.html
>>
>>    
>>    {name}: This element is suppressed. This means it is ignored when computing
>>            the status of the difference (SUCCESS, WARNING, or FAILURE).
>>
>>    [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>>    [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>>    [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>>    [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>>    [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>>    [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>>    [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>>    [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>>    [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>>    [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
>>    [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>>    [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>>    [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>>    [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>>    [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>>    [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>>    [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>>    [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>>    [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>>    [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>>    [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>>    [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
>>    [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
>>    [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
>>    [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>>    [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>>    [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>>    [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>>    [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>>    [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>>    [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>>    [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>>    [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>>    [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>>    [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>>    [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>>    [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>>    [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>>    [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>>    [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>>    [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>>    [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>>    [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>>    [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>>    [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>>    [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>>    [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>>    [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>>    [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>>    [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>>    [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>>    [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>>    [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
>>    [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>>    [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>>    [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
>>    [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>>    [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>>    [Intel XE#2613]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613
>>    [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>>    [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
>>    [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>>    [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>>    [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
>>    [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>>    [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>>    [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
>>    [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>>    [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>>    [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>>    [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>>    [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>>    [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>>    [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>>    [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>>    [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>>    [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>>    [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>>    [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
>>    [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>>    [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>>    [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>>    [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
>>    [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>>    [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>>    [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>>    [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
>>    [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>>    [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>>    [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>>    [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>>    [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
>>    [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>>    [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>>    [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>>    [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
>>    [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
>>    [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
>>    [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
>>    [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>>    [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>>    [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>>    [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>>    [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
>>    [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>>    [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
>>    [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
>>    [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
>>    [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>>    [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
>>    [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>>    [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
>>    [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
>>    [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
>>    [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>>    [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>>    [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>>    [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
>>    [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
>>    [Intel XE#4618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618
>>    [Intel XE#4683]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683
>>    [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
>>    [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>>    [Intel XE#4817]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4817
>>    [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>>    [Intel XE#4914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4914
>>    [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>>    [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>>    [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>>    [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>>    [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>>    [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>>    [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>>    [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
>>    [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>>    [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>>    [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>>    [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>>    [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>>    [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>>    [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
>>    [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>>    [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>>    [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>>
>>
>> Build changes
>> -------------
>>
>>    * IGT: IGT_8341 -> IGT_8342
>>    * Linux: xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed -> xe-pw-148376v1
>>
>>    IGT_8341: 0e76d82675226a942f4811514c040c07d87d156b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>>    IGT_8342: 8342
>>    xe-3002-f6fc27d337f1078e14de1ef319a92b4e50203aed: f6fc27d337f1078e14de1ef319a92b4e50203aed
>>    xe-pw-148376v1: 148376v1
>>
>> == Logs ==
>>
>> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148376v1/index.html

