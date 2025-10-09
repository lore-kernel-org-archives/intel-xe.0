Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0455BCCD184
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 16:20:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B500010E203;
	Thu,  9 Oct 2025 16:20:58 +0000 (UTC)
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9350310E203
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 16:20:57 +0000 (UTC)
Message-ID: <d5971b02-824b-4f97-8e31-6dd72b527c5e@lankhorst.se>
Date: Thu, 9 Oct 2025 18:20:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Increase global invalidation timeout to 1000us
To: Kenneth Graunke <kenneth@whitecape.org>, intel-xe@lists.freedesktop.org
References: <20250912223254.147940-1-kenneth@whitecape.org>
 <12755240.O9o76ZdvQC@imeretto>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <12755240.O9o76ZdvQC@imeretto>
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

Hey,

Den 2025-10-07 kl. 04:21, skrev Kenneth Graunke:
> Humble ping - would love to see this land.  Even if there's additional work to 
> do here or someone finds a better solution, it's no harder to use this as a 
> starting point than where we're at now.  And, it would help me, and others.
> 
> 6.17 is out now and my display has been locking up since 6.15.  Would love to 
> stop having to remember to boot up custom kernels to work around this.
> 
> (Also... I am not a kernel committer.  Would need someone to review/push.)
> 
> --Ken
> 
> On Friday, September 12, 2025 3:31:45 PM Pacific Daylight Time Kenneth Graunke 
> wrote:
>> The previous timeout of 500us seems to be too small; panning the map in
>> the Roll20 VTT in Firefox on a KDE/Wayland desktop reliably triggered
>> timeouts within a few seconds of usage, causing the monitor to freeze
>> and the following to be printed to dmesg:
>>
>> [Jul30 13:44] xe 0000:03:00.0: [drm] *ERROR* GT0: Global invalidation
>> timeout [Jul30 13:48] xe 0000:03:00.0: [drm] *ERROR* [CRTC:82:pipe A]
>> flip_done timed out
>>
>> I haven't hit a single timeout since increasing it to 1000us even after
>> several multi-hour testing sessions.
>>
>> Fixes: c0114fdf6d4a ("drm/xe: Move DSB l2 flush to a more sensible place")
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5710
>> Signed-off-by: Kenneth Graunke <kenneth@whitecape.org>
>> Cc: stable@vger.kernel.org
>> Cc: Maarten Lankhorst <dev@lankhorst.se>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> This fixes my desktop which has been broken since 6.15.  Given that
>> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6097 was recently
>> filed and they seem to need a timeout of 2000 (and are having somewhat
>> different issues), maybe more work's needed here...but I figured I'd
>> send out the fix for my system and let xe folks figure out what they'd
>> like to do.  Thanks :)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index a4d12ee7d575..6339b8800914 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -1064,7 +1064,7 @@ void xe_device_l2_flush(struct xe_device *xe)
>>  	spin_lock(&gt->global_invl_lock);
>>
>>  	xe_mmio_write32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1);
>> -	if (xe_mmio_wait32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1, 0x0, 500, 
> NULL,
>> true)) +	if (xe_mmio_wait32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1, 0x0, 1000,
>> NULL, true)) xe_gt_err_once(gt, "Global invalidation timeout\n");
>>
>>  	spin_unlock(&gt->global_invl_lock);
> 
> 
> 
> 
Sorry, completely missed taking the patch when I first saw it, glad it's merged now!

Kind regards,
~Maarten
