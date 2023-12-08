Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8DDC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 05:59:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7892710E9CC;
	Fri,  8 Dec 2023 05:59:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C16B210E9CD
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 05:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702015150; x=1733551150;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1SJmqc/puUOicYMasYpuPAOCB1uj6rpgAQ429fHOXCE=;
 b=QJNMAExvN2sVFe+agwyhVOLYvwi1CkO0Gx54TzJkS6rQP6fBWRQYGL7m
 I7dg/ddez6iXrNprJXNPFr1Wt+IQRwgEUxcE1Nf7F3xyDQny03ARahlXR
 x0ylH8bIlQlqXXRxRAhNQW26zu5yH5oPns9RE1GaCN6b8loqjm4iu1oUr
 2Xn75ACKFqJZSAz7VNl8HNVc/1mFA1qOreWxzlAQCEG3k5sY3dUQ/xDOH
 3Wx1PcBcQhMw6tDE3FYKO9jeI7do5XxrIFr2LOgZNcL+4LUHp64gs410H
 GwbvV9IKPYicS2ktmiSJYo0Mn4wyA1UMs0VlqKn+Mp/zQ6yPInEERxZdF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="7686160"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="7686160"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 21:59:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="915832766"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="915832766"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 21:59:09 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 21:59:08 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 21:59:08 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 21:59:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fnT72YSeV2skI0VbFFJoy3np29A7+aJVWi0PBYdcFNNqyzoDbz9RCWSR1Bfy2XGYXINn2+Hl0U5y9nwgib7ujXttjTJd5P8GfRGWitlVUwCg6gGwqgiA94q6ot9KwJRm4/HUn8PHmOFMdK3jBa6fHo66xDVsXhpKfykyUzv7QFe67baZPoW/I3ZM9lpbt4vUX+DDMjdLAU2jMmekZzXTLhQjmQPqtEfrmbcARJPxI4APM9NvI5jxhflSwa4KLCD2+tec3reB5DGz9cGbpL/PYccaPEifSje0fG+FvcLrD6d6ww8W4KDClAXryA7AhwGlPMbSDBnp1X3tmWtxOMB3Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FhZQDw+lDWdgJbhNaQJ30MqWkZTYiyGWeTj0FasUbo0=;
 b=eRAw6hTKziuLFqsApWYymtiafh0rpTevx7uON2stFJ7B3B9nX3DoLq3PHMmY+hFlEHiOQHdt+/Qt+KtvAsIjx+SpZ0XFgfiVLUZ3ptO3TFkRdAtf1U32lWXrtAd0HzXNSxDiXmKMBVLbgpaRpJacn9mhFYYQxFVj0ZXxxEy5xU34Vw7Kyd8xofb4mufF6RABTMZKwmBTohS+p+v6PLVmbe2c1AYJIFaVTyRjjcU0unxFd1qIcSwbWrICQNibnWDy55bz7j9Lx4B7PYNEuCm4tvUSi0IGIJ+EPS8yGODA1CeJczPraxjHOKwYMV/g/aRRPsbyZqBDMWHtX+pnEPMfOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ2PR11MB8449.namprd11.prod.outlook.com (2603:10b6:a03:56f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Fri, 8 Dec
 2023 05:59:00 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7068.028; Fri, 8 Dec 2023
 05:58:59 +0000
Message-ID: <4b0e993f-36f3-4bce-a65e-7043c90890e3@intel.com>
Date: Fri, 8 Dec 2023 11:28:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe: Add frequency throttle reasons sysfs
 attributes
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231208051153.664055-1-rodrigo.vivi@intel.com>
 <20231208051153.664055-3-rodrigo.vivi@intel.com>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20231208051153.664055-3-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ2PR11MB8449:EE_
X-MS-Office365-Filtering-Correlation-Id: c5580067-8b62-4ca0-2cd4-08dbf7b2c538
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bJ6sauXCkFzfVc3VtDSnI0MZTAVA77tBJHt9FkVAQzCIDkm8HzyBvTmryICwbPAN6urH/r2K+ZENRtYIavD5gOwH2Vb9KdF9Tkq9l+NMfKZM7CYWb43we2Xnx6AvHwz603QV7L57KddIb/rBNhy+9Y+DZWbmc+Zhv+fNxq+tDiR/UgoFHJZ1QAvYCqJVEiFyZ6QDmFBGrvkTfWFEbzVxHo1X8wYM/BmA+ImWYATDwav7uS/30wvlLXGzz2y3Iqd+VJ+wwLT7AVi7fp7hXMBoQcxarjIz2OdWKuI5yp5pLQ8ArM5x+1/CZlhF5ifR0pNabFjKdmosym/2u72BZO3QRmRBNwbXhRK1F9r8ranIoAeXcSnqCgZBjL9VDo/TKxNWR8EnTS0esuSCY90hSnwg5PGEjgsK6NE7O0+bPuPFCeMxWj0V2ozAjaMK0vxFJvUloEYZjokkOW90nTcsrI84pZu5yPpG2eOuwxloU2loQtBoJsmssGIqOmQb2de/B9wEthEKRgW0ybZrtnylZkTrvfNNtjU9LaKRZ7BVFJmtsSnEsGsocgcD+rpHsBMlCGyBmOPhCNKngZVA3hXC02yvvPgZOxXj+S/bVRYEPpj53ExVLKPoSibNwg9EpaZFZn6ruC8fJwvBKY+/9pSNGaVzBtKEkjzF2ieX9REKuZNnf2g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(346002)(376002)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(2616005)(8676002)(8936002)(5660300002)(107886003)(44832011)(4326008)(6512007)(6486002)(36756003)(6666004)(6506007)(478600001)(66476007)(316002)(53546011)(66556008)(66946007)(41300700001)(2906002)(30864003)(82960400001)(38100700002)(31696002)(86362001)(26005)(83380400001)(31686004)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2lkbU5XdWhxWHM3b2Zhai9BQWF6cVh6cWgxYUpMT29tdnN6ZUVVUW1nN05u?=
 =?utf-8?B?aTlpSXo2ZEZTVml5QkhCbm5leEl2b1JxemFJaUpwaHlkVDMyc0JCYlhvZUFV?=
 =?utf-8?B?cXN4UG1oZVVaK3l2VEYvRGp4a0xhcTVsNGpveW1KQVpYLyt1QVJhSVVsMkhG?=
 =?utf-8?B?dmFmOU9aaXhzeXNuS1hiZTcvaVh4NFRSTnkreW9yV21OdldnUHJ2eUdpTjdE?=
 =?utf-8?B?Zk43cStjZXllMXhUc1FBcmNHbGNvdWxaWVpQMEpTUU9RRjY5MlRDdWRLeDhh?=
 =?utf-8?B?ZjNvbU43Y2RGSm5Vd2VFYUYyc0JqNkhzck92VExEOTBRZFRkUG95eUx2amxr?=
 =?utf-8?B?ay9rS2UvT1B0VVdwVmkzVUV1aE9mUFRNTEhjWmZPblp2ODgvSGZkZXZ0c3Ez?=
 =?utf-8?B?V1piVE9HbHdsNjFWVTBRNU9McmlDcWh1dTloT001cVk0bXdIbkhXSXZNamZO?=
 =?utf-8?B?ZTUvS1J6MFVxSGFtUGZKV2hrNFBNZUtrenJ2R1IxN3k1Q2JubmEzalRsYk1w?=
 =?utf-8?B?NnczTkp6ZEhMS3JKVzQ1eW1UajhGeXRBaklyMjVPWkV2Q21VaHhxRzVpL21u?=
 =?utf-8?B?ZDhUSHN4T3FsUU1UWGpuRVg5ZVlFVXh6SzI5TXVxRWNtWmdva2dsTGVRNnNY?=
 =?utf-8?B?a2ZSaGNQUDY4WGpmblp0bUJwbVRYSklBY1htLzd1b1FXY2lRNG1MeE4vZDdM?=
 =?utf-8?B?d3M0Ui95b1EwU0pSckhtVnpMenNnancybTNIc2NEUGJWbm1kYy9tR3d3YWxr?=
 =?utf-8?B?dTI0cko2c0ZVdGYzd3cvbmd5TGhJeGpUUVZxYXI5MVk5cGhnemlicXFIaGgy?=
 =?utf-8?B?d1N1UmVPcjdDQllMU3dBVzladzBzMW9XaUhoZUs1Vkw0QVBMUUlRUkdoa1A5?=
 =?utf-8?B?SEQ0WThta1F0ejZUcFJuRlBZN1BGUGRCcTFVd0xwM2pmUCtqcXQyREFCaHZI?=
 =?utf-8?B?S3piSDV4RFNoekMrTUVJUC9FMHJnOTdEc05zRGdpTXdBN0ZUalNWNDFMRU1v?=
 =?utf-8?B?TGVWT2MzU3cwcll4OTU1dUR1SmduN3RkMlNqU3c1d0dxT282YVZvNVFENWc3?=
 =?utf-8?B?QXpUdHR6LzNIa0sycXhyaGJ4WXA5NDFuaTlCd09KV0VVUVF5bXcvOGJlb2Nj?=
 =?utf-8?B?UER0blBTUmlDb3JqVFVpSFFBOVQ0aE5SenlSRThCRUpQc1VscVZxRldoRjBO?=
 =?utf-8?B?dHM1R0tBaGNJbWludWRuTFZwdVVEdFdDcnJqSjIzVEVQSVhFREZNNE9mTzE0?=
 =?utf-8?B?dmVoYkFtMXFpK0lWL2ZHQzBvcFZpZFBRM1cybndJUHJpcUJxdC9OQU8yemRi?=
 =?utf-8?B?S3RrNGgrSkxtZUhWSHRsckQ4dklLTlRJVndUMW1oM09qUHloUnpVMzlkZVQ0?=
 =?utf-8?B?SWw0Nlg5dE5QUWlidVZQN28xeElkQmwwVWNzWFNxS0s1amVKS0xON2NFQkpB?=
 =?utf-8?B?WTVGUk9oQU8wbWtvUXNWZDdGTHd3TWMxMUxVdXBVSEF4TVhsUklQYnBEVFlp?=
 =?utf-8?B?VU02S0ljMnZMZGExN0JPTXoydUZHa1RrVTM3Mm9tajNoU0RaekpZTEFjZGJ1?=
 =?utf-8?B?eTFpMFBySkdhbUhlSElCTEY2OUg1ZWprczBuN2NKZXNjeTlucUY0UEhOVkxV?=
 =?utf-8?B?V2crNGVSMFZDN1JZbCtvcUNOQXdhVXNIK2piODFPNTZFSi9qSkZ1K211dFRR?=
 =?utf-8?B?Qk4xcTlxbG1vUGRsVWxXVnF2dDJMRVQwMXF3ejZRMGhBTTdKa083MytscVhR?=
 =?utf-8?B?d0haOTY4cUNXWlp1REhXWWg0cTFoWkVzaTFITzJnTjZzbzVRLzFNZTlHZjk2?=
 =?utf-8?B?Qy9rRE9aWVBWWXVkTmUxTHVYYUdGUXJIWWNrSFRFTUdUb2d3cGlBQUNYWGhY?=
 =?utf-8?B?RUdEb1UzUjltcEhycmJTTm5vM081NitGQnlva2MwTjc3VlQxbUovT2xYbWF2?=
 =?utf-8?B?WXdqNyt4aWlDREl6SWVhanlNSyt0UVRWVThmYXNvWUgrejVNdk5YVzRzak5M?=
 =?utf-8?B?WGpRdFF4Y0JPSW55VWVJa3poeDVWNDBxazM5bkRoZkUwdXpVKzRJdktlL0pF?=
 =?utf-8?B?Y0RJWXNEaGc4cWlVWVZNMTFnVDhRS2x0V216Zi9XRHlYVDVxMWsyeW90T1c5?=
 =?utf-8?Q?kpvUnBczva/8ZGqUVlyREoRBx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5580067-8b62-4ca0-2cd4-08dbf7b2c538
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 05:58:59.5051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rS7odiR9pnTQYeusRYzPAG+4w3Euc8TG8kkmuNJluWElR4XxUs6LuPao/gtBXDuAerugTyyf5DNlzL1vcQ1VRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8449
X-OriginatorOrg: intel.com
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Suja/Rodrigo

On 12/8/2023 10:41 AM, Rodrigo Vivi wrote:
> From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> 
> Add throttle reasons sysfs attributes under a separate directory.
> 
> /device/tile<n>/gt<n>/freq0/throttle
> 			|- reason_pl1
> 			|- reason_pl2
> 			|- reason_pl4
> 			|- reason_prochot
> 			|- reason_ratl
> 			|- reason_vr_tdc
> 			|- reason_vr_thermalert
> 			|- status
> 
> v2: Remove unnecessary headers and clean-up action (Riana)
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile               |   1 +
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  12 ++
>   drivers/gpu/drm/xe/xe_gt_freq.c           |   3 +
>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c | 251 ++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h |  16 ++
>   5 files changed, 283 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 232627e0946e..d35548e437f0 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -78,6 +78,7 @@ xe-y += xe_bb.o \
>   	xe_gt_mcr.o \
>   	xe_gt_pagefault.o \
>   	xe_gt_sysfs.o \
> +	xe_gt_throttle_sysfs.o \
>   	xe_gt_tlb_invalidation.o \
>   	xe_gt_topology.o \
>   	xe_guc.o \
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 9744ed0be3a5..5f5a72e9d0d8 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -478,4 +478,16 @@
>   #define PVC_GT0_PLATFORM_ENERGY_STATUS		XE_REG(0x28106c)
>   #define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
>   
> +#define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
> +#define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
> +#define   PROCHOT_MASK				REG_BIT(0)
> +#define   THERMAL_LIMIT_MASK			REG_BIT(1)
> +#define   RATL_MASK				REG_BIT(5)
> +#define   VR_THERMALERT_MASK			REG_BIT(6)
> +#define   VR_TDC_MASK				REG_BIT(7)
> +#define   POWER_LIMIT_4_MASK			REG_BIT(8)
> +#define   POWER_LIMIT_1_MASK			REG_BIT(10)
> +#define   POWER_LIMIT_2_MASK			REG_BIT(11)
> +#define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> index 2c3830d0e9e5..08eabcafe7bc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> @@ -13,6 +13,7 @@
>   
>   #include "xe_device_types.h"
>   #include "xe_gt_sysfs.h"
> +#include "xe_gt_throttle_sysfs.h"
>   #include "xe_guc_pc.h"
>   
>   /**
> @@ -213,4 +214,6 @@ void xe_gt_freq_init(struct xe_gt *gt)
>   	if (err)
>   		drm_warn(&xe->drm,  "failed to add freq attrs to %s, err: %d\n",
>   			 kobject_name(gt->freq), err);
> +
> +	xe_gt_throttle_sysfs_init(gt);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> new file mode 100644
> index 000000000000..63d640591a52
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> @@ -0,0 +1,251 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +
> +#include <regs/xe_gt_regs.h>
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_sysfs.h"
> +#include "xe_gt_throttle_sysfs.h"
> +#include "xe_mmio.h"
> +
> +/**
> + * DOC: Xe GT Throttle
> + *
> + * Provides sysfs entries for frequency throttle reasons in GT
> + *
> + * device/gt#/freq0/throttle/status - Overall status
> + * device/gt#/freq0/throttle/reason_pl1 - Frequency throttle due to PL1
> + * device/gt#/freq0/throttle/reason_pl2 - Frequency throttle due to PL2
> + * device/gt#/freq0/throttle/reason_pl4 - Frequency throttle due to PL4, Iccmax etc.
> + * device/gt#/freq0/throttle/reason_thermal - Frequency throttle due to thermal
> + * device/gt#/freq0/throttle/reason_prochot - Frequency throttle due to prochot
> + * device/gt#/freq0/throttle/reason_ratl - Frequency throttle due to RATL
> + * device/gt#/freq0/throttle/reason_vr_thermalert - Frequency throttle due to VR THERMALERT
> + * device/gt#/freq0/throttle/reason_vr_tdc -  Frequency throttle due to VR TDC
missed the tile#
> + */
> +
> +static struct xe_gt *
> +dev_to_gt(struct device *dev)
> +{
> +	return kobj_to_gt(dev->kobj.parent);
> +}
> +
> +static u32 read_perf_limit_reasons(struct xe_gt *gt)
> +{
> +	u32 reg;
> +
> +	if (xe_gt_is_media_type(gt))
> +		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
> +	else
> +		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
> +
> +	return reg;
> +}
> +
> +static u32 read_status(struct xe_gt *gt)
> +{
> +	u32 status = read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
> +
> +	return status;
> +}
> +
> +static u32 read_reason_pl1(struct xe_gt *gt)
> +{
> +	u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
> +
> +	return pl1;
> +}
> +
> +static u32 read_reason_pl2(struct xe_gt *gt)
> +{
> +	u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
> +
> +	return pl2;
> +}
> +
> +static u32 read_reason_pl4(struct xe_gt *gt)
> +{
> +	u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
> +
> +	return pl4;
> +}
> +
> +static u32 read_reason_thermal(struct xe_gt *gt)
> +{
> +	u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
> +
> +	return thermal;
> +}
> +
> +static u32 read_reason_prochot(struct xe_gt *gt)
> +{
> +	u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
> +
> +	return prochot;
> +}
> +
> +static u32 read_reason_ratl(struct xe_gt *gt)
> +{
> +	u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
> +
> +	return ratl;
> +}
> +
> +static u32 read_reason_vr_thermalert(struct xe_gt *gt)
> +{
> +	u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
> +
> +	return thermalert;
> +}
> +
> +static u32 read_reason_vr_tdc(struct xe_gt *gt)
> +{
> +	u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
> +
> +	return tdc;
> +}
> +
> +static ssize_t status_show(struct device *dev,
> +			   struct device_attribute *attr,
> +			   char *buff)
> +{
> +	struct xe_gt *gt = dev_to_gt(dev);
> +	bool status = !!read_status(gt);
> +
> +	return sysfs_emit(buff, "%u\n", status);
> +}
> +static DEVICE_ATTR_RO(status);
> +
> +static ssize_t reason_pl1_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buff)
> +{
> +	struct xe_gt *gt = dev_to_gt(dev);
> +	bool pl1 = !!read_reason_pl1(gt);
> +
> +	return sysfs_emit(buff, "%u\n", pl1);
> +}
> +static DEVICE_ATTR_RO(reason_pl1);
> +
> +static ssize_t reason_pl2_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buff)
> +{
> +	struct xe_gt *gt = dev_to_gt(dev);
> +	bool pl2 = !!read_reason_pl2(gt);
> +
> +	return sysfs_emit(buff, "%u\n", pl2);
> +}
> +static DEVICE_ATTR_RO(reason_pl2);
> +
> +static ssize_t reason_pl4_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buff)
> +{
> +	struct xe_gt *gt = dev_to_gt(dev);
> +	bool pl4 = !!read_reason_pl4(gt);
> +
> +	return sysfs_emit(buff, "%u\n", pl4);
> +}
> +static DEVICE_ATTR_RO(reason_pl4);
> +
> +static ssize_t reason_thermal_show(struct device *dev,
> +				   struct device_attribute *attr,
> +				   char *buff)
> +{
> +	struct xe_gt *gt = dev_to_gt(dev);
> +	bool thermal = !!read_reason_thermal(gt);
> +
> +	return sysfs_emit(buff, "%u\n", thermal);
> +}
> +static DEVICE_ATTR_RO(reason_thermal);
> +
> +static ssize_t reason_prochot_show(struct device *dev,
> +				   struct device_attribute *attr,
> +				   char *buff)
> +{
> +	struct xe_gt *gt = dev_to_gt(dev);
> +	bool prochot = !!read_reason_prochot(gt);
> +
> +	return sysfs_emit(buff, "%u\n", prochot);
> +}
> +static DEVICE_ATTR_RO(reason_prochot);
> +
> +static ssize_t reason_ratl_show(struct device *dev,
> +				struct device_attribute *attr,
> +				char *buff)
> +{
> +	struct xe_gt *gt = dev_to_gt(dev);
> +	bool ratl = !!read_reason_ratl(gt);
> +
> +	return sysfs_emit(buff, "%u\n", ratl);
> +}
> +static DEVICE_ATTR_RO(reason_ratl);
> +
> +static ssize_t reason_vr_thermalert_show(struct device *dev,
> +					 struct device_attribute *attr,
> +					 char *buff)
> +{
> +	struct xe_gt *gt = dev_to_gt(dev);
> +	bool thermalert = !!read_reason_vr_thermalert(gt);
> +
> +	return sysfs_emit(buff, "%u\n", thermalert);
> +}
> +static DEVICE_ATTR_RO(reason_vr_thermalert);
> +
> +static ssize_t reason_vr_tdc_show(struct device *dev,
> +				  struct device_attribute *attr,
> +				  char *buff)
> +{
> +	struct xe_gt *gt = dev_to_gt(dev);
> +	bool tdc = !!read_reason_vr_tdc(gt);
> +
> +	return sysfs_emit(buff, "%u\n", tdc);
> +}
> +static DEVICE_ATTR_RO(reason_vr_tdc);
> +
> +static struct attribute *throttle_attrs[] = {
> +	&dev_attr_status.attr,
> +	&dev_attr_reason_pl1.attr,
> +	&dev_attr_reason_pl2.attr,
> +	&dev_attr_reason_pl4.attr,
> +	&dev_attr_reason_thermal.attr,
> +	&dev_attr_reason_prochot.attr,
> +	&dev_attr_reason_ratl.attr,
> +	&dev_attr_reason_vr_thermalert.attr,
> +	&dev_attr_reason_vr_tdc.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group throttle_group_attrs = {
> +	.name = "throttle",
> +	.attrs = throttle_attrs,
> +};
> +
> +static void gt_throttle_sysfs_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_gt *gt = arg;
> +
> +	sysfs_remove_group(gt->freq, &throttle_group_attrs);
> +}
> +
doc needs to be added for this
> +void xe_gt_throttle_sysfs_init(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int err;
> +
> +	err = sysfs_create_group(gt->freq, &throttle_group_attrs);
> +	if (err) {
> +		drm_warn(&xe->drm, "failed to register throttle sysfs, err: %d\n", err);
> +		return;
> +	}
> +
> +	err = drmm_add_action_or_reset(&xe->drm, gt_throttle_sysfs_fini, gt);
> +	if (err)
> +		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
> +			 __func__, err);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
> new file mode 100644
> index 000000000000..3ecfd4beffe1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_THROTTLE_SYSFS_H_
> +#define _XE_GT_THROTTLE_SYSFS_H_
> +
> +#include <drm/drm_managed.h>
> +
> +struct xe_gt;
> +
> +void xe_gt_throttle_sysfs_init(struct xe_gt *gt);
> +
> +#endif /* _XE_GT_THROTTLE_SYSFS_H_ */
> +
Remove extra line

With the above changes
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
