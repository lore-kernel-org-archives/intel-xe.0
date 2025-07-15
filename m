Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB3BC83F17
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 18:32:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED6210E630;
	Tue, 15 Jul 2025 18:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JkN+D7A1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D30D10E630
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 18:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752604374; x=1784140374;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pAplRGed/+ddMftwttmtRdWHKxLDC/zeD9J3gAXtLVk=;
 b=JkN+D7A1cj6ugVcq3eLgtRgGj0lWzX8Zv7d5VWrLIvwGi0WKcKBfG9b8
 1Y1KT+IfG0KXMYgPQ/Omudh8lLSihkAm9Ceg6dusLPxdAyiC/hQ7Sb7NL
 iC2I473oqAXYwzvxK9/c8Tol/suhwioAH5VNZ0BVXtke2yzKBtAyHm8/c
 YPFDFduOQV5chIUoq4MNOoAkndIQUiNOK3AObbobNLnG0A/3qp48GWw/Z
 u+Tk6L/obvTSNmXrtTmVM72Qr41zP1kpXQFRuNvmCgghslk8itlemsU21
 PeNxFCaXGJJpPYPuPi/7qz9WY55Na6dHNOLzOJ2ndYpW3ujUoDDWcSo5h A==;
X-CSE-ConnectionGUID: 6YMrBiTrTMqy++vu+1k6LA==
X-CSE-MsgGUID: ik2mJ4P4RJavD1Sq87I9fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54813355"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="54813355"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 11:32:53 -0700
X-CSE-ConnectionGUID: 3gIkTCqoQ5yw6YgVBNxp2g==
X-CSE-MsgGUID: CZMC5WdARyeFapoWDyQtMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="157099811"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa009.jf.intel.com with ESMTP; 15 Jul 2025 11:32:51 -0700
Received: from [10.245.253.198] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.253.198])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 894F532EDB;
 Tue, 15 Jul 2025 19:32:49 +0100 (IST)
Message-ID: <357a4f2a-574a-4433-b893-a2f52089c8ef@intel.com>
Date: Tue, 15 Jul 2025 20:32:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/xe: Enable SR-IOV for ADL/ATSM
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
References: <20250715181419.807-1-michal.wajdeczko@intel.com>
 <20250715181419.807-5-michal.wajdeczko@intel.com>
 <CH0PR11MB5444C731316EA811DE6ADA58E557A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <CH0PR11MB5444C731316EA811DE6ADA58E557A@CH0PR11MB5444.namprd11.prod.outlook.com>
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



On 15.07.2025 20:24, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com> 
> Sent: Tuesday, July 15, 2025 11:14 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>; Thomas Hellstrom <thomas.hellstrom@linux.intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>; Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>
> Subject: [PATCH 4/4] drm/xe: Enable SR-IOV for ADL/ATSM
>>
>> We should now have sufficient changes in the Xe driver changes to
>> run it on ADL and ATSM platforms in the PF mode, to configure VFs
>> and successfully probe driver on the enabled VF devices.
>>
>> While some more changes are likely still needed to fix all corner
>> cases, we will not find them without running any tests. To start
>> testing this feature by the CI, we need to mark which platforms
>> have basic SR-IOV support and let the driver run in the PF mode.
>>
>> Since this feature support is still in the early testing stage,
>> make all enabling available only for CONFIG_DRM_XE_DEBUG=y and
>> keep it on CI topic branch.
>>
>> Note that from this point, on selected platforms, the Xe driver
>> will be acting as a PF driver, will some SR-IOV specific changes
>> compared to running in the non-virtualized (native) mode.
>>
>> However, those specific changes are visible mostly on the debugfs,
>> and should not impact normal driver execution, unless VFs will be
>> manually provisioned or explicitly enabled.
>>
>> Once we finish adding the remaining SR-IOV tests to the CI and fix
>> any issues that we find in the meantime, we will replace this patch
>> with proper series outside the topic branch.
> 
> We're reapplying this patch with the purpose of removing it from the
> CI topic branch and putting it in its "proper" place, yes?  If so, then we

no, this patch stays in for-CI topic branch, it was just rebased on top
of patch 2/4 that will go first to drm-xe-next

> should probably remove this sentence, as the replacement mentioned
> in it is being done presently.
> 
> My RB otherwise stands.
> 
> -Jonathan Cavitt
> 
>>
>> Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> Acked-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
>> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> Link: https://patchwork.freedesktop.org/patch/msgid/20240711192320.1198-3-michal.wajdeczko@intel.com
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>> [michal] rebased, for drm-xe/topic/xe-for-CI
>> ---
>>  drivers/gpu/drm/xe/xe_pci.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 53d45779cbe9..dc4c8e861a84 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -193,6 +193,7 @@ static const struct xe_device_desc adl_s_desc = {
>>  	.dma_mask_size = 39,
>>  	.has_display = true,
>>  	.has_llc = true,
>> +	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
>>  	.max_gt_per_tile = 1,
>>  	.require_force_probe = true,
>>  	.subplatforms = (const struct xe_subplatform_desc[]) {
>> @@ -210,6 +211,7 @@ static const struct xe_device_desc adl_p_desc = {
>>  	.dma_mask_size = 39,
>>  	.has_display = true,
>>  	.has_llc = true,
>> +	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
>>  	.max_gt_per_tile = 1,
>>  	.require_force_probe = true,
>>  	.subplatforms = (const struct xe_subplatform_desc[]) {
>> @@ -225,6 +227,7 @@ static const struct xe_device_desc adl_n_desc = {
>>  	.dma_mask_size = 39,
>>  	.has_display = true,
>>  	.has_llc = true,
>> +	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
>>  	.max_gt_per_tile = 1,
>>  	.require_force_probe = true,
>>  };
>> @@ -270,6 +273,7 @@ static const struct xe_device_desc ats_m_desc = {
>>  
>>  	DG2_FEATURES,
>>  	.has_display = false,
>> +	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
>>  };
>>  
>>  static const struct xe_device_desc dg2_desc = {
>> -- 
>> 2.47.1
>>
>>

