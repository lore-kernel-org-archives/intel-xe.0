Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3819C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 20:22:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3CC310E02F;
	Fri, 28 Jun 2024 20:22:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LTsyIWdw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E18B10E02F
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 20:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719606132; x=1751142132;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ITGIhfCj0V4lYI7ZQqUJdLsJbfKoAwe91WiDLTxPGsw=;
 b=LTsyIWdwGKP/mgEjwYhhVt+rHjKsNv+Yq7Yk0ojxxOw3AUmh30nxT6OO
 uH9rM1pd+kmBkUxnCd0N5KjDOpQrBaidWtVKiZVgZClO4o8BPhuLSqUfq
 G2HGWMA+pI7BpCjCz18TOqZSftzEQMCIsNFJ+oCsHX0Onoq4kWFXotU/Z
 OThI9m8ja6Ss5pgU8Qg6A+EZIa2IsINLMKyEgEDc1fORzZTcHtOXXycWR
 vZfAsJNrWpeUI0usfwf9taiLbqyrXaWRCMJMvdIWBaXJPzwsaxtVW0mK3
 Ryyu+MbToik7HKtdATYBAC9cZD6jaMk/1ZcC+DMlOYzFNcqW3bHn9ie5D w==;
X-CSE-ConnectionGUID: oXcsaRpFSuWG4AdMLUv6kQ==
X-CSE-MsgGUID: wvYs163yRM+NSpMCYExXlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="34341497"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="34341497"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 13:22:11 -0700
X-CSE-ConnectionGUID: 3fWhlqCyR1+ScVnYBfappA==
X-CSE-MsgGUID: 4pIGgpx/ToSpRgR+VhsHfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="49737490"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa003.jf.intel.com with ESMTP; 28 Jun 2024 13:22:10 -0700
Received: from [10.245.96.165] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.96.165])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 1F73228792;
 Fri, 28 Jun 2024 21:22:08 +0100 (IST)
Message-ID: <61ccf2a7-290e-4eec-86eb-bada852e1e6d@intel.com>
Date: Fri, 28 Jun 2024 22:22:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [CI] HAX: Try SR-IOV on ADLP/ATSM
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240624120203.1169-1-michal.wajdeczko@intel.com>
 <Zn8GQZo5Qh8oHvIn@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <Zn8GQZo5Qh8oHvIn@intel.com>
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



On 28.06.2024 20:51, Rodrigo Vivi wrote:
> On Mon, Jun 24, 2024 at 02:02:03PM +0200, Michal Wajdeczko wrote:
>> This is for CI only. DO NOT REVIEW. DO NOT MERGE.
> 
> how are these tests looking like at this moment?

IMO quite good

recent run [1] just uncovered two existing issues that actually are not
related to the Xe SR-IOV code:

first problem [2]:

Starting dynamic subtest: vf-2
(sriov_basic:1395) igt_device-WARNING: Couldn't find PCI device
0000:00:02:02

was due to a test bug, attempt to fix that is under review [3]


second problem [4]:

<7> [259.552619] BUG: MAX_LOCKDEP_KEYS too low!
<7> [259.552626] turning off the locking correctness validator.

was reproduced on driver running in non-SRIOV mode (native), not sure
whether public bug was created for it, though


[1]
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/index.html?testfilter=iov

[2]
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@sriov_basic@bind-unbind-vf.html

[3] https://patchwork.freedesktop.org/series/135476/

[4]
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-1/igt@sriov_basic@enable-vfs-autoprobe-on.html#dmesg-warnings1677


> I'm wondering if it is already time to add this patch to topic/xe-for-CI

it would be great, as this patch allows running few basic SR-IOV tests
(including VF driver probe) on the existing BAT/FULL CI runs, so with
minimal effort we will be able to catch regressions/breaks that impacts
the VF driver.

note that being a PF driver by default shouldn't impact any existing
results or functionality, as any resources needed for VFs are reserved
only when VFs are enable during the SR-IOV tests.

additional resources used by the PF until VF are enabled are negligible

> 
> Thomas? Lucas? thoughts?
> 
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_module.c | 1 +
>>  drivers/gpu/drm/xe/xe_pci.c    | 2 ++
>>  2 files changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>> index 893858a2eea0..c0cf3b8ad815 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -18,6 +18,7 @@ struct xe_modparam xe_modparam = {
>>  	.enable_display = true,
>>  	.guc_log_level = 5,
>>  	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
>> +	.max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
>>  	.wedged_mode = 1,
>>  	/* the rest are 0 by default */
>>  };
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index ebff5ea79b1d..488a444b7b5c 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -261,6 +261,7 @@ static const struct xe_device_desc adl_p_desc = {
>>  		{ XE_SUBPLATFORM_ALDERLAKE_P_RPLU, "RPLU", adlp_rplu_ids },
>>  		{},
>>  	},
>> +	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
>>  };
>>  
>>  static const struct xe_device_desc adl_n_desc = {
>> @@ -307,6 +308,7 @@ static const struct xe_device_desc ats_m_desc = {
>>  
>>  	DG2_FEATURES,
>>  	.has_display = false,
>> +	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
>>  };
>>  
>>  static const struct xe_device_desc dg2_desc = {
>> -- 
>> 2.43.0
>>
