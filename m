Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D328AEB64D9
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 08:21:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A664D10E2B5;
	Tue, 27 Jun 2023 08:21:28 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5605B10E2B5
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jun 2023 08:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687854086; x=1719390086;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pxHLs++RCkQNxFR1/DQ0i62O6LVPUviP+CPeCcUxf70=;
 b=WpESoLmYJow3ThjX2mXwsdg3MBx5/e1ThL9Ddo7BsjMHKQZB6SfbjHm6
 gKH8QVfVdM0l9z4B5263l0S3bfdA2KWvI30LcOAgyvEuGVE5tN3Agt6Rw
 B5YFMwv/frWXHJh+CvahjFGoOJeeBlUhlOEgfYKgqlfpMIQ+th0S9I8BK
 CQywIZ2EFMm0xkmNC3QlgYCBb+Dlr+mS1ml7EyUys+MT48kVgx+T2A/Kz
 SPfBXEmHco1LoMdnMf0BEUJCVnat99gagxljTR4krzGR9rLBxDJLqLJJC
 3xaOd5DJubS0SuKVnb3/eJrwVODbRsPhgOPOviWAlPgfrBDviZjOcz2CF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="360378290"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="360378290"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 01:21:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="1046822274"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="1046822274"
Received: from fjkilken-mobl1.ger.corp.intel.com (HELO [10.252.8.208])
 ([10.252.8.208])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 01:21:24 -0700
Message-ID: <6d1e3a45-efd0-6ed4-88eb-e2d3fc752dd8@intel.com>
Date: Tue, 27 Jun 2023 09:20:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230626105037.43780-15-matthew.auld@intel.com>
 <20230626105037.43780-19-matthew.auld@intel.com>
 <CY5PR11MB62117F609203FC0958818E3F9527A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <CY5PR11MB62117F609203FC0958818E3F9527A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v12 04/13] drm/xe/guc_pc: add missing
 mem_access for freq_rpe_show
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi,

On 27/06/2023 07:53, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message----- From: Auld, Matthew 
>> <matthew.auld@intel.com> Sent: Monday, June 26, 2023 4:21 PM To: 
>> intel-xe@lists.freedesktop.org Cc: Brost, Matthew 
>> <matthew.brost@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; 
>> Gupta, Anshuman <anshuman.gupta@intel.com> Subject: [PATCH v12 
>> 04/13] drm/xe/guc_pc: add missing mem_access for freq_rpe_show
>> 
>> The mem_access is meant to cover any kind of device level memory 
>> access, mmio included.
>> 
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com> Cc: Matthew 
>> Brost <matthew.brost@intel.com> Cc: Rodrigo Vivi 
>> <rodrigo.vivi@intel.com> Cc: Anshuman Gupta 
>> <anshuman.gupta@intel.com> --- drivers/gpu/drm/xe/xe_guc_pc.c | 4 
>> ++++ 1 file changed, 4 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c 
>> b/drivers/gpu/drm/xe/xe_guc_pc.c index 5d5cf4b0d508..e3722a805837 
>> 100644 --- a/drivers/gpu/drm/xe/xe_guc_pc.c +++ 
>> b/drivers/gpu/drm/xe/xe_guc_pc.c @@ -430,8 +430,12 @@ static 
>> ssize_t freq_rpe_show(struct device *dev, struct device_attribute 
>> *attr, char *buf)  { struct xe_guc_pc *pc = dev_to_pc(dev); + 
>> struct xe_gt *gt = pc_to_gt(pc); +	struct xe_device *xe = 
>> gt_to_xe(gt);
>> 
>> +	xe_device_mem_access_get(xe);
> What is desirable to use here , xe_pm_runtime_get() or 
> xe_device_mem_access_get() ?

Rodrigo suggested using xe_device_mem_access_get() for MMIO, since it 
can be thought of as just another type of memory access, which seems 
pretty reasonable to me. Matt Roper also had thoughts about it here:
https://patchwork.freedesktop.org/patch/542538/?series=119345&rev=1

I don't have a strong opinion either way, just so long as we are 
consistent about it and have a reliable way to 
assert_device_active/assert_mem_access.

> It is register mmio access Few places in driver using 
> xe_pm_runtime_get() for mmio access.

The one in xe_vm.c looks to be a workaround for the race in patch 1, 
which is fixed in this series. Ignoring that I only see the cases in 
compat-i915-headers/i915_drv.h, which looks to be a special case for 
display/i915, but that is also converted to use mem_access later in the 
series, since I wanted to try adding assert_mem_access from all MMIO 
calls to see what CI says (it complained about freq_rpe_show() as per 
this patch). Are there some other places I missed that are using 
xe_pm_runtime_get?

> Thanks, Anshuman Gupta.
>> pc_update_rp_values(pc); +	xe_device_mem_access_put(xe); return 
>> sysfs_emit(buf, "%d\n", pc->rpe_freq);  }  static 
>> DEVICE_ATTR_RO(freq_rpe); -- 2.41.0
> 
