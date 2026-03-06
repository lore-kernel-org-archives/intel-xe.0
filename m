Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB098F513F6
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 04:56:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB4D10E144;
	Fri,  6 Mar 2026 04:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OD69y15Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0497F10E144
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Mar 2026 04:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772773002; x=1804309002;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=AQofbT+/F2ZFz28W1aoGP2Jz5+Yp3IiEob5ssmEvkZY=;
 b=OD69y15ZiW0FsBnxYxutLTtaysrx5ed1WVlfv666lORILmz0NxC3jWMc
 EhxoamRsge4wVV49uVjIeDe+Xe61OOwurEmhMjjIeM8/6voHfd81ra6tV
 54qeZb11SF4EqYtGMdnZbNSxzaCHavOh2+od0/CvWlZeMYH6hdCB4aHnp
 EJDOzzEF1p8SD1kNA6UHukOmmzSYYRrU1Ik4l++g8L5D+bNd4N44l/pHI
 Y3BSevZYZ4oiqvdpcw2MR2cCp3vPYu+/6Ca4zhk42kVA/wuT4Rqs9Nl13
 UCpe1GYrljGjKLoH9EiuOmzcS2alfa07f4XfiZHuynrwhMJvO/THKJMBB Q==;
X-CSE-ConnectionGUID: ethndknPTPezCKIR1bRbnw==
X-CSE-MsgGUID: 4CKjzXFUSwyNCkuPGOopVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="76480433"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="76480433"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 20:56:40 -0800
X-CSE-ConnectionGUID: wuiAZqV9QH+nJm04rNz7fQ==
X-CSE-MsgGUID: AfbV0/eoTLC7PJZuCNG6+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="223387316"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 20:56:41 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 20:56:40 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 20:56:40 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 20:56:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVQPBVSsX+jq8Gi+NGpi7G5Z8hJ8+iPnmKIMM4l8KPvGOaXn2kY6CTzogjicKg4tHfdm+H04En3JgBtEJxi2CHi/ZT3Kwd5p2gmFmIDldxZnFaIhZyQ3Ke3dPPQovqOqJ9npriKj2jFMPIVxtknnhlw4uDdlVAolKOWYktvG9ksdM302OHSnGrRQM3Zh3rz18McMuv3JcN3CyAdhLBilm/wJtzsg5vMysA3SKnq+fsue69tsu6eK5RPqUQGh4j6BoxmXLgCfsNcfMEdcqeezQVj59o0w0Zc8E+5KAUL/Yag++huytLX9Kf/FVjOkhZtNbSjn3oE2ZbaTJgvgGDL+rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OC7E+WmmAQNyl1YOYYiSoA8FTSLjD8zkwsoGLpKwW3c=;
 b=sJVvffMpBlgobaMXctg49dA4R4tB9pOPsecfVo14MzRwgnkZOme3xeQdHM2M+rF3jQlQybfT4jVc81rsaEyZ05m01zo3KrDQoxLgQACv4lwsUO9bMck0e4htmhoV591U88Coo3bCSKWJhH4Ui2+Yrl2KLWn3ESqTBy1wjJdIv+wjDf50J+8KCKz9Rscn04/1DICiRIlgVGcBG+pkpe0zTGWCsPk5USiAfqu0z8mwsKpD3ZaOUdjYyRJqG8+n+b7dUu+jLmsr4HKkNgPMDka1qPpZkxVxElDOaqFIRJFPqBtOcc6Gc8JTKoAtHXxvy9De63NUOqh1GqSjyNGIsVR8rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY5PR11MB6284.namprd11.prod.outlook.com (2603:10b6:930:20::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18; Fri, 6 Mar 2026 04:56:34 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 04:56:31 +0000
Message-ID: <a9948086-90f0-4ac7-a5d3-ff3e0ed75264@intel.com>
Date: Fri, 6 Mar 2026 10:26:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Don't disable GuCRC in suspend path
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260303181416.3880937-1-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20260303181416.3880937-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0035.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY5PR11MB6284:EE_
X-MS-Office365-Filtering-Correlation-Id: 38ba87cf-96e2-4f8d-3209-08de7b3cbbcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: Zr3TU5tO1x8X942eL6yFaqqayqRu6PU4Y6Kw22iPhJhBGsC3mgRz2IRWZzlzku9wTxjMtN52N+pgPr1blagFNVRQ92Y3+gCrBEzxDb/fWAaJ9Wm+5kGo2y5imcT+MNFRSlLKMQROYyDv/0tPNDvh75ocu1cixyt8y2PzYW47+jrqUhyduy7g3/gpYg+8yEl+Q2p2iNOvinrHSSSTzJOYSZI9OmjjaACdkbAJV6mPdoLlNIP2Qv7f4QYNR8q2FjnjNp9JbEzhuyZhRUjQbcZBN6o52oZrzzVEZq7K+dDvwulyIEk3G3qtMD1jBQiXIhVtTh876OCzb0bd+dWetiZW4G5c7Vt6LnKV58qGbWv/Vp/o3USD+H94xXFT8lmRXQTq8lM7kt1D5RwySdd7KB3eljUCaEVV3lEvz5SvcxA6AFEqY87yaZ3PUFEAo1sYGbvAS8/s/fDGWJEMzxA+tbKEV0WvdXW59X+MN5Gjz8LCyFS5Eo4qBg/i42AFNEcAAiKZh+QvAvhjMgcMZ4ly5c2mzmGYhbEk4TLQx4/tpho7/O/O799htXSImYnPVmaMD3s5i61Q29FujI/636qbzWZoddYO0Wo8NeuX0d5UWnnSIOEgqItZ4AwmYY7t9A1BeaAGV2IORXDUqCIGAnvAgrth3EJxU7pnwjT5oZiEKP0A0EPZ7fr9szNsze6Ig75HbN+X
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UG1TNm5ZS2Q2ZG1sNm0rVzh0MitPQVo2YjUzYzNuWGJialRSM3U2ZGxyL2xa?=
 =?utf-8?B?TDNsa1paMG1mMWhUdHprM28vMlZkMjRRS3FZYUlrOTVlUndqckxWNnN4VXZ1?=
 =?utf-8?B?bDAwazFoRjk4WlFmLy9XQ0FObEMvMDVydCtVSEMyU2V1RURXa01PWmZ6bVBh?=
 =?utf-8?B?bmM5OTI3dGJkY09sVWVaVUpNeWh5citXVjN4U3UrdkdSa0trV2xLY0dkVDVn?=
 =?utf-8?B?ZUlOSzJQY3lxRzh2S0l0cUVJbU04RHNwZ2E2b3RWUGRnYmNKUFQzUlJUZGJr?=
 =?utf-8?B?NldmTU5lSUpYUnpkZ3kvQnlSRGFpaytBNHRuSlhhVmxPT1h2VDZRUjZib3Ba?=
 =?utf-8?B?ZFpEZkMrVURpNzhvSk12TmVkSDUxbm5CWTg2cmhqUTRqU1F0bXVCb2FFcHpa?=
 =?utf-8?B?dVJQYXNFVnBvQm8yZDB3bks1ZURYUFRCR1pmWFdtYXl4eldqNmsvZlgzU3V3?=
 =?utf-8?B?V2hjWTZJTlM0U2wyY1hKV0kxRVRSQlFxY2lZUlJzODhVL1NpRE9COGlOYjlt?=
 =?utf-8?B?cWJ1R21iQWtjNDRGTFdWeXByajk5VHV6MEZzL1JGOVNVelhxV3V6WTRqY2dB?=
 =?utf-8?B?Y2xDdTZSbEpDeTJWb2FmT1VQV3hBdUkrK280WjhyYTBKVWlxYnhudHZ1clF4?=
 =?utf-8?B?T1BubjdFOEk1NjFDZk5lSCttT2U4UHpSaVVybmd0NkliVmJNdmJmT3MrUi9x?=
 =?utf-8?B?T0tUVkdYd2VNTU1Eb2pGZ2tqSzVNcU9lR25MOTZwQ1B2a1pNYkpVZ0pXQnRZ?=
 =?utf-8?B?M21nbXR6VzBXRDByeW94VGpPREh3MHgwc2g1Rnh0elBMNlBvczZwNFRTT0Rq?=
 =?utf-8?B?R0dXVk1TZmFUQjFkUVd6SGNmdE1ONHByaGErNGRndzZiL1UwOGc5NThqQjZH?=
 =?utf-8?B?VTYyWGdFNlBia0hzZGhKMGtkdWx2QXJkR014U05sTFN6cEdZenZDZTUzcTMr?=
 =?utf-8?B?dlZmcnJGV3V5UTUwZG5Zb3lpMExyWmJRSjhSdWIwUDR0Z3ZLNitucjQza2Iw?=
 =?utf-8?B?cGhCdzhZcHJXV1loVWdmNnFaNkdMbjA5YWNjTHcxU1dGOWxhYmxtd21ZYkRa?=
 =?utf-8?B?bnY5eHFhOGUxNk5FSmxrdHNyZ05wRm9GS1YyTnZGMmk3SnVPZlVmQndOT3RN?=
 =?utf-8?B?RUI5R25RUGtQdkpEeDdtRSt0NDczUGYxSFlpb0xwVWlVMWE3MFg4eU1TSWJv?=
 =?utf-8?B?UGFDVXVSdld6M2RkWS9pU1dCVGJFS1J5RXFzMzdMbUN4SFV1c1FnU3BtQ1lN?=
 =?utf-8?B?aXhTc3loMll2THRVODFxQjdLZld1OGxLLytIZDVjRkt6NnRYb3FVUllWRS9z?=
 =?utf-8?B?SmJlNVliWU1wNzc1QUdaNUtEMm94QVN4Q0xmMTc1MVRrRUZIbk1DeGJyM25D?=
 =?utf-8?B?ZVdRaW5adFl3U1JxRXI3aldDL0RTQUZXeHJMSVNGNHpwQ005VVFESFJGUWFm?=
 =?utf-8?B?aFkvaXpMTDBnaUh6UHUxdnhQUkRlbmVJeFNHMzZsd1pYcHRZTllxcFUrc1Rx?=
 =?utf-8?B?S0hBSWpDSmE1ZmIxQUpXbER1amdqVmZzd3R0RVp4eDNUbXBpcm1YRkdkOUt0?=
 =?utf-8?B?dFd4UDQ3TG1CaEQzaVIyS3BUTTJNWTQ5SVAvdFJ2Nnk4ZFBMSWE3M1JqZTdr?=
 =?utf-8?B?OWdyL0VXNnY5Z3VEK1FTSmMwZThKVjhmT2F4ZWxWa3ZDNm9xaS8yblo2WnBa?=
 =?utf-8?B?V2wyMnBxWjlZekZWdys5eG0rL2g0QnVYaGlSTjd3dzdmNGFIaGFSb0R0SEZB?=
 =?utf-8?B?ZVE0TWtlMXRaNllla0swYWNKRWR6bHBlaXlCK0JLOWNMNks5b3ZQYlB0T0I1?=
 =?utf-8?B?VHk1cmdUTGgyem1KSWw5VkRvN05EYjQ4ME5PMERQYTU5QVl5NWF1NUplZGdu?=
 =?utf-8?B?YTg4VzJNQ3F0aUNVNkNVcEhva0ZnS1RaVU9BbkxkNXVzeHpYaWxOMmkrYlJY?=
 =?utf-8?B?Qlh5TXpmNEViZVZjZnZtSmtmbEVxUDdvaS9ScUwwSG95OHFNZU43YTdaeUNU?=
 =?utf-8?B?NFFnc2ltK1ZQbDhYWjB1QUtoa093S3BPbGE1SVBvQ0c4UzRpR1RMUGcwKzJa?=
 =?utf-8?B?a0JlYzMwVmF3TFB6Snp3RDgrUk13Q3kvZHhRVytHdzVxS0l1a2hLVitRRVor?=
 =?utf-8?B?R2lOeCtYaWRFaVFzdGFRSDlMSzRkTWNVa0UrRVBzbXQ2YlZFdkVPU1NsOGk4?=
 =?utf-8?B?cm9XSUtIbXQxVWkwRXFLbVlIekxqVVNxWEZIZk1wRFRPaVBiNzZMTFQvU25C?=
 =?utf-8?B?TzUxUGJjZzI4V080K01xVStmWVpPT0RvZi8vTVF2TWJGbnp0V0d1RjhCU3cw?=
 =?utf-8?B?UmorWXB2cmRsblpRN05tdkphajJNQ0xwRE9FdjF6KzFHOGREdWErdz09?=
X-Exchange-RoutingPolicyChecked: SIdLJWZr469KC0AKy97Bq6XDWdo3FZP4lJNsgBDKU5zQ7/PEaRXe5KtyDsRPEUWdRo53FLyXwVRZyfi0Y0ZPpRhmTpKKiXYoX6fiHp5rTC5A0sA9s7sUuTWnXsZHVzAtfCcXsi5WhkSY2vxM4A+B+VZ/fWXNWliYGJ8WQSPNbXdWDcAbWm67Rbx45ui9T5eFMOLTitatjiYGsLezXa2F/BJh2u6oeMyVq44oxoUXY4cbsp324yISfL5mNFwggUvXXV8zei72UcUWYxj8pnFsh9HlJ8nZnaFIIh47oyvOm2oV97XaqbEfd5kMUf15G5csbogBZLjtOqyAvQ6h5LgOpQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ba87cf-96e2-4f8d-3209-08de7b3cbbcf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 04:56:31.6753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +DEdpVcvia86RfLMRdkugjSwV632pbYE7LDtfDc9369D8CI87g4UBJEGR5pxP1RMEsr4O51k44Wsjx7xFVRuiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6284
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

Hi Vinay

On 3/3/2026 11:44 PM, Vinay Belgaumkar wrote:
> GuCRC should not be disabled in xe_guc_stop_prepare() as C6 is a
> prerequisite for s0ix and s2idle. This is a regression caused by
> the patch below.

I thought since it's used in xe_uc_stop_prepare. It should've been fine.
But I remember this issue now where gucrc shouldn't be disabled during 
suspend.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7510
> Fixes: 40a684f91d26 ("drm/xe: Decouple GuC RC code from xe_guc_pc")
> Cc: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c  | 2 ++
>   drivers/gpu/drm/xe/xe_guc.c | 1 -
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index b455af1e6072..f3bb856aad2a 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -38,6 +38,7 @@
>   #include "xe_gt_topology.h"
>   #include "xe_guc_exec_queue_types.h"
>   #include "xe_guc_pc.h"
> +#include "xe_guc_rc.h"
>   #include "xe_guc_submit.h"
>   #include "xe_hw_fence.h"
>   #include "xe_hw_engine_class_sysfs.h"
> @@ -896,6 +897,7 @@ static void gt_reset_worker(struct work_struct *w)
>   	if (IS_SRIOV_PF(gt_to_xe(gt)))
>   		xe_gt_sriov_pf_stop_prepare(gt);
>   
> +	xe_guc_rc_disable(&gt->uc.guc);

Do you think we need it in gt_reset. Though i had retained it in my 
initial patch since it was part of uc_stop

But i think it should be safer since we restart post gt_reset

Sorry for having missed this during review. Even i didn't recall this issue

Reviewed-by: Riana Tauro <riana.tauro@intel.com>



>   	xe_uc_stop_prepare(&gt->uc);
>   	xe_pagefault_reset(gt_to_xe(gt), gt);
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 54d2fc780127..e75653a5e797 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1671,7 +1671,6 @@ void xe_guc_stop_prepare(struct xe_guc *guc)
>   	if (!IS_SRIOV_VF(guc_to_xe(guc))) {
>   		int err;
>   
> -		xe_guc_rc_disable(guc);
>   		err = xe_guc_pc_stop(&guc->pc);
>   		xe_gt_WARN(guc_to_gt(guc), err, "Failed to stop GuC PC: %pe\n",
>   			   ERR_PTR(err));

