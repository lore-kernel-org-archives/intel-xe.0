Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DF2EEB57A
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jan 2026 07:08:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5213E10E055;
	Fri,  2 Jan 2026 07:08:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EcrH6o61";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B95D10E055
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jan 2026 07:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767337735; x=1798873735;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GxT1wwWLzAo2vq7AB9oEEQDf7fYD6y7OZhxkOT99LVQ=;
 b=EcrH6o61wqm4vMQIKwANt9ImLA5nCwCXWFdToS6DBdOaXKupd7lZEd4p
 y3NjCkdJGCuh0gWkgZqClnN9QtBhYxZHRN58V8gMcMA9LlnMtvP4PCLHB
 HdGddn/X2UjDelKTuqt2YgQFFQAXJ+zMAwQoReS3xwEG/5aolqx40y1h3
 MA6mwjxbOokyvg4UjR/W8I7zLWFG2+AioOY/zGC1Ar81BkacEl099WTvU
 82aglu8EH8md6WyuLtV4PrjdHhKFWHjJ+EmHUUhe6WmxnLjZhb4wSS70D
 xG/MB2faIPSUNDsO3PqsH68lVjYOagO2GTq+0++OM3b7UH+Nv631+VICv w==;
X-CSE-ConnectionGUID: JZgSuyOcQimCaTWqSmFiwA==
X-CSE-MsgGUID: F9wksgtPQt6YwtLCo5r7QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="72692620"
X-IronPort-AV: E=Sophos;i="6.21,196,1763452800"; d="scan'208";a="72692620"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2026 23:08:55 -0800
X-CSE-ConnectionGUID: 0RhRYVacRE+DH4cPhdOwsA==
X-CSE-MsgGUID: bx07YTEYTfGPtvvGwTVtmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,196,1763452800"; d="scan'208";a="225255350"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2026 23:08:54 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 1 Jan 2026 23:08:54 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 1 Jan 2026 23:08:54 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 1 Jan 2026 23:08:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c6nY3a/KprA0X7mFRTuIebpaRNJtO/q7hsUkWL9X68gr3PmvSHuJe4pxLr1zjXuwq4YJvTUmBLgOLsZt2EEeU7ntJM0CnHqLeHojYLKSKKU/Ce6Pabz2Q1CwIYwUfxSrqkKZbV8R1h2bhjtY6eQSskP8naUusvrt4yl+E6SU9eDx8VOOGQi/ywfZ2BRZXbQ2SSqzLhdWu6MCJGV2iy8qxm7lfkhx/6NL6CRpckBe+LTIvLLuHsgb+hW/74UAgeBH4HcHgjHSvblfnoJvDvFXIxHFiaMYpXrSJwrWhyTJ0pkNDvZtn69ehrc9AITE60/08JZNvVKUHYdlxhPT07u9Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CnFuzQNsUiO6u1WeoROYEHCGnxMmDALHVtEBpMwWRtI=;
 b=dXHXUQ65TLjexIqGvdoerjYw6bVBiecXMcuxY9Orh8jaBDGffLxz5+nFGTTjnyG20FR4c4+CewUxn/75zjegkK9xi4a8RE4P7v6fE+YBFG2DAVzP2elzgZ3GKtM+EGhpk/9WuZY5dNuhm+ZcYgb7N8gHCNbheGu6j6E6kyG1SQZHhsprZNoK/D1fBBz52mwy4Ka376ElArSon15AZTzX7/K2Plv69s/SjRmWdOa9CbiQA1zgqn1aC5UraZRzNNqXUL5yxvdaVUunMW8JHwGvqurNrZTnqEchmZrpZtR3UlAD3umSlFcks8JCck3HxsblLogGfLOmbYHGbp9OMJszwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA3PR11MB9088.namprd11.prod.outlook.com (2603:10b6:208:57a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 2 Jan
 2026 07:08:47 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9478.004; Fri, 2 Jan 2026
 07:08:46 +0000
Message-ID: <74719650-1793-4b7c-8ca1-f43f60f63c6d@intel.com>
Date: Fri, 2 Jan 2026 12:38:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/i2c: Force polling mode in survivability
To: Raag Jadav <raag.jadav@intel.com>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <andi.shyti@linux.intel.com>
References: <20251211182353.1149481-1-raag.jadav@intel.com>
 <aUFLysxZvs_C24T8@kuha> <aUuoYtWvglZ4a3n6@black.igk.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aUuoYtWvglZ4a3n6@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0108.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::18) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA3PR11MB9088:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ff47b27-92b7-43b5-0edd-08de49cdc5a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejhXd0tJVDhXODVEWmZValJsdEx0M3N3bnFnUTY0RU1jeGx6ajMwWU1wOXN3?=
 =?utf-8?B?ZFNEQ0xOL0piNWpxanZyQkY2WnZocGNwcDgrd1B6dGxXeVpLZEQvTUNtZkd2?=
 =?utf-8?B?YUdwbFBxckZBbkp3dW94cjJZOVBVSGlzMXRCcExyMDJuY2Q4L3NnaytnOC93?=
 =?utf-8?B?bkhOY2RyMUFSeXM2T0dKeFpRM3ZHT2F6SzVXc0ZDQ0FJL2t6a0VhMkp2K3Ft?=
 =?utf-8?B?UHAwSDVmMGViRjRBbGMzZ1ZkcTMvK1J3dXpuSUgwS3ptVnA5ajNXREtRMFdr?=
 =?utf-8?B?cUZBaCtNUHZUVWp1dDFZQUpNY3o0L3JoeHdJM05hWHpDaVFjRDEvWmhMaEVx?=
 =?utf-8?B?UVFidDhER1dMemVlNUxXN1R5cUl3QkZzeXkzUUt2ellBYzd5cU5iNnJ0U3py?=
 =?utf-8?B?dG1Ncjc2Y25DaUlqSU9qSXZCbWY0b2o3cENXOVU3bGM2dHo3UWtvNlRadFIv?=
 =?utf-8?B?MTE1blMxT0Q3NjVuakhtVWRJZnhqck9XVEllcS95dVhaUzVJZTRYNDhNSzZ0?=
 =?utf-8?B?aThsMTJ2aHA2c3ZNVHpWQmE3U3k1SE55V3paaXgreEgvK3dwd0tBTkF5d3Np?=
 =?utf-8?B?cjFxcnF3TlZHUHY0U0FSanVZYlQyVExSTWpnMk1xbmRvb1FpRU94amY2ckJR?=
 =?utf-8?B?MTRidTBSK0tmZXgvN3A5eDVQQkN6eFNKNHg2OXJIUS92MTllVlU2UUNkR1RG?=
 =?utf-8?B?czBML29jcGZ2a2FLWWR3d0lOc2J1QXlOd1RNdElxVi9zWEtuM0hUdjV5dS9C?=
 =?utf-8?B?ZlNxd3FQSWtrd0U1OElCcW9KWGxZK01RdllENHFYTG9CT2xyUGdjdnMxUCts?=
 =?utf-8?B?cUtiZ0d4VUhoWmpoS1ZBeURyQWJ6NCs3cTlSM0ZxU2xVbGN0SGRNVTZrSjlT?=
 =?utf-8?B?M2RpOVc0b3ZNcythcjFVQjZvUElQTEJwU1RJMDBWR1VzRDhLN05yV0JvcVpp?=
 =?utf-8?B?bzZtR0pFYlZibm9yVXd2MmVOQURvcEd4SWRoVHZmZ1IyYlhwZTVYR1RzQVpu?=
 =?utf-8?B?azRIZUF2WnNwSzVmQnptQzNmZFM4S2d0aDduKzM3MTJ0VmFUd2R2M2dnU0tO?=
 =?utf-8?B?S2ZnS2xRbldrNWttL2ErZXdweitpWklnMS9GN1B3UC9MMnJNRlBLVHV2NnlQ?=
 =?utf-8?B?cVNHOHVWUmtzY08vZnZFNS9tcEhxUmZMd0VJSmpOSmdtRVdxYW9VdUJXMm9L?=
 =?utf-8?B?ajZyUXBjSWpOWlB3aEhNUDRvSUZYNm84TE5rMWVtTStKVVNqZUJsS1l0dEdP?=
 =?utf-8?B?dW1QTUFaLzBjeG9qekhkR2ZZUUpuamhMYWZDenk2RjByTDM3aXdZYmFEck1C?=
 =?utf-8?B?RC9uUStJWFlYYVJ1QTdtL2NVUFAwUzIrM0NQM0NtbTZJZ3dUMHJIeHhab1lR?=
 =?utf-8?B?cTlRaDEvN3BRREVPYXVzMnhFaWdXSmFZb1NRZExpWlBIUHVyNjZINkhNVzBQ?=
 =?utf-8?B?aHloQ3YrQnNkMDMwRlJDODE0bm5xQjdZa2thczhkNnNUeXVmMmlkTkxKVWxO?=
 =?utf-8?B?WGhuK20zUVRvSThHUStxaDFaOTBGSEppL2dtQnhrMFlrSC9WbWxQaTFZbmV2?=
 =?utf-8?B?Z3JzUlhYbVd4L3FDd0cvTG5IaWFuZGFhNkJFbnp5Q0s2dGpFaWplRXU0TEZv?=
 =?utf-8?B?QVRqeHlydElzSVV3NnZjRjJYMVNoUWp3SnJYTHA1WGtKYlF3WDViNFpqNWd0?=
 =?utf-8?B?SDFKaTgyK0FvQm5QYk9CSXNrdTE4ZHhmczh0ZWJmZnRJT1pud2pYays5WlFR?=
 =?utf-8?B?MjFIRlNta0dmUEFlMU5OajRGRGQzQWhFMmxvTjdzUEM1aGJIVTFVaTFEQ2px?=
 =?utf-8?B?VEFHcWx6WUNFZ0k2WEZrV3AzVlZQTXVJVnVXOStuQWlaU3Z5SURGVDFOKzJl?=
 =?utf-8?B?R0VXenpyTkxZdFV2ZFRmTFNqWGhocldYdWRnb2gza0RqRkU1OWt1WlNrbVdJ?=
 =?utf-8?Q?FZFeXo7c0FKt7WGxj/kZ9F+xztkyCRhT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkdoeGFNWlJRTkdlSHZpOGlhUEdoQ3I1akpRaTZTTXVUZXBJSGhua0JEY25E?=
 =?utf-8?B?ZDd1MFJmOWpXOGJEU2U0dmtJWDdWbEs4OWQ2Zk14QkxkRW9NSnphVmViZ0I5?=
 =?utf-8?B?ek81K3pKcDJpR0xhMlE5K2dHZzA1c25ZRS8rL1kreUEraGN4SUZDL2tHKzZY?=
 =?utf-8?B?bGJnSG1xZnFHdDF4QWFrWWowdmZveEt5Wnlob0xqdXo4SEVuTkRvR3N1NVJr?=
 =?utf-8?B?aUVBZ1RUZFl5MVBuVTA1bmgrZS85UTJSU0Njald6QTVKYmE3UUxNbWNQNktl?=
 =?utf-8?B?WGJxL0x0WVBFMjArTThxcG15RDNtL1dOOWI2Yi85WFNKWVA3K2dWNEdqelZR?=
 =?utf-8?B?NFlCZTJFcVlrTVpkNWJvRkU1cmk0SjV1eEdYZWh2UDF4TWRDaVVab1dKQ2JB?=
 =?utf-8?B?dmJIRnRoV1R4VGtycmRpRUNWSFgvcjN0SHo4S2tTUlRZREsxaitWQjRGcmhH?=
 =?utf-8?B?YTQwVjVFTUdEd2JvN01rK0ZIbXpKTSswWHBhaEZ2SXk1L2hBSmdtYlFBa0da?=
 =?utf-8?B?MVNRWWFoaFJsaXdaODRBUi8yT0tlSkVHdndaVmp5NW50WlVXNDAybUFTQjJH?=
 =?utf-8?B?VlZNR1EwK3lvREtyRVRKMmhJUmdFbEtPZzVHODZjQ2Nna1NuWSt0VWN5U1Z3?=
 =?utf-8?B?cDFqdzhIeGszSkk4djR0TzhBNFN4dlgreFNZWFNxUU83cXpPSytSb2Q0TmtU?=
 =?utf-8?B?aGZHeWZUYzMyalRERExTSXY0dGg1Q1dYOUlkOUNSU3lVdGpWU1FGZlZOYlAr?=
 =?utf-8?B?MkRFUzB5eWFNUUt4VGFKU3ZBM1d2dUdzYXNiWVI1SGdsL1ZabVFTOURmbTJM?=
 =?utf-8?B?Q0FDWnRKOFd3RnQ2WUMycTlRZTdFSXZubzN5Y0daQ2FROUF3bkVtYWFRUDRi?=
 =?utf-8?B?Y2k3LzBhOHJuMmdwWkZjYk9hb3lnMFFheHh5NVVlM0dFVVVQbkx2bWNHMEo2?=
 =?utf-8?B?ZkVTb0trWWRpd1FDZ01qalhlWStqNkRKdzZ3UlNhNE8zdEVuSWxFZmQrVFo4?=
 =?utf-8?B?TUsrS1grV0JaaTdNc2VqQTkzZjB6REtkRXNudE5SMXNiVDR4WXlDZVFQZHdy?=
 =?utf-8?B?aDdoVktDMW9kZGVaTFFqcWlmY2RlMzlYQ3pZN2ROdDd5Q1VMUThvbFcvNVla?=
 =?utf-8?B?b1NkRnlUMWR1WGhUTlcyWWVqSXRxS3E2RGwrTGdCWGxjcVJVby9pT2pkdi8z?=
 =?utf-8?B?SzlzbmZvUDJpSDlRUmVaL3hQVzZSYWp2WUZFYjB6MXdxeHpRbDJFTGgrM01T?=
 =?utf-8?B?bXQ2YTFCeWpJNmFtdW5EdVh3QVBCYjFHZzNsa0dvZGRmcDU5TTZFYndodzN2?=
 =?utf-8?B?M0J4bnBtYVBxMGdvWm13cDZlK3pFNjM4dUtqWWx3a0lpWEtvSHo5QnhybHJO?=
 =?utf-8?B?eTNiSmhubHYzZGJDNVpUU2QzdXMvUzBYdnpTcE5uZlZhTHBCMDNKMkNiQ0Iz?=
 =?utf-8?B?REJnamgzUWR5b3hLNVlJdTROSnRtOXJlY3Q0UzFmSmNvZWZBLzNFNldacjZG?=
 =?utf-8?B?RVB3REFRL0g4SUQyR004SzFCVy96SytNamoxUGVhZXhxVFNKRzltWTZNOE4z?=
 =?utf-8?B?a0tiZmhURzRQNm4ySktDcmFyQ29neHZ4dUpWZzJ3SUVSRkIrQWJUUFMzSUJ6?=
 =?utf-8?B?NmRiaFdEZDV6Z3JZMGtnRzdqTERiMHRSdXdzaGI3VzJ2RGtjYnVJUHYrOVl3?=
 =?utf-8?B?bjFOdjMvQUJySGhZRkVXRzJta3lnMHZxRDJKN3RaNlJRaFhFekpqYVUvcGRx?=
 =?utf-8?B?eWVaUDhoaXJJTWI2eUprL3hoMmsrYlE2M3hiWGtSZVQrVXgrdUZ2M25hVTZw?=
 =?utf-8?B?djllckdPUmMyMDh0WFh2T3M0bTFHbjRKWTZmUnlNeTFFeEppU09Md3ZQTnFT?=
 =?utf-8?B?VnZ0R0RvNUlYM1pWUVZWYTdrY1VaRldwMUtFQW40SERLNzZ1L2tFM3hkenla?=
 =?utf-8?B?SVl3NVI2cWRvM2oxb1BMbWx2TnMxYVE0RU5tMWgydVJPOXAxSWx1cncxL25X?=
 =?utf-8?B?a2VCK1BYeTY1WFZNRUsyZHNmRTZlTHJLZGpNNUs3V1pTNzY5ZVI2eEVYR1hr?=
 =?utf-8?B?WURLalJSbVRXaTBubXlHREM4WjBqZnFtSGFvZUsrNUlOb3M1Q29SMXd6ZzBr?=
 =?utf-8?B?Z1N6N1F2enRzMis0Y090OHdldmxEZk85M0ZpcXpNUUdqOTd6a3JhL1liSnVx?=
 =?utf-8?B?M1p4aVo1WC9KUmhmWnEvVDRyaGtHVVQyVjdTZEZKMWI2RVBtNDhtUCthVm5O?=
 =?utf-8?B?cHFnKzZ5anRldDczNldjMlFvOEVpZ21PNTIyNUUzSkF4T2ZJRjRQYm9SUEJz?=
 =?utf-8?B?aHFFSFQ3eEtCbFE5ODRhOEg5Ylp3dUcrR1IrekpjcE5VdGVpcGpNdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff47b27-92b7-43b5-0edd-08de49cdc5a0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2026 07:08:46.9154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jZhhmnVeIoSWaoktJe7RtsYn6T1ZQaoBgaY7htHlqXe7Fpc7Agmi0enceEiKSuPJecBG+61xGHsdNTkrLhhm8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9088
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

Hi Raag

On 12/24/2025 2:16 PM, Raag Jadav wrote:
> On Tue, Dec 16, 2025 at 02:08:42PM +0200, Heikki Krogerus wrote:
>> Thu, Dec 11, 2025 at 11:53:53PM +0530, Raag Jadav kirjoitti:
>>> SGUnit interrupts are not initialized in survivability. Force I2C
>>> controller to polling mode while in survivability.
>>>
>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>
>> Like Mika said, polling should always work. This should be fine
>>
>> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> Thanks Heikki.
> 
> Anything else I can do here?
> 
> Raag
> 
>>> ---
>>>   drivers/gpu/drm/xe/xe_i2c.c                | 8 +++++---
>>>   drivers/gpu/drm/xe/xe_survivability_mode.c | 2 +-
>>>   2 files changed, 6 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
>>> index 8eccbae05705..6f14ba1e5217 100644
>>> --- a/drivers/gpu/drm/xe/xe_i2c.c
>>> +++ b/drivers/gpu/drm/xe/xe_i2c.c
>>> @@ -213,11 +213,13 @@ static const struct irq_domain_ops xe_i2c_irq_ops = {
>>>   	.map = xe_i2c_irq_map,
>>>   };
>>>   
>>> -static int xe_i2c_create_irq(struct xe_i2c *i2c)
>>> +static int xe_i2c_create_irq(struct xe_device *xe)
>>>   {
>>> +	struct xe_survivability *survivability = &xe->survivability;
>>> +	struct xe_i2c *i2c = xe->i2c;
>>>   	struct irq_domain *domain;
>>>   
>>> -	if (!(i2c->ep.capabilities & XE_I2C_EP_CAP_IRQ))
>>> +	if (survivability->mode || !(i2c->ep.capabilities & XE_I2C_EP_CAP_IRQ))

Please use the existing abstracted functions

Thanks
Riana

>>>   		return 0;
>>>   
>>>   	domain = irq_domain_create_linear(dev_fwnode(i2c->drm_dev), 1, &xe_i2c_irq_ops, NULL);
>>> @@ -351,7 +353,7 @@ int xe_i2c_probe(struct xe_device *xe)
>>>   	if (ret)
>>>   		return ret;
>>>   
>>> -	ret = xe_i2c_create_irq(i2c);
>>> +	ret = xe_i2c_create_irq(xe);
>>>   	if (ret)
>>>   		goto err_unregister_notifier;
>>>   
>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>> index 7520d7b7f9b8..a34a638bfb76 100644
>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>> @@ -324,7 +324,7 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
>>>   	if (ret)
>>>   		return ret;
>>>   
>>> -	/* Make sure xe_heci_gsc_init() knows about survivability mode */
>>> +	/* Make sure xe_heci_gsc_init() and xe_i2c_probe() are aware of survivability */
>>>   	survivability->mode = true;
>>>   
>>>   	xe_heci_gsc_init(xe);
>>> -- 
>>> 2.43.0
>>
>> -- 
>> heikki

