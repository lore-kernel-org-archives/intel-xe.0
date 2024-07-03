Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B51EC2BD09
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jul 2024 14:54:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED58C10E21D;
	Wed,  3 Jul 2024 14:54:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RDua/930";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E078910E21D
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jul 2024 14:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720018490; x=1751554490;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vq1dpWOiiuPXEF5BYo4wvz9t8E1LvCcrc22aN2s74Mw=;
 b=RDua/93089wvzzxViqSqcGR5qU4b7rcThUveZxG0KIA5ArRvxxcKOL2N
 8ZJ/Y0EdHZ/F8cA7v3KBou0b11fXMn8KYJWcuDRazS39fKsnIXFQ2UuEU
 Z/vIQbWLJkDQ/w3qrGablE0zjBoELHhPyKNHqP74EsbifJ6ZfrmEZAr2a
 O6NLPbKOPqAJN4YCvJ2r9hVzdMmecotoMqCTUv4wXKlVm+rIgJtqSma63
 x6LYmUXRNm9vM4kbduCTE0KcXpHOLkhzvuds/O5Hxg0zdCOEoTHqDPPsi
 ym9BAQYncRgWXBRzJQcQjE280nSl+mqGgrD13AjSkOpgNiTUBt1xrdObl g==;
X-CSE-ConnectionGUID: ge6WWmz0ScCgTxDx9w+8hQ==
X-CSE-MsgGUID: AiiDIdQaRsus9DKO6fD9ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17387321"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="17387321"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 07:54:50 -0700
X-CSE-ConnectionGUID: l5IrEVx5TbW7vFvx4z0NEg==
X-CSE-MsgGUID: NGvwjvo3TZWhLkD7rcA/DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="46159453"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa007.fm.intel.com with ESMTP; 03 Jul 2024 07:54:46 -0700
Received: from [10.246.34.68] (mwajdecz-MOBL.ger.corp.intel.com [10.246.34.68])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id B11912878B;
 Wed,  3 Jul 2024 15:54:44 +0100 (IST)
Message-ID: <20e7ae0e-a3c5-4136-b007-bae1f9cecd45@intel.com>
Date: Wed, 3 Jul 2024 16:54:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [CI] drm/xe/guc: Remove spurious line feed in debug print
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, "Souza, Jose" <jose.souza@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240626201206.1433-1-michal.wajdeczko@intel.com>
 <bf81ea948d144186d471b653ffd5dd9a45b03d09.camel@intel.com>
 <4ae7c9a4-b0f0-46cd-b53f-3c19e1936b5d@intel.com>
 <d06de2f9329d59b92b8156f43b4374fe62d0e6c8.camel@intel.com>
 <bea8fe47-f124-42ab-b6d3-ee380a257cd6@intel.com>
 <0a1de6fdf21f6cca1751792fd80cf1639b0c79d2.camel@intel.com>
 <ZoVc9gx7BASG3gT8@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ZoVc9gx7BASG3gT8@intel.com>
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



On 03.07.2024 16:15, Rodrigo Vivi wrote:
> On Thu, Jun 27, 2024 at 03:27:56PM +0000, Souza, Jose wrote:
>> On Thu, 2024-06-27 at 16:42 +0200, Michal Wajdeczko wrote:
>>>
>>> On 27.06.2024 15:53, Souza, Jose wrote:
>>>> On Wed, 2024-06-26 at 23:18 +0200, Michal Wajdeczko wrote:
>>>>>
>>>>> On 26.06.2024 22:35, Souza, Jose wrote:
>>>>>> On Wed, 2024-06-26 at 22:12 +0200, Michal Wajdeczko wrote:
>>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>
>>>>>>> Including line feeds at the start of a debug print messes up the
>>>>>>> output when sent to dmesg. The break actually appears between all the
>>>>>>> usefu prefix information and the actual string being printed. In this
>>>>>>> case, each block of data has a very clear start line and an extra
>>>>>>> delimeter is really not necessary. So don't do it.
>>>>>>
>>>>>> I guess the indention was to have one blank like between guc_ctb_snapshot_print() 'cmd[X]' lines and 'G2H CTB (all sizes in DW):'.
>>>>>> I agree with the change if you add one line breaker in the end of guc_ctb_snapshot_print().
>>>>>
>>>>> but 'cmd[XXX]' lines already have additional indent compared to 'H2G|G2H
>>>>> CTB' headers so IMO this extra separation line seems unnecessary:
>>>>>
>>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0: TLB invalidation time'd out,
>>>>> seqno=27, recv=26
>>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0: H2G CTB (all sizes in DW):
>>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      size: 1024
>>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      resv_space: 0
>>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      head: 0
>>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      tail: 572
>>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      space: 451
>>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      broken: 0
>>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      head (memory): 568
>>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      tail (memory): 572
>>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      status (memory): 0x0
>>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      cmd[568]: 0x80670003
>>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      cmd[569]: 0x20007000
>>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      cmd[570]: 0x0000001b
>>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      cmd[571]: 0x80000003
>>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0: G2H CTB (all sizes in DW):
>>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      size: 4096
>>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      resv_space: 1024
>>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      head: 210
>>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      tail: 0
>>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      space: 3068
>>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      broken: 0
>>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      head (memory): 210
>>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      tail (memory): 210
>>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      status (memory): 0x0
>>>>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      g2h outstanding: 1
>>>>>
>>>>> and IMO printing empty lines is just a waste of paper ;)
>>>>
>>>> This same function is called during gpu hang capture(devcoredump) and the output of that file has new lines between sections for better reading.
>>>> This a old sample that I had around:
>>>>
>>>>
>>>>
>>>> **** Xe Device Coredump ****
>>>> kernel: 6.9.0-rc6-zeh-xe+
>>>> module: xe
>>>> Snapshot time: 1715877420.647211377
>>>> Uptime: 70684.605982665
>>>> PCI ID: 0x9a49
>>>> PCI revision: 0x01
>>>> GT id: 0
>>>> 	Type: main
>>>> 	IP ver: 0.0.0
>>>> 	CS reference clock: 19200000
>>>>
>>>> **** GuC CT ****
>>>> H2G CTB (all sizes in DW):
>>>> 	size: 1024
>>>> 	resv_space: 0
>>>> 	head: 978
>>>> 	tail: 599
>>>> 	space: 378
>>>> 	broken: 0
>>>> 	head (memory): 599
>>>> 	tail (memory): 599
>>>> 	status (memory): 0x0
>>>>
>>>
>>> but G2H is still part of the CT, no need for extra split
>>>
>>>> G2H CTB (all sizes in DW):
>>>> 	size: 4096
>>>> 	resv_space: 1024
>>>> 	head: 626
>>>> 	tail: 0
>>>> 	space: 3071
>>>> 	broken: 0
>>>> 	head (memory): 626
>>>> 	tail (memory): 626
>>>> 	status (memory): 0x0
>>>> 	g2h outstanding: 0
>>>>
>>>> GuC ID: 9
>>>
>>> hmm, so it looks that we need to fix two more places:
>>>
>>> 1) in xe_guc_exec_queue_snapshot_print() we need to drop spurious \n as
>>> well:
>>>
>>> - 	drm_printf(p, "\nGuC ID: %d\n", snapshot->guc.id);
>>> + 	drm_printf(p, "GuC ID: %d\n", snapshot->guc.id);
>>>
>>>
>>> 2) in xe_devcoredump_read() we need to add proper decorations/separation
>>> lines since xe_guc_exec_queue_snapshot_print() is not part of "GuC CT"
>>>
>>> - 	drm_printf(&p, "\n**** GuC CT ****\n");
>>> + 	drm_printf(&p, "\n**** GuC CT ****\n\n");
>>> 	xe_guc_ct_snapshot_print(coredump->snapshot.ct, &p);
>>> +	drm_printf(&p, "\n**** GuC submission ****\n\n");
>>> 	xe_guc_exec_queue_snapshot_print(coredump->snapshot.ge, &p);
>>>
>>> and maybe also
>>>
>>> - 	drm_printf(&p, "**** Xe Device Coredump ****\n");
>>> + 	drm_printf(&p, "\n**** Xe Device Coredump ****\n\n");
>>>
>>>> 	Name: rcs9
>>>> 	Class: 0
>>>> 	Logical mask: 0x1
>>>> 	Width: 1
>>>> 	Ref: 4
>>>> 	Timeout: 0 (ms)
>>>> 	Timeslice: 1000 (us)
>>>> 	Preempt timeout: 640000 (us)
>>>> 	HW Context Desc: 0x01480000
>>>> 	LRC Head: (memory) 280
>>>> 	LRC Tail: (internal) 552, (memory) 552
>>>> 	Start seqno: (memory) -125
>>>> 	Seqno: (memory) -126
>>>> 	[HWSP].length: 0x1000
>>>>
>>>> ....
>>>
>>> then the output will look like:
>>>
>>> **** Xe Device Coredump ****
>>>
>>> kernel: 6.9.0-rc6-zeh-xe+
>>> module: xe
>>> Snapshot time: 1715877420.647211377
>>> Uptime: 70684.605982665
>>> PCI ID: 0x9a49
>>> PCI revision: 0x01
>>> GT id: 0
>>> 	Type: main
>>> 	IP ver: 0.0.0
>>> 	CS reference clock: 19200000
>>>
>>> **** GuC CT ****
>>>
>>> H2G CTB (all sizes in DW):
>>> 	size: 1024
>>> 	resv_space: 0
>>> 	head: 978
>>> 	tail: 599
>>> 	space: 378
>>> 	broken: 0
>>> 	head (memory): 599
>>> 	tail (memory): 599
>>> 	status (memory): 0x0
>>> G2H CTB (all sizes in DW):
>>> 	size: 4096
>>> 	resv_space: 1024
>>> 	head: 626
>>> 	tail: 0
>>> 	space: 3071
>>> 	broken: 0
>>> 	head (memory): 626
>>> 	tail (memory): 626
>>> 	status (memory): 0x0
>>> 	g2h outstanding: 0
>>>
>>> **** GuC submission ****
>>>
>>> GuC ID: 9
>>> 	Name: rcs9
>>> 	Class: 0
>>> 	...
>>>
>>> would that work for you?
>>
>> In my opinion this looks worst.
>> Lets see what Rodrigo that implemented most of it thinks.
> 
> Well, I do believe that keeping empty lines in text helps
> our human brains to parse the text. For the same reason that
> I kept the empty line between this paragraph and the text I was
> responding to. But also for the same reason that our entire
> code has many empty lines between blocks.
> 
> Even for similar blocks in the same function we add some empty
> lines. It makes things easier to read.
> 
> Mainly this reason was the main reason that drove me to add
> these empty lines there. But that is just my personal preference,
> and I don't have stronger feelings here. I would be totally
> okay with the removal of these empty lines.

but to be clear, me and John don't want to remove empty lines between
different sections in devcoredump, so decorations like:

**** GuC CT ****
blah
blah

**** GuC submission ****
blah
blah

will still be there (and we can even improve that by adding additional
empty line to highlight the section):


**** GuC CT ****

blah
blah

**** GuC submission ****

blah
blah

I just want to remove empty lines from inside the single section, which
IMO could be treated as single paragraph, where you need use empty lines
to split sentences:


**** GuC CT ****

blah

blah

**** GuC submission ****

blah

blah

after all, in most cases, each devcoredump section matches what we
expose over debugfs, and in debugfs we usually don't print empty lines,
do we ?

> 
> Also, I have to agree that empty lines in dmesg are really ugly.
> 
> My biggest stronger feeling here would be on breaking current
> tools that are already parsing devcoredump. If this breaks the current
> tools I would prefer to avoid that breakage and keep things as is, or
> changing for dmesg, bug tweaking the devcoredump as Jose suggested.
> 
> Jose, would this break Mesa tools?

hmm, do we really want to claim that our printer outputs must now be
treated as (semi-)stable uabi?

> 
>>
>>>
>>>>
>>>>
>>>>>
>>>>>>
>>>>>>>
>>>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>>>> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>>>> ---
>>>>>>> cherry-picked from [1]
>>>>>>>
>>>>>>> [1] https://patchwork.freedesktop.org/patch/598024/?series=134695&rev=2
>>>>>>> ---
>>>>>>>  drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
>>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>>>>> index 873d1bcbedd7..113e6348c6ac 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>>>>> @@ -1489,7 +1489,7 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
>>>>>>>  		drm_puts(p, "H2G CTB (all sizes in DW):\n");
>>>>>>>  		guc_ctb_snapshot_print(&snapshot->h2g, p);
>>>>>>>  
>>>>>>> -		drm_puts(p, "\nG2H CTB (all sizes in DW):\n");
>>>>>>> +		drm_puts(p, "G2H CTB (all sizes in DW):\n");
>>>>>>>  		guc_ctb_snapshot_print(&snapshot->g2h, p);
>>>>>>>  
>>>>>>>  		drm_printf(p, "\tg2h outstanding: %d\n",
>>>>>>
>>>>
>>
