Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30BCC36010
	for <intel-xe@archiver.kernel.org>; Fri, 11 Apr 2025 10:12:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78FA10EB5D;
	Fri, 11 Apr 2025 10:12:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jQRHjErN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D96910EB5D
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Apr 2025 10:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744366374; x=1775902374;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=szSgtxaDHPgOGgplZSep8JEZE5reNv/qM3k2xW573xs=;
 b=jQRHjErNzpsYdOFgtrpe3jiWr4hDGPu91zc19gbHRJ1z00UjwAVPUPy1
 vSLFOszAfK7I0hYWSHMB/ppSS0ZJdgYbppEQdPEyJXvjhqohyYXBilrOn
 QUxYdKt2i0yNaBTl0r2CW/6oOXfxnm7Q044P4OE5u0Hr3McsNLgYZaqyI
 Of0cSqleAkXrnf8WZSRzwOwA99o7/nDHZq5UdDvt0EJ91KspoPwMRe9Dk
 Bc4Nh1uyLx1R+0QkWaB5B4/08uLxpjc7q1j+WnmsXqtJ9n9wDqv/9NJ96
 X57cs2ncnemwLa0a7Qxm4Na5NkphsMrzxrELmu1f4opwhAAqRj0FUXZax Q==;
X-CSE-ConnectionGUID: FfeTzjOqRbCdjFJ0zf2jtQ==
X-CSE-MsgGUID: Gx01RsqqTTS1Nu/vOP5TtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="49566105"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="49566105"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 03:12:53 -0700
X-CSE-ConnectionGUID: MZ/U59hsTxW2WqCco2wTEg==
X-CSE-MsgGUID: y2iK17BRSbG8/MGyzNzNPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="152341954"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa002.fm.intel.com with ESMTP; 11 Apr 2025 03:12:53 -0700
Received: from [10.245.96.73] (mwajdecz-MOBL.ger.corp.intel.com [10.245.96.73])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id D55AB33EAC
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Apr 2025 11:12:51 +0100 (IST)
Message-ID: <782597eb-4895-4db7-a075-4947c4ffef43@intel.com>
Date: Fri, 11 Apr 2025 12:12:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBWRjogZGVidWdm?=
 =?UTF-8?Q?s_fixes_=28rev2=29?=
To: intel-xe@lists.freedesktop.org
References: <20250403142635.1821-1-michal.wajdeczko@intel.com>
 <174376403057.38353.2093768642685836501@e6b6f09ec485>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <174376403057.38353.2093768642685836501@e6b6f09ec485>
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



On 04.04.2025 12:53, Patchwork wrote:
> == Series Details ==
> 
> Series: VF: debugfs fixes (rev2)
> URL   : https://patchwork.freedesktop.org/series/146561/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2903-9edc6ea87f86cbb6cda6b76d334c07492d0a8073_FULL -> xe-pw-146561v2_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-146561v2_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-146561v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-146561v2_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_plane_multiple@tiling-4@pipe-a-edp-1:
>     - shard-lnl:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2903-9edc6ea87f86cbb6cda6b76d334c07492d0a8073/shard-lnl-1/igt@kms_plane_multiple@tiling-4@pipe-a-edp-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146561v2/shard-lnl-6/igt@kms_plane_multiple@tiling-4@pipe-a-edp-1.html

it must be an unrelated CI/KMS glitch

https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146561v2/shard-lnl-6/dmesg18.txt

<7>[  453.334556] [IGT] kms_plane_multiple: finished subtest
pipe-A-eDP-1, SUCCESS

