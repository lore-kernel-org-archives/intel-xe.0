Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7ACFC07E97
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 16:35:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A677710E09E;
	Tue, 28 Nov 2023 16:35:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1AC10E09E
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 16:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701189318; x=1732725318;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ZDheQCu6K6AKHCAXJ2iYuRxcxMk68Us02ROU/VTtak4=;
 b=FfqbvBC8e2xotA0nBwRk8QFa3SVNXp2LnXXS07U8QGQNuEeZPS50C8xk
 0M4cTuOk1o7mf0ClUn8K2glaUDpZydQ6sZJV+n6DLEO/KZPtcCWd4FA0w
 llQdwL1wuxxf7n2NKrVWSDzXOWWez1ikXYge3l0F/7C/reePoR4OuuyIi
 K8x4kYZFoTtglkwNbh9uZHJsjwLWVRpGze7OwCYDPt8sDteHp+Gk0lKJW
 a6cyVbDDmaL1SskyGD01zNBN1PjtVuwZwpSuTeOeVLJ6lHfGQ+cX2+Td7
 Kuu3J7pT4wwUwr1iBS7a+lOMpDmIp0B9Uz10XWzzP6akS8sE3VvZ5hEKC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="372331875"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="372331875"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 08:35:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="761990271"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="761990271"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga007.jf.intel.com with ESMTP; 28 Nov 2023 08:35:15 -0800
Received: from [10.249.140.124] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.140.124])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 3B0F134EE1;
 Tue, 28 Nov 2023 16:35:14 +0000 (GMT)
Message-ID: <6c1c328b-0b09-478c-8990-b7c65abcc137@intel.com>
Date: Tue, 28 Nov 2023 17:35:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
References: <20231128151333.4068550-1-tejas.upadhyay@intel.com>
 <20231128151333.4068550-2-tejas.upadhyay@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20231128151333.4068550-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH V3 1/3] drm/xe: Track if platform has csc uid
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



On 28.11.2023 16:13, Tejas Upadhyay wrote:
> Some platforms, like ATS-M has CSC firmware calculated unique

what is "CSC firmware" ? maybe just:

"On some platforms, like ATS-M, we can expose firmware calculated Unique
Identifier (UID) of the device."

> device id. This flag will help to identify if platform has it.
> 
> V2:
>   - Rebase to resolve pre-merge conflict
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 2 ++
>  drivers/gpu/drm/xe/xe_pci.c          | 3 +++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 2712905c7a91..268a40639ec5 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -264,6 +264,8 @@ struct xe_device {
>  		u8 supports_mmio_ext:1;
>  		/** @has_heci_gscfi: device has heci gscfi */
>  		u8 has_heci_gscfi:1;
> +		/** @has_csc_uid: device has CSC FW calculated uid, used for generating uuid */

if we don't know/care about CSC FW then maybe just ".has_uid" ?

> +		u8 has_csc_uid:1;

keep ordered by name

>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>  		struct {
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index cb762c11dd0f..cf4f7de5b04e 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -61,6 +61,7 @@ struct xe_device_desc {
>  	u8 has_heci_gscfi:1;
>  
>  	u8 has_llc:1;
> +	u8 has_csc_uid:1;

ditto

>  	u8 has_sriov:1;
>  	u8 bypass_mtcfg:1;
>  	u8 supports_mmio_ext:1;
> @@ -300,6 +301,7 @@ static const struct xe_device_desc ats_m_desc = {
>  
>  	DG2_FEATURES,
>  	.has_display = false,
> +	.has_csc_uid = true,
>  };
>  
>  static const struct xe_device_desc dg2_desc = {
> @@ -579,6 +581,7 @@ static int xe_info_init(struct xe_device *xe,
>  	xe->info.graphics_name = graphics_desc->name;
>  	xe->info.media_name = media_desc ? media_desc->name : "none";
>  	xe->info.has_llc = desc->has_llc;
> +	xe->info.has_csc_uid = desc->has_csc_uid;

ditto

>  	xe->info.has_sriov = desc->has_sriov;
>  	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
>  	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
