Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8E0C5CFCF
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 09:48:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2843810E2D0;
	Tue, 11 Aug 2026 09:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kDi237sU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D687410E2D0
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 09:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786441696; x=1817977696;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zcuZYwelfVtC7d7Fg0YFxBlHJJSgR5MvONGx/anZ7TU=;
 b=kDi237sUdiCmSVC9+tfOJBBiOAzj9bFKdodTHnZkWn/v0K2Hz+9i9A7I
 gptXKyUq0U03XlAz2OVhSKWAUORMzpNIy6dTGBwkZ97q476WBH92f2sJ+
 r9Dyy2IUX7IpJtJFI8nyx8JlVcMtZ2NbDX+AS0vkMOK0Wk17t8voxxyCk
 om9Qn/rXrJUSzb801lUWwmibZVKbBhmHQZ6K75ZqEE7fW2Eyc7rS7IYYk
 H+G/YaWdxIYxc0NvkfpRx0DPTfcNfDjSIJb9UO763yI3IFiIyBCvmJZm7
 HSieo3Rh2eW7CCQNhxgARdJysamBWo2VaVqujqpwvJ2eUyvE7V/Axlr8F w==;
X-CSE-ConnectionGUID: I2UlrAweTf2DDvsQdNvdWg==
X-CSE-MsgGUID: d2sNwP9HQYaoyOOo0g59+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="87183121"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="87183121"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 02:48:15 -0700
X-CSE-ConnectionGUID: NZdrTNswRZ2r6JKfytoo8g==
X-CSE-MsgGUID: 2hrFWt1jTpGUuZb4hU/QLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="265298751"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 02:48:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 02:48:14 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 02:48:14 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.65) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 02:48:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZmPjjY3hkGvzQ6somlSjBSRpsyvBn9/cuY3Sw9+e57uLOJthLB8Rj54m/aFYIZ0tZPZns/7sew8n3c7/qgoMczq8QPs01jfwBHh3rZELgRn2J0sbU3HIc/VYG/xF8DW52NP0WNaQpE2CNOH73R0f2kFpiK79yg9k/IdRn0SU59WE3hOHwwlzSQGz5EvS9hciuD65trdDhiTapVTqLtJPQhkP56gJLNJZf/ZJp3kuYKat8+T9pL91I2zUDUFa7n/Vi9IxHeURHPX2n2lUx7DzMd5UnG0fa4wZu3mOXgI7CsfQUmyVj8kKeN28L7xyLKFctiiF5SiQ3tx+oeHpOO57hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UP0u5HDgbB6nhm9MzwXNdBQELsW+O7CM+XrA3t8Rubs=;
 b=ue8mLf+rbvzocmSgFesFyoV1vB4a1lEWx9Yh0No4UDMcmJbnmuzsObivJ3EXIxwIYqhegrhxUt/WJnD1kqU5L1Z2DD9UVPAz0zP0EdMW4EgAtTq5nb/sumwSa3NcKrS13tbCQNzuLumhCg6PNL1faetwoizNgZu1FsnAmM20gJrj9llwB3r6nEAR/WMwbxEs6OGDiQgnookBpunUwB15wYuKoJzXgaoOh5WG3/GWNX74J1kr90M6YDiWoZ3jpPpuIm1VfN6ruu9Y1oTH/rkNW4J9ZFmbbxs2flatITqTbYVvNaXxjbRW1NjwwnhKBYIGPxQpVxtg+ziItpFPHElIsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB6024.namprd11.prod.outlook.com (2603:10b6:408:17a::16)
 by CYXPR11MB8755.namprd11.prod.outlook.com (2603:10b6:930:e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 09:48:11 +0000
Received: from LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::38ad:3190:bbb2:412b]) by LV2PR11MB6024.namprd11.prod.outlook.com
 ([fe80::38ad:3190:bbb2:412b%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 09:48:11 +0000
Message-ID: <cd8aecc0-b9e3-42e8-bb4f-b29448cfd790@intel.com>
Date: Tue, 11 Aug 2026 11:48:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] drm/xe/vf: Add bounds checking for queried VRAM
 size
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260810101428.1009573-8-satyanarayana.k.v.p@intel.com>
 <20260810101428.1009573-13-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260810101428.1009573-13-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA3PEPF00000514.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::668) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB6024:EE_|CYXPR11MB8755:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ccd2301-5be8-455d-4534-08def78da806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|3023799007|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: scoLVQFy+1Kd7jJTKsgPmDhCTFc8DRp9yzaflSrv3L8yjwQ56MIJKlNcjdYlXncv2DWgROFYBUh397blh1nWyFmv/FRoBXFhT6HtpnyTxUyAdRueCdSYqFIAt2MELNvHK0/j8Wpmlmdg8pW+rPbUkI3gGoDfY4b4R6hoWHe3kGoJYmoeazHd1pLWVoVXv8jbDN6VvhG9A+vGVriTu3J2aJ8cm4fCnTm41/BwvAJ8z0UQcrwVcOPFWuVQqofAISO5yhGnSh3Cnxyf7qgGXuFhMGjJJOMsu7WipKE1DnX34/nag4Eyyw0+OXcpDXaGy2EB/T8ktq+UltkgZy+MYn34K4uS2khqX3ADaUCAFIIlqessGsdZ36AKC2oFJhIB77OhWa5voZM5D5KJuR+WziRTXB5+mNuV1jq6ZyXD/03aiD8ydfpHVzF1yrM+c0RDTJSUY4772Xqrwp/7CvcCTWXMvYshTr9liYNx2Wv8MmKPBbdGMr7ofkK1tZ5s3YNvOfqG53R4BLuinY+1XM22ACeKOl4Rp6IsUZF91s65BE6wZa+A7yPfqI04mbG6wzlZwmUfadFegp6A6yfvORi1Vmg5x12q/OWwpYXsrj2+sKCX34peDcgJ3N8xDnxjpSmVN0iJI838PC/KrDn8B9sOgMEh5l3lycBhk+xWjLfmCJu0ZNY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB6024.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(3023799007)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWpZV2ZFUitwY25HcTdYRjVnR3BxOHVMK05pT1ZSdjhmZGhteFNFTDhnZ0Jp?=
 =?utf-8?B?UVE2M213UWQvZGNvRXgyejFZbzNBNnBNdjdIeTBvOXlXRDJoSXYyT3NMblox?=
 =?utf-8?B?YXdocGVjaTB1bmpSalkvY0VxTzdsZ1JSamNLNGV4YnJaS2dGNS94K2w3b3pT?=
 =?utf-8?B?UmNTVGpYZWs4dElzcG92dkw5dWIzSWZ4WnZINGhRTElaRUZQQi9ReE0xc3Jl?=
 =?utf-8?B?dGtFMTZRYitXOWFSWHNJSGJCcVFvQVVkdFFSeUZSU2FaanJFTlBJQnk1YUpD?=
 =?utf-8?B?MW1QMlpxb0NZaGh6Q3RwRTlKUW9NbFlJNjVTZ09EYi94UEhxUllTcDJzbUIy?=
 =?utf-8?B?TWVtd1pKK0hJUElHOHdqU2MrdU5nTjUzbldGbnUyVWhVQlMvRDcxT21yYlFB?=
 =?utf-8?B?L1Ryd0xMdW9ZSGVMK1RFRjZtNlNzblpBdTJ5SjJOanpTNVhCZjZlNGNraVpr?=
 =?utf-8?B?UENzMHJvb2ZtZUs4a0QxSC9LZDE1SlE4RGsxdTNNMHo2VlNndVJVb1BDVkMx?=
 =?utf-8?B?azRvb01aKzF5MWtQL3ZvT3VvSldGVUxZR0c3VkhMZ21EbGl3VkNvUEZ1dW9H?=
 =?utf-8?B?THAxQ1drQUptdlNDNkxxV1c4Z0J6ME40bVplcUhWd2IzOGNucG10ck8wQ1hl?=
 =?utf-8?B?RVFBVU9pUURHSGpZc1J2NDlnYy9NQTlPK1gzQmFEN2c5NUp6NnNoNmpBS1px?=
 =?utf-8?B?c2NsemhuS09RaWhwWStGR2FZWm8zTEVYYmwyWFM2QU9pdXpuZThKZXBaeTIw?=
 =?utf-8?B?NTF4RWt6NVIzYitCY1VybkJPMzN3NFBUMSttZitWN2ZCd0JtVzRMU0lZZGpW?=
 =?utf-8?B?MFVFTjQxaE11OFg0MTBFOVluTTd6NkJIVXNiZ0xNUGNHaFU0K3Zua28xb3NZ?=
 =?utf-8?B?TzFWbWRUM3pPbjdKd2RVTVpnMXZURTZ0Ym1NcmxySnIzNUI4MjdHWFUvVHZV?=
 =?utf-8?B?Z2lWaXAwV05FeHpsbm1QYXJCNWxDZisvTG1HbEpjb01HWWljWFpJUDBtbUN5?=
 =?utf-8?B?V1dyQktMOGgwTlVRZGlBVDlmWWNvRzNldUN3ZVhKL1NZTlQ1RDNrMlRhV01I?=
 =?utf-8?B?aUMwamdwOCtiTFgydDhlVGRWN1I4ZW02NE51TnJYTm9tQldVcE5aMUZvaFYw?=
 =?utf-8?B?UjRoaVlic2d1Mkc3amxjQVA2L1lDK04yUy85N3dCSTlma1JoWkFEelF0emJG?=
 =?utf-8?B?V0Q5UDl3OUdkQTJTZ3N1N1BqcHFiRnV4SUxQbVV3bWNyMGtoRU9ub3BFejdE?=
 =?utf-8?B?VVBaZUhxbGxzU1NIYmRoNzFxN0V4cUlacEhwVENYRm9OYU53Y1g4VDJCOC9H?=
 =?utf-8?B?Ymh5T2szMTNHYXNyL1owRDlvTVdTNE90YXpxQ050aEhaMENtZERaV3dxME5k?=
 =?utf-8?B?K0ZHc0hEY3UzS2h0S3F0OUJudW1jem9yMU9tTG9ld0NMSzFSdytvN3hUaXVF?=
 =?utf-8?B?Uk9mbFFMQWlWTG9GUUxPWGZPMG1JVzFWcGZvN3JjTFMrVm0wSW9oMU9QNjVE?=
 =?utf-8?B?UXROMFdqZUNKdHR1NXAzMzlzWkdUM0lPOGw2TTFUTGRCOUh6MHNza2NmMTBp?=
 =?utf-8?B?L2V3V0RrR3JXOGdvL3dvZno3ZGVlVmhNRjlpWUZyVXp0aVc4aE5wczRuK0d5?=
 =?utf-8?B?Tmk1S2FjUTRPeFhhZXRrTjNwRzQzaFhJTitaRFg3K2MyL092Mm1GNTFhZUR5?=
 =?utf-8?B?TEJLTXpHNzQ5aWRDTzhadUVZb0NoSWtxMzZUNkluUGpMUWdSNmJxMjl4b2Uv?=
 =?utf-8?B?UWVXR0VzZGpxK29DSHluSS9kRVEybDZsSUVCeStjQWdnaE5pS25nSU9MbG02?=
 =?utf-8?B?WmtpSTg0ODlDcVlnKy8yeTRYOWNEVnFXbEJNNGVGZy9jVUQ2NUVId3l0Kzl3?=
 =?utf-8?B?bGlEbThNYXFXZzZ4VFkvWnljbDJHWTA1ZGdqWm5LUVVtT3BsQjI2YWpoN1Fw?=
 =?utf-8?B?eEllZXcyUVZ1TEhoNHJ1MHp6cWdHbFdaVjNjN3h5elFmY01sdlNKT1lSTWZR?=
 =?utf-8?B?S3BJOVAvMTdmK2JQL0tWQ29IaFB1WkRLUWZZcnYySEZvY2NvaFpFdDdzRDFY?=
 =?utf-8?B?N21UblVPdmVKbXpReE9rcWs1bWFSRXVuZ2NBd2ltci9OQWViNUgxNnNWVUds?=
 =?utf-8?B?ZnVoLzQ2Z043UW0yTERaOHk2RUVrcklTUXhFV2lMQ2JlVVVjcWVqTmV6WFlx?=
 =?utf-8?B?MkZoTE4zL2NNdDYvZzZmNThxVGYvMU55OVlwWXhiSFpJVUlhb0NZYWRQN3Ny?=
 =?utf-8?B?SEFJR3c3TzVlbDF1VHlSUElkaHoweXA0S1Z6Wk5QTDZJVU1XVE15R1Q3cThI?=
 =?utf-8?B?SER0SWdjZVY3K2Z1UTh6YWJKM1ZjWWR6ZUk0ejZZcEtQd0svTlZXUzdQdits?=
 =?utf-8?Q?ZvDSvr4lZ/R588Vo=3D?=
X-Exchange-RoutingPolicyChecked: pMKQPqTHQa+RucAIkie8JOYapFvfS/GQRKu+HiyGs9v6DeuD9i6T+reh717nki1WF8M69r4nucTVAOmcMzjldH/pXx3j360gMpozxZnYXHU0ggDedwST1PZS1f9CbyOn/a7mlm53NZeo3tUFDi7K+3hq+Q/C1vHzXoblkh4rgiYyaeJpypISbLVwy8RALGPnkjuLn5a50W9UdwY6u+NlwhVDOHeniEZHn2JByfgjtsidMdyuEqTE2YqupPGLxsG2bCbNWaB0fAiKZg/nYqZNGZoXpcUow0nSrfnMVFlLmakWMUk9IS78MM/UacqQaVkbnuRqO+r5yaSU3BwGbYFVlQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ccd2301-5be8-455d-4534-08def78da806
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 09:48:11.7644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2UzwRCbH/oJvlDqoR0rtP0PrYSvGau5mQC1SjfgmDH8ehipRIm/u+jeJXELQ8CRESM590gHo52n6Slp8dlLaFI4sZbbIwDcJ0focfaeOGyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8755
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



On 8/10/2026 12:14 PM, Satyanarayana K V P wrote:
> Add explicit bounds checks for VRAM size which can detect and reject
> invalid configuration data from a misconfigured or malfunctioning PF,
> preventing protocol violations and protecting VF initialization.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> V4 -> V5:
> - New commit.
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 65e48f135801..6c1878e4b1b2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -575,7 +575,7 @@ static int vf_get_lmem_info(struct xe_gt *gt)
>  		return err;
>  
>  	lmem_size = xe_tile_sriov_vf_lmem(tile);
> -	if (lmem_size && lmem_size != size) {
> +	if ((lmem_size && lmem_size != size) || (size % SZ_2M)) {

IS_ALIGNED(size, SZ_2M)

and since those are two different conditions, they deserve different
error codes and different message (-EREMCHG for reassignment and
-EPROTO or maybe better -EINVAL if unaligned)
>  		xe_gt_sriov_err(gt, "Unexpected LMEM reassignment: %lluM != %lluM\n",
>  				size / SZ_1M, lmem_size / SZ_1M);
>  		return -EREMCHG;

