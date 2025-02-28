Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B409C19776
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 08:08:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C36010E26A;
	Fri, 28 Feb 2025 08:08:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Ge3u8PI1";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E0A10E26A
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 08:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x4ks3j1opURkGbeKD2BkHh3qC8eo1M5GZBmrAflP3zs=; b=Ge3u8PI1xtt3OgQwo578w5zgk5
 Vu9+9iqBI+djwJSj0innSoB3e/oLGqUT4ZtACQgCXEAUoCj+Fg8TdJyt2nfHOUTcsQmP5zTvIe74u
 dplKuiKRMbjK6MnltHpJ2It8agSgACxShcxoHioTt4XVqB3QzlIBuAqHdTILaIeInx5qIH8yh1GgE
 w6SqWsciwjMv4k+fCYEwFhNYqZGYDgR9pn5CcMXC7N53Ukx5DiQkqEGmtUP6JhGaIPyA3dENPHHPr
 ywQzVaxAUYtZWlfvB7BUuuZjfs+rEe3O8bPu8Fz6unrczlSCyEEonPtjj7kQCpLGE7LlmA8sR9ft8
 8+482eVQ==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tnvPy-001wLC-G9; Fri, 28 Feb 2025 09:08:28 +0100
Message-ID: <15ecdc03-e7ec-41f8-b91d-77a1c6851673@igalia.com>
Date: Fri, 28 Feb 2025 08:08:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/xe/xelp: Move Wa_16011163337 from tunings to
 workarounds
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 Matt Roper <matthew.d.roper@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
References: <20250227101304.46660-1-tvrtko.ursulin@igalia.com>
 <20250227101304.46660-3-tvrtko.ursulin@igalia.com>
 <og3rnaevqomre67vpskvk3xnlmy62ugs6g2nbiille3dvjz66x@vfvoioi3r5x5>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <og3rnaevqomre67vpskvk3xnlmy62ugs6g2nbiille3dvjz66x@vfvoioi3r5x5>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 27/02/2025 20:58, Lucas De Marchi wrote:
> On Thu, Feb 27, 2025 at 10:13:01AM +0000, Tvrtko Ursulin wrote:
>> Workaround database specifies 16011163337 as a workaround so lets move it
>> there.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_tuning.c | 8 --------
>> drivers/gpu/drm/xe/xe_wa.c     | 7 +++++++
>> 2 files changed, 7 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/ 
>> xe_tuning.c
>> index d449de0fb6ec..3c78f3d71559 100644
>> --- a/drivers/gpu/drm/xe/xe_tuning.c
>> +++ b/drivers/gpu/drm/xe/xe_tuning.c
>> @@ -97,14 +97,6 @@ static const struct xe_rtp_entry_sr 
>> engine_tunings[] = {
>> };
>>
>> static const struct xe_rtp_entry_sr lrc_tunings[] = {
>> -    { XE_RTP_NAME("Tuning: ganged timer, also known as 16011163337"),
> 
> we now lose the infor that we have this tuning implemented, but I'm ok
> with keeping it only on the WA side.... for newer platforms it's there
> so this is mostly making the older ones work.

Good point, and I am happy to respin with a reversed description like 
"16011163337, also known as Ganged timer tuning" or something.

Regards,

Tvrtko

> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> thanks
> Lucas De Marchi
> 
>> -      XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), 
>> ENGINE_CLASS(RENDER)),
>> -      /* read verification is ignored due to 1608008084. */
>> -      XE_RTP_ACTIONS(FIELD_SET_NO_READ_MASK(FF_MODE2,
>> -                        FF_MODE2_GS_TIMER_MASK,
>> -                        FF_MODE2_GS_TIMER_224))
>> -    },
>> -
>>     /* DG2 */
>>
>>     { XE_RTP_NAME("Tuning: L3 cache"),
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index d4982799383c..e446bde3a52b 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -624,6 +624,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>> };
>>
>> static const struct xe_rtp_entry_sr lrc_was[] = {
>> +    { XE_RTP_NAME("16011163337"),
>> +      XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), 
>> ENGINE_CLASS(RENDER)),
>> +      /* read verification is ignored due to 1608008084. */
>> +      XE_RTP_ACTIONS(FIELD_SET_NO_READ_MASK(FF_MODE2,
>> +                        FF_MODE2_GS_TIMER_MASK,
>> +                        FF_MODE2_GS_TIMER_224))
>> +    },
>>     { XE_RTP_NAME("1409342910, 14010698770, 14010443199, 1408979724, 
>> 1409178076, 1409207793, 1409217633, 1409252684, 1409347922, 1409142259"),
>>       XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
>>       XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN3,
>> -- 
>> 2.48.0
>>

