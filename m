Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A53606A321
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 09:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FJZUvBoL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FCE410E56B;
	Fri, 27 Nov 2026 09:36:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4B310E563;
 Fri, 27 Nov 2026 09:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795772168; x=1827308168;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=NM9Kyt/rXO8OXUCxVx/GZ011XmjngpbiLnHZCtNYR/I=;
 b=FJZUvBoL8rkU3MJLcxgqwbZtsJg8NpbOyzdNBAXAT0y/AiD340dluAA6
 xVDFWP9bVXJRglm+IYjYz+4y47ZXd+rdn7n0hgHmR1EhomHTJbZVulEnb
 XKkXQ9pKuvTEHRiA4zhR/HTjVJrv2B8zt3h89EGcEZJ3VbSrShz388zAK
 jOhqZ9GFpM0zNLhJ9Bwcm02cWAkaevhNpa6NCCrfNG9Vbk4dd0Ipy6G88
 js4Vhh90f94NPempbCY0KQKm98MnMlWaOhqEUZBb/pBi5XDQ4NGetBiXC
 jBUC2diq846BZUWDrKqroij19KZ7baMrBnkxYRFWqw3hywjMtLsFlNegE w==;
X-CSE-ConnectionGUID: Cb3Igno4QMa+0Qv93Yk/RQ==
X-CSE-MsgGUID: Fyy8TlfGROebpwV2jhl7vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4731340"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4731340"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 01:36:07 -0800
X-CSE-ConnectionGUID: sPDaEzIYTHGoT9TReTsRuw==
X-CSE-MsgGUID: T/lTN//RTCWKz9q93yYMiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12226555"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.90])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 01:36:07 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH v2 6/6] drm/i915/display: use str_enable_disable() more
In-Reply-To: <04ddae57-c6d9-445e-a18c-5a62ec5f1f4a@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1795607055.git.jani.nikula@intel.com>
 <516907662db5f4f9f3dbaeb49ac031d310f3622a.1795607055.git.jani.nikula@intel.com>
 <04ddae57-c6d9-445e-a18c-5a62ec5f1f4a@intel.com>
Date: Fri, 27 Nov 2026 11:36:03 +0200
Message-ID: <cf4b87f97ddc36d25da6103b6fff04dc4b2b48e8@intel.com>
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

On Thu, 26 Nov 2026, "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com> wrote:
> On 11/25/2026 5:16 PM, Jani Nikula wrote:
>> Convert a few places to str_enable_disable(). Improve the grammar and
>> switch to %pe errno logging while at it.
>>
>> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Thanks for the reviews, series pushed to din.

BR,
Jani.

>
>
>> ---
>>   drivers/gpu/drm/i915/display/intel_dp_hdcp.c | 4 ++--
>>   drivers/gpu/drm/i915/display/intel_hdmi.c    | 4 ++--
>>   2 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
>> index 566a921d18a1..33cfa32791ae 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
>> @@ -756,8 +756,8 @@ intel_dp_mst_toggle_hdcp_stream_select(struct intel_connector *connector,
>>   					 hdcp->stream_transcoder, enable,
>>   					 TRANS_DDI_HDCP_SELECT);
>>   	if (ret)
>> -		drm_err(display->drm, "%s HDCP stream select failed (%d)\n",
>> -			enable ? "Enable" : "Disable", ret);
>> +		drm_err(display->drm, "HDCP stream select %s failed (%pe)\n",
>> +			str_enable_disable(enable), ERR_PTR(ret));
>>   	return ret;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
>> index 667d4514c375..ff1106b70390 100644
>> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
>> @@ -1572,8 +1572,8 @@ int intel_hdmi_hdcp_toggle_signalling(struct intel_digital_port *dig_port,
>>   					 cpu_transcoder, enable,
>>   					 TRANS_DDI_HDCP_SIGNALLING);
>>   	if (ret) {
>> -		drm_err(display->drm, "%s HDCP signalling failed (%d)\n",
>> -			enable ? "Enable" : "Disable", ret);
>> +		drm_err(display->drm, "HDCP signalling %s failed (%pe)\n",
>> +			str_enable_disable(enable), ERR_PTR(ret));
>>   		return ret;
>>   	}
>>   

-- 
Jani Nikula, Intel
