Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A328EC25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 17:20:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1FEF10E64A;
	Tue, 28 May 2024 17:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nSBAI1aR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BF410E19A
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 17:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716916833; x=1748452833;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Aggm2EStAg7xDCXkve5Q3ZygmT5KX/VEelGfNlGE6Vg=;
 b=nSBAI1aRwTpwIP8Up7y9BBdFtu3u+5NIbLp49GJcqGtVEhZl8pdBjtOO
 KfmcupaMYyH0la4HYcwvVjilHZUDJiNuYefz07yPNeTlxJLgpOV3e49gq
 q7h7d1qvnw2XVd25l6zQsNnsi09ZBJtBtYieyWDenHoP3ivfTDkkTTkFi
 ons/fYUp2dlniDiDutsZgwLA2ra/aYsjWRZaquMyn6lqa3MzWqNIXCEoc
 4W7qfEGnSIXfFrnIC11Hv1IXtafEAYWKViI0MS23379oJNwSy70T7mYdS
 /a0MWppHOZzUPpT3Z25ai+LpklAk/a4dW7MYv9aIfqGNHlP6TiEVQpHM0 Q==;
X-CSE-ConnectionGUID: ZfhrPfIjQGSGu/4DnVNjIg==
X-CSE-MsgGUID: 7rfINXlrR5WtiyZ4uu4WOw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24695856"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="24695856"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 10:20:32 -0700
X-CSE-ConnectionGUID: HjieaZdWRjmq2MhCRMwG4g==
X-CSE-MsgGUID: tDshHPLNQoubZR5hW4wZFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="39647462"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 10:20:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 10:20:31 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 10:20:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 10:20:31 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 10:20:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mSYUlxwrVY6LwRl30NDBunokWctQrDnoMLnB6iWEY6JUNWJTOClCABGFZoT7sl0MsAIiza70X28bPoNVMb6qrUTqrhPARFIh+hCG+0Q2nkTgpnsQdb6qyo30PR3ZBqPrxNg0JmV6J+XM+kTZ+BTnVY2ar2oAyME6pBKwfu1fyyuKXAXlQfo3rbKRpKNvd/9p/3lk3QDE6ZSH2xfPvBh4qePZhGIAyHew2ySxMBuWyLCQSCLgecuYdxS8H/z3UEhq0CHA1JjKWqUhumEpYAl979CYA4s8e5JYah9us4ZL3UWMTHoMHmNItv82U1sDuVfRNbeQyIVU3ZMPQ4OA2B3bqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXo9DqfB1asbPvvMNqqUCkgrjFrfOb2D/yLUum8iQ4c=;
 b=gscAgg2gZ3NGWT2g5hov9Og5bexCWnla043XVA5gyy46tdMe9/fY1HokPc+CyRxAFrn40DkfgwSaZFJEaw2kgwV9g5UtX98i9Sw9PXe0MZOKZ9bIdx6xAmu3+gAMB32k5V7eyy9+FsTB0IPU2xzDU124bgCgVKWFuqgRznGQyZu6AT8ZxkW95J4DP21E67Yt4xB42t0e9PGOVw9SX6DNKbqyKj99zeEvGHYkjwGoE56qgmmgcYcxlWBcX+BL4uszwVikraSp33Y2nIAc1mTIcWLNb+8Fwhfog9hjpo+WCa9IxO2GoOyywh6fCLlLvIw9PJ+R5PUZYRyzIRux4XRSkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by MN0PR11MB6112.namprd11.prod.outlook.com (2603:10b6:208:3cc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Tue, 28 May
 2024 17:20:27 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 17:20:27 +0000
Message-ID: <8e778ce7-40a4-4ac0-a117-47e3645c6029@intel.com>
Date: Tue, 28 May 2024 10:20:24 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [CI 1/2] drm/xe/lnl: Apply Wa_22019338487
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>
References: <20240527211928.1179357-1-daniele.ceraolospurio@intel.com>
 <20240527211928.1179357-2-daniele.ceraolospurio@intel.com>
 <u5bsgsjzqzvm2cqorgl7uggaiyagpjzwhxv6vl6pmpolgbbivo@nh52juk6ql3f>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <u5bsgsjzqzvm2cqorgl7uggaiyagpjzwhxv6vl6pmpolgbbivo@nh52juk6ql3f>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0016.namprd08.prod.outlook.com
 (2603:10b6:a03:100::29) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|MN0PR11MB6112:EE_
X-MS-Office365-Filtering-Correlation-Id: f9960c83-37d3-4986-d2e8-08dc7f3a7792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFRKZzg0TVR1TkFmTVB5d013LzFCempteTkvMHpzZ21lK0lnWHY4c0l2QjMy?=
 =?utf-8?B?S1Z1UEQxc2RqRkQyZ3VxZEkwdk1LZmRndlQ3VkN4MUp1UitIOHFmTHVUTkZi?=
 =?utf-8?B?QUhqZVdjTjBkWlZzTXdTMmMrU3ZvaVA2YmZzWktjSUlNNDJvQVVmR2dtZFFw?=
 =?utf-8?B?SnFuNjhiL0xqeGRqcjZhMFFnNmlyaC90M0hxRitqNmtQc1BILzBRNTdCUWhJ?=
 =?utf-8?B?SktaaEIzR1NxY3dweEFkUE5XMTNoQ2F2b1d2NTlwQlRKMW5jK2xjQkVzUmdO?=
 =?utf-8?B?ZlIySmhkWnVza0pkWU5HL2JMbDNFRnMzbHpqNDhtdUs4VWJOeEdZVDFyeHhQ?=
 =?utf-8?B?Z2VEeXJDczJPTVVTWjJsQStueExrdVB1M25iYXNYUWdKbU1MWDFqT25sWXF5?=
 =?utf-8?B?VkdKQTVvQk5VRW1jWUZBQzBsTWFXTE5WYlVkTHgxa29Sb1g3a3IvcTJmL0d1?=
 =?utf-8?B?NmhhRnJBSUowV1MzR29zalF2UGJ6M3NjT3h2elZadStlY3A3WkRiVVpqcW9V?=
 =?utf-8?B?WXhreGM1d05hQWN6Z0Y4UjBNRE45a2FMUGpoRVVvaTlSY1dvSkhIbkZOR3Vz?=
 =?utf-8?B?cjJnOFNzTnBYSlE0clhEVnZERHRCMTRieFJVR0hkaEtOUnBRNFltMVVOZDlT?=
 =?utf-8?B?SFNwaVJ2b3pIMGNNeTgwblhBTS9ORWtUbHNxNEJzTWRQeGlibzN4Z0FTdnpo?=
 =?utf-8?B?ZnVpQjBXNU5rcTdaN2I0ZEFpL1djMDhJVWFJNHJzbThja09FWDhPU3A3K1kr?=
 =?utf-8?B?eXZNUGlEb1pwdVR3blcrZDhETWtremcrRitHMUZyR29TYVlmWndwRmtabXlR?=
 =?utf-8?B?S3g3T0RMVGtyMTJIQXNJWXJIeVc4T0NRMGkydm51L2lkbFJjSFFtem1hM09D?=
 =?utf-8?B?NWJRbXl0aDdoOG1tcjNYN0pXSisrZm9NNkVNeXgxVnVuTUhERG42UlBoaXlZ?=
 =?utf-8?B?bUpZVUdzLzYxQ1pJeTV2Y2Z0VlFXdjlkcWlXTjdUcitFSzhZVkE4TnoxWnFJ?=
 =?utf-8?B?MzNEbnFYbFlKa1RyNmwwbW0yRFhGQXdzSmU2VXdJYzBIRVk2aDR1K0NSczJz?=
 =?utf-8?B?cTdnR3hFRkNEZFp1OTVmZFM3V0Z4RFVpelkzNThjV2xua2hmb05lR1R0Z3Nn?=
 =?utf-8?B?NzNhNXViRlAvNGY5aGFaS1VxY1NWc3V3YW1hS3ptSmxVck9DQy8vQi9aWmJL?=
 =?utf-8?B?aWgycFlQREI3WDlRRVd6QU95VUE1YVl5bDBFUXowTFNsT0dCZlo5T2pLNWdo?=
 =?utf-8?B?NmpWUXV1VmptdGtRSFpqZ1RHZ2wzNHVBcWZnc0JvVzh0Ym9OL0ZSSzdDZFJw?=
 =?utf-8?B?QXk1T2w4c0FheWRpZmlDSTJsMHpYZm1MWEZPNHh2MFVjdnNjKzhncHhyR0lL?=
 =?utf-8?B?RkpvZFNTamQwVDhUcWFOVjJJa24vT2poZnRpbzB0RDRlSEhUTm9uRk03VlMv?=
 =?utf-8?B?OHlJWkJJL2hnK1EwVmRzemhvb0FNT2xFVmxhZWQzdVZ6cmI3OHIwZk9XUy9s?=
 =?utf-8?B?TTZXekovVHN4VC9OK2Fkc3d4aHlqRGZGSFY5V1FwWmVxWjNORVJsNDhZWW55?=
 =?utf-8?B?OEhPc1hCNGpYbmxONENxM21iWWdpWGh3dDRvdWozdXJnQmJXSmlHOEZNaWx5?=
 =?utf-8?Q?A18+GheMKiJR57laChnlZqRRgcUNgci8jkMJNflVeOto=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d25XVFUrWHhXVnZFaG91bmJ3UlBzTjJ0c2hWeEVaTnJiZk1HdEJ2NzhwdnhJ?=
 =?utf-8?B?NDRiOVlPVHJ4U2dSdFR6blhIZ014ck1UVGNWTG5aRVJnc1FoWHFRVTRsOHpU?=
 =?utf-8?B?MjBZaE1wSW0vdzVkVHRic3F0dFZacGdWUUEvSEtiMExHOHNpOXhrTDBnaEZI?=
 =?utf-8?B?bUJROWFiNEJkQ2trOGFwU1AxQmRDUDZ5RGpyWVhMY2ltUkh1cmZMYXJ4UmRL?=
 =?utf-8?B?dHlqck9SQVkyWlBwb2pZVDd1N05Gd1lwVzhpQWZoMFlUYmVpMjBjRk1IL2Mv?=
 =?utf-8?B?UUFpbFNsYjZacldrUEhuMzhQYVJJKy8yZHMrajRZYzdqak5mVHZsaE1TZ3RP?=
 =?utf-8?B?eWRTenJOSmJPZ1o2WmNmcUVaYlB6OUxjNE1nSEhtSkpvSXI1dDNubzhRZkh2?=
 =?utf-8?B?TmtzMXltSS9Ra3NaN0ZOYlAwajVGNURZV0llWTFyWGJJOVh4a2ozRlUrUEZt?=
 =?utf-8?B?VGZHeG94NXdIK01HNUVuNVJRKzVVZ01kSzVXZnV6T1pYdWcyTGZlSmpBekdu?=
 =?utf-8?B?eWFVQXdpTkhDRlV6YmIyWkRpNTFXK0FqUEl6YXpWclplM0NLeTRXNGlST0hK?=
 =?utf-8?B?YVhlbzhhRXNPMjN1SHlpQTl1Rm1XRE1kd1V2dWhaTk02b1JEZVB0Rndla1Nx?=
 =?utf-8?B?LzlqTVRWVFpRTEFweHl2ZUpXd3Z2dlltSjhqSnBSa1JVM21qNWtQOGZIMkpu?=
 =?utf-8?B?d3lxL3RYOUZCbDV3TU1qRWx0MDhKajV4UFVyWG14TkdPN1k2dFFZVUxwR1cw?=
 =?utf-8?B?blk4YXA4ODdvK3lqUjVCWnNhQkQ0SURtc2gwOHNJN0lYR2R5dXErNVhQeDVu?=
 =?utf-8?B?OEVaTzJpa2drd1lCUFVKUlJnaVBvV1FuWUlTM0cwU0RpSmM5UmhVRkNhK3RK?=
 =?utf-8?B?T29HSVRMeUt6M2FkbzF0bmZYc2JoK2VKY2xzTi9hRzdWWVRZY3FlRW5ObklS?=
 =?utf-8?B?ZG83VTh5Nkk2WmprMSsvd0pBMVFxYU52bkk2WDUvUlByNGYySVVTL3d5Rm5G?=
 =?utf-8?B?bDUvN0lGT1FUYjZqSktvdVFsaWtodVNpUVFGQnpjU2w2a1d0RFFDRWJnNlBN?=
 =?utf-8?B?RFl6cFZub2FaVUlsVnc1eTdOcWc2M3U3eUhFZXRJbTlHQm9WRmNoSTRJMzVR?=
 =?utf-8?B?a2hmeVIvaUZBWWFvQWxLTHRqWTlJd2pSREJ2RjBaZXpMakVkS0V2MDRnaEJU?=
 =?utf-8?B?dS9xZ1NpVFo3NC83RlVyTUo3NHplNFBxU1RkbE1CYWlNR05JRExoZ1E2NXhT?=
 =?utf-8?B?VndoL2kxUWZsZlk5Y3laNG55OGxOc1JkVXRMbTNxVEFUSEowWFBJaE5uakh6?=
 =?utf-8?B?Q1BCUjRuL29Sd3NLUU0rcXBmNkpaWlRkZEV3MmF0Nm9qSWdwMmJvZlJkT1JY?=
 =?utf-8?B?dStKYVVZWE9tQ2FwOWEwWkhuNGlQcnlISEVkUnlpcC9xdUtsR0lmZk5HYnlk?=
 =?utf-8?B?UndmMVRwOUZzU1h1aWlCVWNCVy93RERNcUU0UDhwbjV3LzBDU0pZWWxrZUtj?=
 =?utf-8?B?RjU1TWlLbjFBais3K1l3QmFzY3NTMUFMZG1mRWNrMFVkaHhiYkFvZTBBb2pN?=
 =?utf-8?B?VU1IaEd5WWV2Q05kYVlyMHBhZDZiVDRqaGNITXZMbTZpRXVuaUQ5UGVZT3hS?=
 =?utf-8?B?ZFFFQjB0NDNLeFZnczFrUUJmTmJyWm83TnlJQnNYRE1lK3VKL1JzRW1iZ3Fu?=
 =?utf-8?B?VEZZc2xKWmQxYVMrd3ZwRjdEVkxoWGo2cEx5V2tUSU0xT2JEZTRFeW1RdEJ1?=
 =?utf-8?B?TzJVOStMVFRYU3c5d1BUb0dQQm8xbklVOGJENVZINXY5Z3lZS3FNYTg4NnRh?=
 =?utf-8?B?eW4rY1M0TG9iNUsySXcyenpNaG4vZmZIR3hNaW1PdERORWJxdkJrTEN3STc4?=
 =?utf-8?B?QU5zL25KcUg5d2hrem5xTjFESE9NUDU3VG1zWmxNK0UxN09zSE43N3J5YmNw?=
 =?utf-8?B?b3FRRXUyMUYzZXlXWkFrODFBMjlzOE55WUQzVVg1cERhQ0JHUzI2c2I0eC9X?=
 =?utf-8?B?NW85enp0dXZ2cjNXS29WUENnUEg4ZEVKalVqajQxRjUrVmVoUU8rRldnWS9K?=
 =?utf-8?B?dm4zWVFDOHU2dmxzRlQ4N2JJU0wwTXpjN1ZwY0J4K3hoQkYxRHVOTjdDU3h5?=
 =?utf-8?B?SE85QlQyV2Y1Q1lyU01VOTgxQnBwWitibGF5MEw3MzltWi9mTTVDMCs5cTJP?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9960c83-37d3-4986-d2e8-08dc7f3a7792
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 17:20:27.2165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZJsWkur4+b+AL4uLT3l+JWdRhP/bqPG4BmPJVUGwXTVzBcnax9dH7Uh87Fi4/QWILriI4u8Zgwf3APryj1Af0wOEYYnqASrw7IZSWE6/nfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6112
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



On 5/28/2024 6:45 AM, Lucas De Marchi wrote:
> On Mon, May 27, 2024 at 02:19:27PM GMT, Daniele Ceraolo Spurio wrote:
>> From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>
>> This WA requires us to limit media GT frequency requests to a certain
>> cap value during driver load as well as after driver unload. Freq limits
>> are restored after driver load completes, so perf will not be
>> affected during normal operations.
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>> drivers/gpu/drm/xe/Makefile        |  2 ++
>> drivers/gpu/drm/xe/xe_device.c     |  8 ++++++++
>> drivers/gpu/drm/xe/xe_gsc.c        |  8 ++++++++
>> drivers/gpu/drm/xe/xe_guc_pc.c     | 31 ++++++++++++++++++++++++++++--
>> drivers/gpu/drm/xe/xe_guc_pc.h     |  2 ++
>> drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
>> 6 files changed, 50 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index d5b137e762ed..3701d1a01e50 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -47,9 +47,11 @@ $(obj)/generated/%_wa_oob.c 
>> $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
>>     $(call cmd,wa_oob)
>>
>> uses_generated_oob := \
>> +    $(obj)/xe_device.o \
>>     $(obj)/xe_gsc.o \
>>     $(obj)/xe_guc.o \
>>     $(obj)/xe_guc_ads.o \
>> +    $(obj)/xe_guc_pc.o \
>>     $(obj)/xe_migrate.o \
>>     $(obj)/xe_ring_ops.o \
>>     $(obj)/xe_vm.o \
>> diff --git a/drivers/gpu/drm/xe/xe_device.c 
>> b/drivers/gpu/drm/xe/xe_device.c
>> index f04b11e45c2d..85c1b0c406a6 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -16,6 +16,7 @@
>> #include <drm/drm_managed.h>
>> #include <drm/drm_print.h>
>> #include <drm/xe_drm.h>
>> +#include <generated/xe_wa_oob.h>
>>
>> #include "display/xe_display.h"
>> #include "instructions/xe_gpu_commands.h"
>> @@ -37,6 +38,7 @@
>> #include "xe_gt_printk.h"
>> #include "xe_gt_sriov_vf.h"
>> #include "xe_guc.h"
>> +#include "xe_guc_pc.h"
>> #include "xe_hwmon.h"
>> #include "xe_irq.h"
>> #include "xe_memirq.h"
>> @@ -51,6 +53,7 @@
>> #include "xe_ttm_stolen_mgr.h"
>> #include "xe_ttm_sys_mgr.h"
>> #include "xe_vm.h"
>> +#include "xe_wa.h"
>> #include "xe_wait_user_fence.h"
>>
>> static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>> @@ -337,6 +340,7 @@ static void xe_driver_flr(struct xe_device *xe)
>> {
>>     const unsigned int flr_timeout = 3 * MICRO; /* specs recommend a 
>> 3s wait */
>>     struct xe_gt *gt = xe_root_mmio_gt(xe);
>> +    struct xe_guc_pc *pc = &gt->uc.guc.pc;
>>     int ret;
>>
>>     if (xe_mmio_read32(gt, GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS) {
>> @@ -344,6 +348,10 @@ static void xe_driver_flr(struct xe_device *xe)
>>         return;
>>     }
>>
>> +    /* Set requested freq to mert_freq_cap before FLR */
>> +    if (XE_WA(gt, 22019338487))
>> +        pc_set_cur_freq(pc, min(xe_guc_pc_mert_freq_cap(pc), 
>> pc->rpe_freq));
>
> it seems pc_set_cur_freq() is violating a layer here. At the minimum it
> should have the xe_guc_pc prefix, but it seems we actually want a higher
> level call here like  xe_guc_pc_prepare_for_flr(pc). Then the WA is
> handled internally to xe_guc_pc.

Note that this WA is being reviewed as its own patch here:
https://patchwork.freedesktop.org/series/134036/

Just mentioning it because I'm going to respin this series later today 
with a fix for the GSC proxy unload and I'm not going to include your 
suggested fix for this patch; I'm only including this patch in the 
series for testing, so it doesn't really matter if the patch is clean as 
long as it does the right thing :) . I'll leave it to Vinay to fix it 
properly in the other thread.

Daniele

>
>> +
>>     drm_dbg(&xe->drm, "Triggering Driver-FLR\n");
>>
>>     /*
>> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>> index 80a61934decc..4369e3ff19cf 100644
>> --- a/drivers/gpu/drm/xe/xe_gsc.c
>> +++ b/drivers/gpu/drm/xe/xe_gsc.c
>> @@ -22,6 +22,7 @@
>> #include "xe_gt.h"
>> #include "xe_gt_mcr.h"
>> #include "xe_gt_printk.h"
>> +#include "xe_guc_pc.h"
>> #include "xe_huc.h"
>> #include "xe_map.h"
>> #include "xe_mmio.h"
>> @@ -342,6 +343,7 @@ static void gsc_work(struct work_struct *work)
>>     struct xe_gsc *gsc = container_of(work, typeof(*gsc), work);
>>     struct xe_gt *gt = gsc_to_gt(gsc);
>>     struct xe_device *xe = gt_to_xe(gt);
>> +    struct xe_guc_pc *pc = &gt->uc.guc.pc;
>>     u32 actions;
>>     int ret;
>>
>> @@ -370,6 +372,12 @@ static void gsc_work(struct work_struct *work)
>>     if (actions & GSC_ACTION_SW_PROXY)
>>         xe_gsc_proxy_request_handler(gsc);
>>
>> +    /* Revert the min/max freq limits as we're done with GSC/driver 
>> load */
>
> same thing... do we need a higher level call here rather than calling
> the set max/min freq?
>
>> +    if (XE_WA(gt, 22019338487)) {
>> +        xe_guc_pc_set_max_freq(pc, pc->rp0_freq);
>> +        xe_guc_pc_set_min_freq(pc, pc->rpe_freq);
>> +    }
>> +
>> out:
>>     xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
>>     xe_pm_runtime_put(xe);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c 
>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 8187dfb2ad6c..3ecfbaa75495 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -8,6 +8,7 @@
>> #include <linux/delay.h>
>>
>> #include <drm/drm_managed.h>
>> +#include <generated/xe_wa_oob.h>
>>
>> #include "abi/guc_actions_abi.h"
>> #include "abi/guc_actions_slpc_abi.h"
>> @@ -24,6 +25,7 @@
>> #include "xe_map.h"
>> #include "xe_mmio.h"
>> #include "xe_pcode.h"
>> +#include "xe_wa.h"
>>
>> #define MCHBAR_MIRROR_BASE_SNB    0x140000
>>
>> @@ -41,6 +43,8 @@
>> #define GT_FREQUENCY_MULTIPLIER    50
>> #define GT_FREQUENCY_SCALER    3
>>
>> +#define LNL_MERT_FREQ_CAP    800
>> +
>> /**
>>  * DOC: GuC Power Conservation (PC)
>>  *
>> @@ -238,7 +242,7 @@ static void pc_set_manual_rp_ctrl(struct 
>> xe_guc_pc *pc, bool enable)
>>     xe_mmio_write32(gt, RP_CONTROL, state);
>> }
>>
>> -static void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
>> +void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
>> {
>>     struct xe_gt *gt = pc_to_gt(pc);
>>     u32 rpnswreq;
>> @@ -674,6 +678,14 @@ static void pc_init_fused_rp_values(struct 
>> xe_guc_pc *pc)
>>         tgl_init_fused_rp_values(pc);
>> }
>>
>> +u32 xe_guc_pc_mert_freq_cap(struct xe_guc_pc *pc)
>> +{
>> +    if (MEDIA_VERx100(pc_to_xe(pc)) == 2000)
>> +        return LNL_MERT_FREQ_CAP;
>> +    else
>> +        return 0;
>> +}
>> +
>> /**
>>  * xe_guc_pc_init_early - Initialize RPx values and request a higher GT
>>  * frequency to allow faster GuC load times
>> @@ -685,7 +697,11 @@ void xe_guc_pc_init_early(struct xe_guc_pc *pc)
>>
>>     xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>>     pc_init_fused_rp_values(pc);
>> -    pc_set_cur_freq(pc, pc->rp0_freq);
>> +
>> +    if (XE_WA(gt, 22019338487))
>> +        pc_set_cur_freq(pc, min(xe_guc_pc_mert_freq_cap(pc), 
>> pc->rp0_freq));
>> +    else
>> +        pc_set_cur_freq(pc, pc->rp0_freq);
>> }
>>
>> static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
>> @@ -716,6 +732,17 @@ static int pc_adjust_freq_bounds(struct 
>> xe_guc_pc *pc)
>>     if (pc_get_min_freq(pc) > pc->rp0_freq)
>>         ret = pc_set_min_freq(pc, pc->rp0_freq);
>>
>> +    if (!ret && XE_WA(pc_to_gt(pc), 22019338487)) {
>> +        /*
>> +         * Setting min to RPn disables use of efficient freq
>> +         * which could otherwise interfere with this WA for media GT.
>> +         * We will also bind max to MERT_FREQ_CAP until driver loads.
>> +         */
>> +        ret = pc_set_min_freq(pc, pc->rpn_freq);
>> +        if (!ret)
>> +            ret = pc_set_max_freq(pc, min(pc->rp0_freq, 
>> xe_guc_pc_mert_freq_cap(pc)));
>> +    }
>> +
>> out:
>>     return ret;
>> }
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h 
>> b/drivers/gpu/drm/xe/xe_guc_pc.h
>> index 532cac985a6d..4abdefa36b9a 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>> @@ -29,5 +29,7 @@ enum xe_gt_idle_state xe_guc_pc_c_status(struct 
>> xe_guc_pc *pc);
>> u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>> u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
>> void xe_guc_pc_init_early(struct xe_guc_pc *pc);
>> +void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq);
>
>        ^
>
> See the other functions in this header. We don't export functions to
> the other parts in the driver without a prefix for this component.
>
> Lucas De Marchi
>
>> +u32 xe_guc_pc_mert_freq_cap(struct xe_guc_pc *pc);
>>
>> #endif /* _XE_GUC_PC_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules 
>> b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> index 12fe88796a49..a6b897030fde 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -27,3 +27,4 @@
>> 16022287689    GRAPHICS_VERSION(2001)
>>         GRAPHICS_VERSION(2004)
>> 13011645652    GRAPHICS_VERSION(2004)
>> +22019338487    MEDIA_VERSION(2000)
>> -- 
>> 2.43.0
>>

