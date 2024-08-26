Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94998C5321E
	for <intel-xe@archiver.kernel.org>; Mon, 26 Aug 2024 09:24:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA9D10E167;
	Mon, 26 Aug 2024 09:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UrohpYY5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5236E10E167
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Aug 2024 09:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724664260; x=1756200260;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lu/ELYxEDQLlrlI9qwz5HAADSXQOs5vvBmC1T1t5M8g=;
 b=UrohpYY5785qGFsqpjkHG5X5ABdsAb00c4zsnJPIs2PtBlIl2VwME/9K
 b6w1xzDv0shetVNc28MpdaEwI00M6tX5dJeHEcTAApypFlMGzhSLBg88S
 1wIzfckBbgS//HG6lZSiH3VBgyO3v0srJjnrkLxupGEUNlOTdmEwmetb0
 6kGIsudTR+6UBLEanMazChDMPzTqcGuf2Gkfn4aqY2p7Iew0DJbXHC56q
 PNYgpWAH6yFz/sERwvud6wgsLeG6V6YnLuaf+uikTeIY9s3nOJpm6uHu3
 eOCkIZ3dROFjfzwLtFq85c3K2ITfIE3o9qWXrEPQh4ooNlRbOdo5vO3SE A==;
X-CSE-ConnectionGUID: 9do0BdkkR0u9WM2UN0WL0A==
X-CSE-MsgGUID: JbVxPtzmTnCJCDoT34CRww==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="22884921"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="22884921"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 02:24:04 -0700
X-CSE-ConnectionGUID: LwoyZvpfQyaB4qTI9c/hcA==
X-CSE-MsgGUID: 7Pk1q5Z1TKu1U3g+RMmjcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="67385165"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.24.124])
 ([10.246.24.124])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 02:24:03 -0700
Message-ID: <2ea4efde-1a8b-4a2e-9d35-9bec9d98f89d@linux.intel.com>
Date: Mon, 26 Aug 2024 11:24:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Remove NULL check of lrc->bo in
 xe_lrc_snapshot_capture()
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, apoorva.singh@intel.com,
 Matthew Brost <matthew.brost@intel.com>
References: <20240816080355.897256-1-apoorva.singh@intel.com>
 <Zr9bjsY8zcnciW0M@intel.com>
 <a1d7a803-e365-414c-a9e0-1407f9320b8d@linux.intel.com>
 <Zsd0KqGme2kci1tk@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <Zsd0KqGme2kci1tk@intel.com>
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


On 8/22/2024 7:23 PM, Rodrigo Vivi wrote:
> On Tue, Aug 20, 2024 at 11:43:12AM +0200, Nirmoy Das wrote:
>> Hi Rodrigo,
>>
>> On 8/16/2024 4:00 PM, Rodrigo Vivi wrote:
>>> On Fri, Aug 16, 2024 at 01:33:55PM +0530, apoorva.singh@intel.com wrote:
>>>> From: Apoorva Singh <apoorva.singh@intel.com>
>>>>
>>>> - lrc->bo NULL check is not needed in xe_lrc_snapshot_capture() as
>>>>     its already been taken care of in xe_lrc_init().
>>> I'm afraid this is not a good reason.
>>> This snapshot capture is coming from other places and apparently
>>> with risks of paths where bo was already freed?!
>>
>> After taking another look, I just realized the lrc bo is always pinned and
>> as far as I see, only place we unpin and free it,  is when we destroy the
>> lrc.
>>
>> Am I missing any condition when xe_lrc_snapshot_capture() can be called with
>> lrc->bo freed ?
> if you are confident we don't need it, let's kill...
>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


Merged this to drm-xe-next.


Thanks,

Nirmoy

>
>>
>> Regards,
>>
>> Nirmoy
>>
>>
>>> why is this check bothering you so much?
>>>
>>>> Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_lrc.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>>>> index 974a9cd8c379..aec7db39c061 100644
>>>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>>>> @@ -1649,7 +1649,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
>>>>    	if (!snapshot)
>>>>    		return NULL;
>>>> -	if (lrc->bo && lrc->bo->vm)
>>>> +	if (lrc->bo->vm)
>>>>    		xe_vm_get(lrc->bo->vm);
>>>>    	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
>>>> -- 
>>>> 2.34.1
>>>>
