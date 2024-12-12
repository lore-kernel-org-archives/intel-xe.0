Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67480E7717F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 21:57:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2908710E214;
	Thu, 12 Dec 2024 21:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZXzBUUCp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B52B10E214
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 21:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734040658; x=1765576658;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MDouDv7bNZVsOlqWzTNA4iNL1JX60OmSF+nf66h+3zo=;
 b=ZXzBUUCpouJmD3q4UN8WujcUYuPe5dN6c7P17GNxo7xhW26Jo/0xcskj
 oa4Wz0Qv+QOQZ+lf0vXvsOe/0lGN/GGmGvUHTPEFroAv2LXgqVllu+ZXt
 SuPOT9bdINS5sWqzA9gQslG7aaeDjgfkGnJGL+sVyQ80bezIciawymv+L
 KuoODeuqsd5OEQFFmtcCGeF5ncmLXDLGUMOgjS6emSvPwVXg5TGHyE9wL
 H6tZEtRIBStxl4CGZRmdzmaLsMvjB5bqXCQ5HUEVF+pje3hSzaz6/362U
 jmTbk3BOgswKL0COhBhIfKZ58nla62KYRTv9XyjxSJSTTjwCY2C8XiOFs Q==;
X-CSE-ConnectionGUID: wUWMkACiQcWyxE6/7QHUlg==
X-CSE-MsgGUID: wo0FerKdREiDZAfFjMSMng==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34613589"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="34613589"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 13:57:36 -0800
X-CSE-ConnectionGUID: UBSUGTs0Q+mkP7MWu5yo9Q==
X-CSE-MsgGUID: 8GJsXOaWQ1CPX/uAOrD84Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="96763973"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa010.fm.intel.com with ESMTP; 12 Dec 2024 13:57:32 -0800
Received: from [10.246.21.182] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.21.182])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 820EE28780;
 Thu, 12 Dec 2024 21:57:31 +0000 (GMT)
Message-ID: <89aefb1b-6286-4d96-b21d-e6cb163e0dce@intel.com>
Date: Thu, 12 Dec 2024 22:57:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/13] drm/xe/sa: Allow creating suballocator with custom
 guard size
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20241212010141.389-1-michal.wajdeczko@intel.com>
 <20241212010141.389-9-michal.wajdeczko@intel.com>
 <Z1pXRtHk5S8Fazd2@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <Z1pXRtHk5S8Fazd2@lstrano-desk.jf.intel.com>
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



On 12.12.2024 04:23, Matthew Brost wrote:
> On Thu, Dec 12, 2024 at 02:01:36AM +0100, Michal Wajdeczko wrote:

...

>>  
>> +static inline struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 align)
>> +{
>> +	return __xe_sa_bo_manager_init(tile, size, SZ_4K, align);
> 
> So why is this guard needed? I'm reasoning this was for CS prefetches
> but all current uses of the SA (xe_bb.c) do suballocations with CS
> prefetch padding. We likely don't need to do this in both places.
> 
> I'd say drop prefetch padding from xe_bb.c and move the prefetch
> calculation size to here.
> 
> Can be done in a follow up but before RBing let's make sure we
> understand exactly why this is needed and develop a follow up plan as
> the code as is doesn't look right / necessary.
> 

since none of SA functions were documented, same with BB code, I just
wanted to preserve existing usage without going too deep into a "why"

to get right answers we need original author(s), but since code was part
of the initial submission, I can't tell who is it

