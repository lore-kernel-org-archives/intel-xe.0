Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABDDC531D0
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 20:50:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B42810E5FC;
	Thu, 23 Jul 2026 20:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QVIUSCZ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 004F310E5FC
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 20:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784839853; x=1816375853;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=miKygXr8kM7vV9454C07OdztQYpE+my/pH+HuCuxlwk=;
 b=QVIUSCZ7qwPGibMZp4QhIAzWTdcHzHDCU05h+Yb6IiglsZ9mOJTa9US8
 SdPEUTau2k8LYwM9/IpGTjrUvZi8EonOFRZ8PdRpOHSVOrr+veUtPA1zL
 pxMHnKTjBoKuD43hoLy7snahv2DmnWtigYqptAunZ5HQOpmjweZCQn0/L
 2zXUqZNh2F2mk/znzkNwm9gjsuCWnUCm/5sYGggpV5sIGtthJ4i30l2qQ
 C+pvDrHSGrVqEOvfJYaFDar9BXlFJmsemyJLWJZl9UrXa32zuG7Kji/7E
 AI3gZ5HIVe2cmdxDOAMwwY/3pvBXpU/t2rgqFJSr5W6c3vbkIC+qDpZp0 w==;
X-CSE-ConnectionGUID: mimRdT8zQeiywC8DfNCADA==
X-CSE-MsgGUID: ZluLN7otRNm2wsirX8CCRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="88046448"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="88046448"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 13:50:53 -0700
X-CSE-ConnectionGUID: aDP271fSR9Gw6AyfKkfjRQ==
X-CSE-MsgGUID: x0lYIKJQTqC/EwVIKPo4KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="252209716"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 13:50:52 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 13:50:52 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 13:50:52 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 13:50:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CfHpec5S02h4XuZwskET4p3Rm09PVNxCUtCrMu9igJUV/YxajnbOVzZha3hRkVXH/HLZN7w5AycwSRW5Si4bediAfj+IAhkKb4BShdmsHIhRNfsH4u7IGXNV+Y8U/H7OlcdsgGokXp0coypAx33C5R8UZo7+FNvOILhCbwBLbecKAwUUFVdCjXGBWJQXUY90Ll+hRseZsSHQBhg4AM0ACRo2HzETprAAP7F/IoqbML+XKKxkMkPIt0NDbeA2bM9PHdkNaqVSgnToo2jDp2cEPlzETYYiuXwXOzr0k/uxJbs5oI7bswE/vHb2qPenydAmboAxWKbq3a7oGuoemRTH+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GcVMb/ad/AsVqjfhUlDguFDcFHvM1EhCC6bV+O+hlsA=;
 b=ce4rVolHIAwev8q25akNBZ0rlDV9j0KF1CJXJ4p7HEfZBev60OTSBZJUhBguDbAMNk3hbjvgThSkQvFSHbiIIqmjVbjbiGiYnhA0FrxD/DkBTvwHiDCrQQ4vpa5iOUC3CjQIhG/H6wufR0sofJWuhOGYrccm5XRBD0QZE2oeqE9pt+PFZABOCmuvYhz2srNXUpdMLcPj196Y/Mr9KbrQcGQiXJrtazKHulvIFJwkg8jhpBLcpJ8c+qjubTwPVYN+i325OiVxUyf50iGyYMXF53w2PTwmrLVrDb+ggXH3V7sSpAOi6t1PixCyyqQtUY9Q1SACc58YNBxG8Ek10yS5JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by CY8PR11MB6986.namprd11.prod.outlook.com
 (2603:10b6:930:56::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 20:50:49 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::a3b:efa:42d5:e983]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::a3b:efa:42d5:e983%8]) with mapi id 15.21.0223.017; Thu, 23 Jul 2026
 20:50:49 +0000
Message-ID: <1382044f-664d-4dd3-97e5-20892eb1b2cb@intel.com>
Date: Fri, 24 Jul 2026 02:20:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/6] drm/xe/pt: allow selecting the bind leaf PTE level
To: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260722143759.1718600-1-naresh.kumar.g@intel.com>
 <20260722143759.1718600-6-naresh.kumar.g@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260722143759.1718600-6-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0340.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::15) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|CY8PR11MB6986:EE_
X-MS-Office365-Filtering-Correlation-Id: cf753b17-4a89-4be7-8db7-08dee8fc1368
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|6133799003|56012099006|11063799006|10067099003|4143699003|18002099003|22082099003|18092099006;
X-Microsoft-Antispam-Message-Info: vCjOG+nOxjGbN6QrWeoD0h75WNXDT5Wrke1oqwoL5/6QKa4S13nOwW/s4vInAHRpy/8lgVbkCntDCDOP6n69reWE9OYDACsXeF30p7W6vhaj+vbd0Qi8ydawOhKbXt3VN4YjlGEkIFmVK0taWpAtH1K7RkFmz8BeprcySiGyIgs4iQYximAC0oe4jUiGGdCSIdO2x0T11GaOYUNx3TRAvGJ0QrGE4zTyQaY2HewvZMuFsUOUhH4t4TNwUzRvC5ozb5xKBqVZD3dU4AoqT65VW9oYLgoJFDtHb9jyGwiW/03nGm9CcdCLAxarH4L8GoAXQIjdkcWkt+myEVOPT9RA8GqE4ZZWSICGwVfr3Te7rgIa+wKhscRncD0mIVyDh3IQJLk02Y/P+w7xfvbxBZOi9Rzc1qCDjsL48RArSg3LRh+CWAWXkRFeJfqdVwffva2epV3fuIkkQEZbIIOp7GBH14f3xf7R+E4i4l17AWDrcX6KlByqRK5YbLzOF49jYRGa3vnpNB0KKTYTEhCSrxhynjZz1Sv922RR08/lCCriYJZK5Cz67jfIB3eXP9eZG1sr22M2QX1S1+ZJAP27/IC/7Zn9N6MoLHeDP53zC2rjw8MCwyzvu5U0ojP+YWpvwWw0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003)(18092099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUNPQnlNNG1NNFhIL0M1cEpHNVdUcXk5NC9ldkhlcTBUbXVQYm9KU0JCRWhN?=
 =?utf-8?B?eG00WkpwVXRjY2llWmNCQTl0YjVHa1h2Tk52cXFrK2lIbmI1UzdMVUpWOUJS?=
 =?utf-8?B?WnVnR1k1Y1FjYVpyck1mMEVmRERoc0UvcS9uMkdONDd4dUNPVDlybnB4VFIr?=
 =?utf-8?B?S0M0SnBJaDlVZzQzZFFTL2tSTHdaZ0NzTlhTeThFMFUvK09SZ2k3TS9KbDlU?=
 =?utf-8?B?M1g4UGJaa05SZ0pHQXYxSmU5Z0UzUElFMlNLSDZQOERaajkrOER0K3l3UjNw?=
 =?utf-8?B?Z2h1WjdySnRKU0NhUE1oN2FMQ1RhZVFUOWUydVQ1MWJvTlA2eFdsV3lXTVlv?=
 =?utf-8?B?TmJjblRGQkNyN3Mxd2VkNXlYYWJQamszSEJKZTJreDh6SWdhYjRJQUc3SFpz?=
 =?utf-8?B?Zlo5VnpRTGlqMzZ1QWg4WGJQK01VUVhjRGQ2ZHJHQkZ4Rnd2cUgzcTJvVXJL?=
 =?utf-8?B?MkMxSm4vOUhLV3Vyak8vVnpNQXNvY3BnbTVLVHdJait6RGw0TERjcVArM2Nj?=
 =?utf-8?B?RmVMMVlqM1NpdlZmMlYrejNUZ3g4dFAvUnVzVUxvQ3dtZk9xREp5cEo4ejU2?=
 =?utf-8?B?R2IyUU5XeTRvb2QrMDZranNIV2dXMjNwYXR1NThtcWFET3RsZTE4c21jYlJr?=
 =?utf-8?B?dUlmZzl6Sm5JOVozbmI2K1hCaVdJUWpnWmszeEpiNXY4dDhqa1M2SEs1Y0hl?=
 =?utf-8?B?NjBpNEtDL3ZSZUhLaWNVNkZwb296RU5Sc3dRN1lLWXEzZVpVMVkxYW5Fai9h?=
 =?utf-8?B?TFJ4dWpMeE5UbzZqeDdOdEptWGo5MW1QNXZBR0krOFdQeDNkQmRoTFpwUlE4?=
 =?utf-8?B?cVdXRGo3bnVsQ09EL0dqZWp2MkdQSC9adzhmSWRlVGpSSHpicUVaYnZNZzgx?=
 =?utf-8?B?Z1k5MzJGb0o5bTdUSHM5TGlqaGZwaXJZWUlmY1BGQVRCaTVrWjNVRWVMRDZK?=
 =?utf-8?B?SnQySXJSc0RYK2RqNHVyN0dCM1FHT0xMcFVTZU5qa09ZWDQ0TDdJaDZ4cmVR?=
 =?utf-8?B?SW9CUGNDaFFvYnV6TUROMnd3VmxJcThQdEc0SlVlSFhiTWRqaDRuSUxIWDFx?=
 =?utf-8?B?MGRtdXliZ2gwd1BLN25yT2R6MGNuN0w4bi8yZ3BERm1NL2dpYWxVQ3NoTExJ?=
 =?utf-8?B?K1J3dnFIcXJpaFdlZGZxeEdLSHNZRTNOSTg4NkZPNVJNbzhDTytvdmhmRDZ3?=
 =?utf-8?B?a1RUdGM3SWVOVEFVWC9iVXp4TzVtT2tTSFpmbzdMY0pGNHBEWjAwRkVQOEVp?=
 =?utf-8?B?cWg0NVNlS3R4enc0Tm9NZ3RIU3FFTVVmaStra0p4eUdHdkYyMzdzcEllZWI5?=
 =?utf-8?B?Vm5namZFUEx0MWF1clBxcGh5eGdOUlYrNFNnT1NUTnByZm9UVG9pV1p4Q2Rz?=
 =?utf-8?B?VGh5clhpYmtrRk9mMjg5dXIvYjJybTZVdlFQYTU0OFVVcDhDd0Fvazk1aHVt?=
 =?utf-8?B?aDFRcEFOT0grRlJHZWJGcFZpb2wwZTRtWFY1c0dRSW9wamh4dHVlcmJFcVRh?=
 =?utf-8?B?ZG9pZnZNTzVkMWw0aGxjckdwT0dQOWVrV3BjR0MxRU1URDJuamNXWlNtMWNJ?=
 =?utf-8?B?ZFhzYUEyOEhXYmVFT1RHRHZOaVRKMGxOY05nWUhGWUova2drV1RpKzVZdHlY?=
 =?utf-8?B?UUtQK0JJdGRuUzJISnFRS1RDakx6YTZPKytKcllITU1uVGxLTzlIcE5MWThR?=
 =?utf-8?B?eGlNVDRoWVo2Y1dGREpiY3MrSUdhaWlVdktCK3BGOVNOR2tzQlgvUlM2Y0Jn?=
 =?utf-8?B?R3lpWGNUUlBoWllkbHlNUXdwa1VoR3BOandQb3pwbUhXcExxMndBUUNVVGxK?=
 =?utf-8?B?TXZ3S3VKVXRycEF3bDB1cW5Db1k4MDFCYmZQVnlOVDhiYjBuYUlBRGp4SnpN?=
 =?utf-8?B?OFJpM1BNYkF1VlFPRzgyVEcyUklKMEVuSDVvditJQkdabjBqbDZZRU5uZXA2?=
 =?utf-8?B?TFNWQ2EwKzJxcFlHa0Q2MVIzRkhJNmt4WnVMaHc0Q3Jxbll6enl2WUhQRnB5?=
 =?utf-8?B?MHNPU1l6ajVFbDk2bGE2T1pKT3RsUkVTbGRmV2F5MFc2dWZ1Q3dVN1RuRHVa?=
 =?utf-8?B?SFlIMDBxUW15TzJ0UjFXemx3VllFTXphWURycGs0c1FoZi93QU5BVXhsNi9R?=
 =?utf-8?B?WGFHZkgyR0VOeVMxajg3OCtXbUUxSDM3b2kvRkV5UnVtOVNTVVZvdzhPaFIv?=
 =?utf-8?B?SG4zZXdlRVpKM1c4MkpidUpqVjhDM28xbDRVeGpDYWxJSTVoWjF6ejlPdnVi?=
 =?utf-8?B?QWxnU0s4ZTdMQ2N1SGdNZWdPQ240cCtMY0ovY05tTk4vbXMrVXp3MVRIOUh0?=
 =?utf-8?B?L2ppZWUxdmVSK1dFSTdhTmxKaGg2d2hiV0NZY0lmdGZKRC9WLzJVbHhrZ3FQ?=
 =?utf-8?Q?20qTBESsGBdV0I/M=3D?=
X-Exchange-RoutingPolicyChecked: eEI38t63HvV4v4ugNyZ38Ro4mB+JuGezROZZpNBHN8mg0p8g2g5AxsQGaVZr+edSQORn2mVC214b79SfDhYGEgbiETns/r6SU8IaD1H5c84ZVB2SXMRI0k2MphQft2wGsrXZiYQpec/79GFCH/2s5STD4SX4YBHv8Lx0wzmNlawKVhS9BgrGHNfL6DuEZ/QYx9KxLjHgrHcJaqbGdxVzoZAx9ZPblCwrmDsIZEjc56aMg9rf+mDcO68I9Hb0fGg9cIFTKYJPqE9QYtMMMZ/YJVKjW4cgToS51pfNGYL2Hpk3JlC1f9aTbHDcs/oiJX6+NaDwnM6LMC3NEa/h1EAy9g==
X-MS-Exchange-CrossTenant-Network-Message-Id: cf753b17-4a89-4be7-8db7-08dee8fc1368
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 20:50:48.9998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z1qAVaFoQmr4EiMCHh425OMDEi05pzkKe/T2JhGExal7S1h2WTZGvx1Y+Dn28YAZdugKcwwrMm7SfUkzqr/xqunoOQnoYtUHJIlG0t1+T/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6986
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



On 22-07-2026 20:07, Nareshkumar Gollakoti wrote:
> Add a target_leaf_level field to the page-table bind walk and use it to
>      control the level at which leaf entries are emitted.
> 
>      By default, the bind walk emits level-0 leaf PTEs and relies on
>      xe_pt_hugepte_possible() to select huge mappings when possible. Add an
>      explicit target leaf level so the walk can stop earlier when the VMA
>      requests a larger mapping size.
> 
>      Use level 1 for 2M PDE mappings and level 2 for 1G PDP mappings, while
>      keeping level 0 for normal mappings. The existing huge-page heuristic
>      is preserved for the default level-0 path.
> 
>      This allows the bind path to emit 2M and 1G leaf entries when requested
>      by the VMA, while still validating alignment and size requirements.
> 
>      v2
>      - avoid using max_level to control walk depth
>      - use target_leaf_level to preserve the normal walk behavior
>      - keep the default huge-page heuristic only for the level-0 path
>      - refine commit message
> 
>      v3
>      - reword commit message
> 
>      v4
>      - allow fallback to smaller huge-page levels for non-zero
>        target_leaf_level
>      - avoid constraining clear_pt walks by target_leaf_level
> 
>      v5(Himal)
>      - Restrict only intended level in debug page size policy mode
>      - Allow the normal path to proceed smoothly when
>        no debug page-size mode is selected.
>      v8 (Himal)
>      - Drop
>        https://patchwork.freedesktop.org/patch/740059/?series=168905&rev=5
>        patch and populate target_leaf_level from bo flags
>      - populate target_leaf_level if it is in debug page size mode
>        otherwise fill with 0 which is having no effect on the normal
>        flow
> 
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_pt.c | 77 +++++++++++++++++++++++++++++++++++++-
>   1 file changed, 75 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 598c6b2571e7..b360ef4e2a7e 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -302,6 +302,14 @@ struct xe_pt_stage_bind_walk {
>   	bool needs_64K;
>   	/** @clear_pt: clear page table entries during the bind walk */
>   	bool clear_pt;
> +	/**
> +	 * @target_leaf_level: Page-table level at which to emit leaf PTEs
> +	 * 0 for normal 4K/64K mappings, 1 for 2M huge pages, and 2 for 1G huge
> +	 * pages. The walk still traverses from the root down; this field tells
> +	 * xe_pt_stage_bind_entry() to treat the selected level as a leaf instead
> +	 * of descending further.
> +	 */
> +	u32 target_leaf_level;
>   	/**
>   	 * @vma: VMA being mapped
>   	 */
> @@ -514,6 +522,39 @@ xe_pt_is_pte_ps64K(u64 addr, u64 next, struct xe_pt_stage_bind_walk *xe_walk)
>   	return xe_walk->found_64K;
>   }
>   
> +static bool xe_pt_huge_leaf_allowed(u64 addr, u64 next, unsigned int level,
> +				    struct xe_pt_stage_bind_walk *xe_walk)
> +{
> +	if (xe_walk->clear_pt)
> +		return xe_pt_hugepte_possible(addr, next, level, xe_walk);
> +
> +	if (!xe_debug_page_size_supported(xe_walk->vm->xe))
> +		return xe_pt_hugepte_possible(addr, next, level, xe_walk);
> +
> +	if (!xe_walk->target_leaf_level)
> +		return xe_pt_hugepte_possible(addr, next, level, xe_walk);
> +
> +	if (level == xe_walk->target_leaf_level)
> +		return xe_pt_hugepte_possible(addr, next, level, xe_walk);
> +
> +	return false;
> +}
> +
> +static bool xe_pt_exact_leaf_required_but_invalid(u64 addr, u64 next,
> +						  unsigned int level,
> +						  struct xe_pt_stage_bind_walk *xe_walk)
> +{
> +	struct xe_device *xe = xe_walk->vm->xe;
> +
> +	if (!xe_debug_page_size_mode_not_none(xe))
> +		return false;
> +
> +	return !xe_walk->clear_pt &&
> +		xe_walk->target_leaf_level &&
> +		level == xe_walk->target_leaf_level &&
> +		!xe_pt_hugepte_possible(addr, next, level, xe_walk);
> +}
> +
>   static int
>   xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>   		       unsigned int level, u64 addr, u64 next,
> @@ -531,8 +572,18 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>   	int ret = 0;
>   	u64 pte;
>   
> -	/* Is this a leaf entry ?*/
> -	if (level == 0 || xe_pt_hugepte_possible(addr, next, level, xe_walk)) {
> +	if (xe_pt_exact_leaf_required_but_invalid(addr, next, level, xe_walk))
> +		return -EINVAL;
> +
> +	/*
> +	 * Is this a leaf entry?
> +	 * Always create a 4K leaf at level 0. For huge pages (level > 0),
> +	 * validate alignment and size with xe_pt_hugepte_possible().
> +	 * When target_leaf_level is non-zero, only that huge-page level is
> +	 * accepted for normal bind walks. Clear walks remain unconstrained so
> +	 * existing huge leaves can be cleared without descending further.
> +	 */
> +	if (level == 0 || xe_pt_huge_leaf_allowed(addr, next, level, xe_walk)) {
>   		struct xe_res_cursor *curs = xe_walk->curs;
>   		struct xe_bo *bo = xe_vma_bo(xe_walk->vma);
>   		bool is_null_or_purged = xe_vma_is_null(xe_walk->vma) ||
> @@ -682,6 +733,27 @@ static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_vma *vma)
>   				 (bo && xe_bo_has_single_placement(bo))));
>   }
>   
> +static u32 xe_pt_target_leaf_level_from_bo(struct xe_device *xe,
> +					   struct xe_vma *vma)
> +{
> +	struct xe_bo *bo = xe_vma_bo(vma);
> +
> +	if (!xe_debug_page_size_mode_not_none(xe))
> +		return 0;
> +
> +	if (!bo || !(bo->flags & XE_BO_FLAG_VRAM_MASK) ||
> +	    !(bo->flags & XE_BO_FLAG_USER))
> +		return 0;
> +
> +	if (bo->flags & XE_BO_FLAG_NEEDS_1G)
> +		return 2;
> +
> +	if (bo->flags & XE_BO_FLAG_NEEDS_2M)
> +		return 1;
> +
> +	return 0;
> +}
> +
>   /**
>    * xe_pt_stage_bind() - Build a disconnected page-table tree for a given address
>    * range.
> @@ -774,6 +846,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>   		xe_svm_notifier_unlock(vm);
>   	}
>   
> +	xe_walk.target_leaf_level = xe_pt_target_leaf_level_from_bo(xe, vma);
>   	xe_walk.needs_64K = (vm->flags & XE_VM_FLAG_64K);
>   	if (clear_pt)
>   		goto walk_pt;

