Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC80606CEE9
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 16:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jf7MtF5P
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAEF310E636;
	Mon,  2 Nov 2026 16:45:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA4CB10E636;
 Mon,  2 Nov 2026 16:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793637896; x=1825173896;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=1/+MQpV4gGCF7SlxSx86h8gCpBfsOyE1qQaMtC05pv0=;
 b=Jf7MtF5PPTUnOECmyX8g7sY4nIkRjAE02FWEsKSrKGhyy6EncmjjfOfz
 yTi6kKXZugzIAA9nd1NULdMtYotD0G7LjECrZEMT15EuWgbeairOp5rpQ
 fvGBNDVQcS3P2Nb30DjQ9UIaOElh78YyUbFpdOYAGeuyFVWJnWGlF45ND
 1NJMskxADcfMcMkQrrzagDpUTs6nBTe0VT2KfiS7Z//OZEUBu9SPaJaAA
 3cfcEb5W61l8sOzqAqpjh3JoulHSISlsOhNaIA3JMT3B+IgVskOjnv5c2
 jSUSg42hH4nMaeOLdIisgr0ard6hmTcGOFS/KuqVqbehz4y2wg72krzuH g==;
X-CSE-ConnectionGUID: QAqvBR31RGStY2MAeWZcOQ==
X-CSE-MsgGUID: OsAnehrLREaew1vfHClS4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2238269"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2238269"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 08:44:55 -0800
X-CSE-ConnectionGUID: wr3sNNS3Sji0oQGyE7xlOA==
X-CSE-MsgGUID: CNHz869ORbSrCkuVCzN57Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6291394"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.222])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 08:44:53 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/display: fix a few i915_reg_t usages that have
 crept back
In-Reply-To: <DS4PPFE901A304FA4A537312A02AEDE54BCE36A2@DS4PPFE901A304F.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261030122207.2835113-1-jani.nikula@intel.com>
 <DS4PPFE901A304FA4A537312A02AEDE54BCE36A2@DS4PPFE901A304F.namprd11.prod.outlook.com>
Date: Mon, 02 Nov 2026 18:44:51 +0200
Message-ID: <82f39b16a4789120dd814b844b03e87776264701@intel.com>
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 02 Nov 2026, "Kandpal, Suraj" <suraj.kandpal@intel.com> wrote:
>> Subject: [PATCH] drm/i915/display: fix a few i915_reg_t usages that have crept
>> back
>> 
>> Display code should use intel_reg_t instead of i915_reg_t. It's currently just a
>> typedef around i915_reg_t, but this will change in the future.
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> LGTM,
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

Thanks, pushed to din.

BR,
Jani.

>
>> ---
>>  drivers/gpu/drm/i915/display/intel_de.h       | 2 +-
>>  drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/display/intel_de.h
>> b/drivers/gpu/drm/i915/display/intel_de.h
>> index 5d3aeaf6a70f..d0a239a36980 100644
>> --- a/drivers/gpu/drm/i915/display/intel_de.h
>> +++ b/drivers/gpu/drm/i915/display/intel_de.h
>> @@ -136,7 +136,7 @@ intel_de_rmw_fw(struct intel_display *display,
>> intel_reg_t reg, u32 clear, u32 s
>> 
>>  static inline u64
>>  intel_de_read64_2x32_volatile_fw(struct intel_display *display,
>> -				 i915_reg_t lower_reg, i915_reg_t upper_reg)
>> +				 intel_reg_t lower_reg, intel_reg_t upper_reg)
>>  {
>>  	u32 old_upper, upper, lower;
>>  	int loop = 0;
>> diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
>> b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
>> index bfd6f0a19725..07a66db583dd 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
>> @@ -4798,7 +4798,7 @@ static bool dg2_mpllb_get_hw_state(struct
>> intel_display *display,  {
>>  	struct intel_encoder *encoder = dg2_get_intel_encoder(display, pll);
>>  	enum phy phy;
>> -	i915_reg_t enable_reg;
>> +	intel_reg_t enable_reg;
>>  	struct ref_tracker *wakeref;
>>  	bool ret = false;
>>  	u32 val;
>> --
>> 2.47.3
>

-- 
Jani Nikula, Intel
