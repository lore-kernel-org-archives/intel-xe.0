Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29420C2BA15
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 08:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7CEF10E5CA;
	Tue, 18 Jun 2024 08:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XWkW3QZZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71CD110E251;
 Tue, 18 Jun 2024 08:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718700459; x=1750236459;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=MBJ0U1FR8t3+zqc7VtwgZaBQcgkhxg2hjuKOtSlsDRw=;
 b=XWkW3QZZJHTTtCZJC9uOX3vpEzC2zTny+bg3E4v8lC3QJNLYgznXd+1D
 nF2SvF9EEdpegZhAmCd5l2Cmi5IEYoKaqlAy7T+dEmQCE3b9SfkjyG0/X
 gOO9BaOAXcD96C/ZL7Lp3G8g5li7zTUBSmakWTy7hi5tLsvVvqqB2jxSQ
 R496tLSkJW27MJ1wwMjWaEo41Un96kxmNJZaqxm7s1VOFU+kWJzwgUUKB
 IQnU4SxNzD5F0V4MspeFZISMgEQ12dqYLAeEORH9Er6goVoip8LsPs7ef
 SCJEWtGfUWfVEv1THvOddlu5o5tJiaEyzRh6JQX+rRG6+Y9b3Xhuju+AF Q==;
X-CSE-ConnectionGUID: txvf6R5nT42XtU5dLXbCeg==
X-CSE-MsgGUID: 6tf7bjHuTDa/4y8LUYCrbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15394421"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="15394421"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 01:47:38 -0700
X-CSE-ConnectionGUID: 8KR/hWtYTym/KnMD4PUBkw==
X-CSE-MsgGUID: QUYsL0N2Sh61IfXKXNDn9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41957891"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa006.jf.intel.com with ESMTP; 18 Jun 2024 01:47:35 -0700
Received: from [10.246.49.231] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.49.231])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 6954A33EBE;
 Tue, 18 Jun 2024 09:47:33 +0100 (IST)
Message-ID: <984fe367-4a14-4ed6-b744-886d009baa23@intel.com>
Date: Tue, 18 Jun 2024 10:47:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Allow_?=
 =?UTF-8?Q?const_pointer_when_checking_SR-IOV_mode?=
To: intel-xe@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240617122613.553-1-michal.wajdeczko@intel.com>
 <171866994695.99140.12575844668168609578@a6498e030952>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171866994695.99140.12575844668168609578@a6498e030952>
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



On 18.06.2024 02:19, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Allow const pointer when checking SR-IOV mode
> URL   : https://patchwork.freedesktop.org/series/134952/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb_full -> xe-pw-134952v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-134952v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-134952v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-134952v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

unrelated

> 
>   * igt@kms_sequence@queue-idle@pipe-a-hdmi-a-1:
>     - shard-adlp:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-adlp-1/igt@kms_sequence@queue-idle@pipe-a-hdmi-a-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-adlp-8/igt@kms_sequence@queue-idle@pipe-a-hdmi-a-1.html

queue-idle on pipe A, connector HDMI-A-1: PASSED

Dynamic subtest pipe-A-HDMI-A-1: SUCCESS (2.215s)

This test caused an abort condition: Lockdep not active


<7>[  184.453010] [IGT] kms_sequence: starting dynamic subtest
pipe-B-HDMI-A-1
<7>[  184.453540] xe 0000:00:02.0: [drm:drm_mode_addfb2 [drm]] [FB:300]
<4>[  184.461720] ------------[ cut here ]------------
<4>[  184.461725] DEBUG_LOCKS_WARN_ON(debug_atomic_read(nr_unused_locks)
!= nr_unused)
<4>[  184.461731] WARNING: CPU: 12 PID: 938 at
kernel/locking/lockdep_proc.c:283 lockdep_stats_show+0xb99/0xe30

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - {shard-lnl}:        NOTRUN -> [DMESG-WARN][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-lnl-2/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-134952v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@hotrebind-lateclose:
>     - shard-adlp:         [PASS][4] -> [DMESG-WARN][5] ([Intel XE#1214])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-adlp-4/igt@core_hotunplug@hotrebind-lateclose.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-adlp-1/igt@core_hotunplug@hotrebind-lateclose.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
>     - shard-adlp:         [PASS][6] -> [DMESG-WARN][7] ([Intel XE#1214] / [Intel XE#324]) +4 other tests dmesg-warn
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>     - shard-dg2-set2:     [PASS][8] -> [DMESG-WARN][9] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
>     - shard-dg2-set2:     [PASS][10] -> [DMESG-WARN][11] ([Intel XE#1214] / [Intel XE#282]) +6 other tests dmesg-warn
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x:
>     - shard-adlp:         [PASS][12] -> [FAIL][13] ([Intel XE#1874]) +3 other tests fail
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html
> 
>   * igt@kms_sequence@queue-idle:
>     - shard-adlp:         [PASS][14] -> [ABORT][15] ([Intel XE#1553])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-adlp-1/igt@kms_sequence@queue-idle.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-adlp-8/igt@kms_sequence@queue-idle.html
> 
>   * igt@kms_sequence@queue-idle@pipe-b-hdmi-a-1:
>     - shard-adlp:         [PASS][16] -> [DMESG-WARN][17] ([Intel XE#1214] / [Intel XE#1553])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-adlp-1/igt@kms_sequence@queue-idle@pipe-b-hdmi-a-1.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-adlp-8/igt@kms_sequence@queue-idle@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
>     - shard-dg2-set2:     [PASS][18] -> [FAIL][19] ([Intel XE#899])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
> 
>   * igt@xe_evict@evict-beng-cm-threads-small:
>     - shard-dg2-set2:     [PASS][20] -> [FAIL][21] ([Intel XE#1069])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-small.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-small.html
> 
>   * igt@xe_evict@evict-beng-large-multi-vm-cm:
>     - shard-dg2-set2:     [PASS][22] -> [FAIL][23] ([Intel XE#1600])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-dg2-set2:     [PASS][24] -> [TIMEOUT][25] ([Intel XE#1473] / [Intel XE#402])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_exec_threads@threads-rebind-err:
>     - shard-adlp:         [PASS][26] -> [INCOMPLETE][27] ([Intel XE#1169] / [Intel XE#1195])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-adlp-8/igt@xe_exec_threads@threads-rebind-err.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-adlp-6/igt@xe_exec_threads@threads-rebind-err.html
> 
>   * igt@xe_pm@mocs-rpm:
>     - shard-adlp:         [PASS][28] -> [FAIL][29] ([Intel XE#2043])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-adlp-4/igt@xe_pm@mocs-rpm.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-adlp-1/igt@xe_pm@mocs-rpm.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_cursor_legacy@single-move@pipe-a:
>     - shard-dg2-set2:     [DMESG-WARN][30] ([Intel XE#1214] / [Intel XE#877]) -> [PASS][31]
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-dg2-466/igt@kms_cursor_legacy@single-move@pipe-a.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-dg2-466/igt@kms_cursor_legacy@single-move@pipe-a.html
> 
>   * igt@kms_cursor_legacy@torture-move@pipe-a:
>     - shard-dg2-set2:     [DMESG-WARN][32] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][33] +10 other tests pass
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-dg2-464/igt@kms_cursor_legacy@torture-move@pipe-a.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-dg2-434/igt@kms_cursor_legacy@torture-move@pipe-a.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
>     - {shard-lnl}:        [DMESG-WARN][34] -> [PASS][35] +2 other tests pass
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-lnl-2/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-lnl-2/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
>     - shard-adlp:         [FAIL][36] ([Intel XE#1874]) -> [PASS][37] +2 other tests pass
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
> 
>   * igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1:
>     - shard-adlp:         [FAIL][38] ([Intel XE#2058]) -> [PASS][39]
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-adlp-1/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-adlp-8/igt@kms_plane_lowres@tiling-y@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>     - shard-dg2-set2:     [FAIL][40] ([Intel XE#361]) -> [PASS][41] +2 other tests pass
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
> 
>   * igt@kms_pm_rpm@modeset-stress-extra-wait:
>     - shard-adlp:         [SKIP][42] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][43] +1 other test pass
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-adlp-6/igt@kms_pm_rpm@modeset-stress-extra-wait.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-adlp-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][44] ([Intel XE#899]) -> [PASS][45]
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
> 
>   * igt@xe_evict@evict-beng-cm-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][46] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][47] +2 other tests pass
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-dg2-464/igt@xe_evict@evict-beng-cm-threads-large.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][48] ([Intel XE#1473]) -> [PASS][49]
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_gt_freq@freq_fixed_exec:
>     - shard-adlp:         [FAIL][50] ([Intel XE#1414]) -> [PASS][51]
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-adlp-6/igt@xe_gt_freq@freq_fixed_exec.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-adlp-2/igt@xe_gt_freq@freq_fixed_exec.html
> 
>   * igt@xe_live_ktest@xe_migrate:
>     - {shard-lnl}:        [SKIP][52] ([Intel XE#1192]) -> [PASS][53]
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-lnl-2/igt@xe_live_ktest@xe_migrate.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-lnl-2/igt@xe_live_ktest@xe_migrate.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events:
>     - shard-adlp:         [DMESG-WARN][54] ([Intel XE#1033] / [Intel XE#1214]) -> [DMESG-WARN][55] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [FAIL][56] ([Intel XE#1231]) -> [DMESG-FAIL][57] ([Intel XE#324]) +2 other tests dmesg-fail
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         [FAIL][58] ([Intel XE#1242]) -> [DMESG-FAIL][59] ([Intel XE#324])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_cursor_legacy@single-move:
>     - shard-dg2-set2:     [DMESG-WARN][60] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#877]) -> [DMESG-WARN][61] ([Intel XE#1214] / [Intel XE#282])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-dg2-466/igt@kms_cursor_legacy@single-move.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-dg2-466/igt@kms_cursor_legacy@single-move.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][62] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][63] ([Intel XE#1214])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-adlp-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][64] ([Intel XE#1214]) -> [DMESG-WARN][65] ([Intel XE#1191] / [Intel XE#1214])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html
> 
>   * igt@xe_pm@s4-vm-bind-prefetch:
>     - shard-adlp:         [DMESG-WARN][66] ([Intel XE#1214]) -> [ABORT][67] ([Intel XE#1601] / [Intel XE#1794])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-adlp-6/igt@xe_pm@s4-vm-bind-prefetch.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-adlp:         [ABORT][68] ([Intel XE#1601] / [Intel XE#1794]) -> [ABORT][69] ([Intel XE#1794])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-adlp:         [DMESG-FAIL][70] ([Intel XE#1760]) -> [DMESG-WARN][71] ([Intel XE#1214] / [Intel XE#1760])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb/shard-adlp-8/igt@xe_wedged@wedged-at-any-timeout.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/shard-adlp-6/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
>   [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
>   [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1553]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553
>   [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
>   [Intel XE#1601]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1601
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1909
>   [Intel XE#2043]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2043
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2058]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2058
>   [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb -> xe-pw-134952v1
> 
>   IGT_7889: 9dca15da37f2a385b04427eb39cd460224d09c25 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1482-c00c421245452a4a82a893cd2e1bfd9663a761fb: c00c421245452a4a82a893cd2e1bfd9663a761fb
>   xe-pw-134952v1: 134952v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134952v1/index.html
> 
