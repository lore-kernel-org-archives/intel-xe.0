Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C4ECA5FA1
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 04:52:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD8510ECD7;
	Tue, 29 Sep 2026 04:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zq2nqRsO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C2210ECD7
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 04:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790657572; x=1822193572;
 h=message-id:date:mime-version:from:subject:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=2fp2od85mOgG29trnedjFlVlk/StEn9F4v2Bf5U7kxg=;
 b=Zq2nqRsOCJLVUe1V+jSQJ17Eh5rcMt/JWN0K1XS6ry7dCosNzimd80jA
 DQtZgJ9h+Mt77XzBd7KlUVdaxuCsalHQWZBczM2Tk3HlZx3/7YVGvaY3D
 PQTjQRt7dxQO6GInf2UjyXk94w8/eSbtCt0lneT5xLS7YxbLNIb6KbAUo
 +xfIQAdeJ3B3nNBsKws3PWRJEyuHBoVk2nr9g7QiwL9cQBhKKDb2xO0AE
 RXtY14KQi2q647TX8NCi28e+NknkGKbv6Dp850BAtm7y5QSYKe0V2gI0m
 +s0R75h9ykYDjYyTvNBmi0loFNX73FgO2oReMIHRCbCzcHYrw5tKGYBmT w==;
X-CSE-ConnectionGUID: RAPRqvi0QCWCxN8Z/B5/Bw==
X-CSE-MsgGUID: 79Ti2AVSR0mI01SFNGw3bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101937226"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208";a="101937226"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 21:52:52 -0700
X-CSE-ConnectionGUID: vWgnRSQXRMOHqO7tMtMIIQ==
X-CSE-MsgGUID: OeD0c+NRR/yBi8+vsZZgDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208";a="283337930"
Received: from dbhadane-mobl1.gar.corp.intel.com (HELO [10.66.117.203])
 ([10.66.117.203])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 21:52:51 -0700
Message-ID: <77862b03-640a-49e3-a7a7-82cddb106b05@Intel.com>
Date: Tue, 29 Sep 2026 10:22:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@Intel.com>
Subject: Re: [PATCH v4 10/12] drm/xe/lmtt: Report invalidation errors using
 structured xe_log API
To: sashiko-reviews@lists.linux.dev
Cc: intel-xe@lists.freedesktop.org
References: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
 <20260928092114.1610203-11-dnyaneshwar.bhadane@intel.com>
 <20260928093659.4A08F1F000FF@smtp.kernel.org>
Content-Language: en-US
Organization: intel
In-Reply-To: <20260928093659.4A08F1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 28-Sep-26 3:06 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] xe_lmtt: missing newline in xe_log_err format string
> --
> 
> commit d8b97ea5041b192b44dac80a8e9209e9058d6519
> Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> 
> drm/xe/lmtt: Report invalidation errors using structured xe_log API
> 
> This commit replaces xe_tile_sriov_err() with xe_log_err() using the LMTT
> component tag for LMTT and MERT invalidation failures. It preserves the
> SR-IOV prefix in the newly structured log messages.
> 
>> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
>> index 0c726eda93906..fe77b3ec06807 100644
>> --- a/drivers/gpu/drm/xe/xe_lmtt.c
>> +++ b/drivers/gpu/drm/xe/xe_lmtt.c
> 
> [ ... ]
> 
>> @@ -302,14 +303,15 @@ void xe_lmtt_invalidate_hw(struct xe_lmtt *lmtt)
>>   
>>   	err = lmtt_invalidate_hw(lmtt);
>>   	if (err)
>> -		xe_tile_sriov_err(tile, "LMTT invalidation failed (%pe)",
>> -				  ERR_PTR(err));
>> +		xe_log_err(tile, LMTT, err, "%s invalidation failed.",
>> +			   xe_sriov_printk_prefix(xe));
> 
> [Severity: Low]
> Does this format string need a trailing newline?
> 
> Without a trailing '\n' in xe_log_err(), the kernel printk system might leave
> the log line unterminated, potentially causing subsequent logs to be
> concatenated to this line.
Noted,I will update in the next patch.
>>   	if (xe_device_has_mert(xe) && xe_tile_is_root(tile)) {
>>   		err = xe_mert_invalidate_lmtt(xe);
>>   		if (err)
>> -			xe_tile_sriov_err(tile, "MERT LMTT invalidation failed (%pe)",
>> -					  ERR_PTR(err));
>> +			xe_log_err(tile, LMTT, err,
>> +				   "%s MERT invalidation failed.\n",
>> +				   xe_sriov_printk_prefix(xe));
>>   	}
>>   }
> 

