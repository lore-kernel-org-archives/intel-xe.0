Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C6ACC3DA45
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 17:59:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18FFB10E16C;
	Thu, 11 Jul 2024 17:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="bcs1McGL";
	dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1C84510EB3E
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 17:59:06 +0000 (UTC)
Received: from [192.168.49.54] (c-73-118-245-227.hsd1.wa.comcast.net
 [73.118.245.227])
 by linux.microsoft.com (Postfix) with ESMTPSA id A96D120B7165;
 Thu, 11 Jul 2024 10:59:05 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A96D120B7165
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1720720745;
 bh=HvaWaZ60WZQ1F1WU54bSJNI2M7axX/03qEXL3t0B0p0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=bcs1McGL9WUOK4/WkFs+a8q9u4a7rRdpvpqQyPKXuZke7r8n6uVLigCCeCWzUAEK/
 1s57TZUmukc5Mmq9+oaJSua1pL1MG81nAxaeGmIkfFmon97dcw3TbdCMUn8VDk9nxN
 5IGSm9dlJ9Ml/HqbT0kVshU2mJassqeUD4eSK5Js=
Message-ID: <fa5f5889-1c63-4447-800c-5e11b15feff1@linux.microsoft.com>
Date: Thu, 11 Jul 2024 10:59:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: eahariha@linux.microsoft.com
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_Make_I2C_termino?=
 =?UTF-8?Q?logy_more_inclusive_for_I2C_Algobit_and_consumers_=28rev5=29?=
To: intel-xe@lists.freedesktop.org
References: <20240711052734.1273652-1-eahariha@linux.microsoft.com>
 <172068445813.124810.2466831877853460978@2413ebb6fbb6>
Content-Language: en-US
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <172068445813.124810.2466831877853460978@2413ebb6fbb6>
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

On 7/11/2024 12:54 AM, Patchwork wrote:
> == Series Details ==
> 
> Series: Make I2C terminology more inclusive for I2C Algobit and consumers (rev5)
> URL   : https://patchwork.freedesktop.org/series/131888/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1591-36e90f69c967f4cbcdd02c40c9ef25694ffb1a13_full -> xe-pw-131888v5_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-131888v5_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-131888v5_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 

I took a look at the logs and don't think the regressions below are
connected to my patches. Does anyone disagree?

Thanks,
Easwar

> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-131888v5_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_atomic:
>     - shard-lnl:          NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131888v5/shard-lnl-8/igt@kms_atomic.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:
>     - shard-dg2-set2:     [PASS][2] -> [DMESG-WARN][3]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1591-36e90f69c967f4cbcdd02c40c9ef25694ffb1a13/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131888v5/shard-dg2-464/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html
> 
>   * igt@kms_vblank@query-forked:
>     - shard-adlp:         [PASS][4] -> [DMESG-WARN][5] +1 other test dmesg-warn
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1591-36e90f69c967f4cbcdd02c40c9ef25694ffb1a13/shard-adlp-4/igt@kms_vblank@query-forked.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131888v5/shard-adlp-4/igt@kms_vblank@query-forked.html
> 
>   

