Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F145C3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 09:43:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 282B710E630;
	Tue, 20 Aug 2024 09:43:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ay+LMv6n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 325DB10E630
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 09:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724146996; x=1755682996;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HgCkHCI2+OQ2QyfiS/Dj3D6KK5IBOYnqbCfGtXaoF0A=;
 b=ay+LMv6nWMuw7mPd37vQ7sSEQT6fZl1KkEmQZDXOFdb+eaAVz/2I52nP
 merE9uR/eTJzkT/Bf/O2oiIkWH8qnG2Ju6gm3KzKPBgHs6KoOj/flAstZ
 gnAdFKGwKE2GklR1nKVmAzwKShFqpdYKqDZbfM15Vy5kQiXhT7Y6kGZLC
 ct5liNegbb75o5WpsbWPveNnLzVld7SifbhZrCjNwxyQn7X1ua49Zlys2
 UdN+4DOTqb2+nok3OrDZ9ei5vRQwIeWAEUnR1o3tlCJbjBSAwsIOfHdV2
 HqxFIWJEfCYQUD9XC99h6H2OUGJeDGSH+MD+TyMUUFWdl9HMUG27X3dGz Q==;
X-CSE-ConnectionGUID: NhbJLDk7S0SjMFCFxtNc9g==
X-CSE-MsgGUID: xkB8Pr2ZSJyzrAwotJKgKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="21973175"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="21973175"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 02:43:16 -0700
X-CSE-ConnectionGUID: AIb9odNXR8SEdRJj7rq+Bw==
X-CSE-MsgGUID: M1FYivvNR+KAA8B06Z50DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="60636668"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.80.42])
 ([10.245.80.42])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 02:43:15 -0700
Message-ID: <a1d7a803-e365-414c-a9e0-1407f9320b8d@linux.intel.com>
Date: Tue, 20 Aug 2024 11:43:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Remove NULL check of lrc->bo in
 xe_lrc_snapshot_capture()
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, apoorva.singh@intel.com
References: <20240816080355.897256-1-apoorva.singh@intel.com>
 <Zr9bjsY8zcnciW0M@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <Zr9bjsY8zcnciW0M@intel.com>
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

Hi Rodrigo,

On 8/16/2024 4:00 PM, Rodrigo Vivi wrote:
> On Fri, Aug 16, 2024 at 01:33:55PM +0530, apoorva.singh@intel.com wrote:
>> From: Apoorva Singh <apoorva.singh@intel.com>
>>
>> - lrc->bo NULL check is not needed in xe_lrc_snapshot_capture() as
>>    its already been taken care of in xe_lrc_init().
> I'm afraid this is not a good reason.
> This snapshot capture is coming from other places and apparently
> with risks of paths where bo was already freed?!


After taking another look, I just realized the lrc bo is always pinned 
and as far as I see, only place we unpin and free it,  is when we 
destroy the lrc.

Am I missing any condition when xe_lrc_snapshot_capture() can be called 
with lrc->bo freed ?


Regards,

Nirmoy


>
> why is this check bothering you so much?
>
>> Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_lrc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index 974a9cd8c379..aec7db39c061 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -1649,7 +1649,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
>>   	if (!snapshot)
>>   		return NULL;
>>   
>> -	if (lrc->bo && lrc->bo->vm)
>> +	if (lrc->bo->vm)
>>   		xe_vm_get(lrc->bo->vm);
>>   
>>   	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
>> -- 
>> 2.34.1
>>
