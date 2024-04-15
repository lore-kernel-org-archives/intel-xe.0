Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF55C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 08:30:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BCCA112370;
	Mon, 15 Apr 2024 08:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UntXMA0W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E928112370
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 08:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713169828; x=1744705828;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=p90+GM8+tlDungW5yTLLfJ6BwEgmCkELy9UjgKukxQQ=;
 b=UntXMA0WTTMkECUZzkydYG5fIRdQnrFwcMhxpNWpCQDLELxurl0c4ul4
 NxLC3WVVfB6s1SZSvRqoI8dz/iihaDHrzkBQjJFH0b3CbJCQlg0CNTDnc
 Bj8TYWgDmf8e91ivNDQzwMoNjpDlJBAD1DKHutViOJxQrvP6B6AUl4cHe
 T6jy0725Byw94VJTfdAcNouVA6u+Gg575RZhFDBmdi2/HgpBCJpMK0FYx
 TefmvEDsPcwAnMVYeolmk9XCMaV2g3LgP6sCzg9SlrtXUSv/+EjJJN8er
 70R1OXX51d7pmvV1bWzwEGqRiu8fiTFNdCtxSKz44PIsW8/PdepI2QwHp g==;
X-CSE-ConnectionGUID: 1LWCj00gQ66og8ZJxwZp7A==
X-CSE-MsgGUID: 3q6qBL9cR0exMKgYFVqkJg==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="31027147"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208";a="31027147"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 01:30:27 -0700
X-CSE-ConnectionGUID: LglmBso7Ty2mDmJLn1ceWA==
X-CSE-MsgGUID: 3wAt6XgrSHyVefk3F6Yv9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208";a="45120326"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa002.fm.intel.com with ESMTP; 15 Apr 2024 01:30:25 -0700
Received: from [10.252.44.99] (mwajdecz-MOBL.ger.corp.intel.com [10.252.44.99])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 7233633723;
 Mon, 15 Apr 2024 09:30:16 +0100 (IST)
Message-ID: <431e5048-e909-4b9b-b1df-fd495298370f@intel.com>
Date: Mon, 15 Apr 2024 10:30:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/xe: Add helper to format SR-IOV function name
Content-Language: en-US
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240414190137.1243-1-michal.wajdeczko@intel.com>
 <20240414190137.1243-2-michal.wajdeczko@intel.com>
 <42834d9b-f8ab-4206-800e-72222613b83e@intel.com>
 <20240415075627.ctbcxxwk6jwuhk7p@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240415075627.ctbcxxwk6jwuhk7p@intel.com>
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



On 15.04.2024 09:56, Piotr Piórkowski wrote:
> Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com> wrote on pon [2024-kwi-15 09:17:27 +0530]:
>>
>> On 15-04-2024 00:31, Michal Wajdeczko wrote:
>>> While the GuC firmware and the Xe driver are using VF identifier
>>> VFID(0) to represent the Physical Function, we should avoid using
>>> "VF0" name and use proper "PF" name in all user facing messages
>>> related to the Physical Function and use "VFn" name only when
>>> referrinf to the true Virtual Function. Add simple helper to get
>>> properly formatted function name based on the function number.
>>>
>>> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_sriov.c | 17 +++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_sriov.h |  1 +
>>>   2 files changed, 18 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
>>> index 1b40f5de9ef5..1c3fa84b6adb 100644
>>> --- a/drivers/gpu/drm/xe/xe_sriov.c
>>> +++ b/drivers/gpu/drm/xe/xe_sriov.c
>>> @@ -122,3 +122,20 @@ void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p)
>>>   	drm_printf(p, "enabled: %s\n", str_yes_no(IS_SRIOV(xe)));
>>>   	drm_printf(p, "mode: %s\n", xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
>>>   }
>>> +
>>> +/**
>>> + * xe_sriov_function_name() - Get SR-IOV Function name.
>>> + * @n: the Function number (identifier) to get name of
>>> + * @buf: the buffer to format to
>>> + * @size: size of the buffer (shall be at least 5 bytes)
>>> + *
>>> + * Return: formatted function name ("PF" or "VF%u").
>>> + */
>>> +const char *xe_sriov_function_name(unsigned int n, char *buf, size_t size)
>>
>> nit: It is not necessary to return a |buf|, so |how about void instead of
>> const char * ?|

true, it could be done as void, but that looks as a waste of one of the
potential use which is mentioned below

besides, this is our Xe driver helper only, it's main goal is usability

otherwise it should be written as returning "int" to "return number of
characters of output that would have been written which may be greater
than len, if output was truncated)" like in string_get_size()

but that would be overkill IMO as it would be highly unlikely that we
ever check that ret value

>>
>> |With that LGTM.|
>>
>> |Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com> |
> 
> I'm guessing that this function returns a pointer to be able to use this directly
> in printf kind of functions. I am ok with this:

yes, even in patch 6/6 I'm using that this way in pf_push_vf_cfg_klvs()

> 
> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

thanks!

>>
>>> +{
>>> +	if (n)
>>> +		snprintf(buf, size, "VF%u", n);
>>> +	else
>>> +		strscpy(buf, "PF", size);
>>> +	return buf;
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
>>> index f9dec84d77e3..486bb21c3256 100644
>>> --- a/drivers/gpu/drm/xe/xe_sriov.h
>>> +++ b/drivers/gpu/drm/xe/xe_sriov.h
>>> @@ -13,6 +13,7 @@
>>>   struct drm_printer;
>>>   const char *xe_sriov_mode_to_string(enum xe_sriov_mode mode);
>>> +const char *xe_sriov_function_name(unsigned int n, char *buf, size_t len);
>>>   void xe_sriov_probe_early(struct xe_device *xe);
>>>   void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p);
> 
