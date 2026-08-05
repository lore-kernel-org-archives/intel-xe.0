Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36736C55822
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 07:44:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB95A10ED53;
	Wed,  5 Aug 2026 07:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XMiHzQnN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD98210E194;
 Wed,  5 Aug 2026 07:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785915868; x=1817451868;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=hqe00ZtYq3K0UJ6/OPTUv7qaBfK1Qzd0VpmHtfrrH+4=;
 b=XMiHzQnNDuWuNMRP3EuaafkpCEkWQd+MKUmXgudrTDXOvtbaT02DNbM3
 gRxU6XYG0fwx8pcropvK/vDDVhT48shV8X3QWOLtIehwlvc83F0E/Gg+N
 so+7NxFUj4+ZoEqPX8yZLWEUt1nG2M3FGQaAszsn4idrOut48QxvJolxM
 shyVc01QcaMqqm4lS7h8KdjDPtzi+1sxOln8kfCAMKNnaMcwylBBUO630
 K2Zh7LBpDZTZalK8tqtVJznhi0ylLDyeeDqYljQhYx7rxwg8tdsBxPQ/Z
 0Lc/ZURRebeWQkvXdRRvEmWxt48Lut6oE4NQzLxu9e37VYCeb4vwXrCpB g==;
X-CSE-ConnectionGUID: +qTHYIP0ToKuS5i9Bg8PEg==
X-CSE-MsgGUID: JYN8tQMdTxePYUmyt09c/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="96836376"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="96836376"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 00:44:27 -0700
X-CSE-ConnectionGUID: rGJuFUlwRkylJdfXrf/m8g==
X-CSE-MsgGUID: QpkvgP0RRC6E53HZlZA45Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="263716997"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.64])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 00:44:22 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, Suraj
 Kandpal <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com
Subject: Re: [PATCH v2] drm/i915/dp: Use array size for intersect_rates() bound
In-Reply-To: <4af6b668-e117-4ab3-a534-82564feb9002@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260804085658.1306761-1-suraj.kandpal@intel.com>
 <20260804105549.1435154-1-suraj.kandpal@intel.com>
 <4af6b668-e117-4ab3-a534-82564feb9002@intel.com>
Date: Wed, 05 Aug 2026 10:44:19 +0300
Message-ID: <cec10cd7e2357098ed28c29c9948d2fcf03ba28e@intel.com>
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

On Wed, 05 Aug 2026, "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com> wrote:
> On 8/4/2026 4:25 PM, Suraj Kandpal wrote:
>> Take an explicit common_len parameter and pass
>> ARRAY_SIZE(intel_dp->common_rates) at the call site, so the bound is
>> tied to the destination array.
>> 
>> Fixes: e6bda3e4cb43 ("drm/i915: Avoid overflowing the DP link rate arrays")
>> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
>> ---
>> v1 -> v2:
>> -Use latest baseline (Jani)
>> 
>>   drivers/gpu/drm/i915/display/intel_dp.c | 11 +++++++----
>>   1 file changed, 7 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
>> index 7f13595f40c1..1f1324c99130 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -625,13 +625,13 @@ intel_dp_set_source_rates(struct intel_dp *intel_dp)
>>   
>>   static int intersect_rates(const int *source_rates, int source_len,
>>   			   const int *sink_rates, int sink_len,
>> -			   int *common_rates)
>> +			   int *common_rates, int common_len)
>>   {
>>   	int i = 0, j = 0, k = 0;
>>   
>>   	while (i < source_len && j < sink_len) {
>>   		if (source_rates[i] == sink_rates[j]) {
>> -			if (WARN_ON(k >= DP_MAX_SUPPORTED_RATES))
>> +			if (WARN_ON(k >= common_len))
>
> DP_MAX_SUPPORTED_RATES made more sense here because it keeps the size of 
> the common rate (and sink rate) from drifting away from the standard macro.

DP_MAX_SUPPORTED_RATES means the number of 16-bit rates to read from the
eDP specific DP_SUPPORTED_LINK_RATES DPCD register. I think it's
misleading to use it for *anything* else.

The number of source and sink rates don't have to be linked in any way.

See intel_dp_set_source_rates(). All the platforms since ICL support 10
or 11 rates i.e. more than DP_MAX_SUPPORTED_RATES.

>
>>   				return k;
>>   			common_rates[k] = source_rates[i];
>>   			++k;
>> @@ -660,6 +660,7 @@ int intel_dp_rate_index(const int *rates, int len, int rate)
>>   
>>   static void intel_dp_get_common_rates(struct intel_dp *intel_dp,
>>   				      int common_rates[DP_MAX_SUPPORTED_RATES],
>> +				      int common_len,
>>   				      int *num_common_rates)
>>   {
>>   	struct intel_display *display = to_intel_display(intel_dp);
>> @@ -671,7 +672,8 @@ static void intel_dp_get_common_rates(struct intel_dp *intel_dp,
>>   					    intel_dp->num_source_rates,
>>   					    intel_dp->sink_rates,
>>   					    intel_dp->num_sink_rates,
>> -					    common_rates);
>> +					    common_rates,
>> +					    common_len);
>>   
>>   	/* Paranoia, there should always be something in common. */
>>   	if (drm_WARN_ON(display->drm, *num_common_rates == 0)) {
>> @@ -687,7 +689,8 @@ static bool intel_dp_set_common_link_params(struct intel_dp *intel_dp)
>>   	int common_rates[DP_MAX_SUPPORTED_RATES];
>>   	bool params_changed = false;
>>   
>> -	intel_dp_get_common_rates(intel_dp, common_rates, &num_common_rates);
>> +	intel_dp_get_common_rates(intel_dp, common_rates, ARRAY_SIZE(common_rates),
>> +				  &num_common_rates);
>
> Is this patch in response to an actual bug or just a defensive code 
> change? If it is the later, does it add much value?
>
> common_rates and sink_rate are already locked in with 
> DP_MAX_SUPPORTED_RATES. There is a hazard of them drifting away from a 
> common size for which we could add a static enforcement of
>
> BUILD_BUG_ON(ARRAY_SIZE(common_rates) != ARRAY_SIZE(sink_rates));
>
> Something similar is done in intel_dp_set_dpcd_sink_rates() to keep the 
> sink_rate within limits.
>
> Regardless, if there is no actual bug then the Fixes tag is unjustified.
>
> ==
>
> Chaitanya
>
>
>
>>   	if (intel_dp_link_caps_update(intel_dp->link.caps,
>>   				      common_rates, num_common_rates,
>>   				      intel_dp_get_max_common_lane_count(intel_dp),
>

-- 
Jani Nikula, Intel
