Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0097C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 13:13:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD2F10ECCB;
	Mon, 11 Mar 2024 13:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R26NrJKA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2E510ECCB
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Mar 2024 13:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710162820; x=1741698820;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PbjuQcaJXvwDFeU/RR+LpX7RO04hKaTEYsAO6C8N5iU=;
 b=R26NrJKAAng7/b062SwLXb9jRvV+rK4bc1vv5jBtq4Z+PvG9e5fk5isI
 Q2EQcvr5GncjlsWFAN3Uib4o6gmgCW1QUCw9/Y5lOPTOYZuoWjlY3bHF9
 z0iYvLZmXc/i8vY8rAKLVvLaWA8gqavpC9WU4oKGH0zSvtjqW81ivDjPp
 R+M5wg7A/2SB9OkaVJ4W/93sNnGbmEWpVggrUShL1ZT0sNVo3T6hJ/3uO
 rfBHrJ7x+hCaronslcB2Rz34p9b96VM8fxyIJ4B2jPlPnbpGOjNFYl3lo
 oytdM4gxBdu2PP6YW5YLSqFCJwQqv9/p9LN+/6iaBo25oJn6Vq9qDpIpo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="15552718"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="15552718"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 06:13:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="11737500"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa008.jf.intel.com with ESMTP; 11 Mar 2024 06:13:37 -0700
Received: from [10.249.155.53] (unknown [10.249.155.53])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id BB5D534925;
 Mon, 11 Mar 2024 13:13:32 +0000 (GMT)
Message-ID: <cdaaae9e-ce38-410c-97dd-b522c645bbca@intel.com>
Date: Mon, 11 Mar 2024 14:13:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/vf: Remove lmtt->ops null check in
 xe_lmtt_estimate_pt_size
Content-Language: en-US
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240308043651.2010165-1-himal.prasad.ghimiray@intel.com>
 <20240308043651.2010165-3-himal.prasad.ghimiray@intel.com>
 <ZesmInDmDsLY1uPh@intel.com> <ad13f0ba-4dbb-4f37-8a1d-879b2cb111cd@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ad13f0ba-4dbb-4f37-8a1d-879b2cb111cd@intel.com>
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



On 08.03.2024 17:22, Ghimiray, Himal Prasad wrote:
> 
> On 08-03-2024 20:22, Rodrigo Vivi wrote:
>> On Fri, Mar 08, 2024 at 10:06:50AM +0530, Himal Prasad Ghimiray wrote:
>>> In xe_lmtt_estimate_pt_size: Pointer is checked against null but then
>>> dereferenced anyway.
>> And what's the problem?
>>
>> In the line below it access beyond this pointer, so it is a fair
>> case.
> 
> The problem is even if it is NULL it will be  try to derefrence it.
> Which might lead to segmentation fault.
> 
>>
>>> Since xe_lmtt_init ensures lmtt->ops is populated
>>> remove the check.
>> With this in mind we could simply remove all the asserts in the code.

the purpose of this particular xe_assert() in xe_lmtt_estimate_pt_size()
is to express the SLA for the caller that it shall call the
xe_lmtt_init() prior to calling this function

>>
>> I believe that if someone introduced it here it is likely because
>> during some development or refactor this ended up being a problem
>> and want some earlier kind of warning with backtrace information.

true as this is the goal of all our xe_assert() to have early and clear
notification about the problem due to code refactor or new development

>>
>>> Reported by static analyzer.
>> Perhaps then replace with an
>> if (!lmtt->ops) {
>>      drm_WARN(...);
>>      return;
>> }

no, we don't want to have runtime checks in production driver against
programming errors that should be seen only during early development

> 
> I am also of the opinion that this is the correct check to have instead
> of just warning

see also [1] why we use xe_asserts instead of BUG or WARN

[1] https://docs.kernel.org/gpu/xe/xe_debugging.html

> 
> about lmtt->ops being NULL and continue to dereference it. Need clarity
> on what should we return in
> 
> case of lmtt->ops being NULL since expected return type is u64.

we shouldn't try to hide the problem with fake result as we shall never
call this function with lmtt->ops being NULL in the first place

> 
>>
>> and/or mark the tool as a false positive?!

I would make another step and just fix the tool to be run against the
production code, without xe_assert() being enabled, as all our
xe_asserts() are to some extend "redundant" with the production code,
and the tool will complain not only against extra/missed NULL checks but
also against other conditions that will look like 'not-possible' at
given code snapshot, but the purpose of xe_asserts is to protect
ourselves against future code updates/changes that current code might
not be prepared to or it has different assumptions.

Michal

>>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_lmtt.c | 1 -
>>>   1 file changed, 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
>>> index 0d7c5514e092..d6d75414bb99 100644
>>> --- a/drivers/gpu/drm/xe/xe_lmtt.c
>>> +++ b/drivers/gpu/drm/xe/xe_lmtt.c
>>> @@ -487,7 +487,6 @@ u64 xe_lmtt_estimate_pt_size(struct xe_lmtt
>>> *lmtt, u64 size)
>>>         lmtt_assert(lmtt, IS_SRIOV_PF(lmtt_to_xe(lmtt)));
>>>       lmtt_assert(lmtt, IS_DGFX(lmtt_to_xe(lmtt)));
>>> -    lmtt_assert(lmtt, lmtt->ops);
>>>         pt_size = PAGE_ALIGN(lmtt->ops->lmtt_pte_size(level) *
>>>                    lmtt->ops->lmtt_pte_num(level));
>>> -- 
>>> 2.25.1
>>>
