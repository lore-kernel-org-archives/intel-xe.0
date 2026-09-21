Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B6EC982DE
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 08:15:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA3310E34B;
	Mon, 21 Sep 2026 08:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yv7sB8IV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9617810E29A;
 Mon, 21 Sep 2026 08:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789978500; x=1821514500;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=gk8Q8EhwvY4quefpj0AiigB2bPYdu8ZMhixHxeLfXv4=;
 b=Yv7sB8IVzQv2+WKzBG3+ct8MTLkkEMSIM2SfOSxA37F4nSelOqQABzt1
 2ijcluenJ+jN6Ncn9mSX0vYLR6v/qlTxl8qrCx3V3utMlJ82Bx6If3msL
 NHM/pUQSTupKMdG3+HiK/et5hoIlA3y57nRX7sTJlloJXg/T40Vus9qnd
 B32UluQ8dKVulS+8R2OsuaQykvZ65ZqtHpSn48Tek05dWVStL4i6fcVOi
 9Tbl0P4jMU2McjAGY5kShJkjw86fldmc4W3Px4lfnEfxTP3+ZinkeoVbs
 Sb9v2YvE1auMkEI0xZiXCyKix+CDrFAINLR//IDmQfLirlX0B59WphLNU A==;
X-CSE-ConnectionGUID: iBa0qBnQQ5a25E1Y4L43Hg==
X-CSE-MsgGUID: PglyM5N5Se+5XD0hjgMfKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="116005693"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="116005693"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 01:15:00 -0700
X-CSE-ConnectionGUID: vXqjUpHaTP+DHZl888EbCg==
X-CSE-MsgGUID: eNSSQ7WMTFqiz1Z1CmF73w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="277345089"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.180])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 01:14:58 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Deak, Imre"
 <imre.deak@intel.com>, "Naladala, Ramanaidu"
 <ramanaidu.naladala@intel.com>, "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH] drm/i915/xe3plpd: Map AUX power domains to DC_off
In-Reply-To: <DS4PPFE901A304F185E6E6D4B365612BE75E3842@DS4PPFE901A304F.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260918060426.1162123-1-suraj.kandpal@intel.com>
 <20260921022016.1525322-1-suraj.kandpal@intel.com>
 <DS4PPFE901A304F185E6E6D4B365612BE75E3842@DS4PPFE901A304F.namprd11.prod.outlook.com>
Date: Mon, 21 Sep 2026 11:14:55 +0300
Message-ID: <3929c95a183aa4c2f7c5150e1b6bdcbadf953ad9@intel.com>
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

On Mon, 21 Sep 2026, "Kandpal, Suraj" <suraj.kandpal@intel.com> wrote:
>> Subject: [PATCH] drm/i915/xe3plpd: Map AUX power domains to DC_off
>> 
>> From Xe2Lpd we removed the step to disable DC5/6 because as per Bspec for
>> SNPS PHY Aux will be always up. But from Xe3p LT PHY was introduced which
>> powers down the PHY. Which means we need to make sure "Disable DC5/6" of
>> AUX Programming sequence is honored.
>> Add the AUX power domains to the DC_off power well on Xe3p_LPD+, so that
>> DC5/6 stays disabled for as long as an AUX power domain is held.
>> 
>> Bspec: 68851, 68967
>> Suggested-by: Imre Deak <imre.deak@intel.com>
>> Co-developed-by: Ramanaidu Naladala <ramanaidu.naladala@intel.com>
>> Signed-off-by: Ramanaidu Naladala <ramanaidu.naladala@intel.com>
>> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
>> Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
>
> Thanks for review now merged to drm-intel-next

Where did the review for this version happen? This is substantially
different from v2.

BR,
Jani.


>
> Regards,
> Suraj Kandpal
>> ---
>>  .../i915/display/intel_display_power_map.c    | 42 ++++++++++++++++++-
>>  1 file changed, 41 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_power_map.c
>> b/drivers/gpu/drm/i915/display/intel_display_power_map.c
>> index 3400080d78d2..e18eb49983fe 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_power_map.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display_power_map.c
>> @@ -1759,6 +1759,44 @@ static const struct i915_power_well_desc_list
>> wcl_power_wells[] = {
>>  	I915_PW_DESCRIPTORS(wcl_power_wells_aux),
>>  };
>> 
>> +I915_DECL_PW_DOMAINS(xe3plpd_pwdoms_dc_off,
>> +	POWER_DOMAIN_DC_OFF,
>> +	XE3LPD_PW_2_POWER_DOMAINS,
>> +	XE3LPD_PW_C_POWER_DOMAINS,
>> +	XE3LPD_PW_D_POWER_DOMAINS,
>> +	POWER_DOMAIN_AUDIO_MMIO,
>> +	POWER_DOMAIN_AUDIO_PLAYBACK,
>> +	POWER_DOMAIN_AUX_A,
>> +	POWER_DOMAIN_AUX_B,
>> +	POWER_DOMAIN_AUX_USBC1,
>> +	POWER_DOMAIN_AUX_USBC2,
>> +	POWER_DOMAIN_AUX_USBC3,
>> +	POWER_DOMAIN_AUX_USBC4,
>> +	POWER_DOMAIN_AUX_TBT1,
>> +	POWER_DOMAIN_AUX_TBT2,
>> +	POWER_DOMAIN_AUX_TBT3,
>> +	POWER_DOMAIN_AUX_TBT4,
>> +	POWER_DOMAIN_INIT);
>> +
>> +static const struct i915_power_well_desc xe3plpd_power_wells_dcoff[] = {
>> +	{
>> +		.instances = &I915_PW_INSTANCES(
>> +			I915_PW("DC_off", &xe3plpd_pwdoms_dc_off,
>> +				.id = SKL_DISP_DC_OFF),
>> +		),
>> +		.ops = &gen9_dc_off_power_well_ops,
>> +	},
>> +};
>> +
>> +static const struct i915_power_well_desc_list xe3plpd_power_wells[] = {
>> +	I915_PW_DESCRIPTORS(i9xx_power_wells_always_on),
>> +	I915_PW_DESCRIPTORS(icl_power_wells_pw_1),
>> +	I915_PW_DESCRIPTORS(xe3plpd_power_wells_dcoff),
>> +	I915_PW_DESCRIPTORS(xe3lpd_power_wells_main),
>> +	I915_PW_DESCRIPTORS(xe2lpd_power_wells_pica),
>> +	I915_PW_DESCRIPTORS(xelpdp_power_wells_aux),
>> +};
>> +
>>  static void init_power_well_domains(const struct i915_power_well_instance
>> *inst,
>>  				    struct i915_power_well *power_well)  { @@
>> -1865,7 +1903,9 @@ int intel_display_power_map_init(struct
>> i915_power_domains *power_domains)
>>  		return 0;
>>  	}
>> 
>> -	if (DISPLAY_VERx100(display) == 3002)
>> +	if (DISPLAY_VER(display) >= 35)
>> +		return set_power_wells(power_domains, xe3plpd_power_wells);
>> +	else if (DISPLAY_VERx100(display) == 3002)
>>  		return set_power_wells(power_domains, wcl_power_wells);
>>  	else if (DISPLAY_VER(display) >= 30)
>>  		return set_power_wells(power_domains, xe3lpd_power_wells);
>> --
>> 2.34.1
>

-- 
Jani Nikula, Intel
