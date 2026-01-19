Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1D4CCF2EF
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jan 2026 12:37:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B7610E432;
	Mon, 19 Jan 2026 12:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NMYhCwCq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52F310E432
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jan 2026 12:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768826262; x=1800362262;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tDFzLqyyYdzzKAXqB1JC8rT6PcL9iO/N2PSqjN7pwHk=;
 b=NMYhCwCqfqCj03tZL7Aczpt0zUSDxbLaloHbTBUDn2dE7zlRWZFfjTjZ
 TQRNYegxxRe/SEhDuQFWTTATPUaW26jOUHHhAxE8wYnhE+SKwnW4vR5U7
 ThVD68KnV96T5G+fLOW3yPJPSVEinINr9ZSuP3fCyC328Q9zDAdrqxUgy
 S7R3yWfCloENdvoMN9v7nwuk9EkA5j0iohUfveHmJz2ozyV+1Qk7vVRv6
 hIooonYNfX737Wlj39XxISiGD20x0Am+dXw6shEEbLph3VqxrKoNUrFpb
 s0tV2Mcor+wO07M7g0prB9f4ilBJDPnBNXlBdRfVqeULO1yN2tIqF73/6 A==;
X-CSE-ConnectionGUID: SAb1qKruROaSvJJGminAVg==
X-CSE-MsgGUID: iWabS0dNRFe+GjIRS9ogkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="70124163"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="70124163"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 04:37:41 -0800
X-CSE-ConnectionGUID: bajIkM4MT+i04BC9a4nUhA==
X-CSE-MsgGUID: g/77RmGQQA6iraGyHzvtCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="210001221"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.99])
 ([10.245.244.99])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 04:37:39 -0800
Message-ID: <598d3899-5942-485b-8e76-61bcbdfa5cbe@intel.com>
Date: Mon, 19 Jan 2026 12:37:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/xe/uapi: disallow bind queue sharing
To: "Zhang, Carl" <carl.zhang@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Souza, Jose" <jose.souza@intel.com>,
 "Mrozek, Michal" <michal.mrozek@intel.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20251120132727.575986-4-matthew.auld@intel.com>
 <20251120132727.575986-5-matthew.auld@intel.com>
 <fh6dgogrt3ibrod7qkguejy4bj3cmvlbnxksmedhvfx3ejglk2@nu3h6doh7sdx>
 <cc27ae58-b579-4332-9653-c62b38f32add@intel.com>
 <aURm1LgtNPYNxRCP@lstrano-desk.jf.intel.com>
 <PH0PR11MB55798387B824D4101E19545E87A9A@PH0PR11MB5579.namprd11.prod.outlook.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <PH0PR11MB55798387B824D4101E19545E87A9A@PH0PR11MB5579.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 19/12/2025 06:36, Zhang, Carl wrote:
> 
> 
>> -----Original Message-----
>> From: Brost, Matthew <matthew.brost@intel.com>
>> Sent: Friday, December 19, 2025 4:41 AM
>> To: Auld, Matthew <matthew.auld@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>; intel-
>> xe@lists.freedesktop.org; Thomas Hellström
>> <thomas.hellstrom@linux.intel.com>; Souza, Jose <jose.souza@intel.com>;
>> Mrozek, Michal <michal.mrozek@intel.com>; Zhang, Carl
>> <carl.zhang@intel.com>; stable@vger.kernel.org
>> Subject: Re: [PATCH v3 1/2] drm/xe/uapi: disallow bind queue sharing
>>
>> On Mon, Nov 24, 2025 at 01:41:55PM +0000, Matthew Auld wrote:
>>> On 20/11/2025 15:34, Lucas De Marchi wrote:
>>>> On Thu, Nov 20, 2025 at 01:27:29PM +0000, Matthew Auld wrote:
>>>>> Currently this is very broken if someone attempts to create a bind
>>>>> queue and share it across multiple VMs. For example currently we
>>>>> assume it is safe to acquire the user VM lock to protect some of
>>>>> the bind queue state, but if allow sharing the bind queue with
>>>>> multiple VMs then this quickly breaks down.
>>>>>
>>>>> To fix this reject using a bind queue with any VM that is not the
>>>>> same VM that was originally passed when creating the bind queue.
>>>>> This a uAPI change, however this was more of an oversight on
>>>>> kernel side that we didn't reject this, and expectation is that
>>>>> userspace shouldn't be using bind queues in this way, so in theory this
>> change should go unnoticed.
>>>>>
>>>>> Based on a patch from Matt Brost.
>>>>>
>>>>> v2 (Matt B):
>>>>>   - Hold the vm lock over queue create, to ensure it can't be
>>>>> closed as
>>>>>     we attach the user_vm to the queue.
>>>>>   - Make sure we actually check for NULL user_vm in destruction path.
>>>>> v3:
>>>>>   - Fix error path handling.
>>>>>
>>>>> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel
>>>>> GPUs")
>>>>> Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>>> Cc: José Roberto de Souza <jose.souza@intel.com>
>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>> Cc: Michal Mrozek <michal.mrozek@intel.com>
>>>>> Cc: Carl Zhang <carl.zhang@intel.com>
>>>>> Cc: <stable@vger.kernel.org> # v6.8+
>>>>
>>>> we never had any platform officially supported back in 6.8. Let's
>>>> make it 6.12 to avoid useless backporting work.
>>>>
>>>>> Acked-by: José Roberto de Souza <jose.souza@intel.com>
>>>>
>>>> Michal / Carl, can you also ack compute/media are ok with this change?
>>>
> I am ok , current media driver only use default 0,  did not create bind exec queue .

Thanks for confirming.

Michal, ping on this from compute POV?

> 
>>> Ping on this? I did a cursory grep for DRM_XE_ENGINE_CLASS_VM_BIND and
>>> found no users in compute-runtime or media-driver in upstream. This
>>> change should only be noticeable if you directly use
>>> DRM_XE_ENGINE_CLASS_VM_BIND to create a dedicated bind queue, which
>> you then pass into vm_bind.
>>>
>>
>> Yes, ping? It would be good to get this series in.
>>
>> Matt
>>
>>>>
>>>> Lucas De Marchi
>>>
> Thanks
> Carl

