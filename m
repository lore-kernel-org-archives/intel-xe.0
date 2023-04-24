Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D1EC77B73
	for <intel-xe@archiver.kernel.org>; Mon, 24 Apr 2023 14:09:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068C510E07A;
	Mon, 24 Apr 2023 14:09:18 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753AC10E07A
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Apr 2023 14:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682345355; x=1713881355;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DbLZ9xmkl65MbcWtD7nyzqJdH5uQx/vk5OB3yN8ri+8=;
 b=YjtJ0+NzukMyCmn7JOmDEwOte6S2GIvG2FGW5CZsQx/mdvaCAMNnpvDA
 BI5A7t3PjWCbXxR//G+ZXg2slDEa1MYVoj1/YzF5qJEb3deT+uQyJ8C7w
 MfymP90rCCRMZvGcyyrE2aLupgfltjGo2jLZLtQPFCGc49hpe4YLS5hSw
 rjOf68F9UlQ2b4vt7GstLS2T6IAJznMcegdtUO5qU1I1eR61RwFZQvV4Y
 dsG6JXvFv2GlXvX/rSGSegbGg6AVh5t5nb0nj0gKJHeHsx33St78afo7E
 9hYPaIPX4rMifZ20HdLiPwmibFuHANw2bpqB8tyr2hXmaghqEJJ0+u4m7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="409396772"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; d="scan'208";a="409396772"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 07:09:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="686855649"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; d="scan'208";a="686855649"
Received: from tobiasgr-mobl1.ger.corp.intel.com (HELO [10.252.59.189])
 ([10.252.59.189])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 07:09:13 -0700
Message-ID: <6a97791e-7844-753c-0fcf-b16c71975e26@linux.intel.com>
Date: Mon, 24 Apr 2023 16:09:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230424130517.860627-1-maarten.lankhorst@linux.intel.com>
 <ohg7ccxtl77yk3mje7udbul3paiyx6b7shti674cn7gecscmnb@y2th74maa3on>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <ohg7ccxtl77yk3mje7udbul3paiyx6b7shti674cn7gecscmnb@y2th74maa3on>
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


On 2023-04-24 15:57, Lucas De Marchi wrote:
> On Mon, Apr 24, 2023 at 03:05:17PM +0200, Maarten Lankhorst wrote:
>> In display it's not called from irq context, so use xe_mmio_wait32 with
>> atomic = false. This fixes a splat and the need for i915_utils.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/245
>
>
> this needs to be:
> git commit --fixup=0838430682d761d0c62836455c5a792bd2836615 so it gets
> squashed in next rebase in "fixup! drm/xe/display: Implement display 
> support"
Yeah that's fine, I was planning to change the commit message when 
committing anyway.
>> ---
>> drivers/gpu/drm/xe/display/xe_de.h | 5 +++--
>> scripts/package/buildtar           | 2 +-
>> 2 files changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/xe_de.h 
>> b/drivers/gpu/drm/xe/display/xe_de.h
>> index 000379f8702e..0c76b0d24d96 100644
>> --- a/drivers/gpu/drm/xe/display/xe_de.h
>> +++ b/drivers/gpu/drm/xe/display/xe_de.h
>> @@ -70,8 +70,9 @@ __intel_de_wait_for_register(struct 
>> drm_i915_private *i915, i915_reg_t reg,
>>                  unsigned int fast_timeout_us,
>>                  unsigned int slow_timeout_ms, u32 *out_value)
>> {
>> -    return wait_for_atomic(((*out_value = 
>> xe_mmio_read32(to_gt(i915), reg.reg)) & mask) == value,
>> -            slow_timeout_ms);
>> +    return xe_mmio_wait32(to_gt(i915), reg.reg, value, mask,
>> +                  fast_timeout_us + 1000 * slow_timeout_ms,
>> +                  out_value, false);
>> }
>>
>> static inline int
>> diff --git a/scripts/package/buildtar b/scripts/package/buildtar
>> index 65b4ea502962..fee5b9d3b171 100755
>> --- a/scripts/package/buildtar
>> +++ b/scripts/package/buildtar
>> @@ -51,7 +51,7 @@ fi
>> #
>> cp -v -- "${objtree}/System.map" 
>> "${tmpdir}/boot/System.map-${KERNELRELEASE}"
>> cp -v -- "${KCONFIG_CONFIG}" "${tmpdir}/boot/config-${KERNELRELEASE}"
>> -cp -v -- "${objtree}/vmlinux" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
>> +#cp -v -- "${objtree}/vmlinux" 
>> "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
>
>
> leftover from debugging?

Oops, yes. :)

Can I get your r-b if I commit as a fixup?

