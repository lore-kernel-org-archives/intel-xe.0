Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19A1C531D0
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 22:02:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B036610F22C;
	Thu, 23 Jul 2026 22:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GSNbbZMj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C8D10F22C
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 22:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784844134; x=1816380134;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jvvCDXtJnKBbG8tVSjV76TQhuWH8cCy41OGAR5q7MnY=;
 b=GSNbbZMj29J48PURTzH6itoS8u3Z0VZMo01GHqrP3pAsuJGQbjc2PvdQ
 Ut2q02OnQuFaUeZ20+tN5VRhQedxTziwJnYRolsvvVnr8Ng8bs0bZkfHR
 w8Jz6/EzyW8G/zODLn88uxSVtN+ddD+UsVjCj6OGhK6GWXzCnX91Y1+Ka
 tRzzocIrF2B0pcxMxLRjUNMPZ3PTrNxRYFYNZ88eP6sl0E5vaw90wMNA4
 1pHYYDpxfDOGfcZl6K13iavhOrvkeQNTib3fe7WsFY6ecT9szTxAqg4G2
 yusc/7VeP3qkp7mabnqvjco6Ry/u1Anc1jnrty8MXYIWeNoLqi4swLp4L Q==;
X-CSE-ConnectionGUID: /V57KNjUQbuKOc2wjtGv2Q==
X-CSE-MsgGUID: nPKxMt9GQDqpNRngzELeKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85704440"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="85704440"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 15:02:13 -0700
X-CSE-ConnectionGUID: F6sHRs2PSkuFk5y4GPxhfg==
X-CSE-MsgGUID: lgs9M+c0TrqJKEpwwA11jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="296751713"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 15:02:13 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 15:02:12 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 15:02:12 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.42) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 15:02:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ftTBRVPkdfjlkbOkA/erW+xPm2WBzTIaaOG9BnD6gTEkWq4E1mQlNGEDWIhR4aZ4O7sY+9Bz6U2d7A33nnipdFftUS16EvLzJkOrrsPbVucJrpucnrW3NbFSkbUOU+WA7douyXg/MKT/cmXd2MIrtISrMnpE3T4gEGdCpL2H3rsPwTth4g+McKJEmVzB0zw8WQpXCYFGUh69WdyZrLdtgmvkM8vohtKDppi9TO3IOHX5QhHfGBbik33w7XM6JhDtm5YCODVyz25ufEvqelSeBF6w5wzxKG8JxYqOU0mKK1am0m+IpTdEbc3UdQK82Ym2bP7E7jL2gcSdZkQD2RYWdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s14RkeIxliKFVHGGDha6+TWuKZZ7FHHhk8B82LJqDW8=;
 b=RKOCcRY2DTUQb/8mNySWQUYdiej7nCcZMHhic0Zf7+uKRf5bPsa+qbvzyj+B8U+bhPLy5FCd3MRsA93IaqXr5emyjj3RbpoPKazz//e60A4ZCz9HQRFa4AJ4t3fQjS2xAiFB4p+JDC5zzSatOOCZcriMhbZW8zpgxzAHFBV/JgBJ6NjkxH3G0lgBAlUOPonOVKWo+sG0Y+L/6faFPmbt2LbK1sYZUfvo+y+3N7nqkEAScDZi+LOtzh4AjUflFQnv4pSjrYzqZG1nJPhgKxQ32c3UaRd+ZF7+4rgAKxn9z/buwbYBn1uJsqgQ9WljT8+OmyAIun/4DIWDyUTrH9R5fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SN7PR11MB6948.namprd11.prod.outlook.com (2603:10b6:806:2ab::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 22:02:09 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 22:02:09 +0000
Message-ID: <f1199ac7-7445-48fa-970b-51056d493736@intel.com>
Date: Fri, 24 Jul 2026 00:02:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/19] drm/xe/gt: Report 'pagefault' errors using SIGID
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>
References: <20260723203754.3782-1-michal.wajdeczko@intel.com>
 <20260723203754.3782-19-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260723203754.3782-19-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0058.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:337::15) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SN7PR11MB6948:EE_
X-MS-Office365-Filtering-Correlation-Id: 76e507b4-cdbb-461b-8d75-08dee9060aac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: yO4YrwX3B2wGB0tkd6VPOexV/ZiYWxypwFyPTRw2rtecHYcLMRndNP4iKd51gxK9OYk7KfspD/ag1w8AeSLfw79VWE4+6gDj29lHLCfoKk5ex2c2fS6hshSifjmpaATSGtSoDKibpZjWo2ajfWe4+q67orxG9lGInJjCP5qFhIGmRsl4zb7Pl36JKi2Ye97AT86Quy5gg0SH0uuDQTaQAZIGyFj/hBlDVuDx+6+CbShmRopQ8T8m/HQfDbmWqe0QfTY03uB/iuomLvQZxZ4MRxWZ8tXjzDu25+IBwRNImG6ndi+CFx1mjREBwx+AkG5R1xe/NYDDTDfxD5NPsMB+3bzc6CUhdvPqd97hxwt0CdDcAxH7p7xUpsHad/c4V6RK322QOkFFo9Tz+eBi/MIAT5hs6SgN+m2WWuh1Sf9is+Gasg5U0QRKDoVc7EZJrsMva0Vntv+9LCCFQ7ICzRTxvYWfgcHf/kQNOUOZSNzTBKaMg03J4wL/rmChOKT/KAiUraN8f7EamROElIpDRiwBahcb8VsFJzCEsRXsLgWr1JEhNO0Vp5Wpun5b89FNj79HJH2F6mQKZKfpCvuz2s57ThqcU+Yc1cKylp8pFgEhY0m2KVDEpMs1zbtysQr/sBWqNiZBUg/Fi4KZXHCMMl8OkMEBzL1fHp1+Qmae9rlKBkM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0NoQmpBb01Kd2FNT2UrMnhLWldabUNpN3JXSGUrbmxHR2xTTGUzS0RDVGRI?=
 =?utf-8?B?MHFubURRd3VTeTA2M1J6U2RtemNhUG9McnZ6cGNua2NjN2g2R3R4bkZ3c0hw?=
 =?utf-8?B?YnJHQ2hLTlk5T1l2RGZreWJ4SFduUUlZemhPdlkwRVJaUEV4TURqVmtialcr?=
 =?utf-8?B?aVVESGdCQ3IrQ3UvNDNBNHBJOFhjTkl2VERLd0orejVjcnJCSEhCaks0Q2ZU?=
 =?utf-8?B?Y3NodldZOUJ0Uk90ZHB0VmxYcmJnTXM2R1M5VHNDbjZjKzFMcXpROXYyVUZP?=
 =?utf-8?B?cklEM2YzV0pRQ3ZlR2owM0ZrdU94d2lhVFVmUG96OFBxNWpCbUF6RndGYm9B?=
 =?utf-8?B?cUpQUVh5M1F5TUdEQWpjd0JFQkc1Q2NIeHc1UDgwc1JPTlZIRkJiaEZBTXlo?=
 =?utf-8?B?eTBCQWJPbUFpNGFja2RJUmZFNitqT3daRlJERWFEbThRbjRiclJzL1FpVjBv?=
 =?utf-8?B?Qzdnano4dWtjMk1PTUM3ZkkvYUJwbTZwVHFlY0VndXpVQmFLSWFINWNZcjE3?=
 =?utf-8?B?b3ZocXBIR01TOXg5eEtqMjJET3ZLellZTkVXSlFQQ0dTck1oaHN4UktNWld5?=
 =?utf-8?B?cGpzcFBBWTg4QmJWMzc5MHJFRHdTZXc4bDdha3h4Y0daemdncUk1Y0NPSExo?=
 =?utf-8?B?S1pNaFVrQzhNNm1DVFM3K2xNRXVEaHcwbHhhNEFHeG1SQUw1ZkdsalM0bi91?=
 =?utf-8?B?MlZxY2d2aHErZVYxVUFTRTRPVERiVlBDV3JnQ2RzSkhwR0ZQbGpyc0JrNXpq?=
 =?utf-8?B?TVBweFFreWpKY1piVVlkR2N1Mk5aaGwyUG9YTUdNR1ArblFYQTdUV0YrQnIw?=
 =?utf-8?B?QkFrbUhjUWMrZndzdmVkUmJhTFkwSGdCQURKcGh4bTNmTmNUcThUZjhNejZT?=
 =?utf-8?B?OCtrR2xOaThoTk01SGw4S29xN2cyYXhGckNZZEQyMTh1TFVRR3AzWWpHSFgy?=
 =?utf-8?B?eCs3dUNMbnRNZGl6dkdEQWNEMUNobEU0OS9FUnROTmF1bmRRb2NvSDgxTVpv?=
 =?utf-8?B?VlBtdW1FY3lRNEZNa3NhUmtoek1TSW91SFJvdDl0TXpvcmo3WUlTRVpMTTln?=
 =?utf-8?B?ZnY2bmM5cktxdEw5S1VDMTNNVGFCZkJMTWt3NDhuWTh6RW5kejQ5SXlkaGxF?=
 =?utf-8?B?eEtrQ0tnY0oybnpQWm0zL09uYmd4Nk1xN1k0TDZDKy9hNGlVUm9tbGtUc1Br?=
 =?utf-8?B?YlVXVFZUVENVMEtPU3JJRUVBZjFKcHlxVytMNm0yeUZvajRteGNoS0txNCt6?=
 =?utf-8?B?YUpSNVBrK3o5UVU4S2tiU0MvSW1UblJ0RWc4UjZxTTN5QzRhWUE1Ry92YWVr?=
 =?utf-8?B?OElHSWg1SDNjRUtSd2hhT1lYWWY0Z2ZsQlFFZFZrZEtzM25yRTBTMUpZcDdy?=
 =?utf-8?B?bEVqVEQyTXNXQWFrNTVWeGtYVEtXZkRNYXhqNE5KYkRtcTdVOElWUGc3bUVj?=
 =?utf-8?B?bVVTUHUrVVZGdkZwRDlya3JhbzNwNnNkM1NITy9uVWJRTWU1akM5Yi9RMFZS?=
 =?utf-8?B?cGM3ZVN6Vm1XQy92SGJFZVgwRCs4Qm9rMGQ5T2FiMFhoM3ZKb3pidEFzZ1BI?=
 =?utf-8?B?bFQ5M3V3SWhVNS8rams1U1dIUkJCOCtENUxQRGUyQVUydnJJQU9mQzdFQitt?=
 =?utf-8?B?MGlPMWRDWmhnamRFU291QTVqcys5d24vM29jVHZjWExmM3QvQ284c0I2djN6?=
 =?utf-8?B?ODdRVFV1bXd6UDd4dVROQVlkOUlZQlpUU0Q2bng1aXh5OHBwMWlheFJCMnoy?=
 =?utf-8?B?R0lTR0xXc2dwMXlJNlcvOWwvclU1bjVJNUFFQUFxOVNGZWxva0hoSzFQVG0w?=
 =?utf-8?B?TElDMWpWSnJWN0dLSGJobjUxZktKT2hpcm9WU3d4STNrdy9Qa3RadENtcWl0?=
 =?utf-8?B?SkpKck5SZlRGYmVZUW5JcVIyUkNmQ1A5aU9zWEhaNUUrY2FaNnlJVHY1RzRo?=
 =?utf-8?B?MzZLTERQaXJlSEh0OVBpb3MwZW43WjJicXZEaXdETDlIWnZVS01zOU9NUTZK?=
 =?utf-8?B?UzJ1TXM5YVl4RVlodmVGQkszbGptbkZiS2NNekZsaG5ZZnJhVEJLMTE2NTFh?=
 =?utf-8?B?b3hBUUgxM3N4QWVsdFpoYmpiYVdyc2ZHTXp2WERvTHR3Ti9wS3ZnM0NFTEV6?=
 =?utf-8?B?R2t2ekxGYVp4M1lWMlhWNFdjaC9KUDR5SisrK0NXWjYydTJubmdmbkl5bG44?=
 =?utf-8?B?TEpEZGV6YnR4QjV4WFJNNlAwUCtCT2FTTG9qamFtaktvZkREMW5iRTRQTVB5?=
 =?utf-8?B?MWcwMHg2SzFsM3NlWlpVTlZjcXRhUVFHWi9qMlBhWGF0TTZZc2h5Wlp0V3dS?=
 =?utf-8?B?RFlqNjJnUThZczg3aVpETkU5L01WaWw3cm9YbllDYnphNTRMVVNteXFYbHRp?=
 =?utf-8?Q?Kl8wrrS5/i0E3UfQ=3D?=
X-Exchange-RoutingPolicyChecked: fwiHYpLLowHYSrbTd6I9valV7JmfxxzWuSTRqSFS/Ud7Qn1QNanoxwrhGRJmJPU5LdtuygiNFL5+M5ADY+2AcFIpDzcu57LwazLFjbNUbzG0I8bhm8Vtqk69CAt4MAoBpOhtM7fE77G6F+Fp9rV5awnlqje3bCMOVuB3P2D1cKt7tl0aPU7MXQoEMNK/VUNaKx6bSHydZFYEP9AM3Lf8CxzdySbww9tTWZ++mmlPj2uvbxbIFeDq7NojneJtLO4qGOWJPrL8kvPMO6GIvsd26xqnOidJL/HmL1pU4Zz0qzOzu/71paRtyAQj0tlTgD//zgofEMMSReNVG3nFEvZY6Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e507b4-cdbb-461b-8d75-08dee9060aac
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 22:02:09.3684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qC2dKzeITBHEs6aK30VCxvOKVuCE8pRTga5B4QKYm6CpYkY5vFfw/5DN85zPhPlaIoX3BVnE/BVRK7+plKVpk6jOm6xVTVFlmaCJaMRzLl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6948
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



On 7/23/2026 10:37 PM, Michal Wajdeczko wrote:
> Report 'Queue full/Unsuccessful response' pagefault errors using
> xe_log() helpers.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pagefault.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index dd3c068e1a39..e78c855759e1 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -14,6 +14,7 @@
>  #include "xe_gt_types.h"
>  #include "xe_gt_stats.h"
>  #include "xe_hw_engine.h"
> +#include "xe_log.h"
>  #include "xe_pagefault.h"
>  #include "xe_pagefault_types.h"
>  #include "xe_svm.h"
> @@ -309,8 +310,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>  			xe_pagefault_save_to_vm(gt_to_xe(pf.gt), &pf);
>  			if (!(pf.consumer.access_type & XE_PAGEFAULT_ACCESS_PREFETCH)) {
>  				xe_pagefault_print(&pf);
> -				xe_gt_info(pf.gt, "Fault response: Unsuccessful %pe\n",
> -					   ERR_PTR(err));
> +				xe_log_err(pf.gt, PAGEFAULT, err, "Fault response: Unsuccessful\n");

likely we should update igt-dmesg-regex, as now we can see:

<6> [97.791592] [IGT] xe_exec_fault_mode: starting subtest invalid-va
<6> [97.817628] xe 0000:00:02.0: [drm] Tile0: GT0: 
	ASID: 188
	Faulted Address: 0x0000fffffffff000
	FaultType: 0
	AccessType: 1
	FaultLevel: 3
	EngineClass: 0 rcs
	EngineInstance: 0
<3> [97.817690] xe 0000:00:02.0: [drm] *ERROR* SIGID=107 (-EINVAL) Tile0: GT0: PAGEFAULT: Fault response: Unsuccessful
<6> [97.828714] xe 0000:00:02.0: [drm] Tile0: GT0: Engine memory CAT error [18]: class=rcs, logical_mask: 0x1, guc_id=3

or

<6> [102.287988] [IGT] xe_exec_system_allocator: starting subtest fault
<6> [102.288628] [IGT] add ignored dmesg regex: [Mm]emory CAT error
<6> [102.306296] xe 0000:00:02.0: [drm] Tile0: GT0: 
	ASID: 220
	Faulted Address: 0x0000fd8bd7400000
	FaultType: 0
	AccessType: 0
	FaultLevel: 4
	EngineClass: 0 rcs
	EngineInstance: 0
<3> [102.306313] xe 0000:00:02.0: [drm] *ERROR* SIGID=107 (-ENOENT) Tile0: GT0: PAGEFAULT: Fault response: Unsuccessful
<6> [102.316934] xe 0000:00:02.0: [drm] Tile0: GT0: Engine memory CAT error [18]: class=rcs, logical_mask: 0x1, guc_id=3
<6> [102.316973] xe 0000:00:02.0: [drm] exec queue reset detected

>  			} else {
>  				xe_gt_stats_incr(pf.gt, XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT, 1);
>  				xe_gt_dbg(pf.gt, "Prefetch Fault response: Unsuccessful %pe\n",
> @@ -487,9 +487,9 @@ int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
>  			pf_queue->size;
>  		queue_work(xe->usm.pf_wq, &pf_queue->worker);
>  	} else {
> -		drm_warn(&xe->drm,
> -			 "PageFault Queue (%d) full, shouldn't be possible\n",
> -			 pf->consumer.asid % XE_PAGEFAULT_QUEUE_COUNT);
> +		xe_log_err(xe, PAGEFAULT, -ENOSPC,
> +			   "Queue (%d) full, shouldn't be possible\n",
> +			   pf->consumer.asid % XE_PAGEFAULT_QUEUE_COUNT);
>  	}
>  	spin_unlock_irqrestore(&pf_queue->lock, flags);
>  

