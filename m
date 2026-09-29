Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4BEC9832A
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 04:52:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A1DC10ECD7;
	Tue, 29 Sep 2026 04:52:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TB7mJhri";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B50710ECD7
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 04:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790657533; x=1822193533;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PwMLk34qWKagabLQ9+IIQQeqb+RvhTZ+cbxDzXd1sJQ=;
 b=TB7mJhriYitLwMXyx3NBHQDiGkYEG83PqaaK+/K27Y5HY8NhNbKpUT9K
 zBdlCHedad/HFGlZ5PdVN78VpGR+6cw8FwnUHNZssTa37Xuhu92gqO84n
 1b28CwSRfmWDMUkTHZ2RIdbf4NbuSoWNGKkNIoGlUJzd4GUxnV2jDnBY+
 uCTjzF6QP8kCOqVzlxN1NMzt0Dte32NqVkF2y3nuEjOgwF5RzB2OSt6tk
 hm68PaA6WWU5Xp436rK0FqMcGwsimsgS/QAGFweub1HXIikX1Cf7Ex6J3
 DEU0w9Dwj1F3PfPxo0SwSJXMREcrSflcr50DUhKm4dFvaBE5FdAsqW3JX g==;
X-CSE-ConnectionGUID: 9vCyXHILTZqqFKw8FKMuhg==
X-CSE-MsgGUID: o5ES0CmaSfurs3u+UXloTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101937202"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208";a="101937202"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 21:52:13 -0700
X-CSE-ConnectionGUID: yWVVWPZfSPevUUmgTLwwJA==
X-CSE-MsgGUID: WxjIjcQjSZqNdgqo9fpRdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208";a="283337842"
Received: from dbhadane-mobl1.gar.corp.intel.com (HELO [10.66.117.203])
 ([10.66.117.203])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 21:52:12 -0700
Message-ID: <6a2bca71-3ad5-4d0f-98b0-9b90b03a8130@Intel.com>
Date: Tue, 29 Sep 2026 10:21:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/12] drm/xe/lmtt: Report invalidation errors using
 structured xe_log API
To: sashiko-reviews@lists.linux.dev
Cc: intel-xe@lists.freedesktop.org
References: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
 <20260928092114.1610203-11-dnyaneshwar.bhadane@intel.com>
 <20260928093659.4A08F1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@Intel.com>
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
Noted,I will update in the next patch. >
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

