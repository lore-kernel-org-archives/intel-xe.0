Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFEAC25B4F
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 14:30:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F3F10F2B4;
	Mon,  6 May 2024 14:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MVVSeEwU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FEB010F29C;
 Mon,  6 May 2024 14:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715005827; x=1746541827;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=64D3dawBYyVgwaH4dGM9+sdQCmUdaWBZ6icjD2qOWoQ=;
 b=MVVSeEwUD4FCNupxmaQnZ8bY9rqMyImbQv1A3/nH/dA2Or0ts46REAT7
 axNg9m5Os9r5BhsCTk5d+zJNS+B1UvX0Ro+LGCDgThMcVsrvWp/4nxbSZ
 8S1NE83JOA9lrdIr5iwibvPGTzmyLr4RR7hCavhTB+61HjzUHZAMZoGts
 45r66IaG+oLxLa4AyC0hNrjYjbLqGLLjAbZOeuxHKo/PLF1N4ELQ098Na
 fXaB8a3USYo7TnRjRrgnf5XQ/zMk11PW+PDom1QnvmeRnZijr84KCoYMJ
 35ob/mbDrzOQhKFbSCWtJqh5EKAlNByaFv8oOggqtgB+TteqXOVVAQwIh Q==;
X-CSE-ConnectionGUID: O8aDIbMPQ4KFAAu6pKa8AA==
X-CSE-MsgGUID: q8G80/ThSi+uZgR/l8biMg==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="11287203"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="11287203"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 07:30:27 -0700
X-CSE-ConnectionGUID: yGvWB1VdROuDS776kkhtAg==
X-CSE-MsgGUID: crKQR1ABSt6u08mAw3mGxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28174637"
Received: from sgohier-mobl.ger.corp.intel.com (HELO [10.252.34.83])
 ([10.252.34.83])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 07:30:25 -0700
Message-ID: <f2dc6c0b-c4cf-49c0-947b-3330469c78f7@linux.intel.com>
Date: Mon, 6 May 2024 16:30:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/intel_ctx: Propagate error from
 __intel_ctx_xe_exec wait timeout
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20240506120827.5799-1-maarten.lankhorst@linux.intel.com>
 <20240506133216.wuklmj5g7yshj6uu@zkempczy-mobl2>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240506133216.wuklmj5g7yshj6uu@zkempczy-mobl2>
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

Hey,

Den 2024-05-06 kl. 15:32, skrev Zbigniew Kempczyński:
> On Mon, May 06, 2024 at 02:08:27PM +0200, Maarten Lankhorst wrote:
>> Any wait timeouts are currently ignored, which might cause silent
>> failures in test. Be more noisy about them.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>   lib/intel_ctx.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/lib/intel_ctx.c b/lib/intel_ctx.c
>> index b43dd6391..30325b906 100644
>> --- a/lib/intel_ctx.c
>> +++ b/lib/intel_ctx.c
>> @@ -450,7 +450,7 @@ int __intel_ctx_xe_exec(const intel_ctx_t *ctx, uint64_t ahnd, uint64_t bb_offse
>>   		goto err;
>>   
>>   	if (!ctx->sync_bind || !ctx->sync_out)
>> -		syncobj_wait_err(ctx->fd, &sync_out, 1, INT64_MAX, 0);
>> +		ret = syncobj_wait_err(ctx->fd, &sync_out, 1, INT64_MAX, 0);
>>   
>>   err:
>>   	if (!ctx->sync_bind)
>> -- 
>> 2.43.0
>>
> Yes, you're definitely right:
>
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Thanks, pushed!
