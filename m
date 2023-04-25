Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD730C77B61
	for <intel-xe@archiver.kernel.org>; Tue, 25 Apr 2023 13:10:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE4610E291;
	Tue, 25 Apr 2023 13:10:59 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E888910E27D
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Apr 2023 13:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682428256; x=1713964256;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=aBWVSeCIsNGTB2PChfFn4/twHDwuZ4rUGA6EFQrj9Ro=;
 b=SrTs5H8XSO6oMOX/Vwl5gjrmTfhh4zpR66xM++LHl8zgCm4gavvwLOGp
 n2kFlZhWVquZBmrqcRlxa+xz/3dfhXG3VneqdgckoRezv2J4st2cGqkMs
 Slr5AWWnrlx9kXQfk8BGSPFGL3TMdCrTxhM6ocSPlrbOzFEGY4w3JSp/C
 pgVTBLLKHHisq6F0zGx+v+jP0rxuemAlwSHtluFfE+DApGGzcm4eC/D2Y
 UrffiDDFkIj9BPWVM2BawGhyN1WomsT1u5hBUKAxXbxRhVlWsvbgPm6+b
 31+QoNApvB/yYp+1xgBHrrzKYnF2ZnuXfPiR6tCNRFr1qk9ge30y4uKWG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="326360310"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; d="scan'208";a="326360310"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 06:10:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="782839794"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; d="scan'208";a="782839794"
Received: from jardanow-mobl1.ger.corp.intel.com (HELO [10.252.59.199])
 ([10.252.59.199])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 06:10:54 -0700
Message-ID: <a4344507-03ab-b551-94e6-bc73b41c7fa6@linux.intel.com>
Date: Tue, 25 Apr 2023 15:10:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230424130517.860627-1-maarten.lankhorst@linux.intel.com>
 <ohg7ccxtl77yk3mje7udbul3paiyx6b7shti674cn7gecscmnb@y2th74maa3on>
 <6a97791e-7844-753c-0fcf-b16c71975e26@linux.intel.com>
 <f2vg2dabapru46pufo7nok2ggszceagdofaapwswz4z7o2qaas@zt664xn4m2xg>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <f2vg2dabapru46pufo7nok2ggszceagdofaapwswz4z7o2qaas@zt664xn4m2xg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fixup small bug in xe_de.h
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 2023-04-24 17:32, Lucas De Marchi wrote:
> On Mon, Apr 24, 2023 at 04:09:11PM +0200, Maarten Lankhorst wrote:
>>
>> On 2023-04-24 15:57, Lucas De Marchi wrote:
>>> On Mon, Apr 24, 2023 at 03:05:17PM +0200, Maarten Lankhorst wrote:
>>>> In display it's not called from irq context, so use xe_mmio_wait32 
>>>> with
>>>> atomic = false. This fixes a splat and the need for i915_utils.
>>>>
>>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/245
>>>
>>>
>>> this needs to be:
>>> git commit --fixup=0838430682d761d0c62836455c5a792bd2836615 so it gets
>>> squashed in next rebase in "fixup! drm/xe/display: Implement display 
>>> support"
>> Yeah that's fine, I was planning to change the commit message when 
>> committing anyway.
>>>> ---
>>>> drivers/gpu/drm/xe/display/xe_de.h | 5 +++--
>>>> scripts/package/buildtar           | 2 +-
>>>> 2 files changed, 4 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/display/xe_de.h 
>>>> b/drivers/gpu/drm/xe/display/xe_de.h
>>>> index 000379f8702e..0c76b0d24d96 100644
>>>> --- a/drivers/gpu/drm/xe/display/xe_de.h
>>>> +++ b/drivers/gpu/drm/xe/display/xe_de.h
>>>> @@ -70,8 +70,9 @@ __intel_de_wait_for_register(struct 
>>>> drm_i915_private *i915, i915_reg_t reg,
>>>>                  unsigned int fast_timeout_us,
>>>>                  unsigned int slow_timeout_ms, u32 *out_value)
>>>> {
>>>> -    return wait_for_atomic(((*out_value = 
>>>> xe_mmio_read32(to_gt(i915), reg.reg)) & mask) == value,
>>>> -            slow_timeout_ms);
>>>> +    return xe_mmio_wait32(to_gt(i915), reg.reg, value, mask,
>>>> +                  fast_timeout_us + 1000 * slow_timeout_ms,
>>>> +                  out_value, false);
>>>> }
>>>>
>>>> static inline int
>>>> diff --git a/scripts/package/buildtar b/scripts/package/buildtar
>>>> index 65b4ea502962..fee5b9d3b171 100755
>>>> --- a/scripts/package/buildtar
>>>> +++ b/scripts/package/buildtar
>>>> @@ -51,7 +51,7 @@ fi
>>>> #
>>>> cp -v -- "${objtree}/System.map" 
>>>> "${tmpdir}/boot/System.map-${KERNELRELEASE}"
>>>> cp -v -- "${KCONFIG_CONFIG}" "${tmpdir}/boot/config-${KERNELRELEASE}"
>>>> -cp -v -- "${objtree}/vmlinux" 
>>>> "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
>>>> +#cp -v -- "${objtree}/vmlinux" 
>>>> "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
>>>
>>>
>>> leftover from debugging?
>>
>> Oops, yes. :)
>>
>> Can I get your r-b if I commit as a fixup?
>
> ok... in i915 we have:
>
> intel_de_wait_for_register()
>   intel_wait_for_register()
>     __intel_wait_for_register_fw()
>     __wait_for()
>
> with the __wait_for() only happening when slow_timeout != 0 (and
> slow_timeout also passed to __intel_wait_for_register_fw()).
>
> So this is always a might_sleep condition.
>
> For direct users of __intel_de_wait_for_register(), it's harder to
> verify as it depends on the value passed by the caller. Currently I see
> 2 callers:
>
>     drivers/gpu/drm/i915/display/intel_dp_aux.c|47 col 8| ret = 
> __intel_de_wait_for_register(i915, ch_ctl,
>     drivers/gpu/drm/i915/display/intel_hdcp.c|350 col 8| ret = 
> __intel_de_wait_for_register(dev_priv, HDCP_KEY_STATUS,
>
> It seems they are only using the __intel* variant to be able to get the
> out_value and not because of the different handling for the timeout.
> since the are both passing a !0 slow_timeout.
>
>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
Thanks for r-b, I see that I forgot to add it when pushing, but I fixed 
up the leftover.
