Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5690EC6FD1F
	for <intel-xe@archiver.kernel.org>; Fri, 29 Mar 2024 12:59:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF33510F6E5;
	Fri, 29 Mar 2024 12:59:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H92S+sTG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE1610F6E5
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Mar 2024 12:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711717162; x=1743253162;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=2C+9U/uGOTCANSeJZXx4Y+7JT4kW90Fl3ikwPx1YsV4=;
 b=H92S+sTGx7XWfzdhnMmF7g9bZD4O7Om/VCzdoiqf+EuXCtQE9RRcxzXd
 1gr80I8zL6eZ/tJRnJRCGJ4rhTZHIg29gpsBwAXz49wjDTku0hUX9pev6
 BNsfKwU/vECG163tdBpDsaAM7fEnKEf/+cTq8KidbD6HV8ZfxOksfv4JO
 o6r0PTI9duJ8lFZ1ayZ0Pp18S2VuC62sEiBxJbhhuRSml9p8BVzSunZZ2
 y8WvpthWsCDZ0QfcBfqA2HLLsy2M2FVBUha1iFLmHBalONZgpP3IqEgOa
 lhyjG862NxKKeZi3b04iShHoz7HNEiZwXdYXMmARUKOTBhqvzGQpsg3+g Q==;
X-CSE-ConnectionGUID: qGRjjgbdQbqeX8Eruly+kg==
X-CSE-MsgGUID: 7iRNYnI3QKm8eMGe/uZBfg==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="18343773"
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; d="scan'208";a="18343773"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 05:59:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; d="scan'208";a="16937191"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa009.jf.intel.com with ESMTP; 29 Mar 2024 05:59:19 -0700
Received: from [10.249.157.121] (rafaljan-mobl3.ger.corp.intel.com
 [10.249.157.121])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 9E5E134335
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Mar 2024 12:59:17 +0000 (GMT)
Message-ID: <1cac9ebb-669b-4714-ba06-2f364d0111de@intel.com>
Date: Fri, 29 Mar 2024 13:59:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=93_CI=2EBAT=3A_success_for_Refactor_GT_debug?=
 =?UTF-8?B?ZnMgKHJldjIp?=
Content-Language: en-US
To: intel-xe@lists.freedesktop.org
References: <20240328162808.451-1-michal.wajdeczko@intel.com>
 <171166663879.1064396.7495179457892999578@8e613ede5ea5>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171166663879.1064396.7495179457892999578@8e613ede5ea5>
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



On 28.03.2024 23:57, Patchwork wrote:
> == Series Details ==
> 
> Series: Refactor GT debugfs (rev2)
> URL   : https://patchwork.freedesktop.org/series/129890/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1011-c185a0400ae0be7c5565e9eae63d5b81f5c242ff_BAT -> xe-pw-129890v2_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 

CI.FULL reports (sorry, still no e-mail notifications) "possible new
issue" but the call stack is unrelated to debugfs and is similar what
could be seen in [#1344]

[#1344] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1344

>   
> 
> Participating hosts (5 -> 4)
> ------------------------------
> 
>   Missing    (1): bat-lnl-1 
> 
> 
> Changes
> -------
> 
>   No changes found
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1011-c185a0400ae0be7c5565e9eae63d5b81f5c242ff -> xe-pw-129890v2
> 
>   IGT_7790: 5ec1ff6da3535cf80fd4e1844867d75c481ef86a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1011-c185a0400ae0be7c5565e9eae63d5b81f5c242ff: c185a0400ae0be7c5565e9eae63d5b81f5c242ff
>   xe-pw-129890v2: 129890v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129890v2/index.html
> 
