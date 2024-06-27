Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9320EC2BD09
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 14:42:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B1610E081;
	Thu, 27 Jun 2024 14:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TlloxpZE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6668A10EAC5
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 14:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719499362; x=1751035362;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=C/s6kk/i4o4KzU1epHRpwQpegju22MKJu3zt+oAF1/4=;
 b=TlloxpZEb/CESNTvGM2AGk95Xj6baJl7X8kEfQ9jcFhSeQfm0QC715vt
 KsS7+akxtaHwWy5IlpTAZMDbFhpmA219HRXZUBbMKnSkWKDs4BK/9oMUP
 WEDOZZdsdsAS7xMSjgfZo8AojFYfP64Upv2Z0tjyF26feXyonZ2H9ObY2
 Uy5+sErnMJYjgrkdyghZQKjsd/uOZBInz/E1ryBcrE49z77w0GfHpzE/T
 PhbyzfM0P7C7Fa/4coYfLd7SEtUFXgOR1sfQhpUa7wekPaicxtWUjNpEB
 9Mo9GOVxT2GdkQ8O/ZP+jeJkh9r6W9PYQ8Lwv7v69fAHVeh0dN/dNP3wy w==;
X-CSE-ConnectionGUID: Z+Pmae5VSx2S9KOypbjkKQ==
X-CSE-MsgGUID: ZrmbbrWlTzeD7zgmjRze7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16368471"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="16368471"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 07:42:42 -0700
X-CSE-ConnectionGUID: 0kkrURSgRBOmQ1ZWRzeieQ==
X-CSE-MsgGUID: P/tQ9V59SiaELb2gAs0onA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="44815162"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa006.jf.intel.com with ESMTP; 27 Jun 2024 07:42:38 -0700
Received: from [10.246.27.12] (unknown [10.246.27.12])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 37F9627BB6;
 Thu, 27 Jun 2024 15:42:35 +0100 (IST)
Message-ID: <bea8fe47-f124-42ab-b6d3-ee380a257cd6@intel.com>
Date: Thu, 27 Jun 2024 16:42:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [CI] drm/xe/guc: Remove spurious line feed in debug print
To: "Souza, Jose" <jose.souza@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240626201206.1433-1-michal.wajdeczko@intel.com>
 <bf81ea948d144186d471b653ffd5dd9a45b03d09.camel@intel.com>
 <4ae7c9a4-b0f0-46cd-b53f-3c19e1936b5d@intel.com>
 <d06de2f9329d59b92b8156f43b4374fe62d0e6c8.camel@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <d06de2f9329d59b92b8156f43b4374fe62d0e6c8.camel@intel.com>
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



On 27.06.2024 15:53, Souza, Jose wrote:
> On Wed, 2024-06-26 at 23:18 +0200, Michal Wajdeczko wrote:
>>
>> On 26.06.2024 22:35, Souza, Jose wrote:
>>> On Wed, 2024-06-26 at 22:12 +0200, Michal Wajdeczko wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> Including line feeds at the start of a debug print messes up the
>>>> output when sent to dmesg. The break actually appears between all the
>>>> usefu prefix information and the actual string being printed. In this
>>>> case, each block of data has a very clear start line and an extra
>>>> delimeter is really not necessary. So don't do it.
>>>
>>> I guess the indention was to have one blank like between guc_ctb_snapshot_print() 'cmd[X]' lines and 'G2H CTB (all sizes in DW):'.
>>> I agree with the change if you add one line breaker in the end of guc_ctb_snapshot_print().
>>
>> but 'cmd[XXX]' lines already have additional indent compared to 'H2G|G2H
>> CTB' headers so IMO this extra separation line seems unnecessary:
>>
>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0: TLB invalidation time'd out,
>> seqno=27, recv=26
>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0: H2G CTB (all sizes in DW):
>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      size: 1024
>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      resv_space: 0
>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      head: 0
>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      tail: 572
>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      space: 451
>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      broken: 0
>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      head (memory): 568
>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      tail (memory): 572
>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      status (memory): 0x0
>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      cmd[568]: 0x80670003
>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      cmd[569]: 0x20007000
>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      cmd[570]: 0x0000001b
>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      cmd[571]: 0x80000003
>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0: G2H CTB (all sizes in DW):
>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      size: 4096
>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      resv_space: 1024
>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      head: 210
>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      tail: 0
>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      space: 3068
>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      broken: 0
>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      head (memory): 210
>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      tail (memory): 210
>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      status (memory): 0x0
>> [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      g2h outstanding: 1
>>
>> and IMO printing empty lines is just a waste of paper ;)
> 
> This same function is called during gpu hang capture(devcoredump) and the output of that file has new lines between sections for better reading.
> This a old sample that I had around:
> 
> 
> 
> **** Xe Device Coredump ****
> kernel: 6.9.0-rc6-zeh-xe+
> module: xe
> Snapshot time: 1715877420.647211377
> Uptime: 70684.605982665
> PCI ID: 0x9a49
> PCI revision: 0x01
> GT id: 0
> 	Type: main
> 	IP ver: 0.0.0
> 	CS reference clock: 19200000
> 
> **** GuC CT ****
> H2G CTB (all sizes in DW):
> 	size: 1024
> 	resv_space: 0
> 	head: 978
> 	tail: 599
> 	space: 378
> 	broken: 0
> 	head (memory): 599
> 	tail (memory): 599
> 	status (memory): 0x0
> 

but G2H is still part of the CT, no need for extra split

> G2H CTB (all sizes in DW):
> 	size: 4096
> 	resv_space: 1024
> 	head: 626
> 	tail: 0
> 	space: 3071
> 	broken: 0
> 	head (memory): 626
> 	tail (memory): 626
> 	status (memory): 0x0
> 	g2h outstanding: 0
> 
> GuC ID: 9

hmm, so it looks that we need to fix two more places:

1) in xe_guc_exec_queue_snapshot_print() we need to drop spurious \n as
well:

- 	drm_printf(p, "\nGuC ID: %d\n", snapshot->guc.id);
+ 	drm_printf(p, "GuC ID: %d\n", snapshot->guc.id);


2) in xe_devcoredump_read() we need to add proper decorations/separation
lines since xe_guc_exec_queue_snapshot_print() is not part of "GuC CT"

- 	drm_printf(&p, "\n**** GuC CT ****\n");
+ 	drm_printf(&p, "\n**** GuC CT ****\n\n");
	xe_guc_ct_snapshot_print(coredump->snapshot.ct, &p);
+	drm_printf(&p, "\n**** GuC submission ****\n\n");
	xe_guc_exec_queue_snapshot_print(coredump->snapshot.ge, &p);

and maybe also

- 	drm_printf(&p, "**** Xe Device Coredump ****\n");
+ 	drm_printf(&p, "\n**** Xe Device Coredump ****\n\n");

> 	Name: rcs9
> 	Class: 0
> 	Logical mask: 0x1
> 	Width: 1
> 	Ref: 4
> 	Timeout: 0 (ms)
> 	Timeslice: 1000 (us)
> 	Preempt timeout: 640000 (us)
> 	HW Context Desc: 0x01480000
> 	LRC Head: (memory) 280
> 	LRC Tail: (internal) 552, (memory) 552
> 	Start seqno: (memory) -125
> 	Seqno: (memory) -126
> 	[HWSP].length: 0x1000
> 
> ....

then the output will look like:

**** Xe Device Coredump ****

kernel: 6.9.0-rc6-zeh-xe+
module: xe
Snapshot time: 1715877420.647211377
Uptime: 70684.605982665
PCI ID: 0x9a49
PCI revision: 0x01
GT id: 0
	Type: main
	IP ver: 0.0.0
	CS reference clock: 19200000

**** GuC CT ****

H2G CTB (all sizes in DW):
	size: 1024
	resv_space: 0
	head: 978
	tail: 599
	space: 378
	broken: 0
	head (memory): 599
	tail (memory): 599
	status (memory): 0x0
G2H CTB (all sizes in DW):
	size: 4096
	resv_space: 1024
	head: 626
	tail: 0
	space: 3071
	broken: 0
	head (memory): 626
	tail (memory): 626
	status (memory): 0x0
	g2h outstanding: 0

**** GuC submission ****

GuC ID: 9
	Name: rcs9
	Class: 0
	...

would that work for you?

> 
> 
>>
>>>
>>>>
>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> ---
>>>> cherry-picked from [1]
>>>>
>>>> [1] https://patchwork.freedesktop.org/patch/598024/?series=134695&rev=2
>>>> ---
>>>>  drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> index 873d1bcbedd7..113e6348c6ac 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>>> @@ -1489,7 +1489,7 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
>>>>  		drm_puts(p, "H2G CTB (all sizes in DW):\n");
>>>>  		guc_ctb_snapshot_print(&snapshot->h2g, p);
>>>>  
>>>> -		drm_puts(p, "\nG2H CTB (all sizes in DW):\n");
>>>> +		drm_puts(p, "G2H CTB (all sizes in DW):\n");
>>>>  		guc_ctb_snapshot_print(&snapshot->g2h, p);
>>>>  
>>>>  		drm_printf(p, "\tg2h outstanding: %d\n",
>>>
> 
