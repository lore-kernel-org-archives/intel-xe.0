Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FC6CD98E2
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 04:18:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B2B10EDD5;
	Wed, 17 Jun 2026 04:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N+BELVws";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616CA10E926
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 04:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781669918; x=1813205918;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i+rSgz0pmBNcA2mc7u2LaLkdwIyn4N/u2cjthlls5po=;
 b=N+BELVwsjIIUfJZMYTesldhG32TlOV7+1XmpNmzyF7PVdeOpzXiI13T5
 93ViWPpTZ01gEwTlrEQNBxAtLCnEv/uaWh0q83A+UbcZTXzYqJzHLP53D
 QeIu9qd2Jomh42pnSigbp5JaKhuOD3y3BV8lm0rvR7+Oj0o++biTiHR3c
 N3T67+HQgiKbHcJwVNu7afxXq/PXMAZ/9ZBAG7CHtTYL3Oem7UwBpZ0u3
 216WMe52jIK5XabZemA0hnkwAmsHDvXvbnORCotCHhhi6pJ5IX72gwP2L
 HqEDbVfolxUKyWrUPEDuydS1qCsAhe6Aiiu0eM22Ip8WWY94GKewLzhLI w==;
X-CSE-ConnectionGUID: zZzOzQvcQ32pvPhsYqOg/Q==
X-CSE-MsgGUID: O6IYcEC0R4qlubOJhOi/tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="92801420"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="92801420"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 21:18:38 -0700
X-CSE-ConnectionGUID: BUkKNFY4TvGcMJcx+5OOMg==
X-CSE-MsgGUID: 4gUGQJYVTpWNmbVgxaa0HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="243798095"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 21:18:37 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 21:18:37 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 21:18:37 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 21:18:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wZoAP/W3QPTDSYjo8deeDEtkfaVXkvpd2iT0LFoakrov998pKLjP7wHiWeLc0ocJQa0aYUs6u7fX+MoZseMsWZQ6G5dCw++DdtNSimCiBpeadSy85D7S0UCa+r7Ej+U58B6GBeKe20+bJfRoSeHBrDkNxuljCTXNCz5mmSUbo4hcpZnHa6jFQl8ktHxbqhMtwfiwiyWffZhmWAgQ07Qveo6D0ybOuftRBSfrksWZk8F36DrQo5eJDJOwEKeNk0EAVZ6tCafmarG2kk+S8nkLySiekXfA88R2VqEQFj/irepRIQOWoYrzVwWe9EvUAr/XyNBlnFEYD2yMxC/DIH9oog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SrMVe0DszX60CUpX03amdy6USYO2CK86jwmscGxB3mo=;
 b=fqVeTRpzzHDvGATDWTMkOhHrfld0NYOim18X14TniHMSTqKytPefDwur/ZwGewN5bCI6tiC0btUAMswU2crhQyLogdBRemzq9xiFjwTI99Tm+Pcwi6d5zGiX1LLTvEYhiPeaB+6ryOLcQaagtg2tTqocGwgo9JLX6/lcCQSibKO8138vq5nlkNpku39AY1K2MLQKmlu5h6SnNOjlo4q5Cmd+DGSRs/mbmV8ZZnrzL2ED6q3ARPQQ0JzQuxbGpSpn/kZ5Y+RUeIx6vMXGQqA+MmcHyWTyJFCE1lsyD1OEBvophf3RehDdyR6zbXDhrKkx46ksGOH5JxKFh9chP+v6Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by SAWPR11MB9569.namprd11.prod.outlook.com (2603:10b6:806:4e4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Wed, 17 Jun
 2026 04:18:32 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%5]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 04:18:32 +0000
Message-ID: <26aed1f5-b260-4335-8aae-c5c5335c3be1@intel.com>
Date: Wed, 17 Jun 2026 09:48:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/xe/guc: Hold device ref until queue teardown
 completes
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20260616094655.2511-1-arvind.yadav@intel.com>
 <ajF0KIx7MLAQqab8@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <ajF0KIx7MLAQqab8@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0037.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::17) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|SAWPR11MB9569:EE_
X-MS-Office365-Filtering-Correlation-Id: b5ec582d-fb09-458c-c6b2-08decc277dcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|56012099006|11063799006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: DSLf0IUciPAEbvtOaJWfBq3UaxLV41KthyKbvpB9+ccKY+Swg478CmIID2wIX7nURzDW/uBsGfW7gV8YNF6s1XIfeK5v7PdvbE/DXvsX/A4A7Smz0arXh01+hm857ifsbUCUrhRPsETLiyBOlnHfZYKLr7/lgOANT9+i3qp1GoujXRj9apJeCsInW5TDxrT/b56QpZvSjClW+S2xIkKozS+HwdudfYNOoWfyCrOcuzh9rplRO63BgzhiNfgMpykqRU9v71ZzslwnNjmx+sL+ScLua5pz95wJXMPsMDcYr36yI0OazJ8F9VZ+424expNkPbZXQxmwT6Vho6l39qH0Q82XDb+aK2N3J3MrmgwX0A2cy67YaxtAMUehCfjI19N1Fpt7Q9sUQIBs8FIaSNgY9572YsZ9GFL+Vs9U7f6q9pX6XBVVJgTDwgYmDo9R5mUnprmdCHZPIQwPQLgC1E1KKOC4lmdgiSTvLpZ6IXOktBqHSlfm6BsZVw/qtz3NCWA2EErOo1P+0qqYQUiD73t0uoluOm6EZLsx5NI2kpLwl+HhZQ+Duc9pY6CukC8Y4/X6jZTF3JWQ8pRLdgyZcHxfMrMu6FOLZvtNZ8qSKRoDRCxC53WyCtXLRxC5xNDwt06AsUS2XwLvYQJmj/+fZNh0galRrtU4vHLXfolRcuNSP7AzFEshcFECWPHWoFb/IUAX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(11063799006)(22082099003)(18002099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWdWcVk1L29wTXFzZFpaSWRldHVsZmtMKzNxdnZxMDFXM1pIYVV4eGZrYmVk?=
 =?utf-8?B?Mnh4UDN4cy93Lyt6UTF2YmMxU1lYTW9yczU3NGlYVHgvN2loNkl2NWV5Tk81?=
 =?utf-8?B?eUlHTFhCakNnR2RTMHBCblFxR1I2dk9yejRtYUxzU2s5WWM2VWVwSnloZThy?=
 =?utf-8?B?aXRMeld0RjR4NTgvK2NKME9yL1ZGV2g3amRBMlc4T3dlY01GeUZxNVlHTkM1?=
 =?utf-8?B?S1QxaW81Q3lQQVpFL2RVK05XQWFabzdxUzdhVVI1Vkt1bDNyQkxiZHdGMmY3?=
 =?utf-8?B?MG4zeW1xS2V1Rk1KUlR4QlR5UDlWQy85dG8zZktjVWZraW8yZitneTFOWjJC?=
 =?utf-8?B?d3pxdmxTU1p4R2RMYkIwbXlwUFBaQmZCL3pGdUZOMWVEZ1Ntc05rYXlNaVo3?=
 =?utf-8?B?T3dDTnRCVHNJY09BcVN3Y2pMVUU5SW02S1BOWGgyZm5mOElZdjRtSGJTOW84?=
 =?utf-8?B?Sm5rOTUwMFNWSjlPTmJHK3hMM2F4ZEdYS09Xd2VacFpLbXlnRERNb3A0NGJH?=
 =?utf-8?B?bmprWmN4UkY4RW9aM2QrRWxNSU4zRXFDMURVazFnanRSYVlBZHJXVGk3Tis2?=
 =?utf-8?B?dWFrNmRDSmllVWRqMWtlTk5ET3FvT0M0YVd5VVZ3TU10dm4ySC9wdlpBSmlQ?=
 =?utf-8?B?REVFWjJLLzBBd0NZQTY4SmVBTlRTUGZDaFRLRkFJTlhNM3FOU1BKV3N4akp2?=
 =?utf-8?B?a2ZBenQrdTRNbUZXNWx1bTBqNmdIU2h0b25pQ2ROYXVBcFVZN29OM2N2bUdN?=
 =?utf-8?B?SDdjR0RySUI1b0ttZG1Sczc4K2t5WXdsYW1EZTAzSW0vQ016TnpJVEgrWjM3?=
 =?utf-8?B?ZEVXVXpVTDM3VWQ5MXF2K2toMkNrWWhldlUyUGptOFRNbk50SG5TVkgybGgw?=
 =?utf-8?B?NnBhTCtTeXN6S3gxQWx5NHpZQjdyajREZDE1V3diOFJJUEhVc3IvcHhvZzcv?=
 =?utf-8?B?MmhNMjRSVXMwWGdIdEFPeFRWRWpMd1pncTZmMjdUeko2Q0oxTlNYVzFLTjJR?=
 =?utf-8?B?UkEzZndHR0wxaWpySE5SZXc3cGJOUXdOZ1ZkZE5iQjA1RTRNQ05rTHlOSHk3?=
 =?utf-8?B?a05uUXAwczNTY1FvWndYcllVN1p1b0EzNzlQMTBEUVJyb21XNFVOT0hiRXRs?=
 =?utf-8?B?Y2owMWdtQzZGQWwyeWJXUmlxZ2R5SHlrWTdwOU5ZcUVYQzhsNS9Dc3lMOURR?=
 =?utf-8?B?OGtvRHVtclFwN01CZGpIM2VFNXQzZWViVVgyNTdXN2hsYktFZlNtVVVmWkNP?=
 =?utf-8?B?QjlSU3MrVk8vdnNPSWVvRmw5dHpuZHJMb2xlZ2RBa0JJMWU4OU5BUWhhb1ZD?=
 =?utf-8?B?Q096d3IwWUg3enAvdVU3ZXNEajUram40UlFmVFI0THlrdXUvYUgwNXFsaGJQ?=
 =?utf-8?B?Y3ZaTnRnZUg4M3Axb28yS0srdlY3em8zcnc5YUJxQ3FHVEk1ekdSeFN1OTgv?=
 =?utf-8?B?alFaTSs4djk4bHMvay9BcXQ0aGkrT3RheGJLMG1XcVo4QkVDZ0pTdGovUHJV?=
 =?utf-8?B?VmNVd2NyNHFxRUx4Mkp3VlZWMHNTQTFKUnpPVkgwMnpUY05kMXVqL0pMbjhV?=
 =?utf-8?B?MTlYTXJvT3IzM0JEV25BbzZaN0tvdE9QNS9zWFFXQlY5U1lKRVlNa2R1WWg4?=
 =?utf-8?B?YllXVTloMjNuQVpweFZCL3NSRVRzYytUNFRZVGs3OWZoQldnY2NpNFBBRDdv?=
 =?utf-8?B?Skg2dlphaUtHdXczSTIvS0EvRmIxcC9ycHVncUdIeTBBL2I5M2pJZnkrU0x1?=
 =?utf-8?B?akRXOForS2JFZnF2a1ZVRXlDdjI4WERLVytpMkV6U1cyTzVycmNISTJocGll?=
 =?utf-8?B?QUJDaC96WVd6TmFpSlFNdmIrZkg0M0E3OU81QzR1MHl4am9JcWpNdDhhR1Nv?=
 =?utf-8?B?N2QxaU5OVWM3NHRYSGpzd1k4b292STg3REI2TjdCbGNBOWFaYi8vVk1VaUdr?=
 =?utf-8?B?RTJWc1lqWXVscWpoSkhCdVZSM3pWcTVuWmZNK1IyUDVYSXRtU2Y0emI2Rkg1?=
 =?utf-8?B?TnRGUGxVSTFjYlRwUUxKTzFzaElJVzNkcnNRMHRDR0gxaHpoc2RTNGZQSjE3?=
 =?utf-8?B?QTV0KzkybTd1RU1KWUdsUGhPT3V1QWVoUWdadU15YTV5NkRWOTIwdWlQSUk0?=
 =?utf-8?B?bmsyWmtjMkV2RVdMVUZobmg4OGZLcUhQSmJCVnBqQ3hnMmdDZ2pheFVMUzJW?=
 =?utf-8?B?a3lkbVVzSUpXOHZiK0Z1Z3ZIL0FHc2tHUWZUaXQ0ZFlQSTkzTlRSbnBtL3Fj?=
 =?utf-8?B?cmF4dktvRjBtZ2ltem5IbUJXbWR3VkNPQlR2R3U5eTNaaDlEWE1acnlDamRx?=
 =?utf-8?B?UjJrN0t0Q3l1OUgxaVVjOTlVQ25LRUtqV3N5czVnVCtzWXFsUU9DUT09?=
X-Exchange-RoutingPolicyChecked: LpDxSaYBAFiCYWHHi2M8b/esm9P07A1HT0hbYN9iycKzHr0ZERqS5lgNKZJV/DIWHxUZrcc93C+akD/u+yy1ySrgwcrmAObc7vty7Pbr6dnCTKz2TZ27uU4OxSJ8t5IWv8p819BepJ5LOBXcIm+c9FcyVrbt7ibBBcMfAJ76Yk+UMj3Ap/OFVH/cyb22toVvJe/63vzKCNG4v0QatUPr47RWsyNAiiCiWS+0zd/V+VYSneaStSDMFFoT+k2dlboK4CJf/RxpSjLO8CdibPtXeIBoP9DebQUR6qOAyDNxnsSsh1ujvbLVNBvI+dNb068MJS9GRUL/FxsDiuU+BsGyXQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b5ec582d-fb09-458c-c6b2-08decc277dcb
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 04:18:32.2742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tjT8sY4YtVkTp4GxgXIUbrNE+wIhvYi7/QrDJp+cGTN9melFyGoSaNnWsQO/AHUcgVZK7eEGkULdKAbfqC4/sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9569
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


On 16-06-2026 21:34, Matthew Brost wrote:
> On Tue, Jun 16, 2026 at 03:16:55PM +0530, Arvind Yadav wrote:
>> GuC exec queue destruction can run asynchronously. During queue cleanup,
>> xe_exec_queue_fini() may drop the last references that eventually release
>> the DRM device and run drmm cleanup actions.
>>
>> guc_submit_sw_fini(), registered as a drmm action, used to drain
>> xe->destroy_wq. If DRM device release happened from a worker on
>> xe->destroy_wq, teardown could end up draining the same workqueue from
>> within that worker, causing a self-deadlock.
>>
>> Fix this by taking a drm_device reference when the queue is created and
>> dropping it after queue teardown completes. This prevents drmm cleanup
>> from running while queue destruction is still pending.
>>
>> Since GuC queue destroy work no longer uses xe->destroy_wq, remove the
>> stale drain from guc_submit_sw_fini().
>>
>> With queue-held device refs, guc_submit_sw_fini() cannot run until all
>> GuC IDs have been released, so replace the fini wait with an assertion
>> and remove the now-unused fini_wq.
>>
>> v2:
>>    - Rebase
>>
>> v3:
>>    - Switch to queue-lifetime drm_dev_get()/drm_dev_put() model. (Matt)
>>    - Queue async teardown on system_dfl_wq instead of xe->destroy_wq. (Matt)
>>    - Drop separate deferred drm_dev_put worker.
>>    - Remove stale drain_workqueue(xe->destroy_wq) from guc_submit_sw_fini().
>>
>> v4:
>>    - Replace the guc_submit_sw_fini() wait with an assertion  and remove
>>      the now-unused fini_wq. (sashiko)
> What about Sashiko complaining about using system_dfl_wq which is not
> flushed on module unload? That seems like a valid concern. I'd move
> xe->destroy_wq to static module variable initialized on module load,
> drained on module unload.


Agreed, I will respin to use a module‑lifetime xe->destroy_wq instead of 
system_dfl_wq. Keeps it out of drmm cleanup, avoids the deadlock, and 
fixes unload concerns. drm_dev_get()/put() stays as is.


Thanks,
Arvind

>
> Matt
>
>> Fixes: 2d2be279f1ca ("drm/xe: fix UAF around queue destruction")
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_submit.c | 65 +++++++++++++++++-------------
>>   drivers/gpu/drm/xe/xe_guc_types.h  |  2 -
>>   2 files changed, 37 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index afe5d99cdd8b..08ad0acf06ae 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -10,6 +10,7 @@
>>   #include <linux/circ_buf.h>
>>   #include <linux/dma-fence-array.h>
>>   
>> +#include <drm/drm_drv.h>
>>   #include <drm/drm_managed.h>
>>   
>>   #include "abi/guc_actions_abi.h"
>> @@ -232,17 +233,9 @@ static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
>>   static void guc_submit_sw_fini(struct drm_device *drm, void *arg)
>>   {
>>   	struct xe_guc *guc = arg;
>> -	struct xe_device *xe = guc_to_xe(guc);
>>   	struct xe_gt *gt = guc_to_gt(guc);
>> -	int ret;
>> -
>> -	ret = wait_event_timeout(guc->submission_state.fini_wq,
>> -				 xa_empty(&guc->submission_state.exec_queue_lookup),
>> -				 HZ * 5);
>>   
>> -	drain_workqueue(xe->destroy_wq);
>> -
>> -	xe_gt_assert(gt, ret);
>> +	xe_gt_assert(gt, xa_empty(&guc->submission_state.exec_queue_lookup));
>>   
>>   	xa_destroy(&guc->submission_state.exec_queue_lookup);
>>   }
>> @@ -319,8 +312,6 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
>>   
>>   	xa_init(&guc->submission_state.exec_queue_lookup);
>>   
>> -	init_waitqueue_head(&guc->submission_state.fini_wq);
>> -
>>   	primelockdep(guc);
>>   
>>   	guc->submission_state.initialized = true;
>> @@ -411,9 +402,6 @@ static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q,
>>   	xe_guc_id_mgr_release_locked(&guc->submission_state.idm,
>>   				     q->guc->id, q->width);
>>   
>> -	if (xa_empty(&guc->submission_state.exec_queue_lookup))
>> -		wake_up(&guc->submission_state.fini_wq);
>> -
>>   	mutex_unlock(&guc->submission_state.lock);
>>   }
>>   
>> @@ -1685,6 +1673,7 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
>>   {
>>   	struct xe_guc_exec_queue *ge = q->guc;
>>   	struct xe_guc *guc = exec_queue_to_guc(q);
>> +	struct drm_device *drm = &guc_to_xe(guc)->drm;
>>   
>>   	if (xe_exec_queue_is_multi_queue_secondary(q)) {
>>   		struct xe_exec_queue_group *group = q->multi_queue.group;
>> @@ -1703,36 +1692,52 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
>>   	 * (timeline name).
>>   	 */
>>   	kfree_rcu(ge, rcu);
>> +
>> +	drm_dev_put(drm);
>>   }
>>   
>> -static void __guc_exec_queue_destroy_async(struct work_struct *w)
>> +static void guc_exec_queue_do_destroy(struct xe_exec_queue *q)
>>   {
>> -	struct xe_guc_exec_queue *ge =
>> -		container_of(w, struct xe_guc_exec_queue, destroy_async);
>> -	struct xe_exec_queue *q = ge->q;
>> +	struct xe_guc_exec_queue *ge = q->guc;
>>   	struct xe_guc *guc = exec_queue_to_guc(q);
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +	struct drm_device *drm = &xe->drm;
>>   
>> -	guard(xe_pm_runtime)(guc_to_xe(guc));
>> -	trace_xe_exec_queue_destroy(q);
>> +	/*
>> +	 * guc_exec_queue_fini() drops the queue's drm_device ref.
>> +	 * Keep the device alive until the PM-runtime guard unwinds.
>> +	 */
>> +	drm_dev_get(drm);
>>   
>> -	/* Confirm no work left behind accessing device structures */
>> -	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
>> +	scoped_guard(xe_pm_runtime, xe) {
>> +		trace_xe_exec_queue_destroy(q);
>>   
>> -	xe_exec_queue_fini(q);
>> +		/* Confirm no work left behind accessing device structures */
>> +		cancel_delayed_work_sync(&ge->sched.base.work_tdr);
>> +
>> +		xe_exec_queue_fini(q);
>> +	}
>> +
>> +	drm_dev_put(drm);
>>   }
>>   
>> -static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
>> +static void __guc_exec_queue_destroy_async(struct work_struct *w)
>>   {
>> -	struct xe_guc *guc = exec_queue_to_guc(q);
>> -	struct xe_device *xe = guc_to_xe(guc);
>> +	struct xe_guc_exec_queue *ge =
>> +		container_of(w, struct xe_guc_exec_queue, destroy_async);
>> +
>> +	guc_exec_queue_do_destroy(ge->q);
>> +}
>>   
>> +static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
>> +{
>>   	INIT_WORK(&q->guc->destroy_async, __guc_exec_queue_destroy_async);
>>   
>>   	/* We must block on kernel engines so slabs are empty on driver unload */
>>   	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT || exec_queue_wedged(q))
>> -		__guc_exec_queue_destroy_async(&q->guc->destroy_async);
>> +		guc_exec_queue_do_destroy(q);
>>   	else
>> -		queue_work(xe->destroy_wq, &q->guc->destroy_async);
>> +		queue_work(system_dfl_wq, &q->guc->destroy_async);
>>   }
>>   
>>   static void __guc_exec_queue_destroy(struct xe_guc *guc, struct xe_exec_queue *q)
>> @@ -1927,6 +1932,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>>   {
>>   	struct xe_gpu_scheduler *sched;
>>   	struct xe_guc *guc = exec_queue_to_guc(q);
>> +	struct drm_device *drm = &guc_to_xe(guc)->drm;
>>   	struct workqueue_struct *submit_wq = NULL;
>>   	struct xe_guc_exec_queue *ge;
>>   	long timeout;
>> @@ -1938,6 +1944,8 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>>   	if (!ge)
>>   		return -ENOMEM;
>>   
>> +	drm_dev_get(drm);
>> +
>>   	q->guc = ge;
>>   	ge->q = q;
>>   	init_rcu_head(&ge->rcu);
>> @@ -2014,6 +2022,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>>   	release_guc_id(guc, q);
>>   err_free:
>>   	kfree(ge);
>> +	drm_dev_put(drm);
>>   
>>   	return err;
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
>> index c7b9642b41ba..31a2acb63ac3 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
>> @@ -100,8 +100,6 @@ struct xe_guc {
>>   		 * even initialized - before that not even the lock is valid
>>   		 */
>>   		bool initialized;
>> -		/** @submission_state.fini_wq: submit fini wait queue */
>> -		wait_queue_head_t fini_wq;
>>   	} submission_state;
>>   
>>   	/** @hwconfig: Hardware config state */
>> -- 
>> 2.43.0
>>
