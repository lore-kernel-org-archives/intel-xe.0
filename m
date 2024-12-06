Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19028E77173
	for <intel-xe@archiver.kernel.org>; Fri,  6 Dec 2024 20:38:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D233210E06D;
	Fri,  6 Dec 2024 20:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D30irg8M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4F010E06D
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Dec 2024 20:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733517498; x=1765053498;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=tceY+qaJdwRZayPlH2M2ZGEOnnoaIVOBijFtF8/zOOU=;
 b=D30irg8M2yjaAu8guq2gj1Os/nAigUCY6D6dby2aXXiKh7utZe1gVapv
 iLyZUjCwr+sia6BmM3Ls+6OJuOn+pngBYZA9D6t2789ljf2yrgehq56Cr
 eScr7Vtj4jrx5in7bw1GWhISXEnF5IPjYzk68wgyYInsy5FiJGGbH9bkI
 /+gt8WgbsiwtzxmM+ZQrE90JK+e3jNKatWriDi6eD0av/Accahy5uVCVI
 tKmRrhdXnC7q0F39IoJsgs55b2Q3fYI6uwq2fOO4jowDBLIR+JNrWQB6S
 NZBrpqG+e2zysGRgFH5d9kQblXdqLm2LeqaH7H+jGzJJvRvDGcLfh05z1 Q==;
X-CSE-ConnectionGUID: QxiCt9stQWOnwfD3CXbM2A==
X-CSE-MsgGUID: Ap3e7WFmTbGeKZ9sa0IHow==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="44554590"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="44554590"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 12:38:17 -0800
X-CSE-ConnectionGUID: /bRBW43BRcCPos49kZaUqA==
X-CSE-MsgGUID: oPDmXwpJTi+0uIehyZENUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="99446925"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2024 12:38:17 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Dec 2024 12:38:16 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Dec 2024 12:38:16 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Dec 2024 12:38:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tVub/8aOQ8Px7jU3NQ9p8IxFtQ2uWaq7TcvDNyXS0SkaH6wJbewJR9BLt/pEWXSUAhZhhhOMQIMPNrzYpNu4CQF9iUinY54he+tK4rH4b84U6NT0X7lnwNOQJRNNhcwl9UpEOAnjmhfwYZDFrDB0odOAODBHV3gb4lmVZyTDzMaRh7LFB0BJTba1HdLW1dZTPuI/CMsJKtJkZ+KDJZ/eyLa5EM4qynX5vCTl3hZ9j+rSq5ZFiZJLJnzGrOkDHR+/8FxGVQn3OZf+yelMlWt1muacRYeKsS3FzdFkJMYoQ2JZtVtsF9p3bne1JDojhAe6SnSqx4Zg0Up6ZB/WjT7R/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYGQCIzH/mSc2rZ2CUxnLrNZXSaR0TeQo6OkCtDa+Es=;
 b=YECMVK8o39IhoFwHY8lVS06Pinq2fnCsrUrY11bt8MBKco8538vs43NgW/YnS+/SA/GfLu9AhH6TU1gHhbfHYmFpEBv3M0KsTNje6FYzCOrMsg8He2+BHSTgYhUMRKMPnjDb269TeTSamLo2djQmiieYythbBbBjaWgQC3KyTpRYhXxGqnEg6YxBxhWuqGv+ZmSpnwBPowQyqPIWgdeAYoRb0Hv1izifLEMTnR4IXlA8lNTwERAgtHQPVjkagtUlV6ZuODHtMkIQt42wdvd5IAHyj8iE8J3p81u83eYimn+3tAOap5wvBFqHk1oALXui2pSlZP9biIadBwCjCu/WQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Fri, 6 Dec
 2024 20:38:08 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8207.017; Fri, 6 Dec 2024
 20:38:08 +0000
Message-ID: <1483262d-fa74-46bd-9f6f-993d3dcb85fe@intel.com>
Date: Fri, 6 Dec 2024 12:38:04 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/12] drm/xe/pxp: Add GSC session invalidation support
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
 <20241120234353.1037180-5-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20241120234353.1037180-5-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0043.namprd03.prod.outlook.com
 (2603:10b6:303:8e::18) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH7PR11MB6522:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f90b785-7233-43cc-59f4-08dd1635e4c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eU9CaTlRY3RZcURneFN0NTlyTjdKYWZBOVhKN3FMbWEzNkVGN0VjeElvaitI?=
 =?utf-8?B?Q1ZrZHlvbmZXT1FUZ3pteHhmbHRhNG1UMHcrSXlXd1Q1L1crN3pnQlRhVkZS?=
 =?utf-8?B?WGNxOWxWVUVYY01oa3psQVZQdmhVTGduQmxXY2ZLblBiTFppREZsbUdGVmx4?=
 =?utf-8?B?ZnVqcUMybkQvajNxeUM0ZmxZem43VmpoUVRwSWlpMEgyZGxZNU55YXB0MWFC?=
 =?utf-8?B?eVpheTVpSnJLak5YWFFPZDBERStvK1BqYzBiOHp1eFB0Z1J4czk5QXcra0Fq?=
 =?utf-8?B?R3RMbERUeGZtcUtnU1lEdnFuemUrN0FUZVJ5RlYyMm14K2I0TWNpMWd1NkUy?=
 =?utf-8?B?V0RMalpabmVDREVLSnhPWk95WW9uZVRIcGhBdjh1czZTeVpoS3YwZkJPYkhq?=
 =?utf-8?B?aWJrWFV2emgyWXNBYTZORWR2RDMxSVN6b0NnaFAwcExlRmVTT1EvbEhtZWVH?=
 =?utf-8?B?bTcwNm15K2lqYlJOd3hmWXlsYTZYV3drQXJCM0dZSVVYa1pRL216WXQrV091?=
 =?utf-8?B?R1dYVEFqNUR1TnlVYXNWR2kvSWJacUhPazA4RUo2Zm11OWs5b3laSHViSE1k?=
 =?utf-8?B?OGtPNzZ1TWdYK1NtLzV4VWVKa0dTVXRZRHVGY1hteWRtSFhrTjNNZXFSZlVw?=
 =?utf-8?B?d1ZHOVl6dEo0SGZvU3VuUTk5TmpWa1VjbElUVDBFQjRVanBJV0JTZ2FXbjdh?=
 =?utf-8?B?OW1tK212SDhpS1E5bCs3djhmTlNRcEx5Q0g3M1dmeG1LMjl3QkRWSEpkeXdB?=
 =?utf-8?B?Y1kxakJSUnJ0THJydVlWcXdHNjNmVXpRRVN5bmlicTJKMU9jYVlNUXNiTjBB?=
 =?utf-8?B?dEVpMkM5QlFCdWdGKzVzMGtzZjN2NkhmRTYvRG9pRnhGcUpRUHF3ZngvYkdp?=
 =?utf-8?B?YTdDdDZnWFVlSHdydWNPaytSb21IQjhWMHBlQThVaXJFZy9jMllWcVhycElK?=
 =?utf-8?B?QkN3SmV3bHNLSjhyWGg1dHJ5bGowT2M0aEwyM21uaVZHUFFYMVB0QTJQVEpl?=
 =?utf-8?B?VnlmWXcyei9SQS9LQjZMTEJxTUR0TGdHWGltUlE5KzFOa28ra3Q5TFNNeUYz?=
 =?utf-8?B?aXFJRmVTRWdVU25uWkYyVnphMnNhZVlwa3V4ZGhTaWpzcldDMkVTNGtkL3RH?=
 =?utf-8?B?WUtveWNaTndJYTR2MDQ1NkJiYVdWc01xR2g1QlhFQUEwV3JtOElCMTg0aWZL?=
 =?utf-8?B?SitkTWtjclc0VXAvWWNFV0xSbTBBeTRjS3JxUFQzUFJDYzZrY3N4MDdqSHdM?=
 =?utf-8?B?MDVJbGhhaG0xZDlEYURERUpRY0JOVXMzbGRkOHRNNHc5ZGRxaUYvbm43UU56?=
 =?utf-8?B?OW9OdVRZL1dVcm0wRjVONnh5empxYTBqNG5lMlBzK2JtbnF4eGJSeUxQUm84?=
 =?utf-8?B?N1lpelF4aFRqajh3SlVWLyt6aWk1azBlNkVuOU9yV3MzT0lnQlo4eXRmUENl?=
 =?utf-8?B?TzdxdnlUbVQ4SytzMmpjZHpkRGVzUjg0QmI5ZTRYdnk2elZXdi84bHZ3K0wy?=
 =?utf-8?B?SmUxNjV1U2FxZDJmdjFRN0V4dnN4b3kxMlo2MGQyUDBnbDhKajc5UUJ5VEp2?=
 =?utf-8?B?UndQM0w0WXVmWWVFQlpoSzNlbVFiazh4UGVmZXJhT2FzUk1lVkJCaFJjS29D?=
 =?utf-8?B?aHFIcDFNZ0NZWFpjbTFVdTN1Z0FET0lINnI2dlFveDEyaGFxTURzK093SXdp?=
 =?utf-8?B?bE1vbDNuVUZRa2VGaVB4ajVIZFJ2SG4rL1FyRC9mTjRGbVVNQjRxZlh6Q25M?=
 =?utf-8?B?dTJiZmZQeXlaZUZna0c5NzhzSFl6Q2pNVFhvUEI2TWI0WjNMamxyN3NQbWU4?=
 =?utf-8?B?ekVVMTJHeVhZY2EyQmh5QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q09mRXY5NTU2NlNHc2UrZ2hRT3BUdlBua2w4RlcxNm1RQ1doVlVVWHBkK1Ja?=
 =?utf-8?B?eER2VVd5V0ExTHg2Y3AxbEZZOW5mcWNlWWJCM1lQSVlQajhPQXF1emdCNU5z?=
 =?utf-8?B?RHg4R2Npb1dzUG92UVR0SXlzcklYWFZ1UVBoL1pIemRaSU0rV25pQ0xjelBP?=
 =?utf-8?B?czdHOU43akI4RWtRS21va01WU3hjRjY5M2FtdmtMRzRwb3I1dWFRcmtJczY1?=
 =?utf-8?B?S2RlcENQWHNTbkVvak5pSE5QdGJqYTNMbEJ1SzkweEtMNldkN210MkFBcjVu?=
 =?utf-8?B?dWgrcm45Y2RKSGxnRzFtK0RpeUozckhyUzZZL01GcDVFb3l0T294ZzQrUHhZ?=
 =?utf-8?B?aG13YjV0anBTcUJpeExqU2VKWUhCeFpIZDVUbFlQM1pqY1R0Z1VyMVlaMzhX?=
 =?utf-8?B?TVg1cVJrblY3Z0FXRGFkclBTSG01SmxuY0ZzV0M0SEtadFRUSFlzakNoeTQ1?=
 =?utf-8?B?SHIwZGhnNHBOUWxoRy9veDZVSzY4MEduMEFNVzA2OTcwRjZQQ3lkZnQ3RTJj?=
 =?utf-8?B?TnlhUmJxeXNxbEhaVG5VUVBuZFNiYmFIaXhzekdZUzVycUN5dlZzMHljbDRI?=
 =?utf-8?B?bHlIVC9kK1VaOTFHNFp1TUpQUWZ1bzVJdWljdjZZV2EwUW9MUjgxY1dGeUtI?=
 =?utf-8?B?Sm9CbjJ2amtuNy9oYnd5aTlDVURJdGtsaXFZc3FFOG8xQUtNa0djSWo2cXlB?=
 =?utf-8?B?RTZ6aVpIMkpOdTNDRjg1bkxyZFV2WUtOSWtNNlY0dFM0K0dnQ2ZLOGlXa2w1?=
 =?utf-8?B?UkVycGZjY0hWbytHVzhwUXhFRkFYRHZaV2RocUxlSEdRSi9MNlhPOXpLbWpN?=
 =?utf-8?B?VThZTUp4b3loMmMvL0VOSTNrZ1hrVUFkVnp6UzFyck9GUmZ4QXRKTWViUkpu?=
 =?utf-8?B?ZjRFRTlXdEVZTG5HTXF6dkgxWFFUcUlPRGMyUW8vNCtrd3JyZm5FYmlvV3ho?=
 =?utf-8?B?OGlJSDJpazlJRGgvaUdBc2FPMmN1ZVA0OWxzU1ZIcTMvMG5lZmNiby9xOFlQ?=
 =?utf-8?B?R09mUW5NbDBrUVhpOHp0ZjBrOGVDeDYxWkZoRndvcnNtUThnZXdMSVl3L3pK?=
 =?utf-8?B?aEx5eE5waktGNG45cDRINUZqbnAxZ3dOdHBWQ1pPVENCRzJadUZYWlRmNDA5?=
 =?utf-8?B?T3Nra0F4NGZWY0JwN1liY0EwL3VrWFAxU1lUaVk3MGM5bFdlV2FaY0FCODN1?=
 =?utf-8?B?ZUVuMGJhcGFOejRTVXcybmZhdGVhMkFiZUpMUmp6STNNMXc0dUN6TVBmd3RL?=
 =?utf-8?B?cHdTZGJsNE1Oa3hDUWU0ZkIxK1p5TDN3YmEzSkVqQkJiNFMwL0hyWHZlamhk?=
 =?utf-8?B?UFArTk9qVHdPbDVZaldENjJkbDl0M0FkVEVQa1dZOGdzWTlONzRxcE83MEs0?=
 =?utf-8?B?NXRaMEdTUGdFdzlOdmxLbExvOW90MVh4aGIxVFBqdW95MDJjaXR3Qk4wQ3N5?=
 =?utf-8?B?TnYvV0FsczlZUU5HYjV6VHlKb09IV0VJUThHOHNsRmExSS9GdEd1Z08yNHNC?=
 =?utf-8?B?KytGd1VNN1hnOUZDclo1NG5KaHhYRjZ2NityVzViWXpXQ3VvVHhrMmFQdmJs?=
 =?utf-8?B?WEhCaTR3bi9nVmZ4WjJod1hvMUZxWHVyU3Z1Q2IrS1ZDbW1GN2NYaEJPTjY5?=
 =?utf-8?B?YjdJQjVyUGNxZUpibjZLWkpuaE5uSEZnU3ZVNUxCK2tUQUIzWWpJcnVkV2lQ?=
 =?utf-8?B?ZGoxV2h3SUxWOEVTSGdTMzRxSTRySW5NSUJJeitCOE5xVVlJSVlzZE5rYkFm?=
 =?utf-8?B?d3lROS9pTGZzV2lJZTMrNHhlNmJIV0tFeEZHcHUwY3lkZkhBTVNjaGtFdUJX?=
 =?utf-8?B?MzVZbUVHcHdOZ01iQTE0anNSWmlBa2U5bWtoa0dlQlJ4UUJnMDFkSllOQjQr?=
 =?utf-8?B?cUYreW1jUklJSWlMeWtWbWljSlZGQ080dUVGWTB6My9jNlRhdVVLcHNzSmh1?=
 =?utf-8?B?SUVMdFB3elBCbVQ3Q2tZaFJ3b3lhY2UrWVlhWTdiZ2RKdnpJV2xrVisvbVBD?=
 =?utf-8?B?REkwSnJhUW10V3o1K2lFZkJpZzYwdXNRMEZ0TW9PMHVzcnQ5eWcwdXFoQk9v?=
 =?utf-8?B?YTdib1IxbUZUR1VvTkszYWJaS2xTa1FGTjJBZExLWjFnOWdBV24yMi9nVXdy?=
 =?utf-8?B?bUsyT1lBNForOFBGSXVxQ2NqVXBTdXd0UGlvTTM5U1ZwUGZvTGZWdUpHVUFl?=
 =?utf-8?B?a0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f90b785-7233-43cc-59f4-08dd1635e4c9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 20:38:08.5843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cMaXqZcIJT12FaNxJo4nhHQ9DIgrwgrDXGDUnRaS4Nt5JhckLkbQhEhJNp7sfOO/ZTKIXNbdtteVof2ESZ0GIHgoTmrMv3tdxR2Bk2UvMIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6522
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

On 11/20/2024 15:43, Daniele Ceraolo Spurio wrote:
> After a session is terminated, we need to inform the GSC so that it can
> clean up its side of the allocation. This is done by sending an
> invalidation command with the session ID.
>
> Note that this patch is meant to be squashed with the follow-up patches
> that implement the other pieces of the termination flow. It is separate
> for now for ease of review.
>
> v2: Better comment and error messages (John)
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h |  13 +
>   drivers/gpu/drm/xe/xe_pxp_submit.c            | 228 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pxp_submit.h            |   3 +
>   3 files changed, 244 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
> index f3c4cf10ba20..f0da65ccdda2 100644
> --- a/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
> +++ b/drivers/gpu/drm/xe/abi/gsc_pxp_commands_abi.h
> @@ -31,6 +31,7 @@ enum pxp_status {
>   	PXP_STATUS_NOT_READY = 0x100e,
>   	PXP_STATUS_PLATFCONFIG_KF1_NOVERIF = 0x101a,
>   	PXP_STATUS_PLATFCONFIG_KF1_BAD = 0x101f,
> +	PXP_STATUS_PLATFCONFIG_FIXED_KF1_NOT_SUPPORTED = 0x1037,
>   	PXP_STATUS_OP_NOT_PERMITTED = 0x4013
>   };
>   
> @@ -49,6 +50,7 @@ struct pxp_cmd_header {
>   	u32 buffer_len;
>   } __packed;
>   
> +#define PXP43_CMDID_INVALIDATE_STREAM_KEY 0x00000007
>   #define PXP43_CMDID_NEW_HUC_AUTH 0x0000003F /* MTL+ */
>   
>   /* PXP-Input-Packet: HUC Auth-only */
> @@ -63,4 +65,15 @@ struct pxp43_huc_auth_out {
>   	struct pxp_cmd_header header;
>   } __packed;
>   
> +/* PXP-Input-Packet: Invalidate Stream Key */
> +struct pxp43_inv_stream_key_in {
> +	struct pxp_cmd_header header;
> +	u32 rsvd[3];
> +} __packed;
> +
> +/* PXP-Output-Packet: Invalidate Stream Key */
> +struct pxp43_inv_stream_key_out {
> +	struct pxp_cmd_header header;
> +	u32 rsvd;
> +} __packed;
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
> index 326baea679a3..f5f6b18c1054 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_submit.c
> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
> @@ -15,9 +15,13 @@
>   #include "xe_gsc_submit.h"
>   #include "xe_gt.h"
>   #include "xe_lrc.h"
> +#include "xe_map.h"
>   #include "xe_pxp_types.h"
>   #include "xe_sched_job.h"
>   #include "xe_vm.h"
> +#include "abi/gsc_command_header_abi.h"
> +#include "abi/gsc_pxp_commands_abi.h"
> +#include "instructions/xe_gsc_commands.h"
>   #include "instructions/xe_mfx_commands.h"
>   #include "instructions/xe_mi_commands.h"
>   
> @@ -311,3 +315,227 @@ int xe_pxp_submit_session_termination(struct xe_pxp *pxp, u32 id)
>   
>   	return 0;
>   }
> +
> +static bool
> +is_fw_err_platform_config(u32 type)
> +{
> +	switch (type) {
> +	case PXP_STATUS_ERROR_API_VERSION:
> +	case PXP_STATUS_PLATFCONFIG_KF1_NOVERIF:
> +	case PXP_STATUS_PLATFCONFIG_KF1_BAD:
> +	case PXP_STATUS_PLATFCONFIG_FIXED_KF1_NOT_SUPPORTED:
> +		return true;
> +	default:
> +		break;
> +	}
> +	return false;
> +}
> +
> +static const char *
> +fw_err_to_string(u32 type)
> +{
> +	switch (type) {
> +	case PXP_STATUS_ERROR_API_VERSION:
> +		return "ERR_API_VERSION";
> +	case PXP_STATUS_NOT_READY:
> +		return "ERR_NOT_READY";
> +	case PXP_STATUS_PLATFCONFIG_KF1_NOVERIF:
> +	case PXP_STATUS_PLATFCONFIG_KF1_BAD:
> +	case PXP_STATUS_PLATFCONFIG_FIXED_KF1_NOT_SUPPORTED:
> +		return "ERR_PLATFORM_CONFIG";
> +	default:
> +		break;
> +	}
> +	return NULL;
> +}
> +
> +static int pxp_pkt_submit(struct xe_exec_queue *q, u64 batch_addr)
> +{
> +	struct xe_gt *gt = q->gt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_sched_job *job;
> +	struct dma_fence *fence;
> +	long timeout;
> +
> +	xe_assert(xe, q->hwe->engine_id == XE_HW_ENGINE_GSCCS0);
> +
> +	job = xe_sched_job_create(q, &batch_addr);
> +	if (IS_ERR(job))
> +		return PTR_ERR(job);
> +
> +	xe_sched_job_arm(job);
> +	fence = dma_fence_get(&job->drm.s_fence->finished);
> +	xe_sched_job_push(job);
> +
> +	timeout = dma_fence_wait_timeout(fence, false, HZ);
> +	dma_fence_put(fence);
> +	if (timeout < 0)
> +		return timeout;
> +	else if (!timeout)
> +		return -ETIME;
> +
> +	return 0;
> +}
> +
> +static void emit_pxp_heci_cmd(struct xe_device *xe, struct iosys_map *batch,
> +			      u64 addr_in, u32 size_in, u64 addr_out, u32 size_out)
> +{
> +	u32 len = 0;
> +
> +	xe_map_wr(xe, batch, len++ * sizeof(u32), u32, GSC_HECI_CMD_PKT);
> +	xe_map_wr(xe, batch, len++ * sizeof(u32), u32, lower_32_bits(addr_in));
> +	xe_map_wr(xe, batch, len++ * sizeof(u32), u32, upper_32_bits(addr_in));
> +	xe_map_wr(xe, batch, len++ * sizeof(u32), u32, size_in);
> +	xe_map_wr(xe, batch, len++ * sizeof(u32), u32, lower_32_bits(addr_out));
> +	xe_map_wr(xe, batch, len++ * sizeof(u32), u32, upper_32_bits(addr_out));
> +	xe_map_wr(xe, batch, len++ * sizeof(u32), u32, size_out);
> +	xe_map_wr(xe, batch, len++ * sizeof(u32), u32, 0);
> +	xe_map_wr(xe, batch, len++ * sizeof(u32), u32, MI_BATCH_BUFFER_END);
> +}
> +
> +#define GSC_PENDING_RETRY_MAXCOUNT 40
> +#define GSC_PENDING_RETRY_PAUSE_MS 50
> +static int gsccs_send_message(struct xe_pxp_gsc_client_resources *gsc_res,
> +			      void *msg_in, size_t msg_in_size,
> +			      void *msg_out, size_t msg_out_size_max)
> +{
> +	struct xe_device *xe = gsc_res->vm->xe;
> +	const size_t max_msg_size = gsc_res->inout_size - sizeof(struct intel_gsc_mtl_header);
> +	u32 wr_offset;
> +	u32 rd_offset;
> +	u32 reply_size;
> +	u32 min_reply_size = 0;
> +	int ret;
> +	int retry = GSC_PENDING_RETRY_MAXCOUNT;
> +
> +	if (msg_in_size > max_msg_size || msg_out_size_max > max_msg_size)
> +		return -ENOSPC;
> +
> +	wr_offset = xe_gsc_emit_header(xe, &gsc_res->msg_in, 0,
> +				       HECI_MEADDRESS_PXP,
> +				       gsc_res->host_session_handle,
> +				       msg_in_size);
> +
> +	/* NOTE: zero size packets are used for session-cleanups */
> +	if (msg_in && msg_in_size) {
> +		xe_map_memcpy_to(xe, &gsc_res->msg_in, wr_offset,
> +				 msg_in, msg_in_size);
> +		min_reply_size = sizeof(struct pxp_cmd_header);
> +	}
> +
> +	/* Make sure the reply header does not contain stale data */
> +	xe_gsc_poison_header(xe, &gsc_res->msg_out, 0);
> +
> +	/*
> +	 * The BO is mapped at address 0 of the PPGTT, so no need to add its
> +	 * base offset when calculating the in/out addresses.
> +	 */
> +	emit_pxp_heci_cmd(xe, &gsc_res->batch, PXP_BB_SIZE,
> +			  wr_offset + msg_in_size, PXP_BB_SIZE + gsc_res->inout_size,
> +			  wr_offset + msg_out_size_max);
> +
> +	xe_device_wmb(xe);
> +
> +	/*
> +	 * If the GSC needs to communicate with CSME to complete our request,
> +	 * it'll set the "pending" flag in the return header. In this scenario
> +	 * we're expected to wait 50ms to give some time to the proxy code to
> +	 * handle the GSC<->CSME communication and then try again. Note that,
> +	 * although in most case the 50ms window is enough, the proxy flow is
> +	 * not actually guaranteed to complete within that time period, so we
> +	 * might have to try multiple times, up to a worst case of 2 seconds,
> +	 * after which the request is considered aborted.
> +	 */
> +	do {
> +		ret = pxp_pkt_submit(gsc_res->q, 0);
> +		if (ret)
> +			break;
> +
> +		if (xe_gsc_check_and_update_pending(xe, &gsc_res->msg_in, 0,
> +						    &gsc_res->msg_out, 0)) {
> +			ret = -EAGAIN;
> +			msleep(GSC_PENDING_RETRY_PAUSE_MS);
> +		}
> +	} while (--retry && ret == -EAGAIN);
> +
> +	if (ret) {
> +		drm_err(&xe->drm, "failed to submit GSC PXP message (%pe)\n", ERR_PTR(ret));
> +		return ret;
> +	}
> +
> +	ret = xe_gsc_read_out_header(xe, &gsc_res->msg_out, 0,
> +				     min_reply_size, &rd_offset);
> +	if (ret) {
> +		drm_err(&xe->drm, "invalid GSC reply for PXP (%pe)\n", ERR_PTR(ret));
> +		return ret;
> +	}
> +
> +	if (msg_out && min_reply_size) {
> +		reply_size = xe_map_rd_field(xe, &gsc_res->msg_out, rd_offset,
> +					     struct pxp_cmd_header, buffer_len);
> +		reply_size += sizeof(struct pxp_cmd_header);
> +
> +		if (reply_size > msg_out_size_max) {
> +			drm_warn(&xe->drm, "PXP reply size overflow: %u (%zu)\n",
> +				 reply_size, msg_out_size_max);
> +			reply_size = msg_out_size_max;
> +		}
> +
> +		xe_map_memcpy_from(xe, msg_out, &gsc_res->msg_out,
> +				   rd_offset, reply_size);
> +	}
> +
> +	xe_gsc_poison_header(xe, &gsc_res->msg_in, 0);
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_pxp_submit_session_invalidation - submits a PXP GSC invalidation
> + * @gsc_res: the pxp client resources
> + * @id: the session to invalidate
> + *
> + * Submit a message to the GSC FW to notify it that a session has been
> + * terminated and is therefore invalid.
> + *
> + * Returns 0 if the submission is successful, an errno value otherwise.
> + */
> +int xe_pxp_submit_session_invalidation(struct xe_pxp_gsc_client_resources *gsc_res, u32 id)
> +{
> +	struct xe_device *xe = gsc_res->vm->xe;
> +	struct pxp43_inv_stream_key_in msg_in = {0};
> +	struct pxp43_inv_stream_key_out msg_out = {0};
> +	int ret = 0;
> +
> +	/*
> +	 * Stream key invalidation reuses the same version 4.2 input/output
> +	 * command format but firmware requires 4.3 API interaction
> +	 */
> +	msg_in.header.api_version = PXP_APIVER(4, 3);
> +	msg_in.header.command_id = PXP43_CMDID_INVALIDATE_STREAM_KEY;
> +	msg_in.header.buffer_len = sizeof(msg_in) - sizeof(msg_in.header);
> +
> +	msg_in.header.stream_id = FIELD_PREP(PXP_CMDHDR_EXTDATA_SESSION_VALID, 1);
> +	msg_in.header.stream_id |= FIELD_PREP(PXP_CMDHDR_EXTDATA_APP_TYPE, 0);
> +	msg_in.header.stream_id |= FIELD_PREP(PXP_CMDHDR_EXTDATA_SESSION_ID, id);
> +
> +	ret = gsccs_send_message(gsc_res, &msg_in, sizeof(msg_in),
> +				 &msg_out, sizeof(msg_out));
> +	if (ret) {
> +		drm_err(&xe->drm, "Failed to invalidate PXP stream-key %u (%pe)\n",
> +			id, ERR_PTR(ret));
> +	} else if (msg_out.header.status != 0) {
> +		ret = -EIO;
> +
> +		if (is_fw_err_platform_config(msg_out.header.status))
> +			drm_info_once(&xe->drm,
> +				      "Failed to invalidate PXP stream-key %u: BIOS/SOC 0x%08x(%s)\n",
> +				      id, msg_out.header.status,
> +				      fw_err_to_string(msg_out.header.status));
> +		else
> +			drm_dbg(&xe->drm, "Failed to invalidate stream-key %u, s=0x%08x\n",
> +				id, msg_out.header.status);
> +	}
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.h b/drivers/gpu/drm/xe/xe_pxp_submit.h
> index 4ee8c0acfed9..48fdc9b09116 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_submit.h
> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.h
> @@ -9,10 +9,13 @@
>   #include <linux/types.h>
>   
>   struct xe_pxp;
> +struct xe_pxp_gsc_client_resources;
>   
>   int xe_pxp_allocate_execution_resources(struct xe_pxp *pxp);
>   void xe_pxp_destroy_execution_resources(struct xe_pxp *pxp);
>   
>   int xe_pxp_submit_session_termination(struct xe_pxp *pxp, u32 id);
> +int xe_pxp_submit_session_invalidation(struct xe_pxp_gsc_client_resources *gsc_res,
> +				       u32 id);
>   
>   #endif /* __XE_PXP_SUBMIT_H__ */

