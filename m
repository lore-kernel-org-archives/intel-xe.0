Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14347C5B572
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 13:50:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84E410E464;
	Wed, 19 Aug 2026 13:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XD02VL23";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61BA710E464
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 13:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787147436; x=1818683436;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bnba+PiP9tLi6YIZaL6Y3rwvD+JWadJdw7/wXrtl/qc=;
 b=XD02VL231XnHT+SB2hW307eN4IaYXQbXUvTx+7GTyfGkPBDwATScXhw/
 sVoupUZxD7FkTgnlS3DRkkWgFitZpRXkyU/cmLm5G+Blwkkp2swQfexke
 ceIbt+alsyiCukX1oJV368JCHgRwmgh1cOr/My9GaEVa3nd6sluaR3wdz
 6PqQ545FDYSpMuEBXjjp3YS1tXRdehaoEx+pIEp6sXT0G6namJTpXjkc8
 zEmsZBxB6p7T2NPm8ozY/KHNwY6E4zh77cqFFDuFnFkaCMlu6r368ALbT
 h16GH3fLpRC+cwqvWJ1LPtVRRLDcls33OIca5GML3ij1i8zUsyUSHPb41 g==;
X-CSE-ConnectionGUID: D44jlqUoRSmOcV3YM3pWMQ==
X-CSE-MsgGUID: fJuwNV9MR7S1b8L+0n0Eww==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="98255139"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="98255139"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 06:50:35 -0700
X-CSE-ConnectionGUID: TTgAV1e4S+6ZNXENerzslQ==
X-CSE-MsgGUID: JrSI9d31Q/udY+sac7Y4EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="269848810"
Received: from aiddamse-mobl3.gar.corp.intel.com (HELO [10.247.209.5])
 ([10.247.209.5])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 06:50:33 -0700
Message-ID: <8ceaee0e-cd24-4382-bb45-c59f9444e6ca@linux.intel.com>
Date: Wed, 19 Aug 2026 19:20:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V16 10/12] drm/xe: Add sysfs interface for bad gpu vram
 pages
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Cc: "Wajdeczko, Michal" <michal.wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
References: <20260817065055.3734576-14-tejas.upadhyay@intel.com>
 <20260817065055.3734576-24-tejas.upadhyay@intel.com>
 <a670328d-b5dc-48b4-bb02-ed7dfa2d48f1@intel.com>
 <DS0PR11MB871812022E070C0052F5AF3F81A72@DS0PR11MB8718.namprd11.prod.outlook.com>
 <aoMxh3bh1WEf8SF6@intel.com> <60960fcb-7aeb-4642-bd6f-ad1b6ffd2a2b@intel.com>
 <aoNhZwRGQC2uh95n@intel.com>
 <DS0PR11MB8718B926A3C9AAD8770AB89681A62@DS0PR11MB8718.namprd11.prod.outlook.com>
 <aoRWO88_jtfv1V-g@intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <aoRWO88_jtfv1V-g@intel.com>
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


On 18-08-2026 18:25, Rodrigo Vivi wrote:
> On Tue, Aug 18, 2026 at 09:08:46AM +0000, Upadhyay, Tejas wrote:
>>
>>> -----Original Message-----
>>> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>>> Sent: 18 August 2026 01:01
>>> To: Wajdeczko, Michal <michal.wajdeczko@intel.com>
>>> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
>>> xe@lists.freedesktop.org; Thomas Hellström
>>> <thomas.hellstrom@linux.intel.com>; Ghimiray, Himal Prasad
>>> <himal.prasad.ghimiray@intel.com>
>>> Subject: Re: [PATCH V16 10/12] drm/xe: Add sysfs interface for bad gpu vram
>>> pages
>>>
>>> On Mon, Aug 17, 2026 at 07:09:46PM +0200, Michal Wajdeczko wrote:
>>>>
>>>> On 8/17/2026 6:06 PM, Rodrigo Vivi wrote:
>>>>> On Mon, Aug 17, 2026 at 02:58:31PM +0000, Upadhyay, Tejas wrote:
>>>>>>
>>>>>>> -----Original Message-----
>>>>>>> From: Wajdeczko, Michal <michal.wajdeczko@intel.com>
>>>>>>> Sent: 17 August 2026 16:57
>>>>>>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
>>>>>>> xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
>>>>>>> Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>>>> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
>>>>>>> Subject: Re: [PATCH V16 10/12] drm/xe: Add sysfs interface for bad
>>>>>>> gpu vram pages
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> On 8/17/2026 8:51 AM, Tejas Upadhyay wrote:
>>>>>>>> Include a sysfs interface designed to expose information about
>>>>>>>> bad VRAM pages — those identified as having hardware faults
>>>>>>>> (e.g., ECC errors). This interface allows userspace tools and
>>>>>>>> administrators to monitor the health of the GPU's local memory
>>>>>>>> and track the status of page retirement. Details on bad gpu vram
>>>>>>>> pages can be found under
>>> /sys/bus/pci/devices/<bdf>/vram_bad_pages.
>>>>>>> since those new files are xe driver specific, shouldn't we refer
>>>>>>> to them using
>>>>>>>
>>>>>>> 	/sys/bus/pci/drivers/xe/<bdf>/vram...
>>>>>>>
>>>>>>>> The format is: pfn : gpu_page_size : flags
>>>>>>> kernel documentation [1] says
>>>>>>>
>>>>>>> 	"Mixing types, expressing multiple lines of data, and doing
>>>>>>> 	fancy formatting of data is heavily frowned upon"
>>>>>>>
>>>>>>> [1] https://docs.kernel.org/filesystems/sysfs.html#attributes
>>>>>>>
>>>>>>> so to follow the guidelines maybe we expose the separate files:
>>>>>>>
>>>>>>> /sys/bus/pci/drivers/xe/<bdf>/vram_page_size		u64
>>>>>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_count	u64
>>>>>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_reserved	u64[]
>>>>>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending	u64[]
>>>>>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_failed	u64[]
>>>>>>>
>>>>>>> or
>>>>>>>
>>>>>>> /sys/bus/pci/drivers/xe/<bdf>
>>>>>>> |
>>>>>>> +-- vram/
>>>>>>>     +-- page_size	u64
>>>>>>>     +-- bad_pages/
>>>>>>>         +-- count	u64
>>>>>>>         +-- reserved	u64[]
>>>>>>>         +-- pending	u64[]
>>>>>>>         +-- failed	u64[]
>>>>>>>
>>>>>>> then
>>>>>>>
>>>>>>> /sys/bus/pci/drivers/xe/<bdf>/vram_page_size:0x1000
>>>>>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_count:5
>>>>>>>
>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_reserved:0x0000000000
>>>>>>> 00
>>>>>>> 0000
>>>>>>>
>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending:0x00000000012
>>>>>>> 34
>>>>>>> 000
>>>>>>>
>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending:0x00000000012
>>>>>>> 35
>>>>>>> 000
>>>>>>>
>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending:0x00000000012
>>>>>>> 36
>>>>>>> 000
>>>>>>>
>>> /sys/bus/pci/drivers/xe/<bdf>/vram_bad_pages_pending:0x00000000012
>>>>>>> 37
>>>>>>> 000
>>>>>> Thanks for comment, this is documented format by design doc. Sysman
>>> also depending on this format. So I don’t see this can be done without design
>>> being changed for everyone.
>>>>> Internal design docs don't superseed upstream documentation.
>>>>> It is the other way around.
>>>>>
>>>>> But also, the files will be there one way or another. Both paths are
>>>>> valid, so I don't believe that change in here force changes in the
>>>>> userspace. Although, yes consistency is good...
>>>>>
>>>>> That said, I don't have a strong feeling for one way or the other.
>>>>>
>>>>> Since we are adding to the device level anyway, I believe it should
>>>>> be okay. But Michal, do you know any doc or any precedence that kind
>>>>> of force us to go the other way?
>>>> hmm, are we talking here about the attribute format or folder layout?
>>>>
>>>> if about the latter, no strong feeling either ("files will be there
>>>> one way or another")
>>>>
>>>> but if about the former, then the same documentation [1] earlier says:
>>>>
>>>> 	"Attributes should be ASCII text files, preferably with only
>>>> 	"one value per file. It is noted that it may not be efficient
>>>> 	"to contain only one value per file, so it is socially acceptable
>>>> 	"to express an array of values of the same type.
>>>>
>>>> and my proposal with separate files meets that expectations (there
>>>> will be either single value in the file or array of values of the same
>>>> type), opposed to original idea of array of offset:page_size:flag
>>>> tuples
>>> doh! I'm sorry... my comment was purely driven by the other sentence above:
>>> "since those new files are xe driver specific, shouldn't we refer to them using"
>>>
>>> But now I looked at the content o the patch itself. This patch as is is a BIG NO!
>>> It is against the sysfs rules. Period. Internal spec and other components need
>>> to adjust.
>>>
>>> Also please do not repeat the same PVC mistakes with tenths of lingering sysfs
>>> entries. Organize this per directory as Michal told.
>>>
>>> Another thing, make a design that is future ready, use 'vram0/' as the name of
>>> the directory with vram0 stuff. Like we have freq0/ for instance.
>>>
>>> Perhaps even
>>>
>>> +-- vram0/
>>>   +-- pages/
>>>      +-- size u64
>>>      +-- bad_pages/
>>>          +-- count u64
>>>          +-- reserved      u64[]
>>>          +-- pending       u64[]
>>>          +-- failed        u64[]
>> Currently information shown under vram_bad_pages(looks similar to what other competitor's  bad pages info shows), actual gives data which consumer can extract directly meaningful info out of it. With above approach, consumer need to make one, which we need to discuss with other folks. Lets discuss in a group.
> 2 wrongs don't make 1 right!
>
> If you don't believe in the reviewers check the documentation yourself:
>
> https://www.kernel.org/doc/html/latest/filesystems/sysfs.html
>
> "Mixing types, expressing multiple lines of data, and doing fancy formatting
> of data is heavily frowned upon. Doing these things may get you publicly
> humiliated and your code rewritten without notice."

Is my understanding correct that the PAGE_SIZE limit and the "one value
per file" guidance apply to regular attributes only, and that a
bin_attribute is the sanctioned mechanism for streaming output larger
than one page (via the off/count arguments)?

Thanks,
Aravind.


>
>> Tejas
>>> Thanks,
>>> Rodrigo.
>>>
>>>>>> Tejas
>>>>>>>> flags:
>>>>>>>>   R: reserved, this gpu page is reserved.
>>>>>>>>   P: pending for reserve, this gpu page is marked as bad, will be
>>>>>>>>      reserved in next window of page_reserve.
>>>>>>>>   F: unable to reserve, this gpu page can't be reserved due to some
>>>>>>>>      reasons.
>>>>>>>>
>>>>>>>> For example, cat /sys/bus/pci/devices/<bdf>/vram_bad_pages:
>>>>>>>>   max_pages : 10000
>>>>>>>>   0x0000000000000000 : 0x0000000000001000 : R
>>>>>>>>   0x0000000000001234 : 0x0000000000001000 : P
>>>>>>>>
>>>>>>>> The sysfs binary attribute is created under the PCI device
>>>>>>>> kobject when the platform supports it and the configfs
>>>>>>>> bad_page_reservation policy is enabled. Uses RCU-protected list
>>>>>>>> traversal so reads never block normal VRAM allocation operations.
>>>>>>>>
