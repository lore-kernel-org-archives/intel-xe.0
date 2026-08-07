Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAA3C5AC7C
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 07:32:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7BD610F3AC;
	Fri,  7 Aug 2026 07:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IUcaBgZ2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF5810F3AC
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 07:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786087975; x=1817623975;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=jchJY9lurRQRicEZyu4a4/9kwI+lRIOCTDP4HkYUwHk=;
 b=IUcaBgZ2DPDc2nWsfhw/YMtoQ71Q5geVddpGnzwlQVznoK9sFaSQ9Uox
 9tL+kJxCefU6pkJDm48XlwQX4nqB6x5mxuT3ct3CyaDtvR1HSYkiOTewF
 TiPHUVgwHozPXocnO4FAOk/g4zqHFMF2E+2U1oMhUEGW3zFXo/zXzbb+/
 RFnc6KEURFJw5bx4HPHYuXtg7p9YPlnuYDR/x8suxL8BXA68UdW/pInCX
 DXAt2r46JbEcskfvI3QTVzyV4qrF94rwnmUSLCRzzdF9hsOj4rngFoC2G
 v6yT4ZSlEOwGGUnm4jUO7lNBREBj6umgR66DPwgeAmxLO3maC1P2hfzjX w==;
X-CSE-ConnectionGUID: SyeX3O/dTjqwDdWIHTkOJw==
X-CSE-MsgGUID: DtYv6FY+S86bWZNcfglKtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="98052999"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208,217";a="98052999"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 00:32:54 -0700
X-CSE-ConnectionGUID: VDTRwMc5Tq+1GMYOVQoK9g==
X-CSE-MsgGUID: aRAxbU7nQ+eL5FFkJLf8Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
 d="scan'208,217";a="267478523"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 00:32:54 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 00:32:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 00:32:53 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.21) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 00:32:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXcedVkLWJRankO6gdVGKA5X3p53TjQyHMmNwq+KiD++T4Y3DbTMRJO0afdHOPv2nORJBiYi6WReQnV1YmNtd3LfwanCM2XGXpTi1QxEPmq46udqQutbF8pRLhE8O2jY+3Yy1a5vfXlw50P1M5Ko+tSWNl8xPrW+77davx72fp/5/Ku4f3zkO1uTi/Cem/qpKkCt3hEy44ZmPCPCXGHfQIeFq1feu4vr/b08SDuiFeqtZHvRJKYD8WyakIDuMeKx0AzYaaFwK1+8WFNOaeI2+rUQgIClU1SQVy1JeX7v2WHHiRvLg77M0s3HuEnix7spZBukliDLsz9jK8vY5XdihQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7XsEYevOgwijVwqrQxzbx6D+jKiVrrmd3bIkd/p83yc=;
 b=isfoP3IE9XqdOquCYomIheQphoQ/Iufmi28hCUeWcoOCJah2T3FiNzLctEzJtoV4WcCLhYYA8RVNW3Hpmz2XidcF1ux/witXEUO6T1W2k2szDkgbFI2J+r1/lPYWJLs9s7B71qXHLocEncRjIyzCLYuQeHnq79dzhlbLbSp/nYLOQRHZZQg0ye/8Qp/x7PoMQeWNa+2Q+F0SVEKAKt4lta6qfVeA+aB+TKcdQh+L00zReCS+jRcwpuQBTNqGkXrNoJwTXJo040Nq7UjCdRa3kRlDAQ9onUOZbYy/HJ4cRwMXEmMDYLNgq787Q5Rs1pNh4uUm8zFwxlX9FtyvKPoFOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by DS4PPF2B323C540.namprd11.prod.outlook.com (2603:10b6:f:fc02::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Fri, 7 Aug
 2026 07:32:52 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927%5]) with mapi id 15.21.0292.015; Fri, 7 Aug 2026
 07:32:51 +0000
Content-Type: multipart/alternative;
 boundary="------------2R8WxNNQrn0l0U6SDrb6jSR6"
Message-ID: <a9db5305-51c7-4936-99a8-65e0cbae049f@intel.com>
Date: Fri, 7 Aug 2026 13:02:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/pf: Add _locked variant of the doorbells bulk
 config function
To: <intel-xe@lists.freedesktop.org>
References: <20260805154733.604-1-michal.wajdeczko@intel.com>
 <20260805154733.604-4-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260805154733.604-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MA5P287CA0127.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::12) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|DS4PPF2B323C540:EE_
X-MS-Office365-Filtering-Correlation-Id: c23c17a4-f1fc-479b-adc4-08def456167a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|10067099003|8096899003|11063799006|56012099006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: Mj3ys0YXNgqygyzStVpHBiRx2a9VMPyxM150LTyIVbeQ4uKeP79FTQfmzW/s0Ac1fNF1rP+VGpxgUf93J4SIkE1HUOiZue87buB6+F7gouZofIIQqfk6XNrW6n7vqhex21PjgitPxLHbFfsb/Row7xejmP73llZkQadqcLBhrrjOXSnCBtL+eTSvunGCl5jqCNsUngsyoxbRG0D4c7TdG1FJzspgb/XVrB+NG68NlC8bsGv9ebgc/Nlnc6o+O/smtaVHp+flDJFD9Xeg7+pVQ11nfTJntQm/T7JMe/x8bSzNDIy2ZISeu6tr4gF2kvPrseSgd3QIaV8y59BRXf5zViXb8yscokkLE0fJNx73RPYDj6Q1IJwFv367cHmK8ndAx2ChBXbs5z9cwA2UuynhU90bfSBcII3PaHvOsmBF2Us6UAX6AWt8tugmKVbpR0VMp11kJRqln45D9Of6arGStB0JD0DPqljxLLxAiLBQ9gDomMhUFp+POI1koCOMpQbSlT3oHvjomIo9zht78ylIsan5VHbNWp2iUVpeGtBR7z5Mx7cRzGCG3erhLKGXfOxd0zuul51h0GRLOoWL6m89AzoFmZlHpb295ibX9vRX4qcFk45qMOX9sXX5sD/YoUehHw/g7rGQUyrXj9XSB1MRU4zI0uAXqASps3ZbXmZVkxQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(8096899003)(11063799006)(56012099006)(4143699003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akpqd0lvZWFjaWwxVnNJK01HUUFaU3dKRDdBcFQzcW5jbG9RVVB3Q1N5Y0hv?=
 =?utf-8?B?RFZ6Qll1VzMxc0pQVFJQS1pLVjhraUZPaHUvYnBoNEYralFFaEFuZzlISGJm?=
 =?utf-8?B?RmUyWTdkNVowcFNwOVVDTmFidEJyMUxVSWtkNTVYdGpkajgxTlliakhiMktN?=
 =?utf-8?B?bVNqNXZOemhnTW9tbGZ6S21aZE0zendVUE1lTVhDQ0t5ODF5eGZoRmhaL0hn?=
 =?utf-8?B?WG91eWZSQ3c5N1hMb2NCcDJCQjJOTk5ZVnYzL0ViUGpJQTJYampWcExjMEhp?=
 =?utf-8?B?ckVVMnJZRThhYjMzUHJNOTRQL21mT2QwYkgwR3JQREN3cFlnOFlGeTY4MXNG?=
 =?utf-8?B?dGhBVW92SkdaVlpjUVlDbmtRRkFCZmVWZkI3YlB5RWJFMkNxeWdrdVByZ291?=
 =?utf-8?B?ekYrdFBrUGk1Zm1xZjJjelN0MEtSMFBEd3ZyK1A3RnBhY1E5K216Uk40djhE?=
 =?utf-8?B?WXRQdkwzdVJrYkZ5OFE2Vi9aaHlYSFhKQ3dLMnlEVUFBOFRGVFNtTDJxMG82?=
 =?utf-8?B?Mi9EYSsvSTJXUUdRRHh6eEtNY3JMNnpUMStDdkNXSXBtQVNQMlFJZ3ZITHJG?=
 =?utf-8?B?UHB3UzhXOXhUSlBDenkvVGxhYVdrMVEzMjl2ZTJ0YjlpSmFoOEZtZitlOE9x?=
 =?utf-8?B?SmxzVVJNNEVMbmxBTXlyTnErNmVURXpnckVOS1NIcWUvSGZOTTl6WVJ3c3k0?=
 =?utf-8?B?WkFEcmc2S0Y0ZnBRT293Qmh2bFJabWQxaDIvTHNoZDFDbGxKTkt2cnF5dUNE?=
 =?utf-8?B?ZVJFeHhoRWN4UnJnVEZ0bGZHUzNnSHQ0dHpwVGl3MjNEdm8xQ3NJV0k1V01t?=
 =?utf-8?B?VmFuWkxaVlRpQy8vRXRjdlQvYm5rcUk3VHZUZEtLb0h6aTN6ZmpuOEVteUxo?=
 =?utf-8?B?TTRtS1MxVU1rSXVBZ1VJRHlRQ0xOWFBNY2JIZTBxTlBmYkFtU1VhNkwrb1d4?=
 =?utf-8?B?dUp4YVlhdXIxV0g0MlpFQ011Ylo4bkNwNFRWbjB3RFd0Sjl2aURLMC9MMjFv?=
 =?utf-8?B?TG1UMG5RZ2hlbmNVNzRVeG9lZG9xVTM0dk1HTkFuVXBXOSt4eTU3WDNoT0ZQ?=
 =?utf-8?B?V2FGZCtiWUZBbER4VThrQzZMUHlZN1pZc3NBMm9oWGlIYldYYWYvYkk3aG54?=
 =?utf-8?B?Z3N1WEZuMk13aUh3RjIySVRJdjc0dzdRaVhMUmhUbHZ0NUdtQkJtU0JoTm1F?=
 =?utf-8?B?cnVOU29iZkliTmIyV2xGa1RLNmFtdU1Wd2hHTHZONG03MWlMWlNhV1VyN2JU?=
 =?utf-8?B?OWlxY2drdUlPRVJYVXpHVldyMHRWb2VIN1ZGSC9hRk1PVnFIZ25HYTlYakIw?=
 =?utf-8?B?SzJvZDRkWXMvS3ZJVVNydnl4T0ZvcWliVGFlOUNwY2FPRUtSK1RVaVlPZDVW?=
 =?utf-8?B?bGF1MXBkbWh4ZzN2TGJrb1ZyOEo5VWNEdnY2T05IN0o5RmlBZXRBMkVkMkFY?=
 =?utf-8?B?b3cyTVJoeDQ0cnNJMDdmc2NmOFVuRHFuRHA0SWpyVk9WVWJhQXpsZjZYRnhq?=
 =?utf-8?B?SWgvamtRekV0Rk8rQWNqUmtnMjZXbWt0dDBkTnYySnA5QmQ0R2JuTC9sT2ps?=
 =?utf-8?B?aTU3aVNUaUwwU2RERldMOWx1NnMvMVlKenRyb3c2bGlrNm5ZOTdKWDZjbUZ3?=
 =?utf-8?B?VW9rZ0tucS9ONWhrZithZHRVR3k5dHVEellvdzg0RkFKNU1COGNVbHRNamhH?=
 =?utf-8?B?L1RyczRSRkxGUTBubkhGZDdiT1QvRXM0UDlKaUc5R09FcFBiRm1GcldPQjZZ?=
 =?utf-8?B?QnZKVmNRS3FZTFUyWjV4Y1NTMzA0RHpNbkVDTWQzSW5KQ3dKcmYwR1Qrd1l5?=
 =?utf-8?B?NkJ5a2VRakNXRitFUCtES1FaMC9XNUhDbS85ekhMY0VISUJ0ektsdGxhTlF6?=
 =?utf-8?B?enZYdW9kZkNDUVdGTW1qSVBKMHVkRnNBQm9ady9hRTk2NGJjUUlUc3pJdUFO?=
 =?utf-8?B?N09FVmtqSGNlakxYa1VwY3lHU29QbXoyUnkyei9Yd0crTkt6SktvSGtOb2dh?=
 =?utf-8?B?WldHK2dzcHlqaUtWRUVveWNHVEJucy9lTVl6NmllSnA4R1k2WTI2REFFNWtX?=
 =?utf-8?B?ako0Um1pV0hkYkc3OGZUVVYxS1dyQmRWaVVNUW1vamdxM2FIWTBUbzJUQXo2?=
 =?utf-8?B?eE9Vckx5RHdUOExKRlBSWXl1engwTnZ2OC96d2YrOEJ0d2hFQ2FuM2xOV1U3?=
 =?utf-8?B?bjhkb3hvRkcwZnVVbUJMNXc4cVZTSnVxSnJXd3UySFd5TWZRWW1tb09aM21m?=
 =?utf-8?B?Qi9ocHN1THplSVdMSktSMVhBZnE1RElSRzdaZUE1K0VBUEVXVXVyczhJbHBE?=
 =?utf-8?B?SGw5ZTc1aHJEemtwZjZkcHRCeXAyQVlPUFVnenhHNEN4b29lWW1yVkhSN1ly?=
 =?utf-8?Q?7rLGJHkRXsq9yyW8=3D?=
X-Exchange-RoutingPolicyChecked: UZUquiov7niOvhZ+4mQCzfMI7iqaHPSJxFP++RZ0tsqUuEzBXBJSpCsWNJMgYC4QalZo1NqOxys6ql1Vhl5PVRfe7EXLRGO9UoFErjAYQQiWG7Ozf+SXiNwrUj3YqTUkGfouYAP/C1U8ye8G/cZOporJlfoGneT3gRs3yTGIy73X58ZU/UUfKtyxSUJZ7A9nOopzalnHSLCYA9drrUPDtw5luRimMojKY7lE79Q5+OHlz4ItnQh+EVg4QWizN3H6xn8ltyRDga5jYnIeW9wfzL10ftcPeoE98u6MzGhrgPyK7cXSEZjvk/GlJY4W0+56I2SQkka8tEJ4d3jBzMeX4Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: c23c17a4-f1fc-479b-adc4-08def456167a
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 07:32:51.8439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p5/9BNdfVcPnvruAb5hpgYcQNuqow0PL0GCQB+9EWQUq6IHDRjN90beEX0WFb4SYY7e8HHERVXHu0qs4i82k0/Us0FM6YVwg+PpozPAQyok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2B323C540
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

--------------2R8WxNNQrn0l0U6SDrb6jSR6
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 05-Aug-26 9:17 PM, Michal Wajdeczko wrote:
> We will soon want to provision all VFs, including their GuC doorbell
> IDs config, in one step. Split existing doorbells bulk configuration
> function into two functions, one of which will expect the master lock
> to be already taken. Use this new function in the fair GuC doorbells
> provisioning.
>
> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 37 ++++++++++++++++------
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  2 ++
>   2 files changed, 29 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 4976d8c018ce..b3145444b3d5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1397,7 +1397,7 @@ int xe_gt_sriov_pf_config_set_dbs(struct xe_gt *gt, unsigned int vfid, u32 num_d
>   }
>   
>   /**
> - * xe_gt_sriov_pf_config_bulk_set_dbs - Provision many VFs with GuC context IDs.
> + * xe_gt_sriov_pf_config_bulk_set_dbs_locked() - Provision many VFs with GuC context IDs.
nit: Should be "Provision many VFs with GuC door bells."
>    * @gt: the &xe_gt
>    * @vfid: starting VF identifier (can't be 0)
>    * @num_vfs: number of VFs to provision
> @@ -1407,30 +1407,48 @@ int xe_gt_sriov_pf_config_set_dbs(struct xe_gt *gt, unsigned int vfid, u32 num_d
>    *
>    * Return: 0 on success or a negative error code on failure.
>    */
> -int xe_gt_sriov_pf_config_bulk_set_dbs(struct xe_gt *gt, unsigned int vfid,
> -				       unsigned int num_vfs, u32 num_dbs)
> +int xe_gt_sriov_pf_config_bulk_set_dbs_locked(struct xe_gt *gt, unsigned int vfid,
> +					      unsigned int num_vfs, u32 num_dbs)
>   {
>   	unsigned int n;
>   	int err = 0;
>   
>   	xe_gt_assert(gt, vfid);
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>   
>   	if (!num_vfs)
>   		return 0;
>   
> -	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
>   	for (n = vfid; n < vfid + num_vfs; n++) {
>   		err = pf_provision_vf_dbs(gt, n, num_dbs);
>   		if (err)
>   			break;
>   	}
> -	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
>   
>   	return pf_config_bulk_set_u32_done(gt, vfid, num_vfs, num_dbs,
> -					   xe_gt_sriov_pf_config_get_dbs,
> +					   pf_get_vf_config_dbs,
>   					   "GuC doorbell IDs", no_unit, n, err);
>   }
>   
> +/**
> + * xe_gt_sriov_pf_config_bulk_set_dbs() - Provision many VFs with GuC context IDs.

nit: Should be Guc dbs instead of context IDs.

Otherwise looks good to me.

- Satya.

> + * @gt: the &xe_gt
> + * @vfid: starting VF identifier (can't be 0)
> + * @num_vfs: number of VFs to provision
> + * @num_dbs: requested number of GuC doorbell IDs (0 to release)
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_bulk_set_dbs(struct xe_gt *gt, unsigned int vfid,
> +				       unsigned int num_vfs, u32 num_dbs)
> +{
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return xe_gt_sriov_pf_config_bulk_set_dbs_locked(gt, vfid, num_vfs, num_dbs);
> +}
> +
>   static u32 pf_profile_fair_dbs(struct xe_gt *gt, unsigned int num_vfs)
>   {
>   	bool admin_only_pf = xe_sriov_pf_admin_only(gt_to_xe(gt));
> @@ -1480,10 +1498,9 @@ int xe_gt_sriov_pf_config_set_fair_dbs(struct xe_gt *gt, unsigned int vfid,
>   	xe_gt_assert(gt, vfid);
>   	xe_gt_assert(gt, num_vfs);
>   
> -	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +
>   	fair = pf_estimate_fair_dbs(gt, num_vfs);
> -	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> -
>   	if (!fair)
>   		return -ENOSPC;
>   
> @@ -1492,7 +1509,7 @@ int xe_gt_sriov_pf_config_set_fair_dbs(struct xe_gt *gt, unsigned int vfid,
>   		xe_gt_sriov_info(gt, "Using non-profile provisioning (%s %u vs %u)\n",
>   				 "GuC doorbell IDs", fair, profile);
>   
> -	return xe_gt_sriov_pf_config_bulk_set_dbs(gt, vfid, num_vfs, fair);
> +	return xe_gt_sriov_pf_config_bulk_set_dbs_locked(gt, vfid, num_vfs, fair);
>   }
>   
>   static u64 pf_get_lmem_alignment(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> index a14ca7bf7e4d..a56e63f3660a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -34,6 +34,8 @@ int xe_gt_sriov_pf_config_set_dbs(struct xe_gt *gt, unsigned int vfid, u32 num_d
>   int xe_gt_sriov_pf_config_set_fair_dbs(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
>   int xe_gt_sriov_pf_config_bulk_set_dbs(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs,
>   				       u32 num_dbs);
> +int xe_gt_sriov_pf_config_bulk_set_dbs_locked(struct xe_gt *gt, unsigned int vfid,
> +					      unsigned int num_vfs, u32 num_dbs);
>   
>   u64 xe_gt_sriov_pf_config_get_lmem(struct xe_gt *gt, unsigned int vfid);
>   int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size);
--------------2R8WxNNQrn0l0U6SDrb6jSR6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 05-Aug-26 9:17 PM, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260805154733.604-4-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">We will soon want to provision all VFs, including their GuC doorbell
IDs config, in one step. Split existing doorbells bulk configuration
function into two functions, one of which will expect the master lock
to be already taken. Use this new function in the fair GuC doorbells
provisioning.

Signed-off-by: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 37 ++++++++++++++++------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  2 ++
 2 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 4976d8c018ce..b3145444b3d5 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1397,7 +1397,7 @@ int xe_gt_sriov_pf_config_set_dbs(struct xe_gt *gt, unsigned int vfid, u32 num_d
 }
 
 /**
- * xe_gt_sriov_pf_config_bulk_set_dbs - Provision many VFs with GuC context IDs.
+ * xe_gt_sriov_pf_config_bulk_set_dbs_locked() - Provision many VFs with GuC context IDs.</pre>
    </blockquote>
    nit: Should be &quot;<span style="white-space: pre-wrap">Provision many VFs with GuC door bells.&quot;</span>
    <blockquote type="cite" cite="mid:20260805154733.604-4-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">
  * @gt: the &amp;xe_gt
  * @vfid: starting VF identifier (can't be 0)
  * @num_vfs: number of VFs to provision
@@ -1407,30 +1407,48 @@ int xe_gt_sriov_pf_config_set_dbs(struct xe_gt *gt, unsigned int vfid, u32 num_d
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_gt_sriov_pf_config_bulk_set_dbs(struct xe_gt *gt, unsigned int vfid,
-				       unsigned int num_vfs, u32 num_dbs)
+int xe_gt_sriov_pf_config_bulk_set_dbs_locked(struct xe_gt *gt, unsigned int vfid,
+					      unsigned int num_vfs, u32 num_dbs)
 {
 	unsigned int n;
 	int err = 0;
 
 	xe_gt_assert(gt, vfid);
+	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
 
 	if (!num_vfs)
 		return 0;
 
-	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
 	for (n = vfid; n &lt; vfid + num_vfs; n++) {
 		err = pf_provision_vf_dbs(gt, n, num_dbs);
 		if (err)
 			break;
 	}
-	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
 
 	return pf_config_bulk_set_u32_done(gt, vfid, num_vfs, num_dbs,
-					   xe_gt_sriov_pf_config_get_dbs,
+					   pf_get_vf_config_dbs,
 					   &quot;GuC doorbell IDs&quot;, no_unit, n, err);
 }
 
+/**
+ * xe_gt_sriov_pf_config_bulk_set_dbs() - Provision many VFs with GuC context IDs.</pre>
    </blockquote>
    <p>nit: Should be Guc dbs instead of context IDs.</p>
    <p>Otherwise looks good to me.</p>
    <p>- Satya.</p>
    <blockquote type="cite" cite="mid:20260805154733.604-4-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">
+ * @gt: the &amp;xe_gt
+ * @vfid: starting VF identifier (can't be 0)
+ * @num_vfs: number of VFs to provision
+ * @num_dbs: requested number of GuC doorbell IDs (0 to release)
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_bulk_set_dbs(struct xe_gt *gt, unsigned int vfid,
+				       unsigned int num_vfs, u32 num_dbs)
+{
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
+	return xe_gt_sriov_pf_config_bulk_set_dbs_locked(gt, vfid, num_vfs, num_dbs);
+}
+
 static u32 pf_profile_fair_dbs(struct xe_gt *gt, unsigned int num_vfs)
 {
 	bool admin_only_pf = xe_sriov_pf_admin_only(gt_to_xe(gt));
@@ -1480,10 +1498,9 @@ int xe_gt_sriov_pf_config_set_fair_dbs(struct xe_gt *gt, unsigned int vfid,
 	xe_gt_assert(gt, vfid);
 	xe_gt_assert(gt, num_vfs);
 
-	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
 	fair = pf_estimate_fair_dbs(gt, num_vfs);
-	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
-
 	if (!fair)
 		return -ENOSPC;
 
@@ -1492,7 +1509,7 @@ int xe_gt_sriov_pf_config_set_fair_dbs(struct xe_gt *gt, unsigned int vfid,
 		xe_gt_sriov_info(gt, &quot;Using non-profile provisioning (%s %u vs %u)\n&quot;,
 				 &quot;GuC doorbell IDs&quot;, fair, profile);
 
-	return xe_gt_sriov_pf_config_bulk_set_dbs(gt, vfid, num_vfs, fair);
+	return xe_gt_sriov_pf_config_bulk_set_dbs_locked(gt, vfid, num_vfs, fair);
 }
 
 static u64 pf_get_lmem_alignment(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index a14ca7bf7e4d..a56e63f3660a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -34,6 +34,8 @@ int xe_gt_sriov_pf_config_set_dbs(struct xe_gt *gt, unsigned int vfid, u32 num_d
 int xe_gt_sriov_pf_config_set_fair_dbs(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs);
 int xe_gt_sriov_pf_config_bulk_set_dbs(struct xe_gt *gt, unsigned int vfid, unsigned int num_vfs,
 				       u32 num_dbs);
+int xe_gt_sriov_pf_config_bulk_set_dbs_locked(struct xe_gt *gt, unsigned int vfid,
+					      unsigned int num_vfs, u32 num_dbs);
 
 u64 xe_gt_sriov_pf_config_get_lmem(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size);
</pre>
    </blockquote>
  </body>
</html>

--------------2R8WxNNQrn0l0U6SDrb6jSR6--
