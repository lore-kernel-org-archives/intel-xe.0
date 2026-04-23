Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6119AF99372
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 11:15:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B6E10F0AD;
	Thu, 23 Apr 2026 11:15:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Sj14zMql";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A6B10E308;
 Thu, 23 Apr 2026 11:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RySvajcwr4sJSFV5Rgh1Sg6tBmWqL21R7qDcKk8OLZM=; b=Sj14zMqlNQN6TjE049NCKIw2lU
 rnTADIeYc3tP+4CK9j1baUHC+NxALw1H3Ww+rAN7i4aQw2IMtzNYPuZC9s7RcIUPv6Qx7ByDhjp3l
 6bGfbMnfb7R7OJ5z53G6FzkUP5nhtmBXCV9e8vWp0T05e49jrcB3I9PKtAU61xah17dOCzXAVwVlC
 yjtMy3CmVIgV5v5RwEeJvbdvrjmS4RF8wBnClAWJHRMUJbJsbf+SeX1xeBIi9B2jvBWZlalH1P05s
 TJrnahS+iW16VwSzDWmLJFavpIRniyue/N6nutHPWexmjDGfylIGH/x9e2bbhJEjXWmdYEVy1OKgD
 HNQu/79Q==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1wFs1b-0014qa-M5; Thu, 23 Apr 2026 13:15:14 +0200
Message-ID: <fc60cf57-0662-4c40-8d70-190910d780ad@igalia.com>
Date: Thu, 23 Apr 2026 12:15:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/display: enable ccs modifiers on dg2
To: Jani Nikula <jani.nikula@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20260423101739.2772745-1-juhapekka.heikkila@gmail.com>
 <efeef92c230d81764e1fada17c2a81012548cead@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <efeef92c230d81764e1fada17c2a81012548cead@intel.com>
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


On 23/04/2026 11:28, Jani Nikula wrote:
> On Thu, 23 Apr 2026, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com> wrote:
>> Since Xe driver aux ccs enablement dg2 ccs modifiers have been
>> disabled on both Xe and i915 drivers. Here allow dg2 to use
>> ccs again for framebuffers.
>>
>> Fixes: 6a99e91 ("drm/i915/display: Detect AuxCCS support via display parent interface")
>> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> ---
>>   drivers/gpu/drm/i915/i915_driver.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
>> index d31819758f3d..7a73461d398a 100644
>> --- a/drivers/gpu/drm/i915/i915_driver.c
>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>> @@ -54,9 +54,11 @@
>>   #include "display/intel_bw.h"
>>   #include "display/intel_cdclk.h"
>>   #include "display/intel_crtc.h"
>> +#include "display/intel_display_core.h"
>>   #include "display/intel_display_device.h"
>>   #include "display/intel_display_driver.h"
>>   #include "display/intel_display_power.h"
>> +#include "display/intel_display_types.h"
>>   #include "display/intel_dmc.h"
>>   #include "display/intel_dp.h"
>>   #include "display/intel_dpt.h"
>> @@ -749,8 +751,9 @@ static void fence_priority_display(struct dma_fence *fence)
>>   static bool has_auxccs(struct drm_device *drm)
>>   {
>>   	struct drm_i915_private *i915 = to_i915(drm);
>> +	struct intel_display *display = i915->display;
>>   
>> -	return IS_GRAPHICS_VER(i915, 9, 12) ||
>> +	return IS_DISPLAY_VER(display, 9, 12) ||
> 
> Sorry, can't do this in i915 core.

Was DG2 never Gen12? I totally forgot.. my bad.. Adding IS_DG2 to the 
checks below should work, no?

Regards,

Tvrtko

> 
> BR,
> Jani.
> 
>>   	       IS_ALDERLAKE_P(i915) ||
>>   	       IS_METEORLAKE(i915);
>>   }
> 

