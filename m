Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2370C44520
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 19:09:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80BF310E133;
	Mon, 20 Jul 2026 19:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fge1oxwA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8586510E133;
 Mon, 20 Jul 2026 19:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784574593; x=1816110593;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bh7J4j0PMjDSt4aMCijIlvhaaoIr3z/qcy116zgl8ZI=;
 b=fge1oxwANTRKCu3nBrM5CpCb7aYRYRVUFkplPDJSLa46xm9wZkVmO1/y
 QStLZ89ah6xJ79vqimGIB97z0ikTS2ZfsOtRNxv9UjW6fb1mtoEFxuOLU
 CmPFnyKy10kwqPWNrR2UC0Jv+Pdz4FG9QWClMgGL5IPUcze0kI94Aveqq
 W5RlmIfS4DZ8aLIOxu5cqaXawF2safu/eRwV4MtmBy0c9t7+eHZc+KGiA
 CPWMlAn7QilL1LLwf/tMRwTS3u8VO+tMJPOZPpU76zdLUVJTCFbCafcVU
 NA9dNe7XlmP6Ox7FTDTzOhEg6n2km5UkYwxxPWAonTA570yYrt2mSywe0 A==;
X-CSE-ConnectionGUID: pMD4asfdQh+5T1E4dmXwXA==
X-CSE-MsgGUID: Rz69kQlzR+ahWEvSiufviw==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85286517"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="85286517"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 12:09:52 -0700
X-CSE-ConnectionGUID: oV9RKyZlTUSdBHpzepuVKw==
X-CSE-MsgGUID: f6xgfNUGRZmvASy2Ibno0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="254129424"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 12:09:52 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 12:09:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 12:09:51 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.45) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 12:09:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDVs/0LcAu/FhUisVm5LQzRYI0qSV3mc1X9onMQGDHkkReqPFW+hKh0gSDvCq6NU+EmBrLYchQJ1zw3lgm4fVmuURZbxgqns3VWU8jTcrUNbtIXrQ3mBPtOIVbKcgCfKbNljw3hTaNCRJ3T6FLNCythEFkpeybGB8Atw1NT2dSWMxEtUGNuSukuDf7B3GTWXlzpPEiNW5aGQS9c4JVbRUauGASUiKTCa9SyZoT/V8LvRLX+3Er1XMqEKAych7P68KPntmrSnXZfjgS5zVMTDnoIVWnoLNm8e+RQGoT4aPbw66ujgwRitAQhz146rEb/8NyrP/2IGw8OC6hK/qyN0Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ziadgGTXVIiL81jZ31hDNpuVLz/YpaFdtxYorgzabX8=;
 b=N5YeIxpn7udaJpZwQd2uzPsa+ROEr2bv7AoB2QpiIxj5ySi4g1b0tt5xXGFvnTknNYAe4McThTNVw5GLqyW40yJOgRSzwdDsMwTc9rb9Qt/KUVE9H+jdunziUB72xwuB0fU26ffEfkMLlhTpt0VWwJllnbWmBltcL3qqyWvENffZX8aUpyDobEX/7Nk1NBZ4hGmiC0V8qkwVsezI9GlDUcQ8zCsK79IYhVENUhwI63NRV8z0I8c4hJOq8k+SWG7eW6A+RBlhmPC9v4U9D1h4P+URqvAeKz6ZSOHfme6f4h0m3N8yLN/mh8KwnqU2SDZx+n/L0eYotKaGqYFU1lbztQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5028.namprd11.prod.outlook.com (2603:10b6:303:9a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 19:09:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 19:09:48 +0000
Date: Mon, 20 Jul 2026 12:09:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 08/11] drm/xe/migrate: Support copying between sysmem and
 stolen
Message-ID: <al5yelaY34ls2/vw@gsse-cloud1.jf.intel.com>
References: <20260720161451.384968-13-dev@lankhorst.se>
 <20260720161451.384968-21-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260720161451.384968-21-dev@lankhorst.se>
X-ClientProxiedBy: MW4P222CA0028.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5028:EE_
X-MS-Office365-Filtering-Correlation-Id: 5027c7dc-de63-49ba-6597-08dee69277ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|6133799003|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: r29nb9io66kfzTiTO/vMvOUuVzgOWwk/XXfSq3ZXqWqIJrSBTEKImCrbpivMeTP7fwyXd56+UBcZiyGh/o6b/iCwCFgFT7s1QSydJ2h7ogr/r0ih5b1WwUrGJ0lMSgpzyh6GetK5ifyGBFcwesqvhyZG5iBRdSVRI+IA0RLeXzqQzlIw+O0veBWsUHt+A/QCQWrbdoMIagUjGEBgMxTc1JC4KrxofJWf9BQMdqCEyNtXIM/IOuQoFvpcgF2P4L8alD7AHb/pw2xNN3P9kHwFHuwIVTQfQdf/AHjCkVw1AE6b06kmOZKw59zWb5AleDew3gzUel6yV/AnSMf/7SqMNzVQtLiwwApVBjMvCwz3PvijhK6t2PRkHtF+eCtgACchDldGuatcg07iYgchqh96uoR2T9GNnhbzcaiPOcHXgzIsKw/WiQKrqCID4CMZ2Tp31myeQivqydymYVEvXMfujO5dVjD+xc7GgpJAtTXy5TfMpbQJbc1CbCdl9oIc6UIHPG+y9GvuaX3RZcA8ZBpYe2oXF+STzoN7aifKdT2QUl6JRXKZL0mWUDO+d5okwDki9PLWYjs8kuImrNrgYP7Lq4paC+WfRJ7Vt50BcdWk2gfH71t89NI3C8VObR0ivgBha3q7hF6Wt57szc2uXBLrhHk6DSR/73MVoONWiOdDQyg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?72E7o4qfJIz9S2hWJl4W0Pfy84N0ko93rq9VgD0WznANhinqh55booEKf6z5?=
 =?us-ascii?Q?Yyozx0E2U84rwZH2nNvwbmIP0X+vJfhyigZZlNwKAulSntqheRHg3r51fCHR?=
 =?us-ascii?Q?U4IV/nAhTDKWw0DMk1yeUzMI7EbW5awdJo0zJIsM1IEpR9ZlqOEJiy+r7qe3?=
 =?us-ascii?Q?/AFFE0Dhw0iaWPuSp1IfyI3PpMGcTdGA4mxXjuDS7Swjd4rdJTNRW4GzAxBs?=
 =?us-ascii?Q?3sqyWJmhlddZpVgjD7RIZiSsNFQAiR09F2kGPbVEROI/I1UhOhqRVJ2NxUBy?=
 =?us-ascii?Q?6n8PP2P7aVWrxy49BHVH/I0AHzE/VSotnK2xMFov7QhcUZm6nJZIj5wBv03j?=
 =?us-ascii?Q?B8MGfMt3EqV1ITkf6sNfUfo4llo6UyHqAdC5V8sRscU70kHI2Y7rsKWlBI85?=
 =?us-ascii?Q?PH7KKeLWQTvHlUqrGFkVjuLxPekZjNW9p57LO11HpEQfTkouOJlRlM/ZPZa3?=
 =?us-ascii?Q?XpY9GeJSwwWNzS2WuMdqj9y7E5ChVHVItRoGVn09UqkxH5VwWNsucmW0AB9w?=
 =?us-ascii?Q?d7rueImaepsRdW2f4DJXaRhvpgPXmCKVfwiEoa3dKub5qKpnz4bdSWrRJax9?=
 =?us-ascii?Q?zEH82Rk2azvevj2PIEYjI1RGRuFLanq5V203QTXQPOWgM3MDOvM3GFF5AR3G?=
 =?us-ascii?Q?pFg4tUzv2/pcHrRVJa2SPbJG7mdRgHgLk+o9f8npqfrGG6tHYPhoD+VVLs+P?=
 =?us-ascii?Q?7aslmMZpWApxiyDoYDrT5eWnbJ/w+OTOqdG7taAD/AzbBoMcok0qJX21yzVb?=
 =?us-ascii?Q?pBrEDc5tVINxQG02OnNiGFKTSHGtVuMedfycd+5dG5sqqBKLVLi1SLRorOH3?=
 =?us-ascii?Q?F4buyHhrVv8Wk0Hbjd2D/gyM7SVesr0VzQxfDgNom2olF1Z/AzUM298KObFv?=
 =?us-ascii?Q?XHCmF1y4PQBNjkHaM4K8GR8aOu+bMBelTFkxfoI08CZS01L0UjLf81WbvkPA?=
 =?us-ascii?Q?dViBHKlZ58mPwihd8tRBEpeC0G9Lf5BMRnnx4umBimpT1ND2Q3UC+SVCWyhm?=
 =?us-ascii?Q?VGmRAzBbzbFD44V7/bihwK1CXOE97KGgBkh9YEbIYA6qVFsQZhYH7JGosTCz?=
 =?us-ascii?Q?Uk+NNFK/xiXt2h5OHoZiqHf1vz/Oxit2uHXeDnc6+WYpoPdrvxXsD13Q6dMQ?=
 =?us-ascii?Q?BRrCVzSR7r2HHvGFXzR46NqQ7H5puNAngjqnXft46tIeeUWCsWa0t26XIwqn?=
 =?us-ascii?Q?pGDz+urmuBJffxjrt9LkLK+d4kc9u+45tbyoaBl8BEe2CY6q+f1WLQVQZtjJ?=
 =?us-ascii?Q?yymF8d+6wvMJEO+a7xs8Na97R/LL3c0PWLc0spoAaXxPRXX0s2LV4R6/v83t?=
 =?us-ascii?Q?1uptO2lJFyrLHV0DHPeBVpdPO95iZZH1mdBcOOJVuoi5VL1FFBI2FhEgSwmw?=
 =?us-ascii?Q?voEjifCsE7D29XAaQXehfVEvZZLmuzFD04bUDuHfjYFxDyFskwBHJlTyVqBp?=
 =?us-ascii?Q?ejL5JhnWW8kvdBI0yC53BmLbDoLXGdB4/xj1hfeW7WFgBCywjDVllx2haGkm?=
 =?us-ascii?Q?3/PKB3b3gZX3+rgRXPKl+pp3H8F0mDoV43QlizwBjev+qJQH83vJyWdrLlMf?=
 =?us-ascii?Q?ugMkdg5tgOzza/kbBpoy9hE1OUnDW4NDUFuv8jdzvUMUFD0/X407raO5ZGlZ?=
 =?us-ascii?Q?fgTvX3KmLQSCl7LYm1cEM1vDjYK0odENwju17ZuXmFXSTd93WHQIiUk/5jV+?=
 =?us-ascii?Q?0GTgXtBu7DjaLnRFlHiTkahu4ZegO67MIBL2DpdNohXSURFaO67ZOMMiRHeR?=
 =?us-ascii?Q?qhOazwiqTA=3D=3D?=
X-Exchange-RoutingPolicyChecked: hAltOl4dwvJ+35c5BIA4F5Y1TLRlSSK7N8Y8u09L/ztpcw3Ks+k5DrysCXZnQ1bnhvmHVuGfwos87fJczSmMphxkA0U+KJh58cUJO9WPmXhTx8nthVOv1STRjdxcSa0l6EqeNuk32TMV3C0p/IrGsjw4OUFgX/cRF3MxWY8zIoZPG/yP4wsyz69/b5Npf64swWsgTuS4sn30/eHBhXCSwojoxRXArPAR3zN20jToBpGfaHG23gE4jzxVibsWdp9W26YJf/4NVXYEWwfkZn3vGx3qmeDU7aQyb2aemSDmkT/U50/gVOSKHD1cjoDzDS6/PSkGyLQ00PE7JSr/9xvH0w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5027c7dc-de63-49ba-6597-08dee69277ea
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 19:09:48.7361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XmnrAxApT/1XyARfypSRwFeH660esjuEDZX/nCo7N9r274jsfjwC5iTjCr4plq7e2/wlvLUyBi+FovOS7KLD7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5028
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jul 20, 2026 at 06:15:00PM +0200, Maarten Lankhorst wrote:
> In order to copy out the stolen BO, we have to add some support to
> xe_migrate_copy, since otherwise it tries to use the VRAM identity
> mapping on integrated, which obviously doesn't do the right thing.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 29 +++++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index c84e14e86a823..b346e743025b7 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -559,6 +559,7 @@ static bool xe_migrate_allow_identity(u64 size, const struct xe_res_cursor *cur)
>  
>  #define PTE_UPDATE_FLAG_IS_VRAM		BIT(0)
>  #define PTE_UPDATE_FLAG_IS_COMP_PTE	BIT(1)
> +#define PTE_UPDATE_FLAG_ALLOW_IDENTITY	BIT(2)
>  
>  static u32 pte_update_size(struct xe_migrate *m,
>  			   u32 flags,
> @@ -570,9 +571,10 @@ static u32 pte_update_size(struct xe_migrate *m,
>  	u32 cmds = 0;
>  	bool is_vram = PTE_UPDATE_FLAG_IS_VRAM & flags;
>  	bool is_comp_pte = PTE_UPDATE_FLAG_IS_COMP_PTE & flags;
> +	bool allow_identity = PTE_UPDATE_FLAG_ALLOW_IDENTITY & flags;
>  
>  	*L0_pt = pt_ofs;
> -	if (is_vram && xe_migrate_allow_identity(*L0, cur)) {
> +	if (is_vram && allow_identity && xe_migrate_allow_identity(*L0, cur)) {
>  		/* Offset into identity map. */
>  		*L0_ofs = xe_migrate_vram_ofs(tile_to_xe(m->tile),
>  					      cur->start + vram_region_gpu_offset(res),
> @@ -858,6 +860,14 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
>  	return flush_flags;
>  }
>  
> +static bool is_devmem(struct xe_bo *bo, struct ttm_resource *res)
> +{
> +	if (mem_type_is_vram(res->mem_type) || res->mem_type == XE_PL_STOLEN)
> +		return true;
> +
> +	return false;
> +}
> +
>  static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
>  					   struct xe_bo *src_bo,
>  					   struct xe_bo *dst_bo,
> @@ -878,8 +888,8 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
>  	int err;
>  	bool src_is_pltt = src->mem_type == XE_PL_TT;
>  	bool dst_is_pltt = dst->mem_type == XE_PL_TT;
> -	bool src_is_vram = mem_type_is_vram(src->mem_type);
> -	bool dst_is_vram = mem_type_is_vram(dst->mem_type);
> +	bool src_is_vram = is_devmem(src_bo, src);
> +	bool dst_is_vram = is_devmem(dst_bo, dst);
>  	bool type_device = src_bo->ttm.type == ttm_bo_type_device;
>  	bool needs_ccs_emit = type_device && xe_migrate_needs_ccs_emit(xe);
>  	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
> @@ -939,6 +949,7 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
>  
>  		pte_flags = src_is_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
>  		pte_flags |= use_comp_pat ? PTE_UPDATE_FLAG_IS_COMP_PTE : 0;
> +		pte_flags |= IS_DGFX(xe) ? PTE_UPDATE_FLAG_ALLOW_IDENTITY : 0;

Can we make allow identity a stack variable?

>  		batch_size += pte_update_size(m, pte_flags, src, &src_it, &src_L0,
>  					      &src_L0_ofs, &src_L0_pt, 0, 0,
>  					      avail_pts);
> @@ -946,6 +957,7 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
>  			dst_L0_ofs = src_L0_ofs;
>  		} else {
>  			pte_flags = dst_is_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
> +			pte_flags |= IS_DGFX(xe) ? PTE_UPDATE_FLAG_ALLOW_IDENTITY : 0;
>  			batch_size += pte_update_size(m, pte_flags, dst,
>  						      &dst_it, &src_L0,
>  						      &dst_L0_ofs, &dst_L0_pt,
> @@ -972,13 +984,13 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
>  			goto err_sync;
>  		}
>  
> -		if (src_is_vram && xe_migrate_allow_identity(src_L0, &src_it))
> +		if (src_is_vram && IS_DGFX(xe) && xe_migrate_allow_identity(src_L0, &src_it))

Then use it here too or maybe update xe_migrate_allow_identity to accept
an 'xe' argument which does IS_DGFX(xe) check?

I basically don't like the duplicate IS_DGFX(xe) scattered over these
functions.

Matt 

>  			xe_res_next(&src_it, src_L0);
>  		else
>  			emit_pte(m, bb, src_L0_pt, src_is_vram, copy_system_ccs || use_comp_pat,
>  				 &src_it, src_L0, src);
>  
> -		if (dst_is_vram && xe_migrate_allow_identity(src_L0, &dst_it))
> +		if (dst_is_vram && IS_DGFX(xe) && xe_migrate_allow_identity(src_L0, &dst_it))
>  			xe_res_next(&dst_it, src_L0);
>  		else if (!copy_only_ccs)
>  			emit_pte(m, bb, dst_L0_pt, dst_is_vram, copy_system_ccs,
> @@ -1386,7 +1398,7 @@ struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_off
>  	xe_res_first_sg(xe_bo_sg(sysmem_bo), sysmem_offset, size, &sysmem_it);
>  
>  	while (size) {
> -		u32 pte_flags = PTE_UPDATE_FLAG_IS_VRAM;
> +		u32 pte_flags = PTE_UPDATE_FLAG_IS_VRAM | PTE_UPDATE_FLAG_ALLOW_IDENTITY;
>  		u32 batch_size = 2; /* arb_clear() + MI_BATCH_BUFFER_END */
>  		struct xe_sched_job *job;
>  		struct xe_bb *bb;
> @@ -1576,7 +1588,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  				   struct ttm_resource *dst,
>  				   u32 clear_flags)
>  {
> -	bool clear_vram = mem_type_is_vram(dst->mem_type);
> +	bool clear_vram = is_devmem(bo, dst);
>  	bool clear_bo_data = XE_MIGRATE_CLEAR_FLAG_BO_DATA & clear_flags;
>  	bool clear_ccs = XE_MIGRATE_CLEAR_FLAG_CCS_DATA & clear_flags;
>  	struct xe_gt *gt = m->tile->primary_gt;
> @@ -1616,6 +1628,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  
>  		/* Calculate final sizes and batch size.. */
>  		pte_flags = clear_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
> +		pte_flags |= IS_DGFX(xe) ? PTE_UPDATE_FLAG_ALLOW_IDENTITY : 0;
>  		batch_size = 1 +
>  			pte_update_size(m, pte_flags, src, &src_it,
>  					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
> @@ -1638,7 +1651,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>  
>  		size -= clear_L0;
>  		/* Preemption is enabled again by the ring ops. */
> -		if (clear_vram && xe_migrate_allow_identity(clear_L0, &src_it)) {
> +		if (clear_vram && IS_DGFX(xe) && xe_migrate_allow_identity(clear_L0, &src_it)) {
>  			xe_res_next(&src_it, clear_L0);
>  		} else {
>  			emit_pte(m, bb, clear_L0_pt, clear_vram,
> -- 
> 2.53.0
> 
