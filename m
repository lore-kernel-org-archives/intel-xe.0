Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E64CCD185
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 13:15:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972BD10EBFF;
	Fri, 10 Oct 2025 13:15:33 +0000 (UTC)
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ABFF10EBFF
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Oct 2025 13:15:33 +0000 (UTC)
Message-ID: <4e068bf5-c3ef-47d4-963b-ba032cdeee8c@lankhorst.se>
Date: Fri, 10 Oct 2025 15:15:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] drm/xe: Only have a single drmm release action.
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20251010120655.1046007-8-dev@lankhorst.se>
 <20251010120655.1046007-9-dev@lankhorst.se>
 <cf28a7e3-5924-4d34-a8cd-6908dca5fe6f@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <cf28a7e3-5924-4d34-a8cd-6908dca5fe6f@intel.com>
Content-Type: text/plain; charset=UTF-8
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

Hey,

Den 2025-10-10 kl. 14:14, skrev Michal Wajdeczko:
> 
> 
> On 10/10/2025 2:06 PM, Maarten Lankhorst wrote:
>> The broken action happened after ggtt_early_fini, so
>> it's safe to put the drain_workqueue in there instead of
>> creating a new place.
>>
>> Fixes: 89d2835c3680 ("drm/xe: Process deferred GGTT node removals on device unwind")
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>> ---
>>  drivers/gpu/drm/xe/xe_ggtt.c | 12 +-----------
>>  1 file changed, 1 insertion(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index aca7ae5489b91..33b09737ccba8 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -199,6 +199,7 @@ static void ggtt_fini_early(struct drm_device *drm, void *arg)
>>  {
>>  	struct xe_ggtt *ggtt = arg;
>>  
>> +	drain_workqueue(ggtt->wq);
> 
> as said earlier, drain() will be implicitly called by the below destroy() so moving it here is a nop 
> 
> and in some cases (at least in the past) the draining here, in "drmm" action, was just too late,
> and that's why drain() was moved to separate "devm" action that was called while required devm data was still available
> 
> if this is broken now, please attach dmesg/crash log to better understand the case 

In that case, would it make more sense to put the the entire operation in devm instead?
If we cannot accurately handle this case after dev is finished, I don't see any reason to delay this otherwise.

Best regards,
~Maarten Lankhorst
