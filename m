Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416EDD591A9
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 17:18:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2CB110E52F;
	Mon, 18 Nov 2024 17:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iyuRUzm9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9C210E52F
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Nov 2024 17:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731950281; x=1763486281;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1WgjPmhc7TOOCFV1ME+HRUe3ZsWC57tOBM8JDWjnCT4=;
 b=iyuRUzm9laK05BblQw4TadS1W3EKGx1zlRW0yDPn4TmmxRo5KERfVl19
 3vi57szqP9/I9O35eU9n3Y+8R/Zvi7OLXJfT7pA0XRzt+kmyMWOnKohYi
 ohQvSCXdt8MaO1s+Bf6kn88aOb2xCwNCcsgQEcdnBdbXhb5jzjXm0fnW8
 HqnITAshpGM0AVPXzPrQ4O/+an6j+smrFo8/zgLFVRno9CKkr9S+k0kpH
 BIQHKWXMlLuBhn5eKVaqeYryxjcqX6i2xM6uqCjjUuRlKt1StaXxgmye6
 islGtv/x28E18sUQJ5mMfbozF/RT84Xkx9Zsq29yn+um9lJYrAUYIIaLl Q==;
X-CSE-ConnectionGUID: 8L7560yFTPy+j6QlF++OLg==
X-CSE-MsgGUID: zfEtXjteRFulz7I+d5Qopw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="42987710"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="42987710"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 09:18:00 -0800
X-CSE-ConnectionGUID: j4FFnBf8QSe0nBmww76QfA==
X-CSE-MsgGUID: 14sZ1sErRXeuRLj/0aUm/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="89687134"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa010.fm.intel.com with ESMTP; 18 Nov 2024 09:17:58 -0800
Received: from [10.245.80.89] (mwajdecz-MOBL.ger.corp.intel.com [10.245.80.89])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 35BAE28780;
 Mon, 18 Nov 2024 17:17:57 +0000 (GMT)
Message-ID: <05e9994c-e77f-448f-b2fa-df03d4c1fdc0@intel.com>
Date: Mon, 18 Nov 2024 18:17:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/vf: Print assumed values of the MOCS entries if VF
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20241115210025.2343-1-michal.wajdeczko@intel.com>
 <20241118165625.GN5725@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20241118165625.GN5725@mdroper-desk1.amr.corp.intel.com>
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



On 18.11.2024 17:56, Matt Roper wrote:
> On Fri, Nov 15, 2024 at 10:00:25PM +0100, Michal Wajdeczko wrote:
>> VF drivers can't access the MOCS registers so their values can't
>> be printed as part of the gt0/mocs debugfs attribute, but since
>> MOCS settings are part of the Bspec and SLA between PF and VFs,
>> we can print assumed MOCS values instead.
> 
> Is it actually useful to anyone for us to fake these values?  It feels
> like changing the semantics (printing what the values _should_ be

hmm, IIRC these values _shall_ be set as printed as this is common SLA
between different drivers/OSes or VFs

my understanding was that the main purpose of this debugfs is just to
show what current driver is using/assuming as MOCS settings

> instead of what they necessarily are) could just cause confusion if
> someone is trying to debug a real bug.  Would it be better to just print

well, OTOH by printing 'fake MOCS values' as assumed by VF we can speed
up debug since we can easily compare what PF actually has programmed

btw, one extra improvement could be to mention in the debugfs output
header that this is not a real value, but 'fake/assumed' or similar

> an "unavailable" message (or just not register the debugfs at all) when
> running in a VF?

skipping mocs debugfs attribute is always the option, question is
whether is it a best one? I'm fine with it (assuming that I will never
approach any MOCS related issue)

> 
> 
> Matt
> 
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_mocs.c | 42 +++++++++++++++++++++++++++++-------
>>  1 file changed, 34 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
>> index 54d199b5cfb2..9ad5366f4370 100644
>> --- a/drivers/gpu/drm/xe/xe_mocs.c
>> +++ b/drivers/gpu/drm/xe/xe_mocs.c
>> @@ -257,6 +257,14 @@ static const struct xe_mocs_entry gen12_mocs_desc[] = {
>>  		   L3_1_UC)
>>  };
>>  
>> +static u32 get_entry_control(const struct xe_mocs_info *info, unsigned int index);
>> +static u32 get_combined_entry_l3cc(const struct xe_mocs_info *info, unsigned int index);
>> +
>> +static bool regs_are_not_available(struct xe_gt *gt)
>> +{
>> +	return IS_SRIOV_VF(gt_to_xe(gt));
>> +}
>> +
>>  static bool regs_are_mcr(struct xe_gt *gt)
>>  {
>>  	struct xe_device *xe = gt_to_xe(gt);
>> @@ -275,7 +283,9 @@ static void xelp_lncf_dump(struct xe_mocs_info *info, struct xe_gt *gt, struct d
>>  	drm_printf(p, "LNCFCMOCS[idx] = [ESC, SCC, L3CC] (value)\n\n");
>>  
>>  	for (i = 0, j = 0; i < (info->num_mocs_regs + 1) / 2; i++, j++) {
>> -		if (regs_are_mcr(gt))
>> +		if (regs_are_not_available(gt))
>> +			reg_val = get_combined_entry_l3cc(info, i);
>> +		else if (regs_are_mcr(gt))
>>  			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
>>  		else
>>  			reg_val = xe_mmio_read32(&gt->mmio, XELP_LNCFCMOCS(i));
>> @@ -307,7 +317,9 @@ static void xelp_mocs_dump(struct xe_mocs_info *info, unsigned int flags,
>>  		drm_printf(p, "GLOB_MOCS[idx] = [LeCC, TC, LRUM, AOM, RSC, SCC, PFM, SCF, CoS, SSE] (value)\n\n");
>>  
>>  		for (i = 0; i < info->num_mocs_regs; i++) {
>> -			if (regs_are_mcr(gt))
>> +			if (regs_are_not_available(gt))
>> +				reg_val = get_entry_control(info, i);
>> +			else if (regs_are_mcr(gt))
>>  				reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
>>  			else
>>  				reg_val = xe_mmio_read32(&gt->mmio, XELP_GLOBAL_MOCS(i));
>> @@ -380,7 +392,9 @@ static void xehp_lncf_dump(struct xe_mocs_info *info, unsigned int flags,
>>  	drm_printf(p, "LNCFCMOCS[idx] = [UCL3LOOKUP, GLBGO, L3CC] (value)\n\n");
>>  
>>  	for (i = 0, j = 0; i < (info->num_mocs_regs + 1) / 2; i++, j++) {
>> -		if (regs_are_mcr(gt))
>> +		if (regs_are_not_available(gt))
>> +			reg_val = get_combined_entry_l3cc(info, i);
>> +		else if (regs_are_mcr(gt))
>>  			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
>>  		else
>>  			reg_val = xe_mmio_read32(&gt->mmio, XELP_LNCFCMOCS(i));
>> @@ -425,7 +439,9 @@ static void pvc_mocs_dump(struct xe_mocs_info *info, unsigned int flags, struct
>>  	drm_printf(p, "LNCFCMOCS[idx] = [ L3CC ] (value)\n\n");
>>  
>>  	for (i = 0, j = 0; i < (info->num_mocs_regs + 1) / 2; i++, j++) {
>> -		if (regs_are_mcr(gt))
>> +		if (regs_are_not_available(gt))
>> +			reg_val = get_combined_entry_l3cc(info, i);
>> +		else if (regs_are_mcr(gt))
>>  			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_LNCFCMOCS(i));
>>  		else
>>  			reg_val = xe_mmio_read32(&gt->mmio, XELP_LNCFCMOCS(i));
>> @@ -507,7 +523,9 @@ static void mtl_mocs_dump(struct xe_mocs_info *info, unsigned int flags,
>>  	drm_printf(p, "GLOB_MOCS[idx] = [IG_PAT, L4_CACHE_POLICY] (value)\n\n");
>>  
>>  	for (i = 0; i < info->num_mocs_regs; i++) {
>> -		if (regs_are_mcr(gt))
>> +		if (regs_are_not_available(gt))
>> +			reg_val = get_entry_control(info, i);
>> +		else if (regs_are_mcr(gt))
>>  			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
>>  		else
>>  			reg_val = xe_mmio_read32(&gt->mmio, XELP_GLOBAL_MOCS(i));
>> @@ -550,7 +568,9 @@ static void xe2_mocs_dump(struct xe_mocs_info *info, unsigned int flags,
>>  	drm_printf(p, "GLOB_MOCS[idx] = [IG_PAT, L3_CLOS, L3_CACHE_POLICY, L4_CACHE_POLICY] (value)\n\n");
>>  
>>  	for (i = 0; i < info->num_mocs_regs; i++) {
>> -		if (regs_are_mcr(gt))
>> +		if (regs_are_not_available(gt))
>> +			reg_val = get_entry_control(info, i);
>> +		else if (regs_are_mcr(gt))
>>  			reg_val = xe_gt_mcr_unicast_read_any(gt, XEHP_GLOBAL_MOCS(i));
>>  		else
>>  			reg_val = xe_mmio_read32(&gt->mmio, XELP_GLOBAL_MOCS(i));
>> @@ -713,6 +733,13 @@ static u32 l3cc_combine(u16 low, u16 high)
>>  	return low | (u32)high << 16;
>>  }
>>  
>> +static u32 get_combined_entry_l3cc(const struct xe_mocs_info *info,
>> +				   unsigned int index)
>> +{
>> +	return l3cc_combine(get_entry_l3cc(info, 2 * index),
>> +			    get_entry_l3cc(info, 2 * index + 1));
>> +}
>> +
>>  static void init_l3cc_table(struct xe_gt *gt,
>>  			    const struct xe_mocs_info *info)
>>  {
>> @@ -722,8 +749,7 @@ static void init_l3cc_table(struct xe_gt *gt,
>>  	mocs_dbg(gt, "l3cc entries: %d\n", info->num_mocs_regs);
>>  
>>  	for (i = 0; i < (info->num_mocs_regs + 1) / 2; i++) {
>> -		l3cc = l3cc_combine(get_entry_l3cc(info, 2 * i),
>> -				    get_entry_l3cc(info, 2 * i + 1));
>> +		l3cc = get_combined_entry_l3cc(info, i);
>>  
>>  		mocs_dbg(gt, "LNCFCMOCS[%d] 0x%x 0x%x\n", i,
>>  			 XELP_LNCFCMOCS(i).addr, l3cc);
>> -- 
>> 2.43.0
>>
> 

