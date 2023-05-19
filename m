Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F009C7EE26
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 18:24:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3723510E095;
	Fri, 19 May 2023 18:24:08 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165E510E095
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 18:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684520645; x=1716056645;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lYHlJBVLUUHyy44Xf0Es36ZHZoz8uMLqW0UK4wWgpwk=;
 b=A+rWvPRLQhtr8SMwPm/df/VWbN4Bi6RRep70MeUXkUfnpKL++Wt5VuW5
 XcLGaKfdHK69HXSa5xPqbObfH+XgZ0FKFPoSN2Auom3VgSHozd1MOTgJj
 9A3nhvnOfVRtOgbphkcNtvKfwmQn9femr620M2xbPY4v3u57b7KhG3InI
 9Jel7O/1XjnbW/onQn9wHytmNRInJGNyfdDPSFoC1PxhAsDm4NTasJDOq
 AxPfrYnOpDUuxpl73ZALGbyH4w8bjgq7WGmQ4+yApN1s3RDRBxa92jG4l
 QPVUW62NirP8/kajE2LPLnvqwj7Vv6/TazIGAxaSaFzu4tMLsytiwkDD+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="354801809"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="354801809"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 11:24:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="1032689114"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="1032689114"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmsmga005.fm.intel.com with ESMTP; 19 May 2023 11:24:03 -0700
Received: from [10.249.143.198] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.143.198])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 19DF91242D;
 Fri, 19 May 2023 19:24:02 +0100 (IST)
Message-ID: <d6ed2a33-0251-44f2-bf8f-9794694ae272@intel.com>
Date: Fri, 19 May 2023 20:24:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20230519165927.1204-1-michal.wajdeczko@intel.com>
 <20230519172803.GF10045@mdroper-desk1.amr.corp.intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20230519172803.GF10045@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Reorder GuC interrupt register
 definition
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 19.05.2023 19:28, Matt Roper wrote:
> On Fri, May 19, 2023 at 06:59:26PM +0200, Michal Wajdeczko wrote:
>> We aim to have all definitions sorted by register address.
> 
> It seems like there's a lot of things in this header that still don't
> follow the convention we're trying to standardize on:
>  - A bunch of other registers near the top are still mis-sorted.
>  - Some registers are using uppercase hex for the register offsets
>    rather than the more widely-used lowercase hex.
>  - The definition values are indented different amounts.  I think when
>    we started cleaning up these register headers we picked column 49
>    (via tabs) as the usual starting point for the values.
>  - There's a 'struct guc_doorbell_info' and GUC_NUM_DOORBELLS that don't
>    seem to be used anywhere in the driver (and probably wouldn't belong
>    in a register header anyway).
> 
> Rather than just moving this one register, should we do all of those
> updates?

Well, I prefer small steps, and since this is side work, I didn't want
to spend too much time on possibly endless cleanups all over the place.

But I do agree that we should cleanup all above points, maybe as
separate patch/series, maybe even by another volunteer ?

Michal

> 
> 
> Matt
> 
>>
>> Bspec: 49813
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_guc_regs.h | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> index b4f27cadb68f..f08966c2be20 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> @@ -89,7 +89,6 @@
>>  
>>  #define GUC_SEND_INTERRUPT			XE_REG(0xc4c8)
>>  #define   GUC_SEND_TRIGGER			REG_BIT(0)
>> -#define GUC_HOST_INTERRUPT			XE_REG(0x1901f0)
>>  
>>  #define GUC_NUM_DOORBELLS			256
>>  
>> @@ -116,6 +115,8 @@ struct guc_doorbell_info {
>>  #define GUC_WD_VECS_IER				XE_REG(0xC558)
>>  #define GUC_PM_P24C_IER				XE_REG(0xC55C)
>>  
>> +#define GUC_HOST_INTERRUPT			XE_REG(0x1901f0)
>> +
>>  #define VF_SW_FLAG(n)				XE_REG(0x190240 + (n) * 4)
>>  #define VF_SW_FLAG_COUNT			4
>>  
>> -- 
>> 2.25.1
>>
> 
