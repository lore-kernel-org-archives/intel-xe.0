Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49C6C5AC67
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 12:47:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C0F110EB96;
	Tue, 11 Aug 2026 12:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CB2qib/l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096C210E310;
 Tue, 11 Aug 2026 12:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786452438; x=1817988438;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=At6ZvWakObPfztgs6wy9qm0SPB07gBrF5J8Vz6wmO5A=;
 b=CB2qib/lCgX3F7jpxMz2H00pYlMMhDj3N4x9FxTYMBHcElnJ8REhmcdZ
 YtqF0R5KTW92iXSLhqoXgaBhvArES8rdck2P2elknNAg6OK0oTAOsdeHL
 NQOQzlCFBt+tx1xphomHgt7Q4RYYcM7Y2FGSiJg7qQD4SJ1greRyrXzll
 7huEAx5EQ6Y0UeZ7xiVM23BzQDRyg6lid/WMQezr3C7xxzP+O9lODk35a
 4vPEUlihw65jDQNbNsDC9KsV+nO70ffjVN5mIcc2ZVDGRUn6/qdBM+MnS
 6XPRv6a72InXH3jNW3U8UJGTE6oXLVooPlp34oOTcjnLI9FnZ5p/MWC08 w==;
X-CSE-ConnectionGUID: 3VO6Dm9PT8yeA7IvixO5ew==
X-CSE-MsgGUID: 7vIiZVppRMGgBaS5u3ecWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="98340797"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="98340797"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 05:47:17 -0700
X-CSE-ConnectionGUID: CFLh46aXSu2xyJH8IxEl4Q==
X-CSE-MsgGUID: A6+qgFfeQcC2MVu33Ar0VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="260723226"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.254])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 05:47:16 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/4] drm/i915/display: Limit max joined dotclock on
 joiner pipes available
In-Reply-To: <98b730a6-d459-4ee5-a38c-81ad1c830b6c@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1786105831.git.jani.nikula@intel.com>
 <3c615440f018af779a3a522f14637d2993f7af03.1786105831.git.jani.nikula@intel.com>
 <98b730a6-d459-4ee5-a38c-81ad1c830b6c@intel.com>
Date: Tue, 11 Aug 2026 15:47:14 +0300
Message-ID: <3f42097b08dd26e10108c3a1f549dd615514cab6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 10 Aug 2026, "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com> wrote:
> On 8/7/2026 6:04 PM, Jani Nikula wrote:
>> Multiplying the max dotclock based on joiner availability on the
>> platform alone does not take into account the actual pipes (possibly
>> with some fused) available for joining.
>>
>> Limit the max joined dotclock based on the actual pipes available for
>> joining. Add helpers for figuring out the valid primary pipes, based on
>> having the required joiners and amount of consecutive pipes available.
>>
>> v2: Check for consecutive pipes available (Ankit)
>>
>> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_display.c | 51 +++++++++++++++++++-
>>   drivers/gpu/drm/i915/display/intel_display.h |  1 +
>>   2 files changed, 50 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
>> index 829d7a411dcc..c958b2a92cc7 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
>> @@ -193,6 +193,53 @@ is_trans_port_sync_mode(const struct intel_crtc_state *crtc_state)
>>   		is_trans_port_sync_slave(crtc_state);
>>   }
>>   
>> +/*
>> + * Return a bitmask of all the start indices of consecutive bitfields of size
>> + * width in mask.
>> + */
>> +static unsigned long find_consecutive_bits(unsigned long mask, int width)
>> +{
>> +	unsigned long bit, out_mask = 0;
>> +
>> +	if (!width)
>> +		return 0;
>> +
>> +	for_each_set_bit(bit, &mask, BITS_PER_TYPE(mask)) {
>> +		/* For each set bit, see if the following bits are set also */
>> +		unsigned long bitfield = GENMASK(bit + width - 1, bit);
>> +
>> +		if ((mask & bitfield) == bitfield)
>> +			out_mask |= BIT(bit);
>> +	}
>> +
>> +	return out_mask;
>
> This is very clever!
>
> This fits very nicely with the part where we want to check if joiner is 
> supported "for a specific crtc" during compute_config phase.

Yay, thanks!

> This works even for width = 1 as well, but it's better to handle the 
> case separately as you have already done, it's intuitive and avoids 
> iterating through the bits.
>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Thanks for the review, pushed the lot to din.

BR,
Jani.

>
>
>> +}
>> +
>> +/*
>> + * Return a bitmask of all valid joiner primary pipes for joining
>> + * num_joined_pipes pipes. For completeness, return all valid pipes for
>> + * num_joined_pipes == 1.
>> + *
>> + * Return 0 if the platform doesn't support joining for the requested number of
>> + * pipes, or there are not enough consecutive pipes available.
>> + */
>> +u8 intel_joiner_valid_primary_pipe_mask(struct intel_display *display, int num_joined_pipes)
>> +{
>> +	if (num_joined_pipes == 1) {
>> +		return DISPLAY_RUNTIME_INFO(display)->pipe_mask;
>> +	} else if (num_joined_pipes == 2) {
>> +		if (!HAS_UNCOMPRESSED_JOINER(display) && !HAS_BIGJOINER(display))
>> +			return 0;
>> +	} else if (num_joined_pipes == 4) {
>> +		if (!HAS_ULTRAJOINER(display))
>> +			return 0;
>> +	} else {
>> +		return 0;
>> +	}
>> +
>> +	return find_consecutive_bits(DISPLAY_RUNTIME_INFO(display)->pipe_mask, num_joined_pipes);
>> +}
>> +
>>   static enum pipe joiner_primary_pipe(const struct intel_crtc_state *crtc_state)
>>   {
>>   	return ffs(crtc_state->joiner_pipes) - 1;
>> @@ -8113,9 +8160,9 @@ static int max_dotclock(struct intel_display *display)
>>   {
>>   	int max_dotclock = display->cdclk.max_dotclk_freq;
>>   
>> -	if (HAS_ULTRAJOINER(display))
>> +	if (intel_joiner_valid_primary_pipe_mask(display, 4))
>>   		max_dotclock *= 4;
>> -	else if (HAS_UNCOMPRESSED_JOINER(display) || HAS_BIGJOINER(display))
>> +	else if (intel_joiner_valid_primary_pipe_mask(display, 2))
>>   		max_dotclock *= 2;
>>   
>>   	return max_dotclock;
>> diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
>> index 57ea4f2edf2a..e7ecae9d2d21 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display.h
>> @@ -373,6 +373,7 @@ intel_cpu_transcoder_mode_valid(struct intel_display *display,
>>   enum phy intel_port_to_phy(struct intel_display *display, enum port port);
>>   bool is_trans_port_sync_mode(const struct intel_crtc_state *state);
>>   bool is_trans_port_sync_master(const struct intel_crtc_state *state);
>> +u8 intel_joiner_valid_primary_pipe_mask(struct intel_display *display, int num_joined_pipes);
>>   u8 intel_crtc_joined_pipe_mask(const struct intel_crtc_state *crtc_state);
>>   bool intel_crtc_is_joiner_secondary(const struct intel_crtc_state *crtc_state);
>>   bool intel_crtc_is_joiner_primary(const struct intel_crtc_state *crtc_state);

-- 
Jani Nikula, Intel
