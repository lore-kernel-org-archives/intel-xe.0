Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F816EB64DE
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 14:37:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6FA810E827;
	Tue, 10 Sep 2024 14:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IS61gNmb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B1410E827
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 14:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725979035; x=1757515035;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0tHt3abUmr9UkbAqalQF2X0/OAYXyWwj8YHTTAQFb4Q=;
 b=IS61gNmbtz/noJLZLs4E0y51bwgjTE3OYr1gKp4DRb7Tu/GsJ3qDGPpM
 kvRaehUdt+Ktc1Xee4+OiEnpb9TSNTcsYGLRRhTbpmqh27kWtgqOaMYLt
 PE/JRve2IdTl4BUO8ETTdy642M/CaHGIWvkD1OG36GQYSdvl26wUDCGfi
 P4uSp0Xet9NP6e96a6bz2HCjqfUvemI7HnYRvHP49XcLxT8F5sZV6VTjp
 EHg+dU1A+MLr8lL/WAY/B5L6H4UQKpJkEd/vyln822a8pikgS9T5KpniZ
 1xe0JxPXldWGAvFWiyC3hjYBrkgwv8dnlwHkHEvMU+lFfpkDecWby21Uo A==;
X-CSE-ConnectionGUID: FOZFg9IjSLiOPdm+tubpQA==
X-CSE-MsgGUID: ZibObRL/RJ+wwxvhSnKCMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="28620621"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="28620621"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 07:37:15 -0700
X-CSE-ConnectionGUID: Nkl+Fs9USue1v/cU8MFSCQ==
X-CSE-MsgGUID: 7uUsnI0xSzqmHdskKxKRsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="71182872"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 07:37:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 07:37:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 07:37:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 07:37:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 07:37:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WibozaY3CSholA4GVXsNpriQ17KJwbBJ0ZVkMOB5mm6FMhsIuTOe0+hyj8DXOsIFVdv7S4SighpYshwuhlnGaEAyHiC0wmUJW1vsaqk/Gj2Ob6TOzW7UfRSwMcWgoE/e/wldhTNabTfRl4JuQZKai+6m2x8OERAHNoTy/XsBDjKfPvdqz5/c902RQiRawwcjnw1fQkpt4NYraV0nR9f1sns4UgbFdsXsAPlcAfAYUBmcOgqwwErD/bnEN/l/yyld50ZDfcKFcO7DVk72b52kTwlgjHx9pXob6leeEoJA2/teeYWI76j6zc+2EuXhWjHj+48ZWrAo0MzM3m2r8gV+2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeXuosSPCqidzp/rqao3QbONmrVrOW5Wjtle+haTrnI=;
 b=BNRi/8s6WH1Cxt+gHOXI2XPunE9VsHdU2zo8nXemRFL50zGDTOqjnvPtSJBdr3wwpO7y0vMhUjaIO9AqVHzsA6ishMvMZzt/19NyfRxoyT1GxGAtPvG8Q1elyH4t9zYoNXpc0YLKPZ1h+1CU7tWwJ2JJoXcdWNjKUVhF5vRJQoSTfjGtiDEaW3TV7aD+hIlgzvIdtRy3EapLc00a0TfpHj70Ej5X9/bIzbYNRkqpsJrliAeISD3cFOG3HivPgK3/6EjptLt4/4AJAitQnw2uaYztcY+p4jXkQR6n21uwPrvACxjkPu1cMSgM8eQvWl9EYo9/RDTJk4rShn5k+rp8fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CY8PR11MB7059.namprd11.prod.outlook.com (2603:10b6:930:51::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Tue, 10 Sep
 2024 14:37:09 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 14:37:09 +0000
Message-ID: <122fbba9-8174-4c91-8085-5f5cc940db17@intel.com>
Date: Tue, 10 Sep 2024 20:07:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 7/9] drm/xe/gt_tlb_invalidation_ggtt: Call xe_force_wake_put
 if xe_force_wake_get succeds
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
 <20240830052326.3707019-8-himal.prasad.ghimiray@intel.com>
 <ZtoIk-OUD7qkBvKn@intel.com> <9605f23a-ce16-468d-a7b3-2ea3d9be2f21@intel.com>
 <Ztst1yxHrJyHQMl6@intel.com> <43116f22-0495-44ec-9895-aad9dcd5165d@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <43116f22-0495-44ec-9895-aad9dcd5165d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::8) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CY8PR11MB7059:EE_
X-MS-Office365-Filtering-Correlation-Id: 547ccae8-e450-4e89-d8bd-08dcd1a60c99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmxXSmdVdG1TLzlkaGpKeEdELy9QNE1Zanl4SmFMV2MyOXIrM0luOFZMZnVK?=
 =?utf-8?B?enFyNWlGaTBjaG12T2dPdG9oNmJQTTFjb0ZNdDRlYkNTVEhOdjhBZS9udU5T?=
 =?utf-8?B?UEVaeVlaUXY2MUZEcnpiK2F2L1czQ0ZRSVIrSjF1VTRlZHVTcG5aRERUMTlQ?=
 =?utf-8?B?NXpmTDVDV3BnL1pQWWI3OCtmWVo5c0RlN29qV1Y4VnFBczA4QjhSaDAwUGdh?=
 =?utf-8?B?YjF4VERWZHpMUDhvWDZtSXJaQkluYk9OeW8rL3hNcFIrcDZJb29vNWtnRXFK?=
 =?utf-8?B?SitsZWJxL0lXcyt1YlpOdHRpdmtucUIzczk1ZW1ycHFIdGQyVWhHaDQxT0tF?=
 =?utf-8?B?eW1pVDBoVTFFZVZhMlZNSjg2QWM5MXpHeC9UcUdwT2NKV2tBU2xKaTZxNGw2?=
 =?utf-8?B?V0R4NHlzYkZSV1ZJWnBaUzZ1YjFVRHN5bzdKNXQwWE5WZzVtM3RNUFV5RU5Q?=
 =?utf-8?B?WUNJemlWYmRGc25GSGFYaHBRYk9tTmIzL1JwQTRVV1AvWUM5RFBzY2lGOWpV?=
 =?utf-8?B?T1IrbWY5MmNCNXppZGFwU1JGWEdGQTR2VEUwY0RQVUFUVlR4VTR2c0NUbHVY?=
 =?utf-8?B?dDErREZkd1NLcjBJd1lDOVhLRUdUNGF6dVV2QUJGZEJMcml5MlZwcHJtU2JU?=
 =?utf-8?B?ZWJrYTczS091QWZXVmRlbHk1ODk1RFAxZ0g2OVgvNDlMYm1za3pPMGlFUjIx?=
 =?utf-8?B?cHNnMkw4aWg1NHJYT1BuWGV6ZmFlM3VRaTZKb1E5RjkzczYrbDA4eWNYVjlN?=
 =?utf-8?B?WmNEeHJQQ3NvbXFFZitkbjRyYW9VNk9mcy9FTXEyajFKSUJhS3RBRnFMcEhQ?=
 =?utf-8?B?NmF1MHZUWWRVL3pBQklRRk9RSHZ0RHVvTHlidEVHanZSUlQ1OVZIeXA4U0w3?=
 =?utf-8?B?VWFYenRqZnlVR0s0MzhoUjB6RmtlYWhSRDAwSHg5dnh3a1hacmZtNGlDL2Vs?=
 =?utf-8?B?YXljNmJITTlJT1VvbStvaisvSGZ3eUV6TFQ5ZFdhUGJQemc4MCtDUzBVaGxT?=
 =?utf-8?B?RzZ0U0IvZ00zK0E4WExhWTdRbEdBZktmbzJDdC9uN0oxWkxjNTlFcmx2YStW?=
 =?utf-8?B?UFFMUWx1cXhRZm82Q2ZRNWpiaXIxaUhWbjlNVzhJME5BeXhqV1BPUWxQMnox?=
 =?utf-8?B?ejJ0VFBRMi8vNUQ1Q3dkK09JZkh5T2kwRDBLSGR6d0hXYTc0cGN2MnpCN1Y0?=
 =?utf-8?B?RUlxS0ZHaE1sUkEvYWNUWjFOZWpuc282ZUFBMWwyZ2xEUTRzZjl0M1lkem5o?=
 =?utf-8?B?SGNJTWJQVEtLT0JkQjUzcUlHbjIzQUtIS1NPbEI3TEVEZG1uRlQ0eG43TE41?=
 =?utf-8?B?OEZ6UUhadFJyZFVxVUxFa0NuTVBHWm90bzB3UWdLOG5YdnI2U25xbEx1SnlS?=
 =?utf-8?B?THBCNUFQdG1XM2VWdFV5eTVRT3dMdW9aczRHTXNiRGFnSTRhWGV4aElORHR5?=
 =?utf-8?B?OUh2OGo5cjRxWU5xTkJHblNNQUFjWHFSTjg5TUd2QlNTM3pHbkhoVDgvWFFE?=
 =?utf-8?B?N3g5SVZYRkMrT2pwdVNJRGZWMmQ4M2hRRHQ3LzY5SzcrZWVRSEcyK1lxZ0hX?=
 =?utf-8?B?TFNQNzN3enVsdFFWVEdtZHFpWkJqajdPYVhKUktCbXZvSkEwWDlMd001UWx3?=
 =?utf-8?B?OVVBYlNiWURZSDJ0ZDM0NWRVTFo1WkNXaklqcUcwMGVIY1g0VklWVkJPVnNB?=
 =?utf-8?B?UC9obm5URjdNUUxpVzZSVEYwSWk5bEZveTdQOTM0NDRLVUJ6ZWRCY3M1WVVI?=
 =?utf-8?B?bzQvbUJ2M3BXZmRNSjdWNHVDKzNMN3ZlSHFoZnBQdytLbHA0S3M3dnNxbXYv?=
 =?utf-8?B?R2p1VVdwaU9zbWxwT29zQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXJoYVNuSFVWOHhsUjNqUWlhbzNjMVNDZXVKL3JnNDhiV1dOQUFYUVlnVGx5?=
 =?utf-8?B?V0gyb3h0cDFUeFlvaFAyRkVHTzBvcXVzWGt3dXRDYjJVWWg5QzZFTTlQWlZv?=
 =?utf-8?B?RzFIbmhHb2xSSGNnR3Q2TzVqTTc5ZnYxelBPZ3VoN0NkNWlBRks1cVlrK0lM?=
 =?utf-8?B?QmVRanpERWZkRXJpdkh5cVNQWVVucTBaUFl1UmUvd0l2QTViOGVTQ0pyVndZ?=
 =?utf-8?B?MzYraEMxMjM1eEVTc29Jd3BvbGtNaStwa3V5a2FKWkNaK1dwWmlTSjR0Vkhk?=
 =?utf-8?B?RlMvZDRFWlk1QllNU0RkWjg1SVMyU0dBcmY0L21pNDlVd1UweVgzQVg3Zks5?=
 =?utf-8?B?Z05Oczk2UGpSdDRjZHVPS0YydFBVVkZBV2VwenYyck5YdE54K1lwb2VONFpa?=
 =?utf-8?B?SnhLTFhBVG1OZGhJUjYwSDJRM2NWTytvNFVPWnZxeUc2QzJ6Qy90bEN4MVlB?=
 =?utf-8?B?cGVUemkyVzFXRVhTR3lRU3U1WEt1c2plck50UWtYV2J3WjZaWitJT2tybkdJ?=
 =?utf-8?B?MUZITUtpUmZZd2JYbDZzY3ZJb2wwMmJqNmw3L0hBUWJ4RGtZc3JZUGRrUlhK?=
 =?utf-8?B?eFoxVXMwSk0rOEMxQjFuNDdYanZXd2M2VEttb0N2Z2tzakg5MGtQeUsxMENT?=
 =?utf-8?B?bHhrckZ3RTFlaks5L2ZBQy9KYzlCR1N5WUROQ0dUd0JrSTl2THlpR1IyYXp3?=
 =?utf-8?B?OTd2MEdhTWZvcWdZNXhXdjBDOXZ1WFlhQTA4OFZZL0p6ZVo2WThGdE1HeENv?=
 =?utf-8?B?cnhDMmFWTEFNZVQrWmxLaUNtdzFhVHlYYXg2VDV1cWUvY1JhNlBneVlYWkw2?=
 =?utf-8?B?eGw0UExTWW1BMEtCMjVESEpOL0tVenQ2RDBmMnUveFV0cThwWGJyUDRvdSt1?=
 =?utf-8?B?dTBRenFZT3lUZjh5ZkdqTEt0dHYwSlBIZThaS0txTkhiYnZwK2RiYnNqei9V?=
 =?utf-8?B?c214dUVFUGlaTHUvc0RxNWwyS0h2N2Vhb2JIK0FmdGZQSHh3MDB5Z2VHSFZZ?=
 =?utf-8?B?NjgyZEgxODlsZUZpRnEzd2xxY0dBM1JkOWlkaW9BMWUxcTEzWVlITW0zUGZM?=
 =?utf-8?B?QlhqMXdJT2lVcDQwV0dLeXorOG0xQlJuMjNUSFg3MUhwTXJnaWNXUDBoQW5k?=
 =?utf-8?B?T2cvSTZXR0VvR3NSKzgrcDcxZjNEcW1LNHJjYjc4c2VMa2k2UUNUbXE5czZz?=
 =?utf-8?B?WUloWGREUDlSamNPQXdoaXNoUGhxUlk4aUEvcWxBRXh1bU1MRmtZM2Z5SnND?=
 =?utf-8?B?emVMdXNIV0k1MS82cUxDTzIyZ0tZZGduM0FvckI2ZjlQZjBSQVYrUmxFRTRT?=
 =?utf-8?B?RFhxdHBqL2o4Mjg4UXE3dldVdURuVTZMazZ0VjMxK1BlbW9nVmloTlBEYmJv?=
 =?utf-8?B?SnBTZUR2Y1hJK04yZEhiZVFoUElVSVdMeWptZC9vU0syNmlRbUZoV21uUG9n?=
 =?utf-8?B?T3ZWNUFvWVB5WWVQUGRGQUpUbmk2M2pOclB0cG90dU1vMkRKVHRZdGhQa2Fn?=
 =?utf-8?B?b2RkV29jcUhjZWdwMzZtenU1d1BadC9rQnhMRURNMnRpclRTK253QjR0ZnBw?=
 =?utf-8?B?dVB0Q0o0KzRBTFBXMTRqUVhXV1Z5L2JScjc1Z2VDaW5JM3hIUHJwM2VubDBV?=
 =?utf-8?B?c1dtaFJ0N1Y2RUF0ZFJxcVpjZmxDNWxFMUVvWHRML211bHI5TEswUlQyM3FK?=
 =?utf-8?B?VHZMZzB3NzZxZmV6Nm1CMGtBN2ppRjFHS0dpTGdyZ3pmMWV3L1pjUzBVRkJO?=
 =?utf-8?B?bDA0TWpkYWM4cjhLZnNGOGJxSWp0UzRHaS9Oc0NEUm9QT2R4MzZraHNmRzRm?=
 =?utf-8?B?WHhtQzVaWTA0bi9YdUNqRTBEaXlkRm5IZktmYVVRT1hDbTF0TzA4MHZSQ0Rk?=
 =?utf-8?B?d2o3T2svaUdpSUJFbkxVTmh6RVBVY1hzdHBiTlpiVGJ5VDltNm15dnlhMXRZ?=
 =?utf-8?B?TjlUUFFIMWZqR2dkeWtQbldiZWdxUDlBaWM4Qk9tVlJhc0hmSFdnQUtSOVhx?=
 =?utf-8?B?bHBEQ3lLWkV4dHBVakdZZkpYSGxCM0hFYjRONXVEZDU2QVF5YzQ5R00vYUMr?=
 =?utf-8?B?UnRXcDhuV1c0dDB5N3lyTFlNeFVMOU9lN1JMakg1cE4yWGtMSS9rdjU4bkUr?=
 =?utf-8?B?bExVcTVhdkpLemQySFJVUG5hS1dPcGlyK1czeEw4RnVUd3JUY2JSa2p6T24x?=
 =?utf-8?B?NkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 547ccae8-e450-4e89-d8bd-08dcd1a60c99
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 14:37:08.9460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NIdo7dY74Fcam6LnNW2rXrO9+B7c+SzH89MG40nXd+ZSilJ+jjA9PAJLP7NfCRdddlhDuHfoNdTvSP1Oia3DSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7059
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



On 09-09-2024 14:59, Ghimiray, Himal Prasad wrote:
> 
> 
> On 06-09-2024 21:59, Rodrigo Vivi wrote:
>> On Fri, Sep 06, 2024 at 01:21:41AM +0530, Ghimiray, Himal Prasad wrote:
>>>
>>>
>>> On 06-09-2024 01:07, Rodrigo Vivi wrote:
>>>> On Fri, Aug 30, 2024 at 10:53:24AM +0530, Himal Prasad Ghimiray wrote:
>>>>> A failure in xe_force_wake_get() no longer increments the domain's
>>>>> refcount, so xe_force_wake_put() should not be called in such cases
>>>>>
>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 9 ++++++---
>>>>>    1 file changed, 6 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c 
>>>>> b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>>> index cca9cf536f76..3f86ab704c4f 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>>> @@ -259,11 +259,11 @@ static int xe_gt_tlb_invalidation_guc(struct 
>>>>> xe_gt *gt,
>>>>>    int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>>>>>    {
>>>>>        struct xe_device *xe = gt_to_xe(gt);
>>>>> +    int ret;
>>>>>        if (xe_guc_ct_enabled(&gt->uc.guc.ct) &&
>>>>>            gt->uc.guc.submission_state.enabled) {
>>>>>            struct xe_gt_tlb_invalidation_fence fence;
>>>>> -        int ret;
>>>>>            xe_gt_tlb_invalidation_fence_init(gt, &fence, true);
>>>>>            ret = xe_gt_tlb_invalidation_guc(gt, &fence);
>>>>> @@ -277,7 +277,9 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>>>>>            if (IS_SRIOV_VF(xe))
>>>>>                return 0;
>>>>> -        xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>>>>> +        ret =  xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>>> +        xe_gt_WARN_ON(gt, ret);
>>>>> +
>>>>>            if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 
>>>>> 20) {
>>>>>                xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
>>>>>                        PVC_GUC_TLB_INV_DESC1_INVALIDATE);
>>>>> @@ -287,7 +289,8 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>>>>>                xe_mmio_write32(gt, GUC_TLB_INV_CR,
>>>>>                        GUC_TLB_INV_CR_INVALIDATE);
>>>>>            }
>>>>> -        xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>>>> +        if (!ret)
>>>>> +            xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>>>
>>>> looking all these cases now I honestly prefer the other way around.
>>>>
>>>> If we called the get, we call the put.
>>>> get always increase the reference and put does the clean-up.
>>>>
>>>> fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>>
>>>> xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>
>>>> so, the fw_ref is a mask of the woken up cases which require
>>>> the ref drop and sleep call.
>>>
>>> Hi Rodrigo,
>>>
>>> Thanks for the input. AFAIU using this approach creates issue in the
>>> subsequent force_wake_get/put in callee function. Which I have tried to
>>> explain in cover letter.
>>>
>>> [1] subsequent forcewake call by callee function assumes domains are
>>> already awake, which might not be true. This shows perfectly balanced
>>> xe_force_wake_get/_put can also cause problem.
>>>
>>> [1] func_a() {
>>>     XE_WARN(xe_force_wake_get()) <---> fails but increments refcount
>>>
>>>     func_b();
>>>
>>>     XE_WARN(xe_force_wake_put());<---> decrements refcounts
>>>   }
>>>
>>>      func_b() {
>>>     if(xe_force_wake_get()) <---> succeeds due to refcount of caller
>>>         return;
>>>
>>>     does mmio_operations(); <---> Domain might not be awake
>>>
>>>     xe_force_wake_put(); <---> decrement refcount
>>>   }
>>
>> Well, to be honest, this is what bugs me in this whole series.
>>
>> If func_a failed, why would function b succeed? It that's the
>> case should we include more redundancy and retries so the
>> func_a would succeed like the func_b is expected in your
>> scenario?
> 
> 
> Hi Rodrigo,
> 
> This is current behavior, which patch [1] resolves. I misunderstood your
> comment as dropping of that patch and simply balancing all _gets with
> respective _puts.
> 
> 
>>
>> But other then that, I'm afraid that you didn't fully understand
>> my idea. Sorry for not being clear.
>>
>> My thought is, you do what you are doing in this series.
>> If the get doesn't succeed you drop the ref count and call the
>> disable.
> 
> 
> OK. IMO, just reducing refcount is better for failing domain and not to
> disable it explicitly
> 
> 
>>
>> The return of the get is just for the domains that have succeeded.
>> then the put returns only the ones that had succeeded.
>> The function B will then try to wake-up whatever had failed in
>> func_a.
> 
> I assumw with this, the return of xe_force_wake_get will return the 
> mask, hence the caller will need to verify whether the returned mask is 
> correct or failed.
> 
> 
>>
>> Something like:
>>
>>
>> func_a() {
>>     fw_ref = xe_force_wake_get(ALL_DOMAINS) <---> fails GT-domain but 
>> return a mask with all the domains except GT.
>>
>>     XE_WARN(!fw_ref);
> 
> 
> XE_WARN(!fw_ref); will work for all individual domains but not  ALL_DOMAINS
> 
> XE_WARN(fw_ref != ALL_DOMAINS); <-- If user wants to continue -->
> 
> if (fw_ref != ALL_DOMAINS)  <--If user wants to return on failure -->
>      xe_force_wake_put(fw_ref); <-- ensure to put awake domain -->
> 
>      return;
> }
> 
> 
>>
>>     func_b();
>>
>>     XE_WARN(xe_force_wake_put(fw_ref));<---> decrements refcounts of 
>> the domains which were actually woken up.
> 
> Makes sense.
> 
>> }
>>
>>     func_b() {
>>          fw_ref = xe_force_wake_get(GT_DOMAIN);
>>     if(fw_ref & GT_DOMAIN) <---> likely fail anyway since func_a has 
>> failed, but it at least tries it out because you have handled it in 
>> your series...
>>         return;
>>
>>     does mmio_operations(); <---> Domain might not be awake
>>
>>     xe_force_wake_put(fw_ref); <---> decrement refcount of the domains 
>> you woked up.
>> }
>>
>> does it make sense now?
> 
> 
> Yes, this is indeed a much better approach for FORCEWAKE_ALL. Thank you 
> for the suggestion. To summarize, rather than disabling the successfully 
> awakened domain in the event of a failure, we will use forcewake_put to 
> handle the disabling of them and user will decide when to call it.

This way of implementing looks ok to me. Only concern is what if the 
func_b() calls xe_force_wake_assert_held(), this will raise the assert 
as it will not find expected domain awake. This doesn't align the idea 
of continuing in case of ack failure. IMO user decide to continue even 
after set ack failure by assuming domain woken up but ack didn't arrive 
in  time.

Regards,
Badal
> 
> 
>>
>>>
>>> BR
>>> Himal
>>>
>>>>
>>>>>        }
>>>>>        return 0;
>>>>> -- 
>>>>> 2.34.1
>>>>>
