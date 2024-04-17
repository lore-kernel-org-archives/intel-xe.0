Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C25C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 04:09:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD811130D2;
	Wed, 17 Apr 2024 04:09:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dcx4Db8j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67EEB1130D2
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 04:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713326967; x=1744862967;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=80S8bVeuU9FTahNWjWXSQPHgtUT1SLBCCo/8NoB68MY=;
 b=Dcx4Db8jJ9PXzTcoiA/UFPXu7zFuzLDKx3c7I6nms6O7/80TGa8MKjHQ
 uKcplKqP0wdRelEckFJPkDNXwV5qRTapoAXnsV9eE1JQd5E3YRUSV1E2C
 EVYZRPDqTv7gsix6NdjR7Z4LOyQZLahOGHZEJjYdzBclKUCYM2mEZ6zgg
 kga5YJyPmn4Xybho/8bZSkXsTRF9slkY6aQwICTsGgCwLITzSMA9f8Two
 Ih/EDJAa2fr0fBQ4xs+wfw3d3eHxvRTl8eMX7HEfQU7JHtcwIs+bp/Du8
 SKKS7GWocESmeOHGhJ3kUaQ8HTRkgDGh7yO3CU2Q//+Mrw0jBsoVh/FOX Q==;
X-CSE-ConnectionGUID: jsBBge0ARniIIgu/mR6bXA==
X-CSE-MsgGUID: icURmw+GS0q+BujZDh9SgA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="34188661"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="34188661"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 21:09:26 -0700
X-CSE-ConnectionGUID: n0UzC0hHQfa6UEb93i9bTg==
X-CSE-MsgGUID: 2CJQroXTQcamfQ5KahEpfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="45780445"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 21:09:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 21:09:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 21:09:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 21:09:25 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 21:09:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7M0gfPLXvWMi7zr/cUZjR1EsTGnDMPCbQwZCVbQfvyoNE8v0sOsyq8yLFdd0LFhO70qIp22JKW27K0NrhWQxUZUVQbhcP+LGQhGxuLDUsoQJ5Xv8gcc+IB9kxcnid4QhnQib5qbodZp4OF6Dirdx9yIClFWPUj+R/fRzld82MZSJpqGGhlqpNsNj7FH3izLmfIqcM8GEIxQKsK4/JO3cJl95mskrKh5qbcAK7uraEIOriz7ps/OULdWT3Db3XChHW6eN86CO5/y1u61mHKoEmUlm9vjGyI1+JqU5g5fntjz7sXOGbGqDG4ZbEqvFxukOyk47pvBoT8pIguKFBoLew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qjlp9Hvz3TO0oTvUTqWNO1Ip41QWoPUDE45yLL7qb6U=;
 b=brry0k/xUMRXuc38D2q1i7egu6NCc+VdvhhvpZZwg6qLEd5c7nfINIEXlszy1RC/0WwbFLDsFvTRsKTw8dffCVigN/NLT2ojta4uFfHu44KVy49+WSgVPabe1xrqmnjisHjOQbZ/ixZXSfygL8FjLnHihaurFlb6naOBRsHVqyyIutGJ6VXAO/GhQT4d8nkuJG9dsTce/EsdP2moYCh2/K/3rgNm8dKm66vdzi8csPJxlZ4aI1bj6tn+GLE2bbSCp/LDbSdIWbyHybySLOEWzBqTM2Jml4JaMMtIOQs9l4cH1KQIdnqdpRdgXHbkUnt/SJtvCTof0wPKrJ8FRRR24A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by MN2PR11MB4678.namprd11.prod.outlook.com (2603:10b6:208:264::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Wed, 17 Apr
 2024 04:09:23 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::cea4:315b:52ce:11f2]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::cea4:315b:52ce:11f2%3]) with mapi id 15.20.7472.027; Wed, 17 Apr 2024
 04:09:23 +0000
Message-ID: <c532700f-1b62-4def-a03f-8cf5110740b9@intel.com>
Date: Wed, 17 Apr 2024 09:39:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/xe/gsc: define GSCCS for LNL
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240416222159.1332619-1-daniele.ceraolospurio@intel.com>
 <20240416222159.1332619-2-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
In-Reply-To: <20240416222159.1332619-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0158.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::11) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|MN2PR11MB4678:EE_
X-MS-Office365-Filtering-Correlation-Id: 13706287-6ced-439d-8d9d-08dc5e9429b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZkzSVuOCw3greD5PFrHexpXHHu7hLPVVFn5+SzF2CC084hO9U5sezRXV+ZYEJ+UJxc3uaADsNp8lK68zysLYt1GktpNxmbjJUQBD5ZK63d/bP4pBdkr3HGykqonZt6GYUk44AzvdbGnQl3GjMzhXixcF8mcGoNI1pOSyFvcz/R/6Q5MSTNXN/hcVaR6HKbLus/o+MK3vNfgHu0Kw8dCjYnp+M1o/sH6D1fvogsSs6BSQUv+a2HIV/UttLQ/xiHzPRE25BulUk1+3T3avLbQPY3UCqTFEaCY/FXOcX6M30Oo1UARXkTHrfvrBnn8Raqv3PfMbSb4ijLjQOiYl53Lwxlc6bU1z5R5f2/ZExMc7fdygBX84SDTzbQXatusLBNwXfoQo1hblSOGGz4s3yoIPa2dxLohMAZPki+xXWFty4bs+JqEEh2BO05RvJL/1VCg85adBtyq7SeNyCu/Qe53nKvWhikcdVMo2RaAkfjg5P8BEWX3ozx3oXw4H2oAw23Pf0/106f2T4XsKShyeSwfV66auPstO4EytlBshW5uH3EB6wyXbYqGEZoCOk3W7BsLcVz+cIWzcTKswhBzTPdMYoEt3EJAqHHBefyTLKFiftP7HOZclnhkQqpjB7d7gSbb/VH3VUIXO2Zd3uBHaTwIhiT5OB0pv31XokAdLAa6zpGo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWNCZStobXRQSEh6THc2eDBOaE5sQnVuSWJOdk4wK2dqclBaSmxrbTdHekJY?=
 =?utf-8?B?VkZtYnFDcTdCbXl5VlNieHN1TjhRTzFUTzNpSUN6NXNwVVN5MzRyRmIwZGhV?=
 =?utf-8?B?Uy9sTWxSZXpmNDVOUFhoSnJNU0JWenQ2VXpjQVFiaGRmTDN3Yk5xbExsZW5L?=
 =?utf-8?B?R1VodmxwQzJuYzBNM2RoalY3K1R6U216L3hpM0UwcjlabDFFMkllb250U21X?=
 =?utf-8?B?dXBuZER1MStwMGRUOVNQd0JVZzdyb09Oaml6SjNWSVVmQk5GWUZHL0lvK2xn?=
 =?utf-8?B?TmpMZnJ2RFM5aDlLdEV6Q3ovN0dlOW1uZmlFRHFrejdzajlJU3lZd0xjbjV1?=
 =?utf-8?B?NHdYb3dpMmRNd0lrRnBoL0lvZkEzaFpBeFZKM0p6c0w5d0JjZ1hzSUh0QTZ0?=
 =?utf-8?B?VU9lSGNRRzdhZ056VkU2bWFaSlF2VXN0SW90ejV4UGNVNm9weWE0UVNBaDRm?=
 =?utf-8?B?WjVmbkV1T3pBbEQ0SlRqOUJvOWJzVDduZGgvdWxjM2hLWjdHMnBEaVM5ZUpI?=
 =?utf-8?B?QUR0WkJQbmg4V0dHcnZvbGtnckJVQ29hZ1ZvYWdGM2lCamVJclg3QjlFVGcz?=
 =?utf-8?B?d0pCNjNLWklMbTR1Z0UwYzByVkQ1VlpERk0wSWFlQ2tpYzVlSW1OMFZ2STlu?=
 =?utf-8?B?d0cxVmMyRWZVNzB4TFQ4R0ZQVTRDeEZVUU9xQzdBV00zNmtTWVZid003cnFG?=
 =?utf-8?B?UGV5STM0a1o1bzJ2Ym1Xb2RnWTd4TzFvL3JXZ3dqc0FWQVdsZEYwTm9QcFZu?=
 =?utf-8?B?NlJ6SUZNdVhpZkRabC9DbktuSGdFN05BclJLSzJOcVNQcE53NmVXVjA0Yito?=
 =?utf-8?B?dlhMdVM2VFhLWURZdldVQ1Q1ZVFlTVM3NVNNWGdJenJnZVZaZ1FnV2JpMDJL?=
 =?utf-8?B?SHNiTWJzR0xsZXFGaW1OVEQ1dkFPRlBNWmNUNy9KbVRwYVY1eldEd1AxMWxM?=
 =?utf-8?B?YVJKZXgvd0QvUGJ2dnJBME5nRFBadlBIUFlnZzRuaExlMm1YSk1PSUh3cFNR?=
 =?utf-8?B?Y2NVRXVIWktYSUcxbnFBTjRoeUtPV3hySjQ5aEV4UXluY1BNMU8wNUVEN0NN?=
 =?utf-8?B?NWVERHJPS2VtMHJidWczRTBpMmJvZ0VEN0RKNHRkZ3h2dVFwQUYwUG03SXNS?=
 =?utf-8?B?WWhLb2djd3N6N3pVdWR5ME9Bd1haZVdNSWNwd0dPQjBIWExNN1B2azlCU3dI?=
 =?utf-8?B?T21ZUlpsVEl6N1NUUzZybXJMMDdSS2p2Nm0xVTUzcGZHNnZKdEREd1dJSlVU?=
 =?utf-8?B?MWtkeVhuK3FiMFF2SEd0bnh0UFVnWmJsenZuSGNBSWt2d3FqZ0RGV3U4Z294?=
 =?utf-8?B?ZkZWNEo1V0lNK0l3U09GYmljY1VFaW10Tm1kb2hmZ3MwUUlkOXR1RmRXMmpp?=
 =?utf-8?B?akNHQTgyMWNFam51QnFBNStwZy9pQmV2QUtkYUtxeHViNnhMWUlmaTc1c2NG?=
 =?utf-8?B?WWluaFhnakRsajZIVUtGVmVYVTZ2eDdLdmhlK01kOFdiUVZYbUtZVnZMMHdM?=
 =?utf-8?B?MTRUTzF1QTRhOVpMVlIzR1JzMXp4TCs4RGNDWjdySC9HdWZZL05lOEFELy9X?=
 =?utf-8?B?SkVDRkZZdWhDZ09KM3hma0lGNXREWE9uWXl6ZlJOM2w2RU5FbDFXZE9tMDNy?=
 =?utf-8?B?YnV0aVAxRlM2Smg5QWdtSTlhNlZvdGRtRGJlc1QvUjNnNGNoZ0Jwak5Ndk5K?=
 =?utf-8?B?KzJZalJ0TmEzZEpBdW9ndERPZnZCTnVXNTJTWTdNNW1WWUpnbVVtVGNwWWZy?=
 =?utf-8?B?ZjdxbUZydVJscEU5TFFPaHRDbVNqRjByd25qd0puck5rcGlCREVoQjFodVg4?=
 =?utf-8?B?Smk2VDNINGR2QlZsZlJxeEdpcVkxMUxtd2xuaGlFU3VPL2JEMnp1b2UrcGNh?=
 =?utf-8?B?Ykg4WkoyYTFzby9pbVRkbzUrVmFVRGlMNHFFZEZKR1dncmVIUElneC8vQUxQ?=
 =?utf-8?B?bW8zaG1WY3A4MWhRUElXSGNvb01uODJndHdOMWFtUUJ4UmR5cVFLbjBPcjdj?=
 =?utf-8?B?VFpzZW1jcU5BVEdHWWxNdTRrTFpFT1V0RUdZTkQzYlJwa25QWEpJdG44Qy9n?=
 =?utf-8?B?eDhveFYxNHUrMzdVa2owR3lWdnp0OUtqNzJ3ZjNyMVJmZEw2YjV4UW10S1k4?=
 =?utf-8?B?MjFsdFhBWUNKaXl1RkdKYmtkZU9uQVEvM0lsUTVlVmV5cVNZeXpGZkx1MTB1?=
 =?utf-8?B?YlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13706287-6ced-439d-8d9d-08dc5e9429b1
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 04:09:23.0124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +XUKtkw15lK3okjlfYlLhJqirg9Moxd1UtMOBI70JUUk49Id9KF5yZvC70fSrsSIr6tmV7BrFKa7+F5Na1YpMHz+fdha23q8aujl6Gv0a1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4678
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


On 4/17/2024 03:51, Daniele Ceraolo Spurio wrote:
> LNL has 1 GSCCS, same as MTL. Note that the GSCCS will be disabled until
> we have a GSC FW defined, but having it in the list of engine is a
> requirement to add such definition.
Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 3b30353dbc09..ad46ed6a2de7 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -209,7 +209,8 @@ static const struct xe_media_desc media_xelpmp = {
>   static const struct xe_media_desc media_xe2 = {
>   	.name = "Xe2_LPM / Xe2_HPM",
>   	.hw_engine_mask =
> -		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0), /* TODO: GSC0 */
> +		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0) |
> +		BIT(XE_HW_ENGINE_GSCCS0)
>   };
>   
>   static const struct xe_device_desc tgl_desc = {

-- 
-shekhar

