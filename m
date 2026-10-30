Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CD9606A31D
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 10:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H0QeF7Yf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2E5112736;
	Fri, 30 Oct 2026 10:41:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35585112734;
 Fri, 30 Oct 2026 10:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793356863; x=1824892863;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=T5KXMNQ4RIOzej+TfuL+2Xe6pCzPNA+WHYz1J3vH/BY=;
 b=H0QeF7Yfjx/9DerWNPsxK08WyVf7lfCxU0WIan0R1eiMNp3hU31rObh3
 DOiSJlm+OsxO9aWpos1EUqp7Bt0zDo1bt9zmtvA+C+VrP+4/IURYqdygT
 1xyiP+zTnx4u5I+0z7gT6Cp7SWOLffvnVWcDvHn51exLfvp1QWmMgYyD4
 POH3/bjWJtpkOnLYNxQ2vXRXplplqRIIF4fwZGHu0FCOKStOBFG3UcBuU
 ClppkPeHZVUoLEEm++a02agiJF8jMAzpHF7FbDJB+pXFS4z4XLQ/Luv6X
 bvVunfZZV7G1EBfOYUSe7HB1LOZVnEKfLzaoHPrK60KL2eHs2P4DVhTiS w==;
X-CSE-ConnectionGUID: Rrm7lLdiReqlMTL+TMvP2A==
X-CSE-MsgGUID: m/AvtIUSS9OOdm3ZNPQPTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2022598"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2022598"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 03:41:03 -0700
X-CSE-ConnectionGUID: f8auXAckQHChf9XFPNJZtg==
X-CSE-MsgGUID: wluOryQaRoGcAEOFWd+CcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="7230603"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 03:41:01 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>, Mitul Golani
 <mitulkumar.ajitkumar.golani@intel.com>, intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, stable@vger.kernel.org, Linux kernel
 regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH v1] drm/i915/display: Allow port sync on PTL
In-Reply-To: <3918d7f2-2c8e-4c91-8de3-ae412acc75a0@leemhuis.info>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261012040402.3332398-1-mitulkumar.ajitkumar.golani@intel.com>
 <3918d7f2-2c8e-4c91-8de3-ae412acc75a0@leemhuis.info>
Date: Fri, 30 Oct 2026 12:40:59 +0200
Message-ID: <041969576ff0e2ef6abc03650e077e44669a2b72@intel.com>
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 30 Oct 2026, Thorsten Leemhuis <regressions@leemhuis.info> wrote:
> On 10/12/26 06:04, Mitul Golani wrote:
>> Some dual-SST tiled displays exhibit visual corruption on PTL, with
>> one tile's image vertically shifted or wrapped by a random amount
>> that changes on every hotplug.
>> 
>> PTL supports port sync, so allow it to be used to avoid these
>> display issues.
>
> Is this fix for a recent regression still in the "to review" list of
> anyone, or did it fell through the cracks? Or was this solved meanwhile
> and I just missed it?

Pushed now, thanks for the reminder.

BR,
Jani.

>
> Ciao, Thorsten
>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8991
>> Fixes: 05cffc074938 ("drm/i915/display: Implement Wa_16024710867")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_ddi.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
>> index a46ab5d3d70f..a0aff087fafa 100644
>> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
>> @@ -4629,7 +4629,7 @@ intel_ddi_port_sync_transcoders(const struct intel_crtc_state *ref_crtc_state,
>>  	 * From, xe3lpd onwards we have defeatured this with reference to
>>  	 * Wa_16024710867
>>  	 */
>> -	if (!IS_DISPLAY_VER(display, 9, 20))
>> +	if (!IS_DISPLAY_VER(display, 9, 30))
>>  		return 0;
>>  
>>  	if (!intel_crtc_has_type(ref_crtc_state, INTEL_OUTPUT_DP))
>

-- 
Jani Nikula, Intel
