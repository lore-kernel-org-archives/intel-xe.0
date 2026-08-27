Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6716C61DC4
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 20:25:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B13710E1F8;
	Thu, 27 Aug 2026 20:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YiEZMlI3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD4010E1F8
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 20:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787862317; x=1819398317;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QA4PiTUxYsO1jS752iqDe4cuW8PKb6xoyP23Mn1/tRw=;
 b=YiEZMlI3FUTPFqdp8X+9d+gsvRkRwO84QAOex72k5emrQkMS5OB6kDDS
 8Y6DtLlN6SXHvYJ4/CpzHtBbyn+HEIOoOlaJB8pfhI3dxSoy+ePKC94Jo
 T6ls2FvAY3s44PKCmbTPUtHpIE9zglwilpLjFNjYGA2gtRjBJIAexemOz
 XyfaRqiCF/MwvX6BfpQmM1QNRo2y8Rx5rGCrGPETdUXOx2k8Ha5VOjugU
 /q03sXrSSxAtAb7wfA8nxQczNoGu7/LvYAuBh7W7OHLYVD4RjmrG6tOi9
 vvjN/ilZhPZchQwvJek0InHV0KYjy6BdufVV3urRX3oeCG7R6C0InKyFW A==;
X-CSE-ConnectionGUID: 10LeGm8BSS6g911+95F2Yw==
X-CSE-MsgGUID: HIg91+2TRI2nyAR4bEHJ4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="105894320"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="105894320"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 13:25:16 -0700
X-CSE-ConnectionGUID: +Bc3I5SOQpidzs7PrswFnA==
X-CSE-MsgGUID: d3YpNWmLQG6laAg47dIu1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; d="scan'208";a="271505229"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 13:25:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 13:25:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 27 Aug 2026 13:25:16 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.60) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 27 Aug 2026 13:25:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dB836ABJUwLdnpFDPU5xHlEX7+WS/X+ZGLyOQv1bzm52thIWBQyZoyuP5VFE/fA4nFeFhrI+ccDjs3tRanKY5gq7WVDXE3oRcxu2gskAJ2Oid+Fy9H44PJjJ84USNyAhXNLHdqzbNfCoi3K5/AU8oJsVg6/lJ2nVpKX390lNXoaTDB1FbcGY2OSj63WQKVJ6QxVRMMQZte1miua/mRc8tPoE0SAX7whsabbXZo9SftnX9ZwDVq+9jj1hVyOb+/nwiOFYFF9cwGqga6K9jlGTy5n1bY4olhSgkXO5s+xkP2u0B7rpVQZceSvDpdrBoEYZA6Gb+RfG7Lb6q0EHckipnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VDkJMI0laiCo4bRYZAnd2b4taz/YwAAC2PDbHlyws54=;
 b=M8NP7e+9jB5PG7dtZRxP8U7B4KLhK7WE+ki+HMtHFKvg3yRCAZZLkfVDuPyUafxOZWN6VIbvYrDYCHphyzqj/EBzcs/o5fIoFfk6VxXymGWc2ozqSn7x+AXbzX8zYul97bWyYxgvFnUCXlejVFNq/9c8xHorcA/L7/9v3zBnoWSh9SDrfrLE1K1PVevTk4bi2o2kUg5vykxw70AM6MwSKvKkONBL4jCMSRacrmL68aNF/zTDvkxWu69K2GyT1IX47RDYmziW0+mK6kvDIn+PGsb7Dpi3N8iYyd2E3reD43Mj7nspAvIjHTOl1ATqXwLIbAO8XqVGOPSZGcYGVH9ePQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS0PR11MB9453.namprd11.prod.outlook.com (2603:10b6:8:298::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Thu, 27 Aug
 2026 20:25:14 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 20:25:14 +0000
Message-ID: <4d776e56-a51d-4ecf-9c88-1a33eebe976b@intel.com>
Date: Thu, 27 Aug 2026 22:25:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] drm/xe/ras: Report device memory errors using
 SIGID
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <daniele.ceraolospurio@intel.com>, <raag.jadav@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <aravind.iddamsetty@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <arvind.yadav@intel.com>
References: <20260825175916.1103841-13-badal.nilawar@intel.com>
 <20260825175916.1103841-21-badal.nilawar@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260825175916.1103841-21-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0077.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:352::8) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS0PR11MB9453:EE_
X-MS-Office365-Filtering-Correlation-Id: 0827204e-a7b6-45b9-4085-08df04794d08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: WkObT96xcUUhW3IaHpMlGMSfWk8IHMAzU+CzwWoyLI+/1ymOZLN7kxjW6N7DqqXCRI7XR8snn4iKWJ0clRKhBFFIDtJbq0qELe/IelmHM7Qg2JYgrR/ZxBOa2xXFXoxqF7NJP492b2sGJZ95AIKOcZG3kq6p85+Ma3yefewn933ALFpcjyM3mu+i6TeIJFjZDqMvmsJzGekN5uTi74+h75xsd4hC1ThpSE3sBy2/0Ya9mdPqiDWTWtYLhG6UMMDl6jUwGjx6IXZQa4AY+RwDSt5mmAYXmzm8x5HuguinGlIiHINj/BfiIwE0w4EF1MYZQENm+SHIOZCWOjYx1w2BY4SwqgcJRQPH97VbFotCJUQV6l+miG0l0MGrsWMTS7ebBbFoW10qeEiWIegcuElNplM+LJyF9eqJ6cKjtml9h3wDVgbhVoYT8dROok8nJ8s+bo5q58k6wxXLovBgRYgkR95lUGSNnKpVHfrgcBR4yJt5sLLWzy6FcUCK14FTYZna6evFDzilenDGSiaMaQlmg6bssPhC5Cr3kClvO3nstH+90Y/TDenQ/5nyqe2hkdLYnnxK03aU2cF7gfHSTpqTex6+zuNIVPqSfzXnpsyie6TdvQqCVj36DIb9sNseNSWMEzTt2wriVy2T1u2G2pRNjXNG1LDn59MZnHTEL1AA1iI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3JuTC9KYTkvekt6YlZmL3VsajNKc01CS3ByNjQwV0xwNE5TRUUybDVYQUVW?=
 =?utf-8?B?eTV0NnE3c1NFVUxBWXA3ank2VUFZRmFNSjhoZTNQdXJPMSt1OEVFQ054OEY4?=
 =?utf-8?B?eUpYdnlFSUViRVZVQVo3WEZFTDBYOFNrakRad1N6anErV1JtNlNnWDVzWkNR?=
 =?utf-8?B?bjQza1FmZUNnTEF1VU5zdy92RlYzMDBtZnpEem1ncVRiYjY5KzdpWnkvVmNp?=
 =?utf-8?B?VlplSzFPNllyLzcvbkEyYm5sME45VHJaOFFwbFEwZGJ2WWx1QmpCVWZJUmpM?=
 =?utf-8?B?SDc2T1IyQlZicHp0QlluZDAvVmtZYjlmM0dmbkUyQ3dnZU9xR1Yvb2xTbUhQ?=
 =?utf-8?B?dU9UaGZZK21DUnpvcTJEZm1yYXdkVFJZb1Z4VlRmYUlESFFuYyt1ZGxxa1BJ?=
 =?utf-8?B?c25vNUxyUjFqSUN2V2xVWmRMbmxxclZLQXA5VW91L2cwb1RNRnRRUkFaZ0dq?=
 =?utf-8?B?WFRseTdydUdZbkcxMXpONlFNd3p3WHJMK2JqVG0xTy9VOGNlK24vNVA1OEJV?=
 =?utf-8?B?RXp5SFRDNXJ4VUlROHF4YkMwQkR5QjVyeGFDZjdUSUo1OTFoMnBnd0NCK1BM?=
 =?utf-8?B?WEZYcG1WQjF0Zm9nbDBSMXVTODEzQlZrOG5qRmxmcjluaEJmV0J6OFFiQWJP?=
 =?utf-8?B?QUU0b0tvQy9HMmdvdWpOMVdGbk1TbDV1NlRFMmtmMjR1T3Y1RjJWNzlFZGRZ?=
 =?utf-8?B?Z0F4R1p5cEFGeWRBNjdTMmk5ZGk1ZzVSdDZrTld1VGtJVjBMcEpQVmc1Smgw?=
 =?utf-8?B?aEFzTTZhai9WMXVrZThwUXk0K09va0V5aGl3M3hjMHNTQitDWnozWkgvRE1R?=
 =?utf-8?B?RUNnSzRUYVplL3R5VEhJbXNzazJCOG9IUU0zekZ0V3cwbU40akNqVE85L2cv?=
 =?utf-8?B?UkoxdU5oNVhJUGQwbnIwWXUrckx2UEJLS1RPYjhTRDJYbTA1MzFuMzlsUUdK?=
 =?utf-8?B?TDFiakZKU3I2YmM2QkFLam1xRFA0ZWlYUmkwYkFtOEZQcVd4NEh5Z0dwLzBK?=
 =?utf-8?B?WjVSSGppS25KY2w2Zm8wcC8rdlRUREtWd1NMTU9HdC95SnMyeFI1U1JFN3dN?=
 =?utf-8?B?Y21OMWtncUQ3SGJaRGFjM3I5aFMwUlVjWDJQTVB1VHlWcG5jUG9MQ3BvVHYy?=
 =?utf-8?B?STNsK1N2MFNSMGdrb1NhYXQ2QzZGNnJPTGdua0wyT1oybjRPdHU1ME5za0cw?=
 =?utf-8?B?TXpCK2Y2dkMrV1hrMlhvcnBkeGpjUExyNWJrTXc2aThWSDF3VlpWYk9Wa0cw?=
 =?utf-8?B?dFIrT1dzUzdQeVQvL0FUYUVmNkpyVDFEUlZZa3ZjRys0ZDNiVmhQWGx3d3Qv?=
 =?utf-8?B?aXAxYU5vWDFadGh6bzl1aEJaaDUwUXBwbW0ralBmNlBEdDhUTDVDbVBFSmx2?=
 =?utf-8?B?WHlXK2FNb0JIcUJFWWsxQkNUSFhSdEpCMWF5NUVrZjZWeEJ5eGEreXNucG5B?=
 =?utf-8?B?K2NldFBXQ2pUUEluWE9pd3pDcnpZaFpuTy84OUkyU0FlbE5RaUNyYmYxS3Z2?=
 =?utf-8?B?RjBXTE0xclgzLzFkSUpLTEtjL0hZanROQUwrcDFENWJZZTdCZ2p4aDV6cTdI?=
 =?utf-8?B?eWszNHFzSGwvMUplL2tHWVhpOUVnQXNQRWRUaEhWU0loTDVadDY5dVF3dGN0?=
 =?utf-8?B?SitCNlM1RGQ3dTV3T00rejJwanZtTUZkVzl0SUtYL0RKa1lJYlNlZytmUFVi?=
 =?utf-8?B?WFlxNyttTDhFN2VaMWVLTnF4L0gxVGRrQTZ4RHgzMExOd0FncGZ5RDZ2OGM3?=
 =?utf-8?B?emt3WU9SeUNuWkpJdHVjUnFNdHZLUXE3VDhuMzFmMjlwajdoRnc1V0Vvb2Va?=
 =?utf-8?B?ZmNrVDB3bUxISTc0YzNoQkhKWHh6MEd1VGhlNkJWNXEvcmhnR3FSZGhieW14?=
 =?utf-8?B?cUxLUVlrcmZja05jbUlhdHpkcG85NWFuazdLeXdMYUhrU3BadEZUZzcrdEJF?=
 =?utf-8?B?cmRvbnB0ME83LzEwNUxGeDdWeTFFMTVIZWxRT1JIVE94dS95bzh3YzU1dW94?=
 =?utf-8?B?M1Z1KytxUlVxRzZzOHViNSs1Vnh2STJWV0lwZ0daVi9Xa3JSNDh3UUJ2OEov?=
 =?utf-8?B?UDdWdVdvQjFpWmkzcDJwbXU4UDNsRGtoYVBsL3FhWE9WWEt0ZkU4eTdNZTVi?=
 =?utf-8?B?YTF2a0hoZUJJNmNIVVZuUXY1QXNJTGhlL3V2YkxHOEYyRHFpa1NkWG1oZlU3?=
 =?utf-8?B?cWE3VmtlMmdqU2o5UHIxQlArQ1VGZHRHUFN4KythTGhkNXNRUW1XRzI4VW5G?=
 =?utf-8?B?RUJUZ2RjZko4SG43MTlMVFNlbjJPUVlMNGJsT2ZmSm5XV05GZGlxUng1aHdP?=
 =?utf-8?B?bWs3MFUwUUxnODFwQ29CdHFUckdMaTdGVWQrQmd4d1haOFN0S3U4SmdmRTZw?=
 =?utf-8?Q?Kx2kb6Pt/sZ56lHI=3D?=
X-Exchange-RoutingPolicyChecked: NjxQ4UZne+PEVB8qPVb8tayGK/fp1ba2jYPOFyM6ejKJKm9v3FkZmNyPw8AsLlt1senvkB76B6jBPr7mnsC+08ESbJOi8An82nNoZ/U0cl58JNxmHjgwE4Tgs7I/iRBYcVWNJarctYh2VEKW27EFmbFj1mdYS0T3wMa9aYznD2pfghAe2EsOjC/ZOm6dhW7ZKPUBvYPz7S5ooROjTxLkhuxfbI/pHue42a6o8Ar3CUGukJq4N28BuHYl8E9PLlVOSKJc4HwYxljFj/RU6gt85f9iONCNvwKud8iUaBm8DIqCQWwVtiU2TJn2xD6zbs5+OMiNtVmfYg+s8Ilm/iJS+g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0827204e-a7b6-45b9-4085-08df04794d08
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 20:25:14.1966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JBUTZtSUwd/KsRaIf9tKoTWUiDQQV7KhuDPqS6zTaETBQyIliXcBjI+4ge4F1YZcflUsjzkqHMz3ih5nZfpNJtpgWOS0zreviz7INKmT8dQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9453
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



On 8/25/2026 7:59 PM, Badal Nilawar wrote:
> Use xe_log_comp_info helper to report device memory errors.
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ras.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index b4cdb5ec6491..172653be1b82 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -409,14 +409,17 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>  	 */
>  	switch (info->category) {
>  	case XE_RAS_MEMORY_POISON:
> -		xe_info(xe, "[RAS]: Poison error detected\n");
> +		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
> +				 "Poison error detected\n");
>  		break;
>  	case XE_RAS_MEMORY_DATA_PARITY:
> -		xe_info(xe, "[RAS]: Data parity error detected\n");
> +		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
> +				 "Data parity error detected\n");
>  		break;
>  	case XE_RAS_MEMORY_DB_ECC:
> -		xe_info(xe, "[RAS]: Double-bit ECC error detected at sw address 0x%llx\n",
> -			info->sw_address);
> +		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
> +				 "Double-bit ECC error detected at sw address 0x%llx\n",
> +				 info->sw_address);

are we sure that all of above HW errors are INFORMATIONAL severity only?

>  		/* TODO: Add page offlining for Double-bit ECC error */
>  		fallthrough;
>  	default:

