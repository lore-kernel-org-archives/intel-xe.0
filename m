Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8DEE6B27B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 13:19:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8E210E2DF;
	Fri,  1 Nov 2024 13:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UDlXDrrT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E570C10E2DF
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Nov 2024 13:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730467185; x=1762003185;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9p2kb3bO5opTy0aNcFxhbFWPUORNiqYTzLzH9wwhr1c=;
 b=UDlXDrrTDyDZPeRsjP8qbpR8l93MSEhWgjWWHjZJgPqFp0oLLXNA89j3
 zyzgjf6J2dnGhqVx4F7NxyBuCzvUfPoK2vwAeDQBI27Qc1+EQT7dnZHDq
 ND6Chy0xgqDfbZ7H1yoCkWBpO4r5jFfeSbRTJbReDZ9cCh1LqFM4vInLw
 4KsEHlDlmdbSeHNgy4BFjOdCR0B4GkuDoEA8Udp7ny78zuP9wZdubkd+W
 0T0dZ2e3uPSd29uQWd6MbHFwZdA+8xcE66Dgb+fF8onMFKfOwlwXc8Xy/
 ZoI54I6t8G3vw3Wc+i+bloOBIE0KDjp1+EBHNr6N6TTMGrbRnocmoEBRj w==;
X-CSE-ConnectionGUID: u8QvQQw2SjGz2ur/mQUmxQ==
X-CSE-MsgGUID: wSpnNhhYQZu+toQf0MXagA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30395885"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30395885"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 06:19:44 -0700
X-CSE-ConnectionGUID: fSOBA+mKQkO9+pwSfxWjVQ==
X-CSE-MsgGUID: Gw0f7l9wT1KoC22NV8CpeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; d="scan'208";a="88086594"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.34])
 ([10.245.244.34])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 06:19:43 -0700
Message-ID: <48d004c2-86a8-4d5e-97f2-9e5071b75ee9@intel.com>
Date: Fri, 1 Nov 2024 13:19:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] drm/xe/guc/tlb: Flush g2h worker in case of tlb
 timeout
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, stable@vger.kernel.org
References: <20241029120117.449694-1-nirmoy.das@intel.com>
 <20241029120117.449694-3-nirmoy.das@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241029120117.449694-3-nirmoy.das@intel.com>
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

On 29/10/2024 12:01, Nirmoy Das wrote:
> Flush the g2h worker explicitly if TLB timeout happens which is
> observed on LNL and that points to the recent scheduling issue with
> E-cores on LNL.
> 
> This is similar to the recent fix:
> commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
> response timeout") and should be removed once there is E core
> scheduling fix.
> 
> v2: Add platform check(Himal)
> v3: Remove gfx platform check as the issue related to cpu
>      platform(John)
>      Use the common WA macro(John) and print when the flush
>      resolves timeout(Matt B)
> v4: Remove the resolves log and do the flush before taking
>      pending_lock(Matt A)
> 
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: <stable@vger.kernel.org> # v6.11+
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2687
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

