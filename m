Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB79C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 12:07:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A4F113ABE;
	Wed, 24 Apr 2024 12:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J4E72SK4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54FCF113ABE
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 12:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713960420; x=1745496420;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dhf/1iXF2J2J9L/0zT+yxHLI5BJPtR3Zc7ycPOCJ76A=;
 b=J4E72SK4L9njRsH9LUesRS6sC4BCECD4Npv9GnLl+K1MH174hhArtO8L
 LXcae2XSlxM02Fi2ndnVY8Ot1GFcNBo93a1D543dVXvNRgCnLWHolYDbQ
 wFzeK5SQk1U/YwaLo3FHhXllvG1drtc2iPu5xyJP155SM4cjpbuS0qBms
 P6j7zGisPo9WBqY+1akfMiUzozvjmlsUbFVEeeLSXBXtiLp19RuaBg6oq
 EJwryBcsEVvfRmGxdNH/B6XUGoFegoXzPly5ZcNdWOxyoFf9QH4eNZJBK
 syHj8GvyhLGi8pTF2eCaH56Smehs426Is90YlJhZvRdoL2bNCJ3tGcvPW Q==;
X-CSE-ConnectionGUID: QyeVkOcnTq2lxMIAQR/D6w==
X-CSE-MsgGUID: nlrfHWfZSo+MUYjKC5qsAw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="27100924"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="27100924"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 05:07:00 -0700
X-CSE-ConnectionGUID: AtJNeDXYRNWo5EJttOAGVg==
X-CSE-MsgGUID: mDOUku9tRaChNMT5AY3oAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="25140768"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa006.jf.intel.com with ESMTP; 24 Apr 2024 05:06:58 -0700
Received: from [10.252.46.168] (unknown [10.252.46.168])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 59DEC28787;
 Wed, 24 Apr 2024 13:06:57 +0100 (IST)
Message-ID: <0ad6fe00-b327-421e-afa8-e1fcd46d5a7b@intel.com>
Date: Wed, 24 Apr 2024 14:06:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/guc: Update VF configuration KLVs definitions
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240419123543.270-1-michal.wajdeczko@intel.com>
 <20240419123543.270-2-michal.wajdeczko@intel.com>
 <20240422121423.cq325sg5c4u6mwj7@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240422121423.cq325sg5c4u6mwj7@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 22.04.2024 14:14, Piotr Piórkowski wrote:
> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2024-kwi-19 14:35:42 +0200]:
>> GuC firmware specification says that maximum value for the execution
>> quantum KLV is 100s and anything exceeding that will be clamped.
>> The same limitation applies to the preemption timeout KLV.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 14 ++++++++++++--
>>  1 file changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> index 511cf974d585..e53ffaee2fcd 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> @@ -201,7 +201,11 @@ enum  {
>>   *      it to take effect. Such cases might typically happen on a 1PF+1VF
>>   *      Virtualization config enabled for heavier workloads like AI/ML.
>>   *
>> + *      The max value for this KLV is 100 seconds, anything exceeding that
>> + *      will be clamped to the max.
>> + *
>>   *      :0: infinite exec quantum (default)
>> + *      :100000: maximum exec quantum (100000ms == 100s)
>>   *
>>   * _`GUC_KLV_VF_CFG_PREEMPT_TIMEOUT` : 0x8A02
>>   *      This config sets the VF-preemption-timeout in microseconds.
>> @@ -219,7 +223,11 @@ enum  {
>>   *      on a 1PF+1VF Virtualization config enabled for heavier workloads like
>>   *      AI/ML.
>>   *
>> + *      The max value for this KLV is 100 seconds, anything exceeding that
>> + *      will be clamped to the max.
>> + *
>>   *      :0: no preemption timeout (default)
>> + *      :100000000: maximum preemption timeout (100000000us == 100s)
>>   *
>>   * _`GUC_KLV_VF_CFG_THRESHOLD_CAT_ERR` : 0x8A03
>>   *      This config sets threshold for CAT errors caused by the VF.
>> @@ -291,9 +299,11 @@ enum  {
>>  
>>  #define GUC_KLV_VF_CFG_EXEC_QUANTUM_KEY		0x8a01
>>  #define GUC_KLV_VF_CFG_EXEC_QUANTUM_LEN		1u
>> +#define GUC_KLV_VF_CFG_EXEC_QUANTUM_MAX_VALUE	100000u
>>  
>> -#define GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_KEY	0x8a02
>> -#define GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_LEN	1u
>> +#define GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_KEY		0x8a02
>> +#define GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_LEN		1u
>> +#define GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_MAX_VALUE	100000000u
>>  
>>  #define GUC_KLV_VF_CFG_THRESHOLD_CAT_ERR_KEY		0x8a03
>>  #define GUC_KLV_VF_CFG_THRESHOLD_CAT_ERR_LEN		1u
> 
> 
> Your code is ok:
> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> But since you are already updating the doc for these values, wouldn't you like to maybe correct
> a typo in the doc ? If you don't correct it, it will probably stay there forever.... :
> 
> (...)
>  * _`GUC_KLV_VF_CFG_EXEC_QUANTUM` : 0x8A01
> (...)
>  *      That said, when the PF is changing this value from 0xFFFFFFFF to
>  *      something else, it might never take effect if the VF is running an
>  *      inifinitely long compute or shader kernel. In such a scenario, the
>  *      PF would need to trigger a VM PAUSE and then change the KLV to force
>  *      it to take effect. Such cases might typically happen on a 1PF+1VF
>  *      Virtualization config enabled for heavier workloads like AI/ML.
> 
>  Typo: inifinitely, should be infinitely

thanks for spotting this, but IMO better to fix in a separate patch

> 
> Tha same for GUC_KLV_VF_CFG_PREEMPT_TIMEOUT
> 
> Thanks,
> Piotr
>> -- 
>> 2.43.0
>>
> 
