Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55881CDB465
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 02:57:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1910310E3F9;
	Thu, 12 Oct 2023 02:57:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D837B10E3F9
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 02:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697079421; x=1728615421;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=4cqJHxhhFy/VR1QMsJEe4S/NrMBo633++Rfwf1L6akE=;
 b=dtXWeuEh+39JokDAGy/VnzMjHM5MVHptLfGkvP0KgtljXofG4P2i0geN
 istYZBLx+ddbT3B3F3tzuiYKxr/Et2ny6E6ByZhz2UqHTaqLx2V1rCfBf
 xsSkyY7urhfK8H6t6Uf+Qnm9md3oPmjXPZP0UiqIvD2gTWCSJnWf/T2wX
 f5tMj7S8VZ3JEB/2+Gt1WPG2nggqHl5jY2BjXh4UH60YRNhyi8aKZIOZm
 xoLpwsQNEIqkjn8aeUMIe+fOOBJ+uijoWkX4/MMWlwqrygqAwGAIFTYZy
 RkeRWF26plezcY8M+z/nwbw5Z6OBCvsDdHW8Zov8KZf1pCR6WelG+cpYj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="375170757"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="375170757"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 19:57:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="844820340"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="844820340"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 19:57:00 -0700
Message-ID: <ce44d9f3-deb6-33a6-a955-db3d8ec60da7@linux.intel.com>
Date: Thu, 12 Oct 2023 08:29:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230927114627.136925-1-himal.prasad.ghimiray@intel.com>
 <20230927114627.136925-11-himal.prasad.ghimiray@intel.com>
 <c083d229-bfc1-4acc-421f-246d9be66f07@linux.intel.com>
 <ba352668-c77f-4b65-b487-ac18edaf26e8@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <ba352668-c77f-4b65-b487-ac18edaf26e8@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 10/11] drm/xe: Clear SOC CORRECTABLE error
 registers.
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


On 11/10/23 12:22, Ghimiray, Himal Prasad wrote:
>
> On 11-10-2023 12:18, Aravind Iddamsetty wrote:
>> On 27/09/23 17:16, Himal Prasad Ghimiray wrote:
>>> PVC doesn't support correctable SOC errors, if we receive MSI due to
>> statement looks incomplete/inappropriate,
>>
>> better rephrase to "PVC doesn't support correctable SOC error reporting"
> ok.
>>
>> Thanks,
>> Aravind.
>>> correctable error, classify them as Undefined and clear the registers.
>>>
>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_hw_error.c | 24 +++++++++++++++++++++++-
>>>   1 file changed, 23 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>>> index dcf395bd985f..0bcb1bea7ffb 100644
>>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>>> @@ -616,9 +616,30 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>>>         lockdep_assert_held(&tile_to_xe(tile)->irq.lock);
>>>   -    if ((tile_to_xe(tile)->info.platform != XE_PVC) && hw_err == HARDWARE_ERROR_CORRECTABLE)
>>> +    if ((tile_to_xe(tile)->info.platform != XE_PVC))
>>>           return;
>>>   +    if (hw_err == HARDWARE_ERROR_CORRECTABLE) {
>>> +        for (i = 0; i < PVC_NUM_IEH; i++)
>>> +            xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i),
>>> +                    ~REG_BIT(hw_err));
>>> +
>>> +        xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err),
>>> +                REG_GENMASK(31, 0));
>>> +        xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err),
>>> +                REG_GENMASK(31, 0));
>>> +        xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
>>> +                REG_GENMASK(31, 0));
>>> +        xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
>>> +                REG_GENMASK(31, 0));
>>> +
>>> +        drm_info(&tile_to_xe(tile)->drm, HW_ERR
>>> +              "Tile%d Undefine SOC %s error.",
>>> +              tile->id, hwerr_to_str);
>> I still feel in this scenarios at least we shall flag this as drm_err, since even though
>> it is correctable and corrected by HW, aren't they spurious as we don't expect to receive them
>> and a HW misbehaviour. Thoughts?
>
> Agreed. IMO this change should be part of low driver error reporting. Not only SOC, we need to report other gt and tile errors

the category will be added as part of low level driver error, but the since you are adding the print, suggesting to change to drm_err

Thanks,

Aravind.

>
> too as spurious interrupt errors when they are undefined irrespective of error classes(correctable/uncorrectable).
>
>>
>>
>> Thanks,
>> Aravind.
>>> +
>>> +        goto unmask_gsysevtctl;
>>> +    }
>>> +
>>>       if (hw_err == HARDWARE_ERROR_FATAL) {
>>>           soc_mstr_glbl_err_reg = soc_mstr_glbl_err_reg_fatal;
>>>           soc_mstr_lcl_err_reg = soc_mstr_lcl_err_reg_fatal;
>>> @@ -709,6 +730,7 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>>>       xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err),
>>>               mst_glb_errstat);
>>>   +unmask_gsysevtctl:
>>>       for (i = 0; i < PVC_NUM_IEH; i++)
>>>           xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i),
>>>                   (HARDWARE_ERROR_MAX << 1) + 1);
