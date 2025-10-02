Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6470ACAC5B8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 17:04:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1F910E81F;
	Thu,  2 Oct 2025 17:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="hufpZ1YT";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2640210E827
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 17:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F5oPWHoJpFJqgJPU4UTnC61BPx8vs2ieZu7++cX6E3g=; b=hufpZ1YTwwtyHZF7Cg4wtvcpiS
 2yblRqtVujN1qzBsI4v+LwCcfF68X3b++W9GqVXG/WEO/l4oS1fa/LUr+mEmMvHpDuCdwDfzzqi72
 tI86/4m3x3F4oe/+w8fdEl/WJxoC4FgGyr6YqLohIY+BIYzS6RSFRQ5DeSpd0nqG436XDS0ANLslI
 cmtYUutX2qrYmxgsQIk1Cb9h+0qlhYh7fsathMorc49SN2znFPnWy7ecSEvdKOCF/VGVuFK/SD98a
 tizYGAQzWh0ugSAmwjI5MqSPf2cHZYgE7B9JDZIpTz3OtKYu+Y32oi9vbKaExzO0uI5jyCyr/wDPa
 IUzgH2SQ==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1v4MjF-003THs-Hc; Thu, 02 Oct 2025 19:04:29 +0200
Message-ID: <6649a3e8-eb62-49a6-9f09-46c28515d45a@igalia.com>
Date: Thu, 2 Oct 2025 18:04:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 11/13] drm/xe: Force flush system memory AuxCCS
 framebuffers before scan out
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com
References: <aNKer6J7Op2gGmtC@intel.com>
 <f0fbf72f-4791-4aff-a4cb-299bf9ef265f@igalia.com>
 <aNK0E7KMBW5iOzSo@intel.com>
 <e2cb2159-367b-4f43-babc-a5250fc9914d@igalia.com>
 <aNRx66g6y4c-eoZk@intel.com>
 <7e07606b-d542-4407-a092-476f202cc8e2@igalia.com>
 <cfc54165-b391-4905-a00a-27d2889225e3@igalia.com>
 <aNZDxGoYxVFfRNOu@intel.com> <aNbq_j39EipWw_pV@intel.com>
 <7fde2c90-5d3e-406e-9d5b-6620123e2d2e@igalia.com>
 <aN6nGuZw_IUpIeJl@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <aN6nGuZw_IUpIeJl@intel.com>
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


On 02/10/2025 17:23, Ville Syrjälä wrote:
> On Thu, Oct 02, 2025 at 03:01:08PM +0100, Tvrtko Ursulin wrote:
>>
>> Hi,
>>
>> On 26/09/2025 20:35, Ville Syrjälä wrote:
>>> On Fri, Sep 26, 2025 at 10:41:56AM +0300, Ville Syrjälä wrote:
>>>> I reverse engineered this a bit and there's definitely a
>>>> MOCS issue at play.
>>>>
>>>> First I noticed that if filled the entire MOCS table with
>>>> UC the problem went away. I then filled the entire table
>>>> with WB and essentially bisected what I need to make UC
>>>> to fix it. And I had to repeat that same process starting
>>>> from the other end of table.
>>>>
>>>> Looks like there is some undocumented magic in the hardware.
>>>>
>>>> MOCS 61 really is special:
>>>> - MOCS 61 UC, others WB, select MOCS 61 -> no corruption
>>>>
>>>> MOCS 0 and 63 are special in other ways:
>>>> - MOCS X UC, others WB, select MOCS X -> corruption
>>>> - MOCS X+0 UC, others WB, select MOCS X -> corruption
>>>> - MOCS X+63 UC, others WB, select MOCS X -> corruption
>>>> - MOCS X+0+63 UC, others WB, select MOCS X -> no corruption
>>>>     where X != 61
>>>
>>> OK, the MOCS 63 issue was caused by me having L3=WB still in
>>> MOCS X. If I change MOCS X to L3=UC, MOCS 63 no longer makes
>>> a difference. I suppose that means MOCS 63 is still used for
>>> L3 evictions, even though bspec no longer mentions that fact
>>> explicitly.
>>>
>>> So MOCS 0 is the thing that really matters for CCS. And for
>>> MOCS 0 only the LLC WB vs. UC selection matters. L3 WB vs. UC
>>> doesn't seem to make any difference.
>>>
>>> It's interesting that MOCS 60 is documented as a "CCS special case",
>>> but in reality it's MOCS 0 that matters for CCS. I wonder if some
>>> wires got crossed in the hw design and the wrong MOCS entry ended
>>> up being used for CCS and no one noticed...
>>
>> Oh wow, that is an amazing discovery!
>>
>> I verified it on my end too. Setting MOCS 0 to uncached and cache dirt
>> is gone. No need to the explicit cache flush patch on first pin.
>>
>> Luckily ADL is unsupported so we could change it to UC. I will send a
>> series for CI to see what it will say.

So the MOCS 0 UC experiment did not seem to be 100% glitch free. It 
*looks* it helps, maybe even a lot, but not fully - three tests still 
failed due CRC mismatches.

> I think the real fix is to change igt to use MOCS 61 for tgl/adl.
> That is what Mesa uses as well.
I somehow glossed over the fact you initially wrote 61 worked fine for 
you and focused only on your X+0+63 combinations. :(

61 works fine for me locally too. Very curious hw behaviour.

It would be nice to do a CI run with IGT changed to 61 but AFAIK the xe 
patchwork/CI does not support the Test-with tag.

> Looks like Mesa uses a different MOCS for DG1 and DG2. Those
> do seem to like up with what's in bspec, so probably someone
> needs to just copy the whole MOCS thing from Mesa into igt.

I can have a look.

> Looks like Mesa doesn't even use a UC MOCS for anything except
> on MTL, so possibly we can just change the TGL MOCS 0 to be the
> same WB as on ADL, and maybe that gives some performance benefit
> in some cases.

On xe, i915 or both?

>>>> I didn't actually test all values of X there, but I did spot
>>>> check a handful of them.
>>>>
>>>> Also, ADL is affected, but TGL doesn't seem to be. Though I
>>>> still need to check the situation on TGL a bit more thoroughly.
>>>
>>> TGL actually works exactly the same as ADL. The only reason why
>>> TGL worked correctly out of the box was that we use a different
>>> MOCS table for TGL/RKL (IIRC because we started out with the
>>> wrong table and early Mesa versions depended on that), and in
>>> that table MOCS 0 is just 0x0, whereas on ADL MOCS 0 is WB.
>>
>> Kind of sounds familiar but the only commit I found was 3f027d61663f
>> ("drm/i915/gt: Add separate MOCS table for Gen12 devices other than
>> TGL/RKL") but it is about MOCS 1. What am I missing? Are the hw defaults
>> maybe different and not the code?
> 
> The defaults are somehow populated differently dependign on
> unused_entries_index which is also being set in a very confusing
> way (first set it to 1(PTE) on everything and the overwritten
> with some other value for some of the platforms). The code could
> certainly use a good cleanup pass.
> 
> Anyways, the default index ends up being different on TGL and ADL
> and thus MOCS 0 ends up different as well.

Yep. I missed it and forgot about cfbe5291a189 ("drm/i915/gt: Initialize 
unused MOCS entries with device specific values").

> Since MOCS 0 seems to be special, we should probablya populate
> it explicitly. And I suppose we should first figure out if
> other platforms are also affected.

Yeah. If we could only get the full understanding on the details of 
"specialness".

Regards,

Tvrtko
