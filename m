Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8385CAC5B8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 14:36:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C8D10E7ED;
	Thu,  2 Oct 2025 14:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="a/BNQmfd";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D54E10E7ED
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 14:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
 Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/jd012quSJRiPvJ0dPIt6ZmEy7pjiNJFKqf/A1Igg9A=; b=a/BNQmfdcqrU1/PSH/GEoVCV4P
 lENOe8xSJsVrXv/+MXYKoKCe/2aU2UfU+643Av4HWHJmUT+NbnmvGsmXHe05jTmEDKVgS0tkWNOeL
 GXjEkcXPQjwq+cTVwpH0WV/JZuFvxa4mxU7baameR+UDejbIrjgDCAEfEPalnVRmQbLKq+tnB7lIR
 OKJ+YJo2wN8kYN4DSKDbpgF+3FvEGgzvDapHCDewCNxpyJUOc21RSRDH9VH21nmB3u/3Z647yHKeF
 aTZovZEZU1XnnWAVScZ8v3PdV0UdmnqtxrUfhUK1EqFdPriKxvq5qJkqQQquznBh4hDncOC7iCt7F
 hkVl9aXA==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1v4KQD-003QF4-96; Thu, 02 Oct 2025 16:36:41 +0200
Message-ID: <ffdee2e1-e46a-4c4f-9502-fdd7c65ccb0c@igalia.com>
Date: Thu, 2 Oct 2025 15:36:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 11/13] drm/xe: Force flush system memory AuxCCS
 framebuffers before scan out
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com
References: <aNKMKSIGSPfmPBEc@intel.com>
 <afd72823-2b19-4d15-b87e-bd879568ad02@igalia.com>
 <aNKer6J7Op2gGmtC@intel.com>
 <f0fbf72f-4791-4aff-a4cb-299bf9ef265f@igalia.com>
 <aNK0E7KMBW5iOzSo@intel.com>
 <e2cb2159-367b-4f43-babc-a5250fc9914d@igalia.com>
 <aNRx66g6y4c-eoZk@intel.com>
 <7e07606b-d542-4407-a092-476f202cc8e2@igalia.com>
 <cfc54165-b391-4905-a00a-27d2889225e3@igalia.com>
 <aNZDxGoYxVFfRNOu@intel.com> <aNbq_j39EipWw_pV@intel.com>
 <7fde2c90-5d3e-406e-9d5b-6620123e2d2e@igalia.com>
Content-Language: en-GB
In-Reply-To: <7fde2c90-5d3e-406e-9d5b-6620123e2d2e@igalia.com>
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


On 02/10/2025 15:01, Tvrtko Ursulin wrote:
> 
> Hi,
> 
> On 26/09/2025 20:35, Ville Syrjälä wrote:
>> On Fri, Sep 26, 2025 at 10:41:56AM +0300, Ville Syrjälä wrote:
>>> I reverse engineered this a bit and there's definitely a
>>> MOCS issue at play.
>>>
>>> First I noticed that if filled the entire MOCS table with
>>> UC the problem went away. I then filled the entire table
>>> with WB and essentially bisected what I need to make UC
>>> to fix it. And I had to repeat that same process starting
>>> from the other end of table.
>>>
>>> Looks like there is some undocumented magic in the hardware.
>>>
>>> MOCS 61 really is special:
>>> - MOCS 61 UC, others WB, select MOCS 61 -> no corruption
>>>
>>> MOCS 0 and 63 are special in other ways:
>>> - MOCS X UC, others WB, select MOCS X -> corruption
>>> - MOCS X+0 UC, others WB, select MOCS X -> corruption
>>> - MOCS X+63 UC, others WB, select MOCS X -> corruption
>>> - MOCS X+0+63 UC, others WB, select MOCS X -> no corruption
>>>    where X != 61
>>
>> OK, the MOCS 63 issue was caused by me having L3=WB still in
>> MOCS X. If I change MOCS X to L3=UC, MOCS 63 no longer makes
>> a difference. I suppose that means MOCS 63 is still used for
>> L3 evictions, even though bspec no longer mentions that fact
>> explicitly.
>>
>> So MOCS 0 is the thing that really matters for CCS. And for
>> MOCS 0 only the LLC WB vs. UC selection matters. L3 WB vs. UC
>> doesn't seem to make any difference.
>>
>> It's interesting that MOCS 60 is documented as a "CCS special case",
>> but in reality it's MOCS 0 that matters for CCS. I wonder if some
>> wires got crossed in the hw design and the wrong MOCS entry ended
>> up being used for CCS and no one noticed...
> 
> Oh wow, that is an amazing discovery!
> 
> I verified it on my end too. Setting MOCS 0 to uncached and cache dirt 
> is gone. No need to the explicit cache flush patch on first pin.
> 
> Luckily ADL is unsupported so we could change it to UC. I will send a 
> series for CI to see what it will say.

Doh, but it would be bad to change it for all uses which actually do not 
want UC. Sorry did not wake up fully... So assuming the test CI runs 
will be all clear it will still be a difficult situation on what to do.

Regards,

Tvrtko
