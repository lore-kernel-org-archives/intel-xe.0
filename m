Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA6BD65C69
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 10:13:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EDC010E7E7;
	Thu, 14 Nov 2024 10:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GUUHwUIS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 238AE10E7DC
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 10:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731579191; x=1763115191;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Wh0pbYuLpcUg36EEQGLL+24nLAdEocxedDEmk4sS/bU=;
 b=GUUHwUISQWYqy8PhBe4QTBp1dfkoOuTU+u/M1/rxqxYXiK21mgUTSr5g
 jMTXJ+6yW+9207J/dRViHV+/5Nx+VrrqZgKE1YM80+dsiBSw1389bosVe
 akmy44xxdT/VAIs1P4zBawgEI8neeHC6N+HQelqgnRkF+wFn1xv/5Ajt8
 zyZ5ZFi7EcoWlb9o1pcq5vpeW+NhSzIQBcka3ejM5VBRELf/OWBP7bVgS
 CuGPjAL2NNXlKF7Z3qZ/RLDOBVNWFoZ2AaccTGjaT5khFnfra4J7ljWFL
 leShvmW9RbXbwq/zSPGdl58p6JW0QvkEvCGSAk6UkQxJH9u7+ZkdHgSYY g==;
X-CSE-ConnectionGUID: aUxDU4KxRsqKxeEMCh5W9A==
X-CSE-MsgGUID: 8w7LruJkQnWLcZ4+FZeN2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48957592"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="48957592"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 02:13:11 -0800
X-CSE-ConnectionGUID: Y8LGsTo0SHOCAaVVFs/uQQ==
X-CSE-MsgGUID: NL8reZlhQfabLE+klpYJvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="88048320"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.129.220])
 ([10.245.129.220])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 02:13:09 -0800
Message-ID: <ef55b808-e093-4d47-b4bf-a0c7b7d3f668@linux.intel.com>
Date: Thu, 14 Nov 2024 11:13:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/tests: Limit purgeable size for faster execution
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>
References: <20241113150228.2337530-1-nirmoy.das@intel.com>
 <ce8f155875eb7df9e54773c293c0077cbd66a8b1.camel@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <ce8f155875eb7df9e54773c293c0077cbd66a8b1.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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


On 11/13/2024 4:52 PM, Thomas Hellström wrote:
> On Wed, 2024-11-13 at 16:02 +0100, Nirmoy Das wrote:
>> xe_bo_shrink_kunit takes a while to run on some machines depending
>> on swap storage speed and ram size. Limit purgeable size to 2GB
>> so xe_bo_shrink_kunit can execute much faster.
> Hmm. This actually limits the swap size to 2GiB, and thus *increases*
> the fraction of purgeable bos.
>
> But question is if we end up shrinking only purgeable bos, given that
> we, to be safe, overestimate the need for purgeable bos with 20%.

Tested with system with larger RAM, this helps but not enough. Going to send a IGT patch 

to remove this test from the BAT


Regards,

Nirmoy 

>
> Probably better than skipping the test completely, though.
>
> /Thomas
>  
>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2998
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>  drivers/gpu/drm/xe/tests/xe_bo.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c
>> b/drivers/gpu/drm/xe/tests/xe_bo.c
>> index cd811aa2b227..71b71a546abe 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
>> @@ -467,7 +467,7 @@ static int shrink_test_run_device(struct
>> xe_device *xe)
>>  	}
>>  	to_alloc = ram * 2;
>>  
>> -	ram_and_swap = ram + get_nr_swap_pages() * PAGE_SIZE;
>> +	ram_and_swap = ram + min(get_nr_swap_pages() * PAGE_SIZE,
>> SZ_2G);
>>  	if (to_alloc > ram_and_swap)
>>  		purgeable = to_alloc - ram_and_swap;
>>  	purgeable += div64_u64(purgeable, 5);
