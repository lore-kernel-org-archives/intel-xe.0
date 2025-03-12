Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96A8C28B28
	for <intel-xe@archiver.kernel.org>; Wed, 12 Mar 2025 10:23:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D6E210E755;
	Wed, 12 Mar 2025 10:23:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XoON+3oQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518AD10E755
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Mar 2025 10:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741774986; x=1773310986;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=wugF0/2ywsuyvqqgSqQ6HkQ06OGkIFuGA2AP1r/JcMc=;
 b=XoON+3oQ3xeiO6AQwv7xxZC8GVvn/So3yHPBbB/3ci1Fd7ns7P19CqWH
 q5rN//RN0HFpwbHb70bo+CohtirUGXDpGuECPHdCZUSLF0jo8ebeiXfsz
 hZWEYFKQF0mxEY8kwXWOpvmNYTDOzBtn5m2edLdY7/A0GvRj4PQladAei
 MNJ9XEuQw0Pt32C9AU/G2WKWfvb3mkmTMt/LBZn7yAmYcQ4vCCM2ogsBS
 X5m6RabLBkbZRlg8+h3H4mRrMXWRDz2js4Ru7OdLswRUCuefGiXC7WFgf
 HZPmr54dQuf7nHmnCO8sLahNsiGZWiEJmOslGZm5LlZqI9qSOgBkTF6U+ A==;
X-CSE-ConnectionGUID: IMeCc3OsRvqgyU1voPzF9w==
X-CSE-MsgGUID: eBGB3G+qRgWoiyiPWtg+Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="68206769"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="68206769"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 03:23:06 -0700
X-CSE-ConnectionGUID: HQ4zspkvRByyrTmGiskd+Q==
X-CSE-MsgGUID: lbjy+colQgS6RfkxM1BvqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="121082121"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa007.jf.intel.com with ESMTP; 12 Mar 2025 03:23:05 -0700
Received: from [10.245.99.10] (unknown [10.245.99.10])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id EE29C33E9D
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Mar 2025 10:23:03 +0000 (GMT)
Message-ID: <9ab77838-d511-42ea-a431-bc8c62ecf8f9@intel.com>
Date: Wed, 12 Mar 2025 11:23:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGU6IFBy?=
 =?UTF-8?Q?efer_USEC=5FPER=5FSEC_over_MICRO?=
To: intel-xe@lists.freedesktop.org
References: <20250311140115.2042-1-michal.wajdeczko@intel.com>
 <174177017993.23959.14332523214559178350@18a75f3d1eae>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <174177017993.23959.14332523214559178350@18a75f3d1eae>
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



On 12.03.2025 10:02, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Prefer USEC_PER_SEC over MICRO
> URL   : https://patchwork.freedesktop.org/series/146141/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2795-f8df428b3850ed87a1e2f3b12b6025328d8a6373_full -> xe-pw-146141v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-146141v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-146141v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-146141v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
>     - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2795-f8df428b3850ed87a1e2f3b12b6025328d8a6373/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146141v1/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
> 

looks more like a CI glitch during collecting the logs
can't be related to this patch

