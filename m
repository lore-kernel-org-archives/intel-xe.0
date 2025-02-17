Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA8CC021A0
	for <intel-xe@archiver.kernel.org>; Mon, 17 Feb 2025 08:44:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75B910E26D;
	Mon, 17 Feb 2025 08:44:21 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A471810E26D
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Feb 2025 08:44:20 +0000 (UTC)
Message-ID: <43c449d9-0a10-4ea9-b719-3423e5f93036@lankhorst.se>
Date: Mon, 17 Feb 2025 09:44:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/display: Clarify XE_IOCTL_DBG message
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20250117115305.53113-1-dev@lankhorst.se>
 <bfb41019793270ae2aee1e4cc14b95c109dfce3e.camel@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <bfb41019793270ae2aee1e4cc14b95c109dfce3e.camel@intel.com>
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



On 2025-01-17 18:55, Summers, Stuart wrote:
> On Fri, 2025-01-17 at 12:53 +0100, Maarten Lankhorst wrote:
>> This should make it easier to understand from userspace why importing
>> BO
>> fails.
>>
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>> ---
>>   drivers/gpu/drm/xe/display/intel_fb_bo.c |  5 +++--
>>   drivers/gpu/drm/xe/xe_bo.c               | 16 ++++++++++++++++
>>   drivers/gpu/drm/xe/xe_bo.h               |  1 +
>>   3 files changed, 20 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/intel_fb_bo.c
>> b/drivers/gpu/drm/xe/display/intel_fb_bo.c
>> index 4d209ebc26c2a..a3914b61b7049 100644
>> --- a/drivers/gpu/drm/xe/display/intel_fb_bo.c
>> +++ b/drivers/gpu/drm/xe/display/intel_fb_bo.c
>> @@ -24,6 +24,7 @@ void intel_fb_bo_framebuffer_fini(struct
>> drm_gem_object *obj)
>>          xe_bo_put(bo);
>>   }
>>   
>> +
> 
> Drop the extra line break here on merge.
> 
> I agree this is way cleaner, thanks!
> 
> Reviewed-by: Stuart Summers <stuart.summers@intel.com>
Thanks, pushed a bit belatedly.
