Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DC3C61DD6
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 08:23:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7573510EBF4;
	Tue,  1 Sep 2026 08:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RYnsm9sx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D37910EBEB
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 08:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788251018; x=1819787018;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jErYhl6QsXT8hjGa9lv+QTb13HU7hNeSXeb+kIFR7mw=;
 b=RYnsm9sxe4zk3mV9/ONg+c/Rru0cbhA/Z+G8hMRCpIUuN+pF01kPtRSx
 jG04pLtiODmuHPZoc9eSuS7WzC0PCE3Pq1wtZ+/ZC6tPJiE0oo6lwUFkE
 tsUPFWJn5T+QFfqCuUgfjYcMZB2G7g7QukbsMXwGvw7Vss6PBTPN4USfX
 phN/88dIeibzVnEqsEqZkcDWS8sSf+6YiX7+x6r/ULEXPyFJmfykzV7Lj
 9zTggWcoQv7pjO9a8lNlm9gniYDiFI0nqVJj4fk3+JRTJkR/Xs7BGzmgQ
 VUZo9ZOHSaMjRvtcIxvmvJiqBR/OnWhuEvFxzitgST7N6PoQ2pvMZw+4p g==;
X-CSE-ConnectionGUID: bV73n/xRQaG+GT+iL4xP5Q==
X-CSE-MsgGUID: WcPgjDIyTNO837m2bqURGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88682264"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="88682264"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 01:23:38 -0700
X-CSE-ConnectionGUID: eO+bsjwQSMOegQiU20HXxQ==
X-CSE-MsgGUID: x+GPwC3iSPGWTpKszAG63g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="272540223"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.7])
 ([10.245.245.7])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 01:23:36 -0700
Message-ID: <93751687-9f80-4182-80c7-c407346d5bae@intel.com>
Date: Tue, 1 Sep 2026 09:23:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/xe/vram: report FLAT_CCS base misalignment
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, stable@kernel.org
References: <20260828151405.662533-7-matthew.auld@intel.com>
 <20260828151405.662533-10-matthew.auld@intel.com>
 <apHrLxFCdzGPs9vO@gsse-cloud1.jf.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <apHrLxFCdzGPs9vO@gsse-cloud1.jf.intel.com>
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

On 28/08/2026 21:10, Matthew Brost wrote:
> On Fri, Aug 28, 2026 at 04:14:09PM +0100, Matthew Auld wrote:
>> So we can easily check if a machine had the CCS bug, when looking back
>> over bug reports where we have the same machine with newer kernel.
>>
> 
> I'm a little confused about how this helps, so I'm thinking out loud here:
>   
> - On old kernels without Linus's CCS fix or this patch, there is no
>    message and we get silent corruption if the affected memory belongs to
>    user space. Of course, things fall apart completely if the corruption
>    affects kernel memory, as in the case Linus hit.
> - On new kernels with Linus's CCS fix plus this patch, does this message
>    appear under load on some configurations, or on all configurations?

Yeah, this is logged before the round_down(offset, 4K). On my b570, for 
example, I get a nice dmesg print to indicate that this machine had the 
bug (fix from Linus also applied). In our CI farm, there is no print, 
since nothing seems to have this bug, also confirms the memtest is not 
just missing the issue somehow. But not sure about wider RIL, I assume 
something in there maybe has this bug.

> 
> Is the idea that the first thing we check for is whether this message is
> present?

Yeah, just a record in dmesg of whether the device had this CCS bug, 
when looking at bug reports. The memtest is also gated behind debug 
builds, for now. For example, some older bug report with impossible 
corruption or other weird stuff, update to latest stable or tip and 
issue seems to go away. Would be good to confirm if this machine had the 
CCS bug. Users might also want to check this.

>   
> Would it be better to simply print the FLAT_CCS base address along with
> a field indicating whether it is misaligned? That would let us quickly
> determine, across all devices, whether the CCS base is aligned or
> misaligned and if the CCS fix is present.

Could print the address also. Happy to do either approach.

> 
> Matt
> 
>> Fixes: 37173392741c ("drm/xe/vram: fix ccs offset calculation")
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: stable@kernel.org
>> ---
>>   drivers/gpu/drm/xe/xe_vram.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
>> index 7b4478fb1697..0a2f1ab8416e 100644
>> --- a/drivers/gpu/drm/xe/xe_vram.c
>> +++ b/drivers/gpu/drm/xe/xe_vram.c
>> @@ -90,6 +90,9 @@ static int get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size, u64 *poffset)
>>   		offset |= offset_lo << 6; /* HW view bits 31:6 */
>>   		offset *= num_enabled; /* convert to SW view */
>>   
>> +		if (!IS_ALIGNED(offset, SZ_128K))
>> +			drm_info(&xe->drm, "FLAT_CCS base misaligned: %llx\n", offset);
>> +
>>   		/*
>>   		 * Everything below this offset is handed to the VRAM
>>   		 * allocator, so it has to be the *first* address the
>> -- 
>> 2.55.0
>>

