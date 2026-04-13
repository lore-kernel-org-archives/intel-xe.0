Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94624E93813
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 04:40:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C6B310E303;
	Mon, 13 Apr 2026 04:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kOjMxI6m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E769110E303
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 04:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776055203; x=1807591203;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Gvw2q9RBihgoX5e7PSQ9RkYosJlAngxdXIugDVI/o1o=;
 b=kOjMxI6meAqP9DwUZ9Hwo6RGWeiYDzoGq2KtfBS0uFmPX6iiwspZp/bU
 7XLntdHeL/2RzfTWaAKokWqp0r3lIXyj+OmUmZrFleswbBhCuZI2ziAK5
 DnmdH6brGSG7ihxaJ+tUYFouJPU+IkninfiAypnGZD4iDhRkXYvq6pRJW
 mh/j8K+fMCpAueh9+wT7xQ5QOkLD0q7tux5CAG2tWPePZCnbmo/VmgUNp
 OMf0QCC3dcN+3sh7R3dwSkXcTW+ltXkg/UdV1IZyMKDpkkkP290dKbQqu
 TeWVUKU8V6gXH63Qy28HkG0YSrCuDNAnqlo2/e/qxGmfAVszl7cuJkdsI g==;
X-CSE-ConnectionGUID: hB1HNRX1S4W5zunNauamBg==
X-CSE-MsgGUID: FZd794kbT8O7AXPoIjFzYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="88367429"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="88367429"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 21:40:02 -0700
X-CSE-ConnectionGUID: 1T4BitTfSAq2mH5axoAFnw==
X-CSE-MsgGUID: 2A6kkI7SQ025BXCNq4h0JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="260131618"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 21:40:01 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 12 Apr 2026 21:40:01 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 12 Apr 2026 21:40:01 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.52) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 12 Apr 2026 21:40:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VElUr8AZ105tnt0AvbAZ/GAw8mfDFRnm5/PWG48oKBDYEfHkiiGhpH9X9QVs+U4RGVHcOr370sOyLiFgHRqUxwrO1DG5KYhiRq0l6eMzI8NYhyXsIwFRlLJJyv3TDzdpaMakKFhW5ZoQFws/OGzPVQKW4t7jcZGn0iIdQrXVAvdVGn/dlG0FkCfo/QKLHk5By4xYw8bP3/HUeNAJ4vjDgNxblwjT/7VeM/y1SzIMqiqOTvxMSNZQFZwdD82F96v+Ziozy07kKeHcoVArSxW1IB8ctL/w8YtMC9RPRPmgF1zZko2YtRghXySvKBcWwUwSW3esR8/A/CrG4OTS2dY4FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+OOEAJWkMLpJNgg9IlykvkUI2I1UPxokvHwRKpVXZbo=;
 b=C9ra3fyU2D3op/boetb0dca61sNkyQ0hHyTfMFl9Jmpr59HtCAuNybRBJg7cJ37akAQ4KDb6beaRFnHJnNRUzys6yS9/mo5PhDUpHDtkL1liyJwVTU4+DRrJo/zZCX9N1j0KzJKO6u0KFI3FQ9NjkW+DSphzNOTLsL+qCjp8PVk39heSxuiGXRHp/ihEbC34ErE/oi6U+cG90mZM/qPrrF6Ga9NgW+z4q0zeavzE2GXF3VMtTcFp/P+Gho2Y06Nrv39j6KJAjKXvikjvO0Nxw9wTJ/xdW+9Yd2NHii/1m40+3CP6VHgyNrHJIuBK+jwlPKtA9fxHzOUi3atFRn9bMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MN2PR11MB4709.namprd11.prod.outlook.com (2603:10b6:208:267::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 13 Apr
 2026 04:39:59 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9791.032; Mon, 13 Apr 2026
 04:39:59 +0000
Message-ID: <924eb185-11b8-4d12-a310-09a935af2eff@intel.com>
Date: Mon, 13 Apr 2026 10:09:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/ras: Fix error handling in register_nodes()
To: "Nguyen, Brian3" <brian3.nguyen@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20260407225913.3397059-1-shuicheng.lin@intel.com>
 <20260407225913.3397059-2-shuicheng.lin@intel.com>
 <SA1PR11MB8839D98125E6279612D9FBBEAA262@SA1PR11MB8839.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <SA1PR11MB8839D98125E6279612D9FBBEAA262@SA1PR11MB8839.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MN2PR11MB4709:EE_
X-MS-Office365-Filtering-Correlation-Id: 2467399f-8934-487c-93a7-08de9916b851
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: aHjgF6wo4eRA2c2heIYPcZmYJwL5H2klpDTm4Lzgk+qEqDLXU/Xag4U4cW+l2nTthZraFMO/Vf8LAFRQn8fiLrn2wIdlt6LWuIv0OHMGizsvAyq5ZwUVV8MgFVeq84VBGK6lHtWGv3TWcRBzyJ9aZ2ztUutnKAQMeaGtWk8URYTycUzSCZAFZD8jr7y0/yxL42Zvf70hRwaBx1HMq0ngHKblbqyHSniPk1JLcOuB+aP/L94z2+WIQRlBSJ8RF/eonjvH94tYnTdYnD4Jgw3U6ryRpDNbyDd3chU+fAW6JsT5yVVAe/BzruUeBD2vMvFC2OVZbsgwWrrff4ftg6Jq9IFdQoyJkhR7sPXAmVyRjhvm0W9FEWACgYBeSgNp8IUpumS2Khipyu5BpCkYohjIGoa399st/P0mG0OXaG8+gSm9hQJNFib1wAZAMSAPu6EtgEY7wXzd79OE7RXO6Pf1tdxPu6ErNUSF+UK3ys3mxrl6ilWUHZoQueFFMkt537AKSezBOzGMXzd0Brdv6Z+TTiOVzDNTEE5ovkGaSpIbEkjCVXqzTJNvL9U+tZ1j2hDw5uLe3I0BMWCw9HhMMTrxkUFP0vDfvEAVwok9qliu9gYFX6w4CfZ5Nwlb1NQ+ZN15BWNxbH0v7v6maLKsTmhy8oD46MQ+7qowvvhXdEjBUodIiS3Nb0bVeBh+/rNMae4WSiEs3PkoXFJmBp2hyKYSoR4ArVHnE6ry7Y8sHZ5B/Ho=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHFZR3EzdmRQOVo0NzhJS013NkVvSHZrSUVpV3c0TjdkUGVUcDkzQWp3V0t6?=
 =?utf-8?B?SitBTHlnWFZ0V29GVEVsaVhrL3ZyU1BXQ1hpNlpwYzNtalNXWWxOYU1tQVBJ?=
 =?utf-8?B?OTVCSCtPcVZKQWYwMDIxN3J0dUNJWjE4TzQ0YWxNOXRkNjlpZW1QQWpPL0sx?=
 =?utf-8?B?Z05Fa0VJclQ1US8wa0pyVU1MV2RHTVhjTG9OSldCNjBnYVd4QitlZXRFM0I1?=
 =?utf-8?B?clIza3JZRlZWSFpEYTNZaGI0bHZtRFJHUUh3c1VIbXJWNnNLbDFONFc5YlZ3?=
 =?utf-8?B?bys3cmRZZk9tZWRlZDc3SUJ2YW5Ob1RlNERlMVQrY0lhU3lZclFLaVJ2dUhN?=
 =?utf-8?B?ayt6aG4yTzB0MGNaVHhvRmdPT0tSK0p2T1FMaHg0Um1HTEZCZ1BYTnBDbHdO?=
 =?utf-8?B?Z0d4NXNOQ2dwRmFUQXNnK25iZzVoZVRySDJRUG12SjUrVjBYV1loRzBad3hP?=
 =?utf-8?B?aW54cjcvU09aY2lMV1hHMUV2YUJsejZ6eHpqWXRvSDBkRFZqd2tVUzJONjdn?=
 =?utf-8?B?cit4aUh2Q3lrT1pwNEpaMTJ6dnpJRW1GTHQveUpyMTcwS3EzWnBMamsxV0s1?=
 =?utf-8?B?N0M1VWJaZXRQRFhWZTVFL3VkZ2pZNERuaWdveFltWG1DTHR1VUdYNkJ4K0h3?=
 =?utf-8?B?UFZWa1BDdEozQzZiQXFveHJDN2lPMUwrcFRtTjBmaGdwaXliODJqZmpOK1JG?=
 =?utf-8?B?c0lWT2xsSlFqTnBSY3R5NUQ3QXhCUk5kMWNPM2VnaUQxNDNaa2JlTzNBRm1L?=
 =?utf-8?B?MEh1czlzNFRuT0ZJcTBGSzU1ZDFOMmtiOUxMeERvbytsdjkwSzBOMFVHZVkr?=
 =?utf-8?B?cjY5VUZCbGJKMGNVbCtWaUtFc0ZtaTYxSXNMYkxQOEJNT1k4bHVIMjQrbnB4?=
 =?utf-8?B?Z0szeTRWZ3VNeVBRV3JGT29kOHVxRnA1WFNlOFZxaldRc3hRMU1YbHJvVm5N?=
 =?utf-8?B?M2FxY2N4OHpkOU8wSEVHbGI5ZXhEUFY0M0RiSzJOZldtdWFkNEFuMUtVVTAw?=
 =?utf-8?B?TzJEZWwxLzZHS1VVa2pLSUt2Y2E1Q1g4ckJWQjZOQ3VDRXlFQ1MvcWhMT00y?=
 =?utf-8?B?MVovcDBUdjJPclVyRHpmdzBQME1la2NFelJwRzFaenVIaE9jR2xxTXo2K21W?=
 =?utf-8?B?MUs3LzNGcW5JdzFYQTU1QTZ5dTE3cUVsblpSdWhZY1BEYW9hSjVlWmZub1ND?=
 =?utf-8?B?K1FwVXd3TFp3MXJsUWtRR0tjeU9QbkR6amN1RTkxWUhkZHk5eG5yZndhSmFj?=
 =?utf-8?B?cWpVNVo1Y1NwSHAwNHpjSGg4OUhHcXc2ZGx2c21wRHl2Yzk3b284d1E3bWY3?=
 =?utf-8?B?QlRQWWJLempwNDRoYUlaU2wyMC8xbmtFSkRWdXp6Mk1jcmtMaHhWWVFaTDJP?=
 =?utf-8?B?Q2FqdUswelZtS25LbmVod2IxNUN6MW5FN1lIZnNlbGNDYkxYNTdWUzhqMGpD?=
 =?utf-8?B?UUhKRXJuL1dGRzZvWUhPYXFMNEF1NmtKbFNESmY5NDRaTjJmQ1RzYWtYcU9O?=
 =?utf-8?B?blNuQnFlbG9JY0NHeGZBUkpUbCtvNzJNbXV6TFVCZGd0djBiYVlYR3Zibmlp?=
 =?utf-8?B?QWpSdUNxMmtLMVdEK1B3R0hwNG9mTE5vYzBlVVg0ZFlVR0xJODllWDVIdEtY?=
 =?utf-8?B?Z3hZRENRdnJPREE0MWU3VlpYQWZKTG5SaEtNcmdpbmZ0RkRXY0tQa2RYL0lX?=
 =?utf-8?B?ekRUWkJLd0pucU43bjNpUHo0Z2I5MENLa1o0VGFDSWhpYWFIbmQ4aldhN05I?=
 =?utf-8?B?ek1lTWJVRzk1K1NacmtpZktoRVFybXl2clVBREQydGJjS0Ivc2JVNldDQXZR?=
 =?utf-8?B?V0xUbytNZmRyTW9EMEFhVDJUUnBGZ09EYWRQRmxjSUp1cVR0dUVpVWcvV2pO?=
 =?utf-8?B?cEc3ekUyT05MS1JiMHBuR3B5MUFETGpKb0ptbFJTdTFXWG43NDVuRldGQXpK?=
 =?utf-8?B?K2hCRlBtOU0wNW9XaWNZQXJCMnVqZ2hWQlBWRzZOWVd4Zno5NFp4dmlqcG5M?=
 =?utf-8?B?UTUzNjRFMXg1TVFsR2taa25CQ0RZRElnTWs0TUJEU0x4WDFmc0RhM2ZYMUFL?=
 =?utf-8?B?ZDFQbnpNMFlhaDg5SWt0dFgxTTlKMGFyQWo4Mm1hQ1BSN3RJMXpBNXdiWmx2?=
 =?utf-8?B?ZnQ2S0hTcUh5WkFFdlFvdGlrNjRKL2diT3ptOW9WTGR5WDBpeE1oV3dxRmE5?=
 =?utf-8?B?bnZiYWx1azJkY0RpU2cxY21FbmVLdXpac2s4VnZXTFM0YzMzNDBDYmFobDZQ?=
 =?utf-8?B?TkdCeXp1MUE4dlBXTHRMcGdjRUdFWGkyV2Q1a0haaDBEU3NCZk0yMFFKcFd5?=
 =?utf-8?B?ejRQL09HZUZCWm5PZDF0ajVwTmhMdUpPVDM0QzJaY0N0NnBnR1pZUT09?=
X-Exchange-RoutingPolicyChecked: M2xVyo2K64CBTbBWkBIJhTzcGEMXhIfynmb80/01eW0llHuC99CBP+2S3Ux1Wk2JyKD7LVvRWzsxMizqDL1jOxd+JHLqrqRKQoBmw81JbKcWFLPPl6f+2gJUmcfLliBvaUuT9gCy6JtnNVegK7+dv1v3U7Br/v0c8ZtC0Ib1zs45Lt6KOdSgOdV/mwrY3Iv7Rue0lHEs2yELrgvGaImsCH9jd5aGrU6g32l2NwDtkfZ2Ye7X8PkS5+ylw6KqHspO5XXjxzrkcdAALNr2ISSNBh/7kJ7NWqkYXZFTipJIKoE+uP9CnBtT0YjTbVks78lj6QNmjFop3aNgvFDoP7bPeg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2467399f-8934-487c-93a7-08de9916b851
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 04:39:59.7163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BL1ZXu3YsnZKx6Nxp/ez4EQoDvanNZ4k8r0ip201fmelsI3Ly4uEzGoVjQf0DTST/78kvDFzI43fz3O9+iHFPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4709
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


On 4/11/2026 10:16 AM, Nguyen, Brian3 wrote:
> On Tuesday, April 7, 2026 3:59 PM, Shuicheng Lin wrote:
>> Fix two issues in register_nodes():
>>
>> 1. When the loop fails mid-way, previously registered nodes are not
>>     cleaned up. Add goto-based error unwinding that walks backwards
>>     through completed iterations.

This was intentional.  If the previous nodes were registered 
successfully, why free those?
Also the errors are only from lack of memory where the entire gpu might 
not be accessible

>>
>> 2. When allocate_and_copy_counters() fails, assign_node_params()
>>     leaves ras->info[severity] as an ERR_PTR and returns. The caller
>>     then passes that ERR_PTR to kfree() via cleanup_node_param(),
>>     causing an invalid free. Fix by making assign_node_params()
>>     self-contained on error: NULL out the stale ERR_PTR and free
>>     device_name before returning.

allocate_and_copy_counters returns an error only when it fails 
allocation and when it is NULL. The kfree in mm/slub.c checks and 
returns when it is NULL. I don't see an issue here. Please provide 
better reasoning if you think these are still issues. Thanks Riana

>>
>> Fixes: b40db12b542f ("drm/xe/xe_drm_ras: Add support for XE DRM RAS")
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Assisted-by: Claude:claude-opus-4.6
>> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> Reviewed-by: Brian Nguyen <brian3.nguyen@intel.com>
>
>> ---
>>   drivers/gpu/drm/xe/xe_drm_ras.c | 31 ++++++++++++++++++++++---------
>>   1 file changed, 22 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
>> index e07dc23a155e..802e4bcb731c 100644
>> --- a/drivers/gpu/drm/xe/xe_drm_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
>> @@ -73,6 +73,7 @@ static int assign_node_params(struct xe_device *xe, struct drm_ras_node *node,
>>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>   	struct xe_drm_ras *ras = &xe->ras;
>>   	const char *device_name;
>> +	int ret;
>>
>>   	device_name = kasprintf(GFP_KERNEL, "%04x:%02x:%02x.%d",
>>   				pci_domain_nr(pdev->bus), pdev->bus->number,
>> @@ -89,8 +90,11 @@ static int assign_node_params(struct xe_device *xe, struct drm_ras_node *node,
>>   	node->priv = xe;
>>
>>   	ras->info[severity] = allocate_and_copy_counters(xe);
>> -	if (IS_ERR(ras->info[severity]))
>> -		return PTR_ERR(ras->info[severity]);
>> +	if (IS_ERR(ras->info[severity])) {
>> +		ret = PTR_ERR(ras->info[severity]);
>> +		ras->info[severity] = NULL;
>> +		goto err_free_name;
>> +	}
>>
>>   	if (severity == DRM_XE_RAS_ERR_SEV_CORRECTABLE)
>>   		node->query_error_counter = query_correctable_error_counter;
>> @@ -98,6 +102,11 @@ static int assign_node_params(struct xe_device *xe, struct drm_ras_node *node,
>>   		node->query_error_counter = query_uncorrectable_error_counter;
>>
>>   	return 0;
>> +
>> +err_free_name:
>> +	kfree(device_name);
>> +	node->device_name = NULL;
>> +	return ret;
>>   }
>>
>>   static void cleanup_node_param(struct xe_drm_ras *ras, const enum drm_xe_ras_error_severity severity)
>> @@ -114,26 +123,30 @@ static void cleanup_node_param(struct xe_drm_ras *ras, const enum drm_xe_ras_err
>>   static int register_nodes(struct xe_device *xe)
>>   {
>>   	struct xe_drm_ras *ras = &xe->ras;
>> -	int i;
>> +	int i, ret;
>>
>>   	for_each_error_severity(i) {
>>   		struct drm_ras_node *node = &ras->node[i];
>> -		int ret;
>>
>>   		ret = assign_node_params(xe, node, i);
>> -		if (ret) {
>> -			cleanup_node_param(ras, i);
>> -			return ret;
>> -		}
>> +		if (ret)
>> +			goto err_unwind;
>>
>>   		ret = drm_ras_node_register(node);
>>   		if (ret) {
>>   			cleanup_node_param(ras, i);
>> -			return ret;
>> +			goto err_unwind;
>>   		}
>>   	}
>>
>>   	return 0;
>> +
>> +err_unwind:
>> +	while (i--) {
>> +		drm_ras_node_unregister(&ras->node[i]);
>> +		cleanup_node_param(ras, i);
>> +	}
>> +	return ret;
>>   }
>>
>>   static void xe_drm_ras_unregister_nodes(struct drm_device *device, void *arg)
>> --
>> 2.43.0
