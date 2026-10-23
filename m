Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA44B606A321
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 13:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hj2kh4hv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB3210E101;
	Fri, 23 Oct 2026 13:01:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22EF10E5FF
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 13:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792760498; x=1824296498;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=WHKBhD97+ZB4ip16JMVOXB2mVYJpOvIxvT3Q1mk0AcU=;
 b=hj2kh4hvn1NsQ+3L3btlMG5WpTjyNxlIFBo0S1vYPJ6JjtAsXEnaC+5W
 2v+LHGonT1yXlG2cb48ozDvsjnjhiI72ny/M1n6robwLsxBpRfjfD1PJQ
 U6smncrjIu6G6Tgfa21cZOzb4+gnwfwe2YLwJPB6h1NnI45H+c0y4+cqN
 xjxjPXj3g8kys03osdSBrwlbTyPg4BasfQbPrG1WYFXiMBL9LjR4oGzPq
 KK/swaprOVaAH5QjWOswaUpU0RXMYCvlbNwClFyh4tiyAPdyI0+mqRLby
 rBsOhJ4oq9y3bVU+n+S45dittVLrr5+qvBVNnE/4JMXCG6fSSvnZEDzNx g==;
X-CSE-ConnectionGUID: 5nYJQ88VTh+nAX4s5rxQWg==
X-CSE-MsgGUID: /BkOx8lAQuy3lt4oygdK2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1625436"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1625436"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 06:01:37 -0700
X-CSE-ConnectionGUID: RJ5kiyFnRty5bNRyuehOzA==
X-CSE-MsgGUID: o500cUEYSEuqBUWlTDpK2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3624565"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.106])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 06:01:34 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, sk.anirban@intel.com, raag.jadav@intel.com,
 aravind.iddamsetty@linux.intel.com
Subject: Re: [PATCH] drm/xe/hwmon: Restrict LONG_MAX overflow check to
 32-bit builds
In-Reply-To: <cf26d883-b8e4-441b-b739-40104b874b9b@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261023082939.387258-2-mallesh.koujalagi@intel.com>
 <e5d55f7adef63e5ff054b1493f1759c83cf5e33b@intel.com>
 <cf26d883-b8e4-441b-b739-40104b874b9b@intel.com>
Date: Fri, 23 Oct 2026 16:01:31 +0300
Message-ID: <ef1d19c459a6495ad5e75ad959f82cea8c23c024@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 23 Oct 2026, "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com> wrote:
> On 23-10-2026 05:28 pm, Jani Nikula wrote:
>> On Fri, 23 Oct 2026, Mallesh Koujalagi <mallesh.koujalagi@intel.com> wrote:
>>> The temperature decoding code stores the intermediate result in an
>>> s64 and checks it against LONG_MAX before assigning it to a long.
>>>
>>> This check is only needed on 32-bit architectures, where long is
>>> narrower than s64. On 64-bit systems, long and s64 are both 64 bits,
>>> so the condition can never be true.
>>>
>>> Wrap the check with BITS_PER_LONG == 32 so it is only compiled where
>>> it is needed, preserving the existing overflow protection on 32-bit
>>> architectures while eliminating the dead branch on 64-bit builds.
>> Why would it matter? Why make the code harder to read with the inline
>> #ifdef?
>
> Static analysis tools complain that the code contains dead code on
>
> 64-bit systems because the "value > LONG_MAX" check is always false there.

Given that this is the reason *why* you're doing the change in the first
place, or at all, don't you think perhaps it should be mentioned in the
commit message?

> My initial thought was to handle this explicitly for 32 bit systems,
>
> but I agree that the #ifdef makes the code harder to read.
>
>
> An alternative is to user overflows_type(), which handles both 32-bit and
>
> 64-bit cases without conditional code and keeps the overflow check clear
>
> and simple.

I think using overflows_type() with the destination variable (see the
documentation) is the most self-documenting thing you could do.

BR,
Jani.


>
>
> Any thoughts? If that sounds reasonable, I'll send a next revision with 
> that approach.
>
>
> Please let me know.
>
>
> Thanks,
>
> -/Mallesh
>
>>> Fixes: 24ec15d64617 ("drm/xe/hwmon: Decode CRI temperature registers as IEEE-754")
>>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_hwmon.c | 7 ++++++-
>>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>>> index 42acfeb8818c..2ee51921acf5 100644
>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>> @@ -1322,9 +1322,14 @@ static int xe_hwmon_temperature_decode(u32 reg_val, long *temperature)
>>>   		value = 0;
>>>   	}
>>>   
>>> -	/* Ensure the magnitude fits in long, which is 32-bit on some arches. */
>>> +#if BITS_PER_LONG == 32
>>> +	/*
>>> +	 * On 32-bit systems, long is smaller than s64, so the value may
>>> +	 * still overflow long even if it fits in s64.
>>> +	 */
>>>   	if (value > LONG_MAX)
>>>   		return -ERANGE;
>>> +#endif
>>>   
>>>   	if (reg_val & IEEE754_SIGN)
>>>   		value = -value;

-- 
Jani Nikula, Intel
