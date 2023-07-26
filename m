Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89BFC0015E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 17:24:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5246910E035;
	Wed, 26 Jul 2023 17:24:00 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1286410E035
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 17:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690392239; x=1721928239;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EqbGtBjGeplKXY5ocWCSc6BtbyZLIfRswTa3katCkX0=;
 b=Wmsm8z+/+96NaAExKRNFEN12zHL2zCAp13hP/12NUb16RdotcmOZvCrw
 M4nU6uOhfP3reTSwDy0gK5aMkHGcPfYDYoCh1IcVR0jWI+fSrCB3dmv0r
 GeM+jMVruTbetivIGcNAigKF2U9vJGtJjRfnuCu+xX4a8xs54MfCov+KH
 QbopBbplKE767bH077WhBP7OyzOqrbXjshjho1CwSWGagi7iBfY7tetYr
 rOWuvKni9VjDVc1KRjd4vdXwQB2d+b6KmhlNt7q+0A2GzTqILptW/csih
 MUNkVng4yU73WBiD5LVyaP0WRdrOSf8auhosyrS8w0VUW5RJ+2w5krlRs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="347694092"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="347694092"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 10:23:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="869967122"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 26 Jul 2023 10:23:41 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 10:23:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 10:23:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 10:23:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZsaKfMJ1U2dVkvlxB2ga0hK20nMsJRG8o94GTy4ngU/fN0GpX2VUF8DTOlQWQUSzZ4n0bB7XAiIpJnavniRKl5Qy7YM87UVH1b9hVeSECv9JS9ubaDAjTedYIvLQw93e5EXSApf9OwEWoHn9AoYVoiaMzkv8hXrmJ2zZCWZLVOw4quEN0L9xgbUjUiA5469xUVTOTNYGGbncm1FO0h9kbKZaadtP0j1m9hJgkY6rFKPb2r5IqR2+yjkeliKEtUm99L5z5cb6HVE66PN5yYSSrWJcoYR1jFqlCCxlIGXH2cSV8lMcJboCp0uc2Gd54grieJYa1xb+dZTfUNjMPgcVLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQopD1TSugAvalF9WCWUJBrUU1o10eRJkhNH4iqwx9w=;
 b=IHBgireWZU0apuewf+8qDty+LFYuChFE/10/6ubg3g1sqKJ6Gl3swDPHx4LwA8swW8gQGFCti//Ah7Ti13k+LUfi/QMVezt3u0Rj1oZaJTlcQ3rLQcPsVTJ70/CVzO3ZuEQgKW05ObUi2R/IEwqyk/Es+S/W7uV0eozIuTOJswAASz6O/AJnA/9MDfsPnXvbkV0wc/37S8d7fAi+TG3bFXRPXC/OhyXwXcvcShULI8v4JGhaU5QY4VABnxFL0BQA8ym0dCa5TL4xHB4+AjKKrvnNZGPZrEPLN6C7OOP70hP22JMu+ZEDqRdshcUMfTzJAj4B7XZJpUPK9lWYLcrPwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV3PR11MB8459.namprd11.prod.outlook.com (2603:10b6:408:1b0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 17:23:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164%7]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 17:23:34 +0000
Date: Wed, 26 Jul 2023 14:23:29 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <mlcvtxxcdlav7ptereh5enjwdamn4v3vgeinefljzvwxenprd2@3tccvpcqybum>
References: <20230726160708.3967790-1-lucas.demarchi@intel.com>
 <20230726160708.3967790-6-lucas.demarchi@intel.com>
 <20230726165434.GN138014@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230726165434.GN138014@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR13CA0028.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV3PR11MB8459:EE_
X-MS-Office365-Filtering-Correlation-Id: df58adbf-7ada-42b4-562e-08db8dfd09f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ig6zozoTKnjd9CHWvSQ97PcyyJxh3knz77NX9ZJENQSfTBbeSfCYovA5D6CBFJJC53QTX9UhkYILq5DnUhxfeNA6j8ye74WN07YqMXEBJTvnRv7gH73bzgKbzjJIRp+f+XX3QrlkFpT/In3AwMrnhjLPHJb5wtElXRDhEsnq59KnvEImIJaj7uzfp0QAv4TeopZTcMi1HmG1ZnptAALGNl+dj8HkquR9RzIvaZDivbR6Ejb6mjWjW/ErFkbLIHgPvUo0VGmpxo2vac5dLxxUMfcDzGIPq+24R5uswEwU7b6EaRsXoihQDrwK8CCd9tMsyRmT/NAVGG5BcpT43P9N5NtjENjBLomTU4pCrD/QfWAfMD9auiqFXfx6Tp0usB/xOW48Ih4BoY4o+2C5q4yIYMwu4pBdyMTg75yfn+CXY+NvyhFtU0LSLH8R9xx+5wLDIRkEYkj2XIz/1OMuLQbX217N6ehjBq2spuV+KZTsCOmMc++rzZFsBSwYJ6HNaVhbSVPm0JL5LwSwWGjT2dC48F6rzkPuoEae9kfO9hwkb8G3hVNsSK7gBwWwyvlBQKLX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(39860400002)(396003)(346002)(376002)(136003)(451199021)(82960400001)(6666004)(6486002)(478600001)(83380400001)(26005)(6506007)(107886003)(6512007)(9686003)(38100700002)(66946007)(66556008)(6636002)(4326008)(66476007)(186003)(5660300002)(316002)(6862004)(8936002)(8676002)(33716001)(2906002)(41300700001)(30864003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vqYqI/XHVW4obBNL7tmfCuVlyWJGP4aGYlNWCMJBRoPZNuB9yyP1T4lsxOz9?=
 =?us-ascii?Q?/VYQdZuJDvp+T38ZPcjNgNWoMbzFX5EIIdwz2rQySSlwCOfrC82Kq/gR6Dc3?=
 =?us-ascii?Q?bRkPKaOKoy0wP2ras2XSGvPJBHZxnU88moqKdh2rDdWZ5iiVawy4d2VxeaHg?=
 =?us-ascii?Q?vYaKOctBzPj4W7vk0vYgDpV8wg/idKNitcYRfZW6tlO8FhhVKISnVqdNCiqW?=
 =?us-ascii?Q?RLvTT8yjgGF3iF5/9im5XuzMoCNaA98EhQ1lt6bhWlOz7DaTJZJdhlaufBDl?=
 =?us-ascii?Q?KUUzrE+1R7IwEE90kXMWjc/0prgTeCuhm+eRHrD83CaxMLuGQZmNEimADCoL?=
 =?us-ascii?Q?mjcH665xtztFwNoQqnI93Jec2T6VkxpVjsyID0H0oHZgzeYx5F32d9xajmgK?=
 =?us-ascii?Q?3JzZvhf16YfIi/NKTK/7NCUGydJHUAQ4iWbdG5+vLyI7Gr9L6Y+lnVXxpeCf?=
 =?us-ascii?Q?M/IYQSQQj3BFQC1QjC/dB6AFrD8kHNKVcfhAPi05Or5SGyz2sSDP0z4qMaoA?=
 =?us-ascii?Q?dTzNXTgAspNmGlEnL1tlTdO+yUVLC2xBj3IJWFjrr0tZOxuRCLl/ZD+Jwlax?=
 =?us-ascii?Q?BTEExl14g1VEeZDL7U7nRHB9G4amLLkN9Me5gc1xTmxPPxFr7za3cTxyRIrS?=
 =?us-ascii?Q?S7bD2bEvqmAsF8Z77BI7LHxMzfVT1bjhWqJzBwzAMuuUj6M8rgoDAW1mlIbd?=
 =?us-ascii?Q?TG93Bu6cJpI0kbaSAK43kOkofnKlvjzzbqZIKVns0F8tqu2yRZre4nDI6mKb?=
 =?us-ascii?Q?7sdsy1YOIwV8OhLSEuYhKv3702DhcyOeyNiUt2Pbb6NBJCRgjG07Yn0BbyNG?=
 =?us-ascii?Q?bvPRhLqv1hMPJ6E1UGxaYM+z0gKeX41AKC8Vx6B3183HrrMwu3PJjIxneD2g?=
 =?us-ascii?Q?V38wgjre5eeNE6lcyyrvpNV/+G92bsvQQnLIP8eZvFBlftLH/36ghlBC9i6X?=
 =?us-ascii?Q?Kc3E2MHWF3w+S6bL2+JhRJ5jszw0ZJoCfUZ6TZ1pxi4tJlxm/KAEwrycV+xh?=
 =?us-ascii?Q?qKZV9ruJCk4TiZjtyPiVo9lj0sfu4o5HcBN6iNarm24dlZdiwYanzhPHu8eg?=
 =?us-ascii?Q?s6J6xpVdpOr9q0tPKRjKDIsXcYYIBM85y48ppSYd6YLLS/ZTot2+EqdaPeGc?=
 =?us-ascii?Q?MetNh1cpCvgz4UHPAgRb+wOMq/Ds0lvImbjJaZby5qfFPwRHNJVHu7hZOeNg?=
 =?us-ascii?Q?DwuAbcAOB4vCqyBfk7OYa6FN/PXXwGGiSaUeJ0OTOLuOUndUY27ERmVg1uON?=
 =?us-ascii?Q?tVHU8dLUzTH0GfKbAFAqTFi6ESjQUVrFSYR+WCnZHyCR3cOHZzOEcO88TGq9?=
 =?us-ascii?Q?8wfwO9zYNX2yYhfL8DJCdlv1DS6fpzawAdAHwiWH5thLsJU9E2Gxl3TmTzIk?=
 =?us-ascii?Q?WpM6AxsZDPNOKGSuRhRUy/dxOMtL45iWiF0jBSJwA6B9/BbnmTXhY1lXjfYt?=
 =?us-ascii?Q?JIUqcVwly59Uhrsam4vdNExZQDzsRZCau/zx6HXNRKznE3kDLr2vPwFy227I?=
 =?us-ascii?Q?w3ujHAjTUb4qR1ugHb+2lD+auoKSUu35bS0BqNa6yyZ4xBjt0xZWwjQ8ii3B?=
 =?us-ascii?Q?H2rLxiGfsIXfr/d13SrQbS3Dl7EpoiIYUm/VjwUGzoeW1XeRH4u+0B9OfP2r?=
 =?us-ascii?Q?QQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df58adbf-7ada-42b4-562e-08db8dfd09f6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 17:23:34.0641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +pWiUxzgLtptfZa9xuKcdFa9Jf6uRG038WRlA40deuIzQnwBf4nYA1Tcfi2kR4hCJP6cgH6djPK/53+iFym8f2uWk06kRf+v6nQI95CTGsI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8459
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 05/10] drm/xe: Decouple vram check from
 xe_bo_addr()
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
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jul 26, 2023 at 09:54:34AM -0700, Matt Roper wrote:
>On Wed, Jul 26, 2023 at 09:07:03AM -0700, Lucas De Marchi wrote:
>> The output arg is_vram in xe_bo_addr() is unused by several callers.
>> It's also not what the function is mainly doing. Remove the argument and
>> let the interested callers to call xe_bo_is_vram().
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_fbdev.c |  4 +---
>>  drivers/gpu/drm/xe/xe_bo.c                 | 15 +++++----------
>>  drivers/gpu/drm/xe/xe_bo.h                 | 10 +++-------
>>  drivers/gpu/drm/xe/xe_ggtt.c               |  5 ++---
>>  drivers/gpu/drm/xe/xe_migrate.c            | 16 ++++------------
>>  drivers/gpu/drm/xe/xe_pt.c                 | 10 +++-------
>>  drivers/gpu/drm/xe/xe_vm.c                 | 10 ++++++----
>>  7 files changed, 24 insertions(+), 46 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
>> index a4f30773e314..f38d5c114a9d 100644
>> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
>> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
>> @@ -369,14 +369,12 @@ static int intelfb_create(struct drm_fb_helper *helper,
>>
>>  #else
>>  	if (!(obj->flags & XE_BO_CREATE_SYSTEM_BIT)) {
>> -		bool lmem;
>> -
>>  		if (obj->flags & XE_BO_CREATE_STOLEN_BIT)
>>  			info->fix.smem_start = xe_ttm_stolen_io_offset(obj, 0);
>>  		else
>>  			info->fix.smem_start =
>>  				pci_resource_start(pdev, 2) +
>> -				xe_bo_addr(obj, 0, XE_PAGE_SIZE, &lmem);
>> +				xe_bo_addr(obj, 0, XE_PAGE_SIZE);
>>
>>  		info->fix.smem_len = obj->ttm.base.size;
>>  	} else {
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 6a96cb0689c4..29813271cc4c 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -1516,12 +1516,11 @@ int xe_bo_pin(struct xe_bo *bo)
>>  	if (IS_DGFX(xe) && !(IS_ENABLED(CONFIG_DRM_XE_DEBUG) &&
>>  	    bo->flags & XE_BO_INTERNAL_TEST)) {
>>  		struct ttm_place *place = &(bo->placements[0]);
>> -		bool vram;
>>
>>  		if (mem_type_is_vram(place->mem_type)) {
>>  			XE_BUG_ON(!(place->flags & TTM_PL_FLAG_CONTIGUOUS));
>>
>> -			place->fpfn = (xe_bo_addr(bo, 0, PAGE_SIZE, &vram) -
>> +			place->fpfn = (xe_bo_addr(bo, 0, PAGE_SIZE) -
>>  				       vram_region_gpu_offset(bo->ttm.resource)) >> PAGE_SHIFT;
>>  			place->lpfn = place->fpfn + (bo->size >> PAGE_SHIFT);
>>
>> @@ -1646,8 +1645,7 @@ bool xe_bo_is_xe_bo(struct ttm_buffer_object *bo)
>>   * address, such as printing debug information, but not in cases where memory is
>>   * written based on this result.
>>   */
>> -dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset,
>> -		      size_t page_size, bool *is_vram)
>> +dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size)
>>  {
>>  	struct xe_res_cursor cur;
>>  	u64 page;
>> @@ -1656,9 +1654,7 @@ dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset,
>>  	page = offset >> PAGE_SHIFT;
>>  	offset &= (PAGE_SIZE - 1);
>>
>> -	*is_vram = xe_bo_is_vram(bo);
>> -
>> -	if (!*is_vram && !xe_bo_is_stolen(bo)) {
>> +	if (!xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo)) {
>>  		XE_BUG_ON(!bo->ttm.ttm);
>>
>>  		xe_res_first_sg(xe_bo_get_sg(bo), page << PAGE_SHIFT,
>> @@ -1673,12 +1669,11 @@ dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset,
>>  	}
>>  }
>>
>> -dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset,
>> -		      size_t page_size, bool *is_vram)
>> +dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size)
>>  {
>>  	if (!READ_ONCE(bo->ttm.pin_count))
>>  		xe_bo_assert_held(bo);
>> -	return __xe_bo_addr(bo, offset, page_size, is_vram);
>> +	return __xe_bo_addr(bo, offset, page_size);
>>  }
>>
>>  int xe_bo_vmap(struct xe_bo *bo)
>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> index 3fed3e18c223..894ea0deb34b 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.h
>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>> @@ -207,17 +207,13 @@ static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
>>  }
>>
>>  bool xe_bo_is_xe_bo(struct ttm_buffer_object *bo);
>> -dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset,
>> -		      size_t page_size, bool *is_vram);
>> -dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset,
>> -		      size_t page_size, bool *is_vram);
>> +dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size);
>> +dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size);
>>
>>  static inline dma_addr_t
>>  xe_bo_main_addr(struct xe_bo *bo, size_t page_size)
>>  {
>> -	bool is_vram;
>> -
>> -	return xe_bo_addr(bo, 0, page_size, &is_vram);
>> +	return xe_bo_addr(bo, 0, page_size);
>>  }
>>
>>  static inline u32
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index e1b84bc25375..f57dd8703d93 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -31,12 +31,11 @@ u64 xe_ggtt_pte_encode(struct xe_bo *bo, u64 bo_offset)
>>  {
>>  	struct xe_device *xe = xe_bo_device(bo);
>>  	u64 pte;
>> -	bool is_vram;
>>
>> -	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE, &is_vram);
>> +	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
>>  	pte |= XE_PAGE_PRESENT;
>>
>> -	if (is_vram)
>> +	if (xe_bo_is_vram(bo))
>>  		pte |= XE_GGTT_PTE_LM;
>>
>>  	/* FIXME: vfunc + pass in caching rules */
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index 3c7d5cfd30bc..2a4b22c3a024 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -132,7 +132,6 @@ static int xe_migrate_create_cleared_bo(struct xe_migrate *m, struct xe_vm *vm)
>>  	struct xe_device *xe = vm->xe;
>>  	size_t cleared_size;
>>  	u64 vram_addr;
>> -	bool is_vram;
>>
>>  	if (!xe_device_has_flat_ccs(xe))
>>  		return 0;
>> @@ -147,8 +146,7 @@ static int xe_migrate_create_cleared_bo(struct xe_migrate *m, struct xe_vm *vm)
>>  		return PTR_ERR(m->cleared_bo);
>>
>>  	xe_map_memset(xe, &m->cleared_bo->vmap, 0, 0x00, cleared_size);
>> -	vram_addr = xe_bo_addr(m->cleared_bo, 0, XE_PAGE_SIZE, &is_vram);
>> -	XE_BUG_ON(!is_vram);
>
>Should we keep the assertion here (but as a warning rather than a bug)?
>
>       drm_WARN_ON(&xe->drm, !xe_bo_is_vram(m->cleared_bo));
>
>> +	vram_addr = xe_bo_addr(m->cleared_bo, 0, XE_PAGE_SIZE);
>>  	m->cleared_vram_ofs = xe_migrate_vram_ofs(vram_addr);
>>
>>  	return 0;
>> @@ -221,15 +219,13 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>>  			level++;
>>  		}
>>  	} else {
>> -		bool is_vram;
>> -		u64 batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE, &is_vram);
>> +		u64 batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
>>
>>  		m->batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
>>
>>  		if (xe->info.supports_usm) {
>>  			batch = tile->primary_gt->usm.bb_pool->bo;
>> -			batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE,
>> -						&is_vram);
>> +			batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
>>  			m->usm_batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
>>  		}
>>  	}
>> @@ -1000,12 +996,8 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
>>  	 */
>>  	XE_BUG_ON(update->qwords > 0x1ff);
>>  	if (!ppgtt_ofs) {
>> -		bool is_vram;
>> -
>>  		ppgtt_ofs = xe_migrate_vram_ofs(xe_bo_addr(update->pt_bo, 0,
>> -							   XE_PAGE_SIZE,
>> -							   &is_vram));
>> -		XE_BUG_ON(!is_vram);
>
>Same here.
>
>> +							   XE_PAGE_SIZE));
>>  	}
>>
>>  	do {
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index ac01bc42e54f..38ccc96c4584 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -61,13 +61,10 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
>>  		  const enum xe_cache_level level)
>>  {
>>  	u64 pde;
>> -	bool is_vram;
>>
>> -	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE, &is_vram);
>> +	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
>>  	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
>>
>> -	XE_WARN_ON(IS_DGFX(xe_bo_device(bo)) && !is_vram);
>
>And here.

I looked at those and thinking about calling xe_bo_is_vram(), but it
seems the places they were put are pretty much arbitrary. Why do we have
it here and not in the pte encode where it is actually used?

Also, I didn't see much value in keeping the BUG_ON() as there is
already an effort to remove/convert them. Since these BUG_ON and
warnings never triggered, I don't see a point in keeping them.

>
>> -
>>  	/* FIXME: I don't think the PPAT handling is correct for MTL */
>>
>>  	if (level != XE_CACHE_NONE)
>> @@ -128,10 +125,9 @@ u64 xe_pte_encode(struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
>>  		  u32 pt_level)
>>  {
>>  	u64 pte;
>> -	bool is_vram;
>>
>> -	pte = xe_bo_addr(bo, offset, XE_PAGE_SIZE, &is_vram);
>> -	if (is_vram)
>> +	pte = xe_bo_addr(bo, offset, XE_PAGE_SIZE);
>> +	if (xe_bo_is_vram(bo))
>>  		pte |= XE_PPGTT_PTE_LM;
>>
>>  	return __pte_encode(pte, cache, NULL, pt_level);
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 6429d6e5113d..87f32cfc475a 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -3497,9 +3497,10 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
>>  		return 0;
>>  	}
>>  	if (vm->pt_root[gt_id]) {
>> -		addr = xe_bo_addr(vm->pt_root[gt_id]->bo, 0, XE_PAGE_SIZE,
>> -				  &is_vram);
>> -		drm_printf(p, " VM root: A:0x%llx %s\n", addr, is_vram ? "VRAM" : "SYS");
>> +		addr = xe_bo_addr(vm->pt_root[gt_id]->bo, 0, XE_PAGE_SIZE);
>> +		is_vram = xe_bo_is_vram(vm->pt_root[gt_id]->bo);
>> +		drm_printf(p, " VM root: A:0x%llx %s\n", addr,
>> +			   is_vram ? "VRAM" : "SYS");
>>  	}
>>
>>  	drm_gpuva_for_each_va(gpuva, &vm->mgr) {
>> @@ -3520,7 +3521,8 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
>>  				addr = 0;
>>  			}
>>  		} else {
>> -			addr = __xe_bo_addr(xe_vma_bo(vma), 0, XE_PAGE_SIZE, &is_vram);
>> +			addr = __xe_bo_addr(xe_vma_bo(vma), 0, XE_PAGE_SIZE);
>> +			is_vram = xe_bo_is_vram(xe_vma_bo(vma));
>
>This is an accurate transformation of the existing code, but is that
>code setting is_vram everywhere it should be?  Shouldn't the null vma
>and userptr branches be setting is_vram to false rather than just
>leaving it at whatever value it already had?

I had initially added a  "is_vram = false" before the if/else ladder due
to the same observation. However I then noticed is_vram is only used for
the drm_printf() and it will only be used if it executed this specific
branch:

	is_null ? "NULL" :		// 1st branch
	is_userptr ? "USR" :		// 2nd branch
	is_vram ? "VRAM" : "SYS");	// 3rd branch

>
>Anyway, aside from possible restoring the various assertions that were
>removed, the changes look correct to me.

I will wait a little bit to see if anyone is strictly on the "keep the
warnings" side.

>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

thanks
Lucas De Marchi

>
>>  		}
>>  		drm_printf(p, " [%016llx-%016llx] S:0x%016llx A:%016llx %s\n",
>>  			   xe_vma_start(vma), xe_vma_end(vma) - 1,
>> --
>> 2.40.1
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
