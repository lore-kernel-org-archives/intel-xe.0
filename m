Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14820E810CB
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 11:11:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC5710E4D9;
	Wed, 27 Sep 2023 11:11:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88EF10E4DB
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 11:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695813095; x=1727349095;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=SZspVmycimXl7mcNXbo9ageQubsnVsaakJ7/nV4RaiU=;
 b=Qvt6WKUjys0zjBTKAy599/LfuDN3tvuIm3DsXGIPstmyJl79CIwS6DrW
 d1ShsTd9vLFfMSqVV3ZluYhJ8gGbHtXXWV+G9m+SaQiwdbj2O//r7GYOt
 6YG+TeuhIW+D3NILCku2OkZdeeTnUDuo+vBp6UsGIMfliDDXHT3Kc4o0P
 YtazBBJLvP3KR8NhaYqgGFEF/t62PAp2+57fjZNiDhHe7/t+3RpzG5v7F
 R0TvPVGRhW7zwUc6h4j5a55PcskrucSNgbSKT+ZnDOZHneS2DjvMApq05
 rUKCZ7nSBX6EdD7I2bkSFCGSNXq5SUpA0LkFJNF8ppraxpOadqCqSXxfn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="361185457"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="361185457"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 04:11:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="814842098"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="814842098"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2023 04:11:33 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 04:11:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 04:11:34 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 04:11:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MeVjUC8+nJMkDfZX2HaN+eZyuo8kYhh/m/dBn1LKSgWS9QOzOeqCYrRdFvypGPyS1v5uR2e382eb9TsBSbn5RVeHspMAXu6NiCX72uD/5s0MSYZnIAXIx7OjCu1OfwzTi7XEgZ+pbs5GRWIECE3dIuZqghYb08cpP0EdEML4qtlR+yNtxpMIUtBu2DrePikHgOm4lsmPVQmBCIDx9kFT6BoLRZd9OkV4eLIzCKagko/Vz2OhuMttf9J+jeRnIaQrYBdt0YCmHveTlJLEAR7Qc6XP7opximLnlazlNSOT+IT7GEujuGJtgZ2Obe12z28cvsbtX/kA3Z0qVtGnYFa0TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HnfgN6yE0Qxskp7fewSJIXvnyCDxGopBp9zbdXVcXkU=;
 b=SLPqQu+DEx4KyjkbN62CjMgi+mDzKK3BENAP7AUHrmgyRjiAOrRtlMc6TGYFUZLSeZKPvWfTWO6LAoTiRci9KWoiDjpPvME3hW43o14g8pFAFnPT5I1VTztwGHiMbox02H9T0bxU3ZMtgz9wGsemEAEzUQQs78jodCikLCjQyh1tluuxj1GdmG6qBoEZeMjkwa30kJ5StkUf9bltPy7TmKYECch7AiS8b/QsY8wLATZI1xfGDkqfnQZPQSmpFB0wyUyWr0HV1jHizy76OXTyaNHj+2Ct4eB6561c5c6j23/dh2Y06rjvoNjVkiVEg1Aq42cIbAWG1ZhLYa8W7K6Z0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 11:11:31 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::6f86:7fd1:af53:ee2]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::6f86:7fd1:af53:ee2%7]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 11:11:31 +0000
Message-ID: <2384762f-7d2a-03d5-56ff-e11100f392f9@intel.com>
Date: Wed, 27 Sep 2023 16:41:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230926143916.333958-1-sujaritha.sundaresan@intel.com>
 <20230926143916.333958-2-sujaritha.sundaresan@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20230926143916.333958-2-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::11) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|LV8PR11MB8607:EE_
X-MS-Office365-Filtering-Correlation-Id: 42ec8e8b-7bfb-46f7-83e1-08dbbf4a807c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BoG/hYC5Nn7+jYnnf6Z5LyJC3BJj/rBk/Ch8bJljne8vE47yTrDfH4sgF3Es7UFgp9uovPJsc0tvN84laWUGXj58MemWHuF7u2zOdAcIVMuQzD4QBtlnEO1+iamwuxKWRRMUxgUBg23YfhgYBDoTwYe98foWd9G/pDXJWQoMKY7OAJXwnzXIrPIpS0fZO2+hLnaVyAeB3zwrc6p5VbwBXAIXXcVVsPGIBtRYYCDPLguvi3UH9CtIh7LvL77BRoguoR83eUF+s9K16FJ03m8603ER35dmiyyt2KgNGNcoe5kb02Cbmr05ZcNmOx5zWGHp6qQ3Pns5YJKY9sYlnJ1JnEQGd7sWrYEGaS/KKignwiAZFSZTiT9vrqa5pCn9UiOecLLoi0yK+TjN2GVPgCY+2Zc7f/fcwP3v1Ow1RDXmAMzBo+tD46g5PQNu+QTZvegbGqmUtIn7hXec3itOlZqT0rwsj6KKM08fiMQZTuM/7LuodVoRzuGatNtX1bhCjOAUarWnTmvZVgfB6Bl9AMHR8swMJl3lH+3UJvUa9JxVUyrO6BZxnLE9q/8qGHCIOY1G5G8gvAc3hkckqPY+F6waNDye5B0JMpcRXYDle2Z8ijW+Sxn2rjh60/Rb+XpQqwP/tv4O5gjTJjN/JgjHSgpcsJFd+sHiwP44PMumtDrZBwg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(1800799009)(186009)(451199024)(26005)(6666004)(478600001)(86362001)(2616005)(36756003)(82960400001)(31696002)(6486002)(83380400001)(53546011)(6506007)(5660300002)(38100700002)(6512007)(2906002)(8936002)(8676002)(31686004)(41300700001)(316002)(66476007)(66556008)(66946007)(30864003)(44832011)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vlo4WHZzYk9lS1lIZlVoVEVnMkkrbkZzemZSQUs5a2tYcEVpaEthUkh4QmRy?=
 =?utf-8?B?Z09UVlBHYk9HbTk3OGRkNHlCcXY5SlEydVN4YjEyODRiNmRDclZtTStDd0RL?=
 =?utf-8?B?QVdUa0I4cnNvdGZHU1JIOHhwemtZQ09Ud3Y4SHNXbllkbXZ6ZHN1U0pZQVdm?=
 =?utf-8?B?ejBSUjNMKzhJUTE0T1ppL242UzhnejZlNlZpOTZVVEp6dlEzUWZWTHdJa2lr?=
 =?utf-8?B?djYwci9xbVdNV3JITHBGckVNbjZra084VmtjUGZ6eUJ4LzE0ZkRBNitRbnht?=
 =?utf-8?B?Q2kxdE1VSWFpWXkwUzlzN1B0UXFwL0pDODRxTEpKYTdUZXpjVExVdDFyRGZN?=
 =?utf-8?B?cnRQMHlhUGplQnJNZ014V2hncTNNeGljRnJCcXcra2pTcm12RXpJdHR1Mlp2?=
 =?utf-8?B?cDdrTVdoQ2x3NGQ2TVF0N1M2Q0FiNEJkVFRHdFBWdllLZ0psTWNRc2xPZWkz?=
 =?utf-8?B?MTVudzZEQ2lSY1Fkam16ZExQcnJTTEREeWJYSGdKdlh5QTBoYkVjMVMySDV3?=
 =?utf-8?B?dzU1ZkJ0eGlpMFFiazVhalN0ZGhrTXZkdVRURk5zakZ0Q0NDNWI1OTdpOTB5?=
 =?utf-8?B?WkFYOWs3S0pxdW9QVkxGTXlSNTRmNkNvUHNXZ2hnMlg5anF5dk9DcUJ3LzA5?=
 =?utf-8?B?ZGIwZTJFaG15L3hKSmZqdEEyK3lSRXFHb24zTzFtdHljR1dJTEVlRTY2WE9m?=
 =?utf-8?B?WWdxeUVwUHN2QWtuY3VnWDBjWGlaOG1Nd3lmN1pIczRXOHgvczNHdVhVcldq?=
 =?utf-8?B?TzdjSXgzeUdtVXZKZGxScmtRbnZsdVlsRWhqWk9icEVGcmVaN3hUN3g1bkda?=
 =?utf-8?B?OGYyS0JVVHk3ekEwSmJhT0Znb1hibGtvS1ZGY0VxOVEyRElDU3ZLYXJPbzR1?=
 =?utf-8?B?Q0ZLN3pnV0NWcXE1OVFNUkloYjRjVHE4RUo3RDIvT3M0WFhlQmhpOGs2em80?=
 =?utf-8?B?REd2dkh6M3pwNmZ1OWQ0b2lqcDRDVi9WcEtrN1dHbitDRE9rK0xRYXBZQ1BO?=
 =?utf-8?B?bFVmMjRWN1RmNFBVY2tRYWE3MEtIRFh1TVdwblRwd1NWTG1GeDZaUm5oSnpJ?=
 =?utf-8?B?VlBUdUhuZ1lud0ZJWE5Ka2NwbWZPSUtVRHJPcEFRLy9sZUJMVWhoYWFHdCtS?=
 =?utf-8?B?bzRSQmNUWFZxR0hpNzU3SytYTGxYUFZuSmNLYkFZeTVENlZzVmVYZE9rbk1a?=
 =?utf-8?B?VCtjbDhYL0pKVDBnV0lLa2E3d1FaWFlkR0huUHVUQks1cE1uOFpMU2dFYU9o?=
 =?utf-8?B?bzBsd1ZLMU9hRGRqSEZFM3J4Zkh2MzlwbXpvcmsvck9YcDYva0pKWlN3VkE0?=
 =?utf-8?B?ZnJXK1Q2SGIrSzJmMmJsZEl2TGRWQzJhdk5iVk12Y3VUWHBVT0Z4R3ptNjVY?=
 =?utf-8?B?aFUwcEdwcHZtaXVyUjVpRERMdFIvMk9tU1VhSmhlTzQvakdHZHdCek1ad0Qx?=
 =?utf-8?B?b1JZYTRHaTFoWHVVTVQ3N0ZYMm50U3NWK3BoSmdnUEJjNWpENTJUbjB5bmll?=
 =?utf-8?B?dDhIbUl5UXYxZ1dSNVFycTNUaHNBUGxGTVBzdTVDeTJLdXlxMzZuUzZ2eVEr?=
 =?utf-8?B?ODNDV2V2eEF4RDUyKzlRQlU4Sk1uVWZMdVJFclVFTjNOUEFqMmQydHAzMm5z?=
 =?utf-8?B?NEJwZzM2ZERZWlUxZUM4UHFPRWp5aCtoV2VxaWZVY3JndTkwZnhLWU9GL0JM?=
 =?utf-8?B?d2JNSUhnand3SUt3OE1VRVB1d2Zuc3Z0M0dyazg3b2NuclhGUWFkNktnemFO?=
 =?utf-8?B?dk9ybnd0RzBQTWpUUmh2NnJ3ZDBWYVdhR0s0OEJ4MjlGMWZEdzdVT21KemFP?=
 =?utf-8?B?MXZWbmpwV00yMWNRRmprVWJMN05BTkJzamJ0azFmcGl4ZGNwNjlEZm1IclNM?=
 =?utf-8?B?bTh1M2Zuai9UWmlyVGVBQXJ3K2J2TVp0SGs5NWVENnZ1NGdhRUhaSFc2aWhj?=
 =?utf-8?B?aDcwaC9paGFqdmkxeDRuZDN1WCtYWGNBVDFnRWpIV29HVExrN3BKTndGTXYy?=
 =?utf-8?B?ZmhFYWhDOWg5eUF4SDR2T2ZxamtrOVYzdmlLaEJRcEE2Vi9FUEswOUQ0bmJL?=
 =?utf-8?B?bEZPYkt0ejJJdFlhblJQbmRHQ3ZDNVQ3OG4rNnlFbWl6bC9STmV1OGJxS2ow?=
 =?utf-8?Q?Ec5dKnFO/tuNF2IIEgb4cGUl8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42ec8e8b-7bfb-46f7-83e1-08dbbf4a807c
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 11:11:31.0544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SznghRAquRjUAxq7zHjH/P0dgoh9t3etqDGf+iO1DBcO5ikgYXLtFw2IWTH0H3kiKYhOjtY5GRY+1M7jys8cyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8607
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 1/1] drm/xe: Add throttle reasons sysfs
 attributes
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


Hi Suja

On 9/26/2023 8:09 PM, Sujaritha Sundaresan wrote:
> Add throttle reasons sysfs interface under device/../gt#/
> Currently there is one overall status and eight reasons
> attributes.
> 
> The new sysfs structure will have the below layout
> 
> device/tile<n>/gt<n>
>                 ├── gt0
>                 │   └── throttle
>                 │       ├── <throttle_reasons>
>                 │
>                 │
>                 ├── gtN
>                 │   └── throttle
>                 │       ├── <throttle_reasons>
> 
> v2: Fix review comments (Riana)
>      Move init call (Matt)
> 
> v3: Remove xe_gt_throttle (Riana)
>      Make functions static (Rodrigo)
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile               |   1 +
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  12 +
>   drivers/gpu/drm/xe/xe_gt_sysfs.c          |   3 +
>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c | 257 ++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h |  16 ++
>   5 files changed, 289 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>   create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index b1681d1416eb..9aa61e416a24 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -64,6 +64,7 @@ xe-y += xe_bb.o \
>   	xe_gt_mcr.o \
>   	xe_gt_pagefault.o \
>   	xe_gt_sysfs.o \
> +	xe_gt_throttle_sysfs.o \
>   	xe_gt_tlb_invalidation.o \
>   	xe_gt_topology.o \
>   	xe_guc.o \
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 3a4c9bcf793f..374238dd8a06 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -411,4 +411,16 @@
>   #define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
>   #define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
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
> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> index c69d2e8a0fe1..dc3f841b49d0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> @@ -11,6 +11,7 @@
>   #include <drm/drm_managed.h>
>   
>   #include "xe_gt.h"
> +#include "xe_gt_throttle_sysfs.h"
>   
>   static void xe_gt_sysfs_kobj_release(struct kobject *kobj)
>   {
> @@ -52,6 +53,8 @@ void xe_gt_sysfs_init(struct xe_gt *gt)
>   
>   	gt->sysfs = &kg->base;
>   
> +	xe_gt_throttle_sysfs_init(gt);
> +
>   	err = drmm_add_action_or_reset(&xe->drm, gt_sysfs_fini, gt);
>   	if (err) {
>   		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> new file mode 100644
> index 000000000000..12facebd8989
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> @@ -0,0 +1,257 @@
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
> + * device/gt#/throttle/status - Overall status
> + * device/gt#/throttle/reason_pl1 - Frequency throttle due to PL1
> + * device/gt#/throttle/reason_pl2 - Frequency throttle due to PL2
> + * device/gt#/throttle/reason_pl4 - Frequency throttle due to PL4, Iccmax etc.
> + * device/gt#/throttle/reason_thermal - Frequency throttle due to thermal
> + * device/gt#/throttle/reason_prochot - Frequency throttle due to prochot
> + * device/gt#/throttle/reason_ratl - Frequency throttle due to RATL
> + * device/gt#/throttle/reason_vr_thermalert - Frequency throttle due to VR THERMALERT
> + * device/gt#/throttle/reason_vr_tdc -  Frequency throttle due to VR TDC
> + */
> +
> +u32 read_perf_limit_reasons(struct xe_gt *gt)
> +{
> +	u32 reg;
> +
xe_device_mem_access_get here?
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
Since the same function in called multiple times above.
Can it be a single function with the mask sent from the show?
> +static ssize_t status_show(struct device *dev,
> +			   struct device_attribute *attr,
> +			   char *buff)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
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
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
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
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
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
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
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
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
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
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
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
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
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
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
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
> +	struct kobject *kobj = &dev->kobj;
> +	struct xe_gt *gt = kobj_to_gt(kobj);
> +	bool tdc = !!read_reason_vr_tdc(gt);
> +
> +	return sysfs_emit(buff, "%u\n", tdc);
> +}
> +static DEVICE_ATTR_RO(reason_vr_tdc);
> +
> +static const struct attribute *throttle_attrs[] = {
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
> +static void gt_throttle_sysfs_fini(struct drm_device *drm, void *arg)
> +{
> +	struct kobject *kobj = arg;
> +
> +	sysfs_remove_files(kobj, throttle_attrs);
> +	kobject_put(kobj);
> +}
> +
> +void xe_gt_throttle_sysfs_init(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct kobject *kobj;
> +	int err;
> +
> +	kobj = kobject_create_and_add("throttle", gt->sysfs);
> +	if (!kobj) {
> +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
> +		return;
> +	}
> +
> +	err = sysfs_create_files(kobj, throttle_attrs);
> +	if (err) {
> +		kobject_put(kobj);
> +		drm_warn(&xe->drm, "failed to register throttle sysfs, err: %d\n", err);
> +		return;
> +	}
> +
> +	err = drmm_add_action_or_reset(&xe->drm, gt_throttle_sysfs_fini, kobj);
> +	if (err)
> +		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
> +			 __func__, err);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
> new file mode 100644
> index 000000000000..c318d98215a0
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
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +
Above headers are not used.
Can use forward declaration for xe_gt

Thanks
Riana
> +void xe_gt_throttle_sysfs_init(struct xe_gt *gt);
> +
> +#endif /* _XE_GT_THROTTLE_SYSFS_H_ */
