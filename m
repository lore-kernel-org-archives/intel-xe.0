Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1BAC48260
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 18:41:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A3B10E184;
	Tue, 13 Feb 2024 18:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xrf8mqyi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44DE10E0F7
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 18:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707849708; x=1739385708;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YHbdh0WyTKfaIbcxNznkZvwZtViem+AkTt4IdAjZ8rs=;
 b=Xrf8mqyiGaWAS9MnkUXMcJIhbewnt2ovXdPOxU3kpHOV9gUFgnY+ah7C
 DurWOLkN73uPnvyQ1Oa6UoatSqMDcc8alv8AY+Ro8ela06SX66Za3q+CI
 C+KqF68SBUOAHztoLc8ArmWDVpOgeuh8kObB3VH6t73Ge1JtRIuvpqoLI
 28oPqN0FG3IbRW1DL5qe8urTnNyX8YT6eEQiemTuPiKbxXJNfNZG802ek
 40LG/vpuyH4HH1q2XnzFxEXtlWceASSoMvCIU1iMIHPO0C9wYnoItRWuz
 yFpZ6OY9D9HSSjjInJxC6HnlcLci95EC1odXkKi3v/R9lys710YwQew3Y Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="13269206"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; d="scan'208";a="13269206"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 10:41:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="3260891"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa006.fm.intel.com with ESMTP; 13 Feb 2024 10:41:45 -0800
Received: from [10.249.153.144] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.153.144])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 7E3F612424;
 Tue, 13 Feb 2024 18:41:43 +0000 (GMT)
Message-ID: <5178425f-c9fc-4675-bc06-5b63b8d9ac5a@intel.com>
Date: Tue, 13 Feb 2024 19:41:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] drm/xe: Mark VF accessible GT registers
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240116145617.1177-1-michal.wajdeczko@intel.com>
 <20240116145617.1177-6-michal.wajdeczko@intel.com>
 <20240117234136.GN45138@mdroper-desk1.amr.corp.intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240117234136.GN45138@mdroper-desk1.amr.corp.intel.com>
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



On 18.01.2024 00:41, Matt Roper wrote:
> On Tue, Jan 16, 2024 at 03:56:16PM +0100, Michal Wajdeczko wrote:
>> Only selected registers are available for Virtual Functions.
> 
> Are these registers still accessible from the VF on platforms that have
> memory-based interrupts?  I thought these weren't directly accessible
> anymore?
> 
> If this is just to support the older pre-memirq platforms, then we may
> want to make that more clear with code comments or something.  Maybe
> even moving these to a separate register with some dedicated kerneldoc.

I'm not sure if moving to separate register will help us as then we
would need to duplicate some code to use them, while for pre-memirq
platforms we want to reuse existing irq code as much as possible, while
memirq platforms don't even try to access those registers.

So I would go with option to add some comment only.

> Having these in xe_gt_regs.h might not have been the best idea since
> even though they relate to GT concepts, the registers themselves are in
> the sgunit, so the current placement is confusing.

What would be the best place for those register definitions?
Do you plan to move it anytime soon?
Should I wait for this cleanup?

Thanks,
Michal

> 
> 
> Matt
> 
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 46 ++++++++++++++--------------
>>  1 file changed, 23 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 4017319c6300..500d96392e8a 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -433,7 +433,7 @@
>>  #define GT_PERF_STATUS				XE_REG(0x1381b4)
>>  #define   VOLTAGE_MASK				REG_GENMASK(10, 0)
>>  
>> -#define GT_INTR_DW(x)				XE_REG(0x190018 + ((x) * 4))
>> +#define GT_INTR_DW(x)				XE_REG(0x190018 + ((x) * 4), XE_REG_OPTION_VF)
>>  #define   INTR_GSC				REG_BIT(31)
>>  #define   INTR_GUC				REG_BIT(25)
>>  #define   INTR_MGUC				REG_BIT(24)
>> @@ -444,16 +444,16 @@
>>  #define   INTR_VECS(x)				REG_BIT(31 - (x))
>>  #define   INTR_VCS(x)				REG_BIT(x)
>>  
>> -#define RENDER_COPY_INTR_ENABLE			XE_REG(0x190030)
>> -#define VCS_VECS_INTR_ENABLE			XE_REG(0x190034)
>> -#define GUC_SG_INTR_ENABLE			XE_REG(0x190038)
>> +#define RENDER_COPY_INTR_ENABLE			XE_REG(0x190030, XE_REG_OPTION_VF)
>> +#define VCS_VECS_INTR_ENABLE			XE_REG(0x190034, XE_REG_OPTION_VF)
>> +#define GUC_SG_INTR_ENABLE			XE_REG(0x190038, XE_REG_OPTION_VF)
>>  #define   ENGINE1_MASK				REG_GENMASK(31, 16)
>>  #define   ENGINE0_MASK				REG_GENMASK(15, 0)
>> -#define GPM_WGBOXPERF_INTR_ENABLE		XE_REG(0x19003c)
>> -#define GUNIT_GSC_INTR_ENABLE			XE_REG(0x190044)
>> -#define CCS_RSVD_INTR_ENABLE			XE_REG(0x190048)
>> +#define GPM_WGBOXPERF_INTR_ENABLE		XE_REG(0x19003c, XE_REG_OPTION_VF)
>> +#define GUNIT_GSC_INTR_ENABLE			XE_REG(0x190044, XE_REG_OPTION_VF)
>> +#define CCS_RSVD_INTR_ENABLE			XE_REG(0x190048, XE_REG_OPTION_VF)
>>  
>> -#define INTR_IDENTITY_REG(x)			XE_REG(0x190060 + ((x) * 4))
>> +#define INTR_IDENTITY_REG(x)			XE_REG(0x190060 + ((x) * 4), XE_REG_OPTION_VF)
>>  #define   INTR_DATA_VALID			REG_BIT(31)
>>  #define   INTR_ENGINE_INSTANCE(x)		REG_FIELD_GET(GENMASK(25, 20), x)
>>  #define   INTR_ENGINE_CLASS(x)			REG_FIELD_GET(GENMASK(18, 16), x)
>> @@ -461,21 +461,21 @@
>>  #define   OTHER_GUC_INSTANCE			0
>>  #define   OTHER_GSC_INSTANCE			6
>>  
>> -#define IIR_REG_SELECTOR(x)			XE_REG(0x190070 + ((x) * 4))
>> -#define RCS0_RSVD_INTR_MASK			XE_REG(0x190090)
>> -#define BCS_RSVD_INTR_MASK			XE_REG(0x1900a0)
>> -#define VCS0_VCS1_INTR_MASK			XE_REG(0x1900a8)
>> -#define VCS2_VCS3_INTR_MASK			XE_REG(0x1900ac)
>> -#define VECS0_VECS1_INTR_MASK			XE_REG(0x1900d0)
>> -#define GUC_SG_INTR_MASK			XE_REG(0x1900e8)
>> -#define GPM_WGBOXPERF_INTR_MASK			XE_REG(0x1900ec)
>> -#define GUNIT_GSC_INTR_MASK			XE_REG(0x1900f4)
>> -#define CCS0_CCS1_INTR_MASK			XE_REG(0x190100)
>> -#define CCS2_CCS3_INTR_MASK			XE_REG(0x190104)
>> -#define XEHPC_BCS1_BCS2_INTR_MASK		XE_REG(0x190110)
>> -#define XEHPC_BCS3_BCS4_INTR_MASK		XE_REG(0x190114)
>> -#define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
>> -#define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
>> +#define IIR_REG_SELECTOR(x)			XE_REG(0x190070 + ((x) * 4), XE_REG_OPTION_VF)
>> +#define RCS0_RSVD_INTR_MASK			XE_REG(0x190090, XE_REG_OPTION_VF)
>> +#define BCS_RSVD_INTR_MASK			XE_REG(0x1900a0, XE_REG_OPTION_VF)
>> +#define VCS0_VCS1_INTR_MASK			XE_REG(0x1900a8, XE_REG_OPTION_VF)
>> +#define VCS2_VCS3_INTR_MASK			XE_REG(0x1900ac, XE_REG_OPTION_VF)
>> +#define VECS0_VECS1_INTR_MASK			XE_REG(0x1900d0, XE_REG_OPTION_VF)
>> +#define GUC_SG_INTR_MASK			XE_REG(0x1900e8, XE_REG_OPTION_VF)
>> +#define GPM_WGBOXPERF_INTR_MASK			XE_REG(0x1900ec, XE_REG_OPTION_VF)
>> +#define GUNIT_GSC_INTR_MASK			XE_REG(0x1900f4, XE_REG_OPTION_VF)
>> +#define CCS0_CCS1_INTR_MASK			XE_REG(0x190100, XE_REG_OPTION_VF)
>> +#define CCS2_CCS3_INTR_MASK			XE_REG(0x190104, XE_REG_OPTION_VF)
>> +#define XEHPC_BCS1_BCS2_INTR_MASK		XE_REG(0x190110, XE_REG_OPTION_VF)
>> +#define XEHPC_BCS3_BCS4_INTR_MASK		XE_REG(0x190114, XE_REG_OPTION_VF)
>> +#define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118, XE_REG_OPTION_VF)
>> +#define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c, XE_REG_OPTION_VF)
>>  #define   GT_WAIT_SEMAPHORE_INTERRUPT		REG_BIT(11)
>>  #define   GT_CONTEXT_SWITCH_INTERRUPT		REG_BIT(8)
>>  #define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	REG_BIT(4)
>> -- 
>> 2.25.1
>>
> 
