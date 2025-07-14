Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5335C83F1A
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 20:29:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C38910E35B;
	Mon, 14 Jul 2025 20:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jkKogC6r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CD410E35C
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Jul 2025 20:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752524944; x=1784060944;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=4K7/Hzh8FUBJJJgz/wCysESHm3FrrIuq089kdHUmNVM=;
 b=jkKogC6r3Q863fHNJU1U8xBASej7SrDfXOrPzS9bmcS+JFMSQxdwTOJF
 oMBVRkDfaRQz23DpRa5dM9OBleBhirUZzUoyXwOQoTKM7vjZ6fG9gMtM5
 GvjTYLeC+7AHbNmnYsbpGR7vzv7I+/SmfOsV1hsBHfYU8wHHwyw1Tn7f4
 qE/7p/T1EarwfITv7dkTY6PM+XRIE0IAdK1reMI9sOnDrvOiaMnKcIj0z
 mcLWwPOkuuPWdH7FokdcDT4vsmEjOaS1e1S1chmSaWQKfoxoXdPTj1XUF
 GNoweB6WE9zSHkoHkY4497YEvOypl2lr65hz7ZrITIHZNfID1CzXBarDI g==;
X-CSE-ConnectionGUID: ApOuK9MnQ+al8jvlcugd7g==
X-CSE-MsgGUID: ly5tFeUER8qAZoVN5ChZwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="64987710"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="64987710"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 13:29:04 -0700
X-CSE-ConnectionGUID: UgmiMUn+TZGSkM5pNCS14A==
X-CSE-MsgGUID: NJwx2Nt0ST22FSnDk3H72A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="157122127"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa006.fm.intel.com with ESMTP; 14 Jul 2025 13:29:03 -0700
Received: from [10.245.84.121] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.84.121])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id E93BA332C2
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Jul 2025 21:29:01 +0100 (IST)
Message-ID: <1a73103d-6c42-4e8a-b545-d431a46c4acf@intel.com>
Date: Mon, 14 Jul 2025 22:29:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_LMTT_invali?=
 =?UTF-8?Q?dation_=28rev4=29?=
To: intel-xe@lists.freedesktop.org
References: <20250711193316.1920-1-michal.wajdeczko@intel.com>
 <175230600553.156940.7650415531067047556@1538d3639d33>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <175230600553.156940.7650415531067047556@1538d3639d33>
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



On 12.07.2025 09:40, Patchwork wrote:
> == Series Details ==
> 
> Series: LMTT invalidation (rev4)
> URL   : https://patchwork.freedesktop.org/series/151092/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3403-9f1c50aa2358b47480008da45c785d88b0b27ba3_FULL -> xe-pw-151092v4_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-151092v4_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-151092v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-151092v4_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_getversion@basic:
>     - shard-adlp:         [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3403-9f1c50aa2358b47480008da45c785d88b0b27ba3/shard-adlp-3/igt@core_getversion@basic.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151092v4/shard-adlp-4/igt@core_getversion@basic.html

looks like a test or CI glitch, it didn't survive long error injection
test that was run before and was killed, impacting all later tests...

<5>[  470.985109] [IGT] Per-test timeout exceeded. Killing the current
test with SIGQUIT.
	
(core_getversion:3939) CRITICAL: Test assertion failure function
__igt_unique____real_main84, file ../tests/core_getversion.c:91:
(core_getversion:3939) CRITICAL: Failed assertion: fd >= 0
(core_getversion:3939) CRITICAL: Last errno: 2, No such file or directory
(core_getversion:3939) CRITICAL: file descriptor fd failed
Test core_getversion failed.

> 
>   * igt@xe_exec_reset@parallel-gt-reset:
>     - shard-adlp:         [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3403-9f1c50aa2358b47480008da45c785d88b0b27ba3/shard-adlp-3/igt@xe_exec_reset@parallel-gt-reset.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151092v4/shard-adlp-4/igt@xe_exec_reset@parallel-gt-reset.html

actually, the PASS case is interesting, since there is no reset at all:

<7>[  433.143255] [IGT] xe_exec_reset: executing
<7>[  433.146001] [IGT] xe_exec_reset: starting subtest parallel-gt-reset
<7>[  433.146280] [IGT] xe_exec_reset: finished subtest
parallel-gt-reset, SUCCESS
<7>[  433.146850] xe 0000:00:02.0: [drm:intel_power_well_enable [xe]]
enabling DC_off
<7>[  433.146971] xe 0000:00:02.0: [drm:gen9_set_dc_state.part.0 [xe]]
Setting DC state from 02 to 00
<7>[  433.161367] xe 0000:00:02.0: [drm:drm_client_dev_restore] fbdev: ret=0
<7>[  433.161647] [IGT] xe_exec_reset: exiting, ret=0

while there is reset sequence in DMESG-WARN case, which is expected, as
this is what the test name suggests at least

and it looks similar what is happening sporadically on BMG [1] even
without this series [2]

[1]
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151092v4/shard-bmg-4/igt@xe_exec_reset@parallel-gt-reset.html

[2]
https://intel-gfx-ci.01.org/tree/intel-xe/xe-3402-63c7eef609dde585843b5aa6b8f078c211a556fb/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html



