Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4ACE7718A
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 19:47:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9517410E42E;
	Wed, 18 Dec 2024 19:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oc0V6wVE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0359A10E42E
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Dec 2024 19:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734551261; x=1766087261;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=h2nxv9BAxzPLdGSKZFTYbBn3XdP1awSH98xXlNfip+M=;
 b=Oc0V6wVEpiziH+TwRj6kF2Yn5mMO3MXHwIIo+kWbqXwo7Jfpw0NN5rD5
 /KnqqN/3crKoQyRid3bd15qknq5Tcr3MIkk2CRp60kZYm2fFO1cqClTO6
 vQ93r8LZVvdyvL0w6wi4jFc7K4kttyQazHy2FDxj/V3MC5POiVbCCpqQ8
 6nTmJtvqI568d+vG+pYWU8QfxJtLDX/z1g7abDmvRCwIGlFLzXmgtcDF6
 ywuI462z6Nv/3DcYVnWbfeaOpjr81aedhjprXfoITs2FunPYPQ+WKcGwO
 45bseC0epwcxVEkmBSZyXtAoj/Q/NnKWx+fIvl2nJyq8mK9oN5lZ/z0AC Q==;
X-CSE-ConnectionGUID: EMiZisFaRJaleuz6Yh5W/g==
X-CSE-MsgGUID: LNtpJs0bQIuLS4lq6ovvVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="22634877"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="22634877"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 11:47:40 -0800
X-CSE-ConnectionGUID: As6iv4GASeajRGCrjBpBDw==
X-CSE-MsgGUID: ZGOvcH7dSr6r50M11/swsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="103051882"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa003.jf.intel.com with ESMTP; 18 Dec 2024 11:47:39 -0800
Received: from [10.246.0.69] (mwajdecz-MOBL.ger.corp.intel.com [10.246.0.69])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 2D3FB2FC5F;
 Wed, 18 Dec 2024 19:47:38 +0000 (GMT)
Message-ID: <326e8edb-e38e-44d7-b078-2defaf01fbbf@intel.com>
Date: Wed, 18 Dec 2024 20:47:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/sa: Drop hardcoded 4K guard in sub-allocator
To: Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20241217222246.863-1-michal.wajdeczko@intel.com>
 <Z2H9sADDJOvFG6j+@lstrano-desk.jf.intel.com>
 <aeec7c51-b04b-4805-82bb-c5f2051178f7@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <aeec7c51-b04b-4805-82bb-c5f2051178f7@intel.com>
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



On 18.12.2024 10:15, Matthew Auld wrote:
> On 17/12/2024 22:39, Matthew Brost wrote:
>> On Tue, Dec 17, 2024 at 11:22:46PM +0100, Michal Wajdeczko wrote:
>>> Any required prefetch guards are added during batch buffer
>>> allocations anyway.
>>>
>>
>> This should work but I think we actually want to do the opposite of
>> this - drop the prefetch pad in BB allocation. This would enable a more
>> optimial usage of each suballocation. I think that would work unless we
>> have an odd caching issue - if caching is a problem then maybe the BB is
>> a cacheline.
> 
> Also would be good to update bb_prefetch(), since current prefetch value
> is too small for xe2+ on some engines, so the hardcoded 4K here was
> maybe saving the day.

since I don't what would be a good value for xe2+, I'll hold with this
patch until someone fixes the bb_prefetch()

> 
>>
>> I haven't had time to try to out yet but I think we explore the above
>> option first. If I'm missing something and the above does not work, then
>> agree with this patch.
>>
>> Matt
>>
