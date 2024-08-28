Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC2AC5474F
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 08:34:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B845610E053;
	Wed, 28 Aug 2024 08:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="feCq4lJ6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F61E10E053
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 08:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724834071; x=1756370071;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7Kn8DZ1qx+Og76Q73a/artDA9yHHIRtKzxGf12jr97Y=;
 b=feCq4lJ6pR3sMlUKhQui06R8ZgrU/1kiyrrTGIozyd6HhqkDncP7DpiH
 INZKZxpIeeh5UjtDnKXNhI0EXIGDAFdLm6VM9UpkYRN22KdmnfzCnPyaH
 iz+LSb+tPAqS674Gdq64NHWXoYHAoDFt/QAu+WJkGgXhxnaj7fAxHGL/1
 uC/4ktryPdXYpLjzivZZ7KsSsuCVT2jHwsi7uU64UFiLWlP0SdaMoVHeg
 MkeANZKRNpObPIsjn3qErUOMWInuJqYGrsKmENL97Wt6dRk6DS5L18En0
 1aIDWwN70EQIM+/pgtAQt9WGgrY6+yPDnpRmobkQ7S1o7uNUJszycImGV w==;
X-CSE-ConnectionGUID: f0f9TWF5TamEh1V5iX6zTQ==
X-CSE-MsgGUID: LvaDCgDDRJ+VfATNu+X7uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="13255949"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="13255949"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 01:34:31 -0700
X-CSE-ConnectionGUID: BD7j3G48SnOWMbxUnTHUgw==
X-CSE-MsgGUID: PJ51dwvaQcSSbIKljcKnxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="63109931"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Aug 2024 01:34:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 01:34:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 28 Aug 2024 01:34:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 01:34:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PyR2J3yxoAlsvDi/AvhB6RP5lcI0L2y3cY3qS/NIHzjTU40ugD5c/65q5iiGmbxExvq4GVmVhSLnLSwku11JityBc2xrnwF00bzLAAqeL9Na0Cxfb/M4oLWPsHPeZDAf+2jYaKWeDf2PvlaZwDPVDzBoiIWV78m9xj/9miDmm4t9ksQOJV3Wp1pSsGM/FDoM5nPINtmsfkWZntD/w9ePZ9wWUYtf7GuB/zuAm82XpV387+wSCDMDKses4oH26u678MMHOr+eCZfzsKLZkuFVXAZ44AxOdVxU5NfvcZc4TOkIX+8cpgMvIRZzgLk3ZV8KgxpOYM9Vgg3M7sbyF/Y2Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IgxhbqYn1aLxDAEuyXcgc7Az6KHQUI6o/KPHEf+Fz/8=;
 b=hpHplK6fM9E30CFWpvupe2b6j2si3oxiTxGUut6uc0C/Y7L8B4u6nFv/vICDh0p0biOPUlMDhd9koCQpbnwwARS0JRC/N6HqNX34iZAHf3pqwrh/pM14CwNwD07VsoQnMq51di8hLnQph+wzEVhLpT7ujJOUPNAcXvBIbPWZ8MAfiT/52ABJCfwCB8lPfVdS/G83/jNBW5RalgamSpiQ7077/I2j9Lb4sdYLafMU9Y2hiNNQu23GLxw5r68YuO9luZU/fCICM0rS+J4DfmEP1uoiWB2CIS1WThsn6rargiQR0DuDsyGUMCr6VT4RhJtY+Pj75P/ttGBJD32Rhv3cjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SA3PR11MB7625.namprd11.prod.outlook.com (2603:10b6:806:305::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Wed, 28 Aug
 2024 08:34:27 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%3]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 08:34:27 +0000
Message-ID: <2fbd6036-b010-4fa3-8365-be193ea52008@intel.com>
Date: Wed, 28 Aug 2024 10:34:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Skip CCS clear for WB type BOs
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
References: <20240827154910.24841-1-nirmoy.das@intel.com>
 <757264cd5bd81ed416ad87cc31657ac6e35d5345.camel@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <757264cd5bd81ed416ad87cc31657ac6e35d5345.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TLZP290CA0004.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::15) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SA3PR11MB7625:EE_
X-MS-Office365-Filtering-Correlation-Id: 29fd65c3-663b-46b4-7f26-08dcc73c3a99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3BTN0I3T2xHNUFVekM4aklUaWl5WlhvWElmUzBwaG8vRkN2UkZ6b0xDMGRH?=
 =?utf-8?B?aWlCcHRRTWdTMW1qMmRVNUFLRGtZRDJlZWZvblV1a0d3S090NzJ4RjR4U2xL?=
 =?utf-8?B?NWE2TkJJR2JOWThXWTNQMTBxcEpNcjRGWkQ4eW1ZTWExQXJkZE9hbWYzT3kr?=
 =?utf-8?B?c0c3Q2h4WU1pcFRtSGF2K2RJV3huSTZReCtRbmdLNmVodC9FaFZnWmFPZkwx?=
 =?utf-8?B?RWlJV3FOMy96ZkJNQ0xZRUYzN2dHak9yQ3AzanFnZkRETXdweWRwa21EekJX?=
 =?utf-8?B?Ny8yTlgyV1JHSUVBMWZjbTJOZFNobG5raElDQWp0RE13eTUvOHZBM3phSW1T?=
 =?utf-8?B?MmIxRTRML25TRkhLR3RoZitlUUtQMisxdnkvbkNWVWdYMi9tbFZJWGtjblZU?=
 =?utf-8?B?NTZmNGJQck9zQy9ZdUg3akJOQW1ud0hkaEJoR2Zvc2tDUDlpeHNuT25mWmx6?=
 =?utf-8?B?MlpJTnVlaE44emNXRTRLTlozRUNVWEp2Vldla254ZExCS0xLR1JITkFGVHJF?=
 =?utf-8?B?SzZ3bEoyZXh3SzdOWVgvdGlZaldKNzFnSmlIYTBBQllDQzkydVRGSXFSOTBJ?=
 =?utf-8?B?Sk0zczloMytENGEyQzJiTTU1WnRQRU1OSGplcjdEOTM5MnZmazJVRVdFNW1r?=
 =?utf-8?B?aUxrOEl5NGRHVVU0dnl4ZzQ3cDhwTGR6RFdQZEpudjNTczViT1JYQjVkRnRG?=
 =?utf-8?B?UVpzNFlaTDJMYmY5SmxkTFZmL3hNRFBzTDZqeE1wdEpMbEJRaU1pWkxUZ0Zm?=
 =?utf-8?B?QW1yOXFWaFhIb0dEQ2RZaVZwQzBHUUFabnBLazhQckpZbDZlYkdxSnBwQUVD?=
 =?utf-8?B?RU5uaEZCdW42SUdYcmFTR3J4WnNSbVRycXo3QlBoYjRjcjQwZlBnNWhDcysv?=
 =?utf-8?B?TVlkOGxUelg5RDhDWUY5eTZ3anZwTFJ5aHVYZU1DSUwyVUpuamlFZk9pSlQ4?=
 =?utf-8?B?bjkvYUp2SGthZG5SSDlDemJYVk9qOXFiUUZWVSt6MkxBVFBFZmFXemU1YU1k?=
 =?utf-8?B?bXVmdElFeXh1S3dSemY3WWMyYkUzeTFNeGo5dlRwb3ZCSjBHaGpZUXpkeFF3?=
 =?utf-8?B?YVZlK2cwMmQ5dG93VjFjN2E2YVZGUERlZXcvRDgzMUsvYXRTcUJUaHovMjZs?=
 =?utf-8?B?ZzVQcHViWGU4bjNDM2RxMnRBdkZqM0x6Y1J0VjBHSERPVm1sWmtPazl0b3hy?=
 =?utf-8?B?MUxyd1VpUk5aclJrb0taZUJaRktHVzFxMGR5QklIVVQycTNaU2dvTUhURHlr?=
 =?utf-8?B?UCt3WTJtbEdsOWxxMEFSVGxhZTRZdlRmbTkyV3JCZ2tmbHRxN1RFdC83a1Bh?=
 =?utf-8?B?US9oS0IrTUN6c0s0WUFvNzMybTd2SkFUZXR2eERjQ01ZcWM2KzhEd28zbzVK?=
 =?utf-8?B?SVNIbmpWZCs4OHlJclNsMWp3UTlFNTl2S0tqa3JFNkxxWnEwd1FDdDNqNVZq?=
 =?utf-8?B?eXhwVTNWdU1GZ1ZXeElEK0lCZ0tNYXF3TldBMW92d1VPWnNObVhTMWNwT1NP?=
 =?utf-8?B?Zi9La05qVWNOUk5Qa2JveHY1ZGdyZEJ6NGtwdmxqMjlISmpuL1J5NW1Fa3lO?=
 =?utf-8?B?UGFia0ZneEliL2ZwQmd3UGlwQ0tzUzN2bGo5SWR0S1JqYmJlZVpTTjUzRzNv?=
 =?utf-8?B?UkF0VDhQSEVlcExvTXBSWEdKOXhpNUJxR3p6MzhadElkbGNSdWtSSmVkUm9n?=
 =?utf-8?B?azZ1a3d0d1p6Smsyci9nem1kajQ0MEdEZWpwdlNkcitYb2ZMcHNSTXIvRTRK?=
 =?utf-8?B?TmlOcUc0bmo1UHJIaWJ4MUZhWDZXZ0NpL2pidGZBK1V6S3c3dnZ1NVNEcDFw?=
 =?utf-8?B?czdqb2tBcUJnVVdnNjVnUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTljZWlBd0MvSGFqL0t2NDQ4aE8zbTNMVE52WFlXV2FkaGVZOXd1RUp2ZUZ0?=
 =?utf-8?B?VGFYZ2xhYkhnWGlTVG5qSkpsUkNLWjJRRlVSTklDNWxZNkdRcjdCeVFpV1c4?=
 =?utf-8?B?dDVYeitwWW92aVRQYW85UEF4Z3pnUlJRMWJFRG1zYXhWend3WG5sQ1ZjcEtL?=
 =?utf-8?B?RmJVZjdkZVdYd2o4dEYrWGhCSGpSd1RlTlU1VGRvQS9uVlV4MTdUQmhURGY4?=
 =?utf-8?B?MWU5OUhwRmlmYmo3d2k4QmlCZmd2OWppdE44bFVSSDd0T2VUTjhRQVhCYUt1?=
 =?utf-8?B?QmgzQ0R6RkwwT29FK3R1TC9XbDRxMVdtQjBnS05CTDZPNnhyTWt5VXVtMzF1?=
 =?utf-8?B?bHJGOXZ5d3VEenZxQ2NZRzdQTDdiYkZRYWE3dER6TEMxRHZVT1FYRmVxUkQy?=
 =?utf-8?B?d1lsSDEyYWxrN2d6bmdBR29nY3ZQQjVEOHRUREsyU0lLWVp6NUxkOFpzYkll?=
 =?utf-8?B?R2svRytQUVFVYVk1QlhWUzY2VXg3ZlF2UExKdGJKSU1adC9tL203aGJ0bEJY?=
 =?utf-8?B?Z0JWaVVVREFqeVU4Wlg2Y05sMXFxOTdBakRBZXV0ZE1mZlR5SlZlK2cyM0xp?=
 =?utf-8?B?YVdKZXBrV1ROSjcrMGhaL0FuSktVeFBjNU1ZR0tnQjgwUDFEUkJqbjJYQVN5?=
 =?utf-8?B?T3pianozUzBuWll5MFo2b3BSZ1BCdTcrMDhLUzM3NzUwUXZpOXV1bEsxczQy?=
 =?utf-8?B?aWZrdStRUktETDNTNDg1RllJMU1VWWNJbXA0UmZNb21WNEh5aW1kYWN2MjYz?=
 =?utf-8?B?OWNoT3NOazBOYUxNTjVRUkdQUEU5bG8zOTFpSzJhdjVXam5kTjY5aDNFeTNz?=
 =?utf-8?B?bHdIdmc1WDhIaEFLSE54b2hPNms4NDdVd2hlVzdWSGkzRERYZnJiY2w0SWpa?=
 =?utf-8?B?UDUxVFZQajNiUDlPK0xFTmt5a285ODZoWGZQRlo4R2dFVjRiaE9sSng0eFlh?=
 =?utf-8?B?VXRHeUxUTXAwWFNURTFvZTR4eXRzN0VsK3p2WFpuZDNlZVB2SXFKR3Y5TzV3?=
 =?utf-8?B?dURnU29hYzY5Mm90MkFVeFQ3YmFtOWp6SzlpYjJCVmdiTjNuUkFyVlJpVlov?=
 =?utf-8?B?V1d0emN5cktxMmZub09hbFNEcjdPVWRDVktBOHB1WVFzbHZ1dEhGbVA3dU0z?=
 =?utf-8?B?UVc3WTgwVFZMR0hyMCtkL2JrZnhwU3N6WVZZcW4zczd4emxMQkdoajlzNDE5?=
 =?utf-8?B?TThSa290bWwyNTdNS3ZCdjVyalhkdnQ0RVBkbEdjMFhBNzcwTjVEWUNPWTZT?=
 =?utf-8?B?WTJaZkExWkM5TUY2WEF2RVhCaFdwazNBQ1J6cVd5bHBQcHJKYW5hNWllR2JR?=
 =?utf-8?B?dXRyRDk1ZEEzT3BGdGdMWjNHY1ozMk1BQWxHL1RlWlArNFhLZmJNamV0Zzg4?=
 =?utf-8?B?RW91cGFoWmVCSUVpRVkwZ0pJVHN6R1ZUNW0xbXVFcUxGRVdkcERJTUNlaW9K?=
 =?utf-8?B?OVEyTk9PbDJjMlpJWitGQXkwMFF5ME9nUUpvdzhmS0pSTmdicXVoNVN6QzZ6?=
 =?utf-8?B?Y2hQSVBYcjN6YWRsTXBlay9ZazRuUW5FRnVtUzBKMkY4NS92aU1GWmxub25V?=
 =?utf-8?B?aTNvdGhteDgzNDV0MzdibURNb0hjMm5aR2dwTkt1SkkxenVNRlYvRnlPOWJF?=
 =?utf-8?B?akZPcnNEMTYwUjVOTDJoa0ZQS09FWHNlYWtrL1cxcWZMamxkSkJNelZRZkU3?=
 =?utf-8?B?c3p1UVkyMzFCcElzYy9RWGtuQ0tnczRsSVJnUWpQMlFYaXZNQ3JnREd3SVdi?=
 =?utf-8?B?MGc0emZORlViNzczSnlva3Z6amNkMkYyTkM1T2pmTGNYVFEwRWlxK0drZ3NW?=
 =?utf-8?B?aklRNSszOTR0WWY2VjcvZmMzQ0g3c3MzRnE0Mk9Hd3Z2NTVsK2VoUDRIUXNh?=
 =?utf-8?B?czZTODAwdnJnVTlwd1VUODBwTGpmc3NPVTJTSnVzeDJ3akYzZ1pOQTVJOUZJ?=
 =?utf-8?B?ZnNkOE9yWVVhVXE3cGRRMU5qRUdjZk1uNENjUmJ6ZWFBeEhuMkswOHBKY3Jv?=
 =?utf-8?B?QnNEZkNtVTdQL091YTdIdWJqcUNwMmpzMzV3czd0RWpVRHU0YjN1QVk2NDZz?=
 =?utf-8?B?cm1mcnVlcnduSFVLeWJhS1h2eGVUZUJNMzdWWTBMQnB5WGxKZ1lVMm9PdWFY?=
 =?utf-8?Q?zFzf2aFKOhxzxYRbrPEozjXEY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29fd65c3-663b-46b4-7f26-08dcc73c3a99
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 08:34:27.7292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uOnIzJDYzYZaW5fKSzufmOlK7ClVohPyOlOWmy7lMIYsSQMpHHySSbYw/UJyQoYcNV1QYBxKiDg41HpA1REncQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7625
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


On 8/28/2024 10:23 AM, Thomas Hellström wrote:
> Hi,
>
> On Tue, 2024-08-27 at 17:49 +0200, Nirmoy Das wrote:
>> HW treats any access to 1-way or 2-way coherent memory as compression
>> disabled memory. So for such BOs there is no need to do CCS clearing.
>>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index cbe7bf098970..24701272e3af 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -283,6 +283,7 @@ struct xe_ttm_tt {
>>   	struct device *dev;
>>   	struct sg_table sgt;
>>   	struct sg_table *sg;
>> +	bool skip_ccs_clear:1;
>>   };
>>   
>>   static int xe_tt_map_sg(struct ttm_tt *tt)
>> @@ -404,6 +405,8 @@ static struct ttm_tt *xe_ttm_tt_create(struct
>> ttm_buffer_object *ttm_bo,
>>   	if (ttm_bo->type == ttm_bo_type_device && xe-
>>> mem.gpu_page_clear_sys)
>>   		page_flags |= TTM_TT_FLAG_CLEARED_ON_FREE;
>>   
>> +	/* compression is not allowed for cached BO so ccs clear can
>> be skipped. */
>> +	tt->skip_ccs_clear = caching == ttm_cached;
> In theory, BOs that are promoted to fb (not created with the SCANOUT
> flag) can AFAICT have caching remaining at ttm_cached, yet still sent
> to the display engine, reading uninitialized ccs.
>
> Also I think LNL will be the only HW having the "feature" that clean
> cache-lines are written back so in the future we might allow 0-coherent
> with ttm_cached.


I Just read that no compression for 1,2-way coherent is only for LNL In 
seems so this is mainly applicable for LNL.


>
> So IMO we need to improve the detection of "skip_ccs_clear" here.


How do I detect when a BO is promoted to FB ?


Regards,

Nirmoy

> Otherwise, I'm all for the optimizaion.
>
> /Thomas
>
>
>>   	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching,
>> extra_pages);
>>   	if (err) {
>>   		kfree(tt);
>> @@ -664,13 +667,16 @@ static int xe_bo_move(struct ttm_buffer_object
>> *ttm_bo, bool evict,
>>   	struct ttm_resource *old_mem = ttm_bo->resource;
>>   	u32 old_mem_type = old_mem ? old_mem->mem_type :
>> XE_PL_SYSTEM;
>>   	struct ttm_tt *ttm = ttm_bo->ttm;
>> +	struct xe_ttm_tt *xe_tt = container_of(ttm_bo->ttm, struct
>> xe_ttm_tt,
>> +					       ttm);
>>   	struct xe_migrate *migrate = NULL;
>>   	struct dma_fence *fence;
>>   	bool move_lacks_source;
>>   	bool tt_has_data;
>>   	bool needs_clear;
>>   	bool handle_system_ccs = (!IS_DGFX(xe) &&
>> xe_bo_needs_ccs_pages(bo) &&
>> -				  ttm && ttm_tt_is_populated(ttm)) ?
>> true : false;
>> +				  ttm && ttm_tt_is_populated(ttm) &&
>> +				  !xe_tt->skip_ccs_clear) ? true :
>> false;
>>   	bool clear_system_pages;
>>   	int ret = 0;
>>   
