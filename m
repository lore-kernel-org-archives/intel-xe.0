Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F09F9D0D5
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 15:45:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD7610E0A2;
	Tue, 14 Apr 2026 15:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="QxRlgS6k";
	dkim-atps=neutral
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3719510E0A2;
 Tue, 14 Apr 2026 15:45:54 +0000 (UTC)
Received: from [192.168.178.25] (i5C75F434.versanet.de [92.117.244.52])
 (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 27BA02FC0050;
 Tue, 14 Apr 2026 17:45:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1776181552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bdSO335/4d5oGcZdjFzqcwYatsq5nVYqKrBIkBJL5Xc=;
 b=QxRlgS6kbny8eNhWTr1be4he0u8N2EmC+3KO/bfbLxY5DfTa1XY7x9SehSqKcnmco9z+4a
 Trtr2mByebiZhrAmlLPDlmPtNNb412w2pkViuzVgw38TqsDUNxFZi0j17AZtE9ABNAWC8a
 SXZZbK7SrYuI9efmmBG+x02ffKPL0Go=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <02a7d3d8-7021-4476-a659-44ee31253447@tuxedocomputers.com>
Date: Tue, 14 Apr 2026 17:45:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/backlight: Remove try_vesa_interface
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Cc: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
References: <20260224031322.2568874-1-suraj.kandpal@intel.com>
 <38ba8502-4a9b-4881-9bac-7833ef755d77@tuxedocomputers.com>
 <DM3PPF208195D8D28441301A99E1A8600CAE3252@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <DM3PPF208195D8D28441301A99E1A8600CAE3252@DM3PPF208195D8D.namprd11.prod.outlook.com>
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

Hi,

Am 14.04.26 um 08:11 schrieb Kandpal, Suraj:
>> Subject: Re: [PATCH] drm/i915/backlight: Remove try_vesa_interface
>>
>> Hi,
>>
>> Am 24.02.26 um 04:13 schrieb Suraj Kandpal:
>>> Remove try_vesa_interface. This is because we now make VESA Interface
>>> as a fallback mechanism for Panels which needs VESA DPCD AUX backlight
>>> mechanism to work but have a broken VBT indicating otherwise.
>>> While at in sneak in a small comment cleanup too.
>> Just a heads up: I ran into some devices that don't auto select the intel
>> interface and don't work with the vesa interface, but ran in the return -
>> ENODEV case before and then still had a working backlight. This patch stops
>> backlight control working on these devices. So there seems to be another
>> fallback that this patch overwrites?
>>
>> Explicitly forcing the intel interface via module property makes the backlight
>> control work again.
>>
>> I will do some more research and then write a proper bug report, but just to
>> let you know that this patch will cause a regression bug in its current form.
>>
> There have been fixes to get this issue resolved. And they are merged. Should be available on latest upstream drm-tip
> Them being
> 02d44b3a8fa drm/i915/backlight: Fix VESA backlight possible check condition
> 0fb03890d182 drm/i915/backlight: Check if VESA backlight is possible

Thanks, I was only aware of "Check if VESA backlight is possible" /which alone 
didn't help) and not "Fix VESA backlight possible check condition". I will test it.

Best Regards,

Werner

>
> Regards,
> Suraj Kandpal
>
>> Best regards,
>>
>> Werner
>>
>>> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15679
>>> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
>>> ---
>>>    .../drm/i915/display/intel_dp_aux_backlight.c | 19 +++++++------------
>>>    1 file changed, 7 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
>>> b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
>>> index eb05ef4bd9f6..a8e9872566cd 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
>>> @@ -644,9 +644,10 @@ int intel_dp_aux_init_backlight_funcs(struct
>> intel_connector *connector)
>>>    	struct intel_dp *intel_dp = intel_attached_dp(connector);
>>>    	struct drm_device *dev = connector->base.dev;
>>>    	struct intel_panel *panel = &connector->panel;
>>> -	bool try_intel_interface = false, try_vesa_interface = false;
>>> +	bool try_intel_interface = false;
>>>
>>> -	/* Check the VBT and user's module parameters to figure out which
>>> +	/*
>>> +	 * Check the VBT and user's module parameters to figure out which
>>>    	 * interfaces to probe
>>>    	 */
>>>    	switch (display->params.enable_dpcd_backlight) { @@ -655,7 +656,6
>>> @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector
>> *connector)
>>>    	case INTEL_DP_AUX_BACKLIGHT_AUTO:
>>>    		switch (panel->vbt.backlight.type) {
>>>    		case INTEL_BACKLIGHT_VESA_EDP_AUX_INTERFACE:
>>> -			try_vesa_interface = true;
>>>    			break;
>>>    		case INTEL_BACKLIGHT_DISPLAY_DDI:
>>>    			try_intel_interface = true;
>>> @@ -668,20 +668,12 @@ int intel_dp_aux_init_backlight_funcs(struct
>> intel_connector *connector)
>>>    		if (panel->vbt.backlight.type !=
>> INTEL_BACKLIGHT_VESA_EDP_AUX_INTERFACE)
>>>    			try_intel_interface = true;
>>>
>>> -		try_vesa_interface = true;
>>> -		break;
>>> -	case INTEL_DP_AUX_BACKLIGHT_FORCE_VESA:
>>> -		try_vesa_interface = true;
>>>    		break;
>>>    	case INTEL_DP_AUX_BACKLIGHT_FORCE_INTEL:
>>>    		try_intel_interface = true;
>>>    		break;
>>>    	}
>>>
>>> -	/* For eDP 1.5 and above we are supposed to use VESA interface for
>> brightness control */
>>> -	if (intel_dp->edp_dpcd[0] >= DP_EDP_15)
>>> -		try_vesa_interface = true;
>>> -
>>>    	/*
>>>    	 * Since Intel has their own backlight control interface, the majority of
>> machines out there
>>>    	 * using DPCD backlight controls with Intel GPUs will be using this
>>> interface as opposed to @@ -694,6 +686,9 @@ int
>> intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
>>>    	 * panel with Intel's OUI - which is also required for us to be able to
>> detect Intel's
>>>    	 * backlight interface at all. This means that the only sensible way for
>> us to detect both
>>>    	 * interfaces is to probe for Intel's first, and VESA's second.
>>> +	 *
>>> +	 * Also there is a chance some VBT's may advertise false Intel
>> backlight support even if the
>>> +	 * tcon's DPCD says otherwise. This mean we keep VESA interface as
>> fallback in that case.
>>>    	 */
>>>    	if (try_intel_interface &&
>> intel_dp_aux_supports_hdr_backlight(connector) &&
>>>    	    intel_dp->edp_dpcd[0] <= DP_EDP_14b) { @@ -703,7 +698,7 @@
>> int
>>> intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
>>>    		return 0;
>>>    	}
>>>
>>> -	if (try_vesa_interface &&
>> intel_dp_aux_supports_vesa_backlight(connector)) {
>>> +	if (intel_dp_aux_supports_vesa_backlight(connector)) {
>>>    		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Using VESA eDP
>> backlight controls\n",
>>>    			    connector->base.base.id, connector->base.name);
>>>    		panel->backlight.funcs = &intel_dp_vesa_bl_funcs;
