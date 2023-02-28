Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623A5C7EE32
	for <intel-xe@archiver.kernel.org>; Tue, 28 Feb 2023 15:22:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C7D710E4D7;
	Tue, 28 Feb 2023 15:22:15 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E459110E4D7
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Feb 2023 15:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677597733; x=1709133733;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=P7c75GBq0YazYAta22LVc2/oArh5ADk2WZKUNnaRERU=;
 b=jae0t4EXImO/W2uXJVnpewwS1RjtQwSUKlQ9msr7+7TuSa7D0bbHP0hl
 W+s0FNyV0Xcmm5I+TUgYQ4K82JYJLxJMr19y2v6QssKarQJ9yw/XOuv+3
 pDUjXujqcAh/jj7lAlQWz/Dq6mr4ZYM5/yN7Uon/YbpPZyGsvjIxH0isf
 K5q2A5xfSohF0KWk/86ZA3Apyg8qm2mOobuzAKq+0Tqray3mvbGg09sit
 +Yje39KPbiFLTJIOMIgGr1XPsw2UZo98yk9nTykqbQZ0C/GF1A6hgkX+a
 iqXGtqK71HrgBk87EBcX2hoYtGl3+TgTFfHb+rr+odLTC7djNZDfXeQON Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="314582681"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="314582681"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 07:22:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="674175283"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="674175283"
Received: from mistoan-mobl.ger.corp.intel.com (HELO [10.252.9.93])
 ([10.252.9.93])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 07:22:11 -0800
Message-ID: <6df42f52-78a4-a54d-0758-47587863f7d1@intel.com>
Date: Tue, 28 Feb 2023 15:22:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Content-Language: en-GB
To: Maarten Lankhorst <maarten@lankhorst.se>, intel-xe@lists.freedesktop.org
References: <20230228104137.80965-1-matthew.auld@intel.com>
 <20230228104137.80965-13-matthew.auld@intel.com>
 <057c2d66-5aff-ae5e-0b9b-c63bf2aaa213@lankhorst.se>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <057c2d66-5aff-ae5e-0b9b-c63bf2aaa213@lankhorst.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 12/14] drm/xe/display: annotate CC buffers
 with NEEDS_CPU_ACCESS
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 28/02/2023 14:48, Maarten Lankhorst wrote:
> Hey,
> 
> On 2023-02-28 11:41, Matthew Auld wrote:
>> The display code wants to read the clear color value from the buffer.
>> However if the buffer is the non-mappable part of lmem then we fail the
>> kmap. The simplest solution is to just mark the buffer with
>> XE_BO_NEEDS_CPU_ACCESS, which will either allocate the buffer in the
>> mappable part of lmem, or migrate it there.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/display/xe_fb_pin.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c 
>> b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> index 65c0bc28a3d1..66e1309e21d8 100644
>> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>> @@ -203,6 +203,14 @@ static struct i915_vma *__xe_pin_fb_vma(struct 
>> intel_framebuffer *fb,
>>       if (ret)
>>           goto err;
>> +    /*
>> +     * For this type of buffer we need to able to read from the CPU the
>> +     * clear color value found in the buffer. This doesn't do 
>> anything on
>> +     * non small-bar devices.
>> +     */
>> +    if (intel_fb_rc_ccs_cc_plane(&fb->base) >= 0)
>> +        bo->flags |= XE_BO_NEEDS_CPU_ACCESS;
> 
> While we do need a change, do we need to do this inside pinning? We 
> could also require userspace to create VRAM BO's with CPU_ACCESS, and 
> reject CCS here.
> 
> Of course we should probably also add a UAPI to allow setting the 
> SCANOUT flag on externally imported DMA-BUF bo's, i don't think we 
> require CPU_ACCESS flag for that as it's not our BO.
> 
> Might require some more thinking on how we want to handle this.
> 
> Other patches look good, except for the comments I had:
> 
> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Thanks.

> 
> ~Maarten
> 
