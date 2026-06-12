Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2698CCD98CE
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 21:43:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C550310E110;
	Fri, 12 Jun 2026 21:43:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L44q8mcS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE93510E110
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 21:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781300600; x=1812836600;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zHjb5sLs5kPtz/3y24pCcEVO4I/oy2mAtDCoq6Tt/A4=;
 b=L44q8mcSKkWWVRnmbIMqrg11zbjaNtKYhDGAfRR7LpDSRd06J7D28m0j
 VQmlgLiLqsl2xGDfloRjRa+whe+ubfOW1fab1S8Nqq1SXLMTVcAPOhtkL
 DAaywfFdbvFpJRYymNLa+OeH86yMyFZGraqs1Hg4dX61b/H4pntkB92CC
 nXfhDFv/ioGZ9gBM3VIpl7SfX/mdPsczRwekU2GPwWx/hKJafdW4mk8p8
 Ye8fV4iYXQu+gEbZJ48HvIo7f4u6W/wpvc1v8F7Gm7ccSjx3yMzJf0RlX
 PzAhEaohCNs5HpuHO82VPecqHqlXRhwSzUl7muHb0GkEg1nGtWUDYMSpX g==;
X-CSE-ConnectionGUID: pbYJZJD+TVyo8Zibcd3WWw==
X-CSE-MsgGUID: qz/g8QWhTVKxVevJ/d0+CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="85985587"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="85985587"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 14:43:19 -0700
X-CSE-ConnectionGUID: 7GH89tJMRLqAkuKWrvJEqQ==
X-CSE-MsgGUID: We7E8h/DQPq23fWuuWV6WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="250840220"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 14:43:20 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 14:43:18 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 14:43:18 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.8) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 14:43:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ht7dQG7n+1ozhYinq3oucFnj13jHc/YDFWoqhVDBmRgJHkwx/dotxoqzaY0yR70WcuNXdSGHWnxW8ZvJP7L52iwAhud02V800eJkyka8F8XcaCyX174Tl7oBgLi4eeU/rT/CR9Eie30AeTXdwC65EuZucvE0KzKTlupXLV0ZVLsFX9bAQFtzQoBGzN9213cPojYnaZe0aXN6VvEBi8vpB7bWQltuQkGL/f1PgJOY6KiAJvwI1siIkvF5NS+caCjNDy+QoheBjEoHgWv4N8M/8YohhboRupsGSrBh2Jhb/4S52GLTUFRfXkm/wZCZ4iko0cacdkIgTINQSWOg8p4CnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eePT1+Dst2QG+s48ENQLZ44qjmSec+LYLPDO1yIutgM=;
 b=xKAZMHNB8lZzGz4zOPx/eSNp9AvesVhAbw7g1x0RNGBqQlRoQWp8nu2g7Nk1o0RB2Unu9rTvWa4KGFwgTGmT9uE/6/D2dK78AvuJNOsxd4UXKALvqxZmt8JKPWuq8iTSK6VUotynIHDZiyaTy1FAF3Ev9mPdplyC4XOcDhaMBCvwB8JEOb8DErbp4qFAY8WAzfBGPQ2BFrP0FP3sNQv4JzviKVddttELjA0vzU+sCWPsdCQDd74PamjabWzR7QBAbjA7qiZSiaxhb5EW9P6vX27e58379wDTO1tjqlZlYSCdr1lAuX8DmcuVmoctYqArfuUqmumhtDaf+qd7IPz/9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CY8PR11MB7290.namprd11.prod.outlook.com (2603:10b6:930:9a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Fri, 12 Jun
 2026 21:43:16 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 21:43:16 +0000
Date: Fri, 12 Jun 2026 14:43:14 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 4/9] drm/xe/rtp: Generalize whitelist_apply_to_hwe
Message-ID: <aix9cmxbfUBaUfRZ@soc-5CG1426VCC.clients.intel.com>
References: <20260608223624.3711760-1-ashutosh.dixit@intel.com>
 <20260608223624.3711760-5-ashutosh.dixit@intel.com>
 <aixdtFtj9IwnVsQE@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <aixdtFtj9IwnVsQE@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: MW4PR03CA0191.namprd03.prod.outlook.com
 (2603:10b6:303:b8::16) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CY8PR11MB7290:EE_
X-MS-Office365-Filtering-Correlation-Id: bc6a757a-b51a-441e-f90e-08dec8cb9cb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: XYDdvUpPGJ00QziFTrDlcJJAnVmXWupW0CI91+pJ1MnBWAK8s7y6xveSNjP7+M9fJ3h1cxlWRaNz0HCHvAP90CdbwHVVXJ2+l/VIH9SwYCy8wehmEJD2ZbHqx2q6gzPPO3yQzwVUcJXk3cje+ks5G2I/1hETAOs9wqGqNbCX3XYr0S61MGoEuEyCrCR5rCsSDnu4yfsk5gPTaNySX/3PDKQempiZUVwGrBr1RW1Kvjq/sFUtjF/ccCH8hP8XRcNMN9Xl7ArSBZwpyQijyBvKHcvJ+XYAply1opD1prWUBTbBHE5HlKprfjvzIgehi6w3zlCSy0LV3EFDxtyyIynuOmkCiKVyRmlCLNd4hn/+ybFaxdhtcYFcXj74xlXDiK2W9wRoU77watD7RA2aYKgJD9on2U4qvoR3XAU/JwaFQLPPfrpml2QmSlq8B3Yp5yDWkGTpMf+5saka0mi4mqSEOsk43gjGZ/w3huOdc5qZxAMHu/2+sudeB9f6Q0F8HYg3vwsUve/XLo9TtP+AqeDFRq3nwGACTtw+FRzVHe/0qboAGbrdPrzDWx0469KLv4ccewVY3AabmA/u/2R5FtoGbA3VUocgWP2dT413fmVNHP/2ltwfHPBXXXdKa9C/v/v+QBfXMTuvvuX+4Jh9e1HLdp8oHRXC6YF68SaMIhm4zsIITSNlCXVG4ggtOd2uwUOx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dW41Z0VwaFRjSVZaR05QWVZSWEVNYkIweFRjVWNHdDNTYTlIOWxOaW44dHd4?=
 =?utf-8?B?blkxZjNCTDF5bU9ZRHJ5aWxmbTJuZSt2QVAzaHVCM2dkNCtrR0oyZDl4c2pQ?=
 =?utf-8?B?MmFwRFo2VFRBYWxrM1F2YXBjRDFaM0RaWkh6RjJheUJyWVFvNThsTEZMejNI?=
 =?utf-8?B?MFhNNHJPNUgrUTRXemZIL2owSnQxSWovRjlFMWRKWEZwbVdReXhJdS9Ba1F0?=
 =?utf-8?B?T1hHa2hoSzR4c01zVFVEQTg5V0Y4L1owbXhKaVJQeGRKWlpIdlpXMHhVZHFP?=
 =?utf-8?B?WGF3RytOVTIybGk5aHZoVGF1eklSTy9hNjhrZ0YyKzVqd2VYbzFYajRYa2gz?=
 =?utf-8?B?RXY0L2JzYTY3RU9SbzA2QXp4YVhkS2JRSmQ2TzF1L1RvVGZPeWVBcFpsQjYx?=
 =?utf-8?B?cEk1RjhPb0RJclQ2dEFWc0ZtSWt5ZGRsZ25sOXoyTmJKZ1ovbW5CY1ZCRW92?=
 =?utf-8?B?QXdPQy9SM2NBbEdTYXNpRFdsZVp1RXVjMWtIVCt6NDY2Q3Bqc1dhM1NteXBk?=
 =?utf-8?B?ZXE2SjRMeTMra2tDNU5jK0tacXZDR29OMnZ6YVVFSHNNMHhtOW1YUkFnT0pO?=
 =?utf-8?B?R09rUWxEVkpzMkxvNTd1a3VUdytleXVvM3FtMCtsaTdMenkyRUEzNXZPazlC?=
 =?utf-8?B?WkhIZFl2NWJsOE5iNTU1Sk10Snl4UTc3ZktiVnJwT3JRcE5aNGVrYnZrWks2?=
 =?utf-8?B?UnB5OTNkSDZmZmdPQmpNc0N6cm1DczdWNkdMdjFqRXB3VllnTGQ5eUM3QkRL?=
 =?utf-8?B?WGdhSGVDYVlsTGViNGVnay9idDBpSzVMdXk2dThHZU0zVE03Kyt6a2tEUllG?=
 =?utf-8?B?ai9ORGh0RXpoNDdpVVVuTE1PWkFvZ0VRaElGVG1ZMDQ0Vy9nZ3lyZkJUNUE4?=
 =?utf-8?B?eldXTXRuYUh1cmZVaExEWnNwTFBUYkJucWZxUTFxSm1kY0J1ejFUczdEcDhO?=
 =?utf-8?B?cGl5cjVPSGY3UkFFelFqSWJVdFBOUjJOVndTTTdIOU9acElpWDJtam1lVVNs?=
 =?utf-8?B?bUZKdWRVeS94c1RKZWlrZ2JuLzZOUHlnTHcvSG1XS2hUMTAyZ1lqSkZtaGp0?=
 =?utf-8?B?VGVsZ1I4UGRIaE9UOXBuN3lGeVF2S3hxT2ZQOGFEUTBJb1lFcHY1c29MNGwv?=
 =?utf-8?B?UlBTY0g4aVBpUEZ6S1FVcmVHcWxzWDVZWGhEa2M2ekpWTTRUUG4xZnEwTFRC?=
 =?utf-8?B?bWN1TXNSTG9DWmNaVzNtczFybDNRUEhvTmRDRVh2M3JKOGZoYXg2N1JjNHBx?=
 =?utf-8?B?UnQyZUMwdzFDYk11dUJFS3JVcVkvakFtYzlFRkkwS0FmVzFGNUNmWWw4dXF0?=
 =?utf-8?B?cjY3STZnMmVuamN3aDFrZTRHSkJFM0Y0cHVxY2t3ay9DU2lOdU1qQUpqMy9p?=
 =?utf-8?B?TXNXb2sxdFJQMnVtekdaazNIdnlDTXIxZ2NsM2hyak00ZHB4Q0NzYlorMU13?=
 =?utf-8?B?bGVwajExNnAxVnRFejlkYmNKU2lhT2ZNMUlKQlBiU2Uvd2N0dDc1YjV6UTVz?=
 =?utf-8?B?bEdiaXlXUW01VXJkY1JSdzJJeS9ORjE3ZmRNVDNla3BZdW5oLzhMRm9udFlM?=
 =?utf-8?B?djQvOXJvdXZ5RENIdnVmQTFycGg2dFlBbmdORm10UjNtWjlKMmdWUzBwcy9h?=
 =?utf-8?B?RkhJRUdYYjM2Y2JhQ1hiekY4Q3JLalVzM2Z5R2J2NnBzMy9WNW5xT1hzY1h6?=
 =?utf-8?B?WjNESm1JajEwcW03S2J1b1J6eFFSRVNmK04zZDZEcU80V1VEQmw5SlhiTnlt?=
 =?utf-8?B?Y2M4eW9EM1EvS0dQZ3Iwak1LYVlQdEY5VnAwWmhvOEdCbFh5M0UxUW92di81?=
 =?utf-8?B?eEpnRnNZUkd2cXdiUHFnaFdzWXI1a0s2dytzR2FEUURrTldFNVRsR1p6SjVw?=
 =?utf-8?B?Y0dMTTkzbnYvK08xNVVzaG9PUVBEaWNybmJOODl2WFBabW5tUThjV3hYWk1X?=
 =?utf-8?B?Wk1uU2hmTEllMVR4TWtYNWJxa2ZwZkdkSVlwMXhWblRHYk40OUZlYU8xYkxm?=
 =?utf-8?B?SVhuaFlyQkF3ZGZzMHNFZ2MzbGtjcEhCTU1QL2d0N0ZsUTZ6dDFxYzRrL0V3?=
 =?utf-8?B?alhXZHRFd1A4cXRYWGdPSzFhcXpQUmpDRzhKcXNhby9lTGJmV1FDSGxOWDRt?=
 =?utf-8?B?Ym1meExWa0FBY3BjZklhZElCeHM0Mm1LRGdreFowdFZkcGVwUE5tQUlPSXc1?=
 =?utf-8?B?MjBaUUw5c1NXekxhZHBGVS9kcDI5Zi9sL0RPeUdFOXZvcTZibG1TNEhRR1E3?=
 =?utf-8?B?SENuaW53NEZKa1BLa0pBVEpXbUJSbS95Q2ZISXFPT3dzMEUva2xLRHkvdzZR?=
 =?utf-8?B?NlRxT3lUWmM0Y3AxSzJ4T1k4a1Z6cWJ3K2hkNGYzdXVuYjNWRUZwaUt2TzVm?=
 =?utf-8?Q?kTI27bqUl3uYx+wM=3D?=
X-Exchange-RoutingPolicyChecked: A6Bpy6VMbMuTC0Y+xL9IqR3zyMtWd9+6JXkRaHJLNRAsKBv4go2dDU8YeKb0b/CBCtuBuY+7PN0pSnsACAyVixdkPmFUS8tKxJHEJCEWIdYwVUhfV3nkAGEJGVtHlpjDvcHzH5L2CkER6joa5bhF/thpyTQY9+6gyIa+tOE8NYxD6lt5C1K+zWVnH/7DO5X9NsKsxzPWv0ffk3XIhuUzW2KB+zqtGrDGjBtkdZhCVZJQjO76UGP5l+gsk5WBh2hywwi7aGn6/nGrpUbu4EnmigxAuDtZwXu/JyNb0RPr5BCbPgVEtjAvdoN3HkxdUY9bcPNzaNpEY2rExpyQsMyFlw==
X-MS-Exchange-CrossTenant-Network-Message-Id: bc6a757a-b51a-441e-f90e-08dec8cb9cb8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 21:43:16.7416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MSzirEqkogs/HrGcLoqKs3Aklz9hsKiw2y+0J36KTXuWmaem2E59S3tuTz2oWAoxUQlaOwgnLlR/fMWDLnhmmRJQHhojjxOUF1sGKllVV4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7290
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

On Fri, Jun 12, 2026 at 12:27:48PM -0700, Umesh Nerlige Ramappa wrote:
>On Mon, Jun 08, 2026 at 03:36:19PM -0700, Ashutosh Dixit wrote:
>>Generalize whitelist_apply_to_hwe to construct both non-OA and OA
>>whitelist nonpriv registers.
>>
>>v2: Rename slot_in arg of whitelist_apply_to_hwe to first_slot
>>
>>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>---
>>drivers/gpu/drm/xe/xe_reg_whitelist.c | 11 ++++++-----
>>1 file changed, 6 insertions(+), 5 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>index 571a8e6909422..0c01e289dc4bc 100644
>>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>>@@ -161,9 +161,10 @@ static const struct xe_rtp_table_sr oa_whitelist = XE_RTP_TABLE_SR(
>>	},
>>);
>>
>>-static int whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
>>+static int whitelist_apply_to_hwe(struct xe_hw_engine *hwe, struct xe_reg_sr *in,
>>+				  struct xe_reg_sr *out, int first_slot)
>
>Once you start using hwe->nonpriv_slot as commented in the previous 
>patch, the first_slot parameter can be dropped.

Ignore this ^.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>
>Umesh
>
>>{
>>-	struct xe_reg_sr *sr = &hwe->reg_whitelist;
>>+	struct xe_reg_sr *sr = in;
>>	struct xe_reg_sr_entry *entry;
>>	struct drm_printer p;
>>	unsigned long reg;
>>@@ -172,7 +173,7 @@ static int whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
>>	xe_gt_dbg(hwe->gt, "Add %s whitelist to engine\n", sr->name);
>>	p = xe_gt_dbg_printer(hwe->gt);
>>
>>-	slot = 0;
>>+	slot = first_slot;
>>	xa_for_each(&sr->xa, reg, entry) {
>>		struct xe_reg_sr_entry hwe_entry = {
>>			.reg = RING_FORCE_TO_NONPRIV(hwe->mmio_base, slot),
>>@@ -189,7 +190,7 @@ static int whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
>>		}
>>
>>		xe_reg_whitelist_print_entry(&p, 0, reg, entry);
>>-		xe_reg_sr_add(&hwe->reg_sr, &hwe_entry, hwe->gt);
>>+		xe_reg_sr_add(out, &hwe_entry, hwe->gt);
>>
>>		slot++;
>>	}
>>@@ -212,7 +213,7 @@ void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
>>	int first_oa_slot;
>>
>>	xe_rtp_process_to_sr(&ctx, &register_whitelist, &hwe->reg_whitelist, false);
>>-	first_oa_slot = whitelist_apply_to_hwe(hwe);
>>+	first_oa_slot = whitelist_apply_to_hwe(hwe, &hwe->reg_whitelist, &hwe->reg_sr, 0);
>>
>>	xe_rtp_process_to_sr(&ctx, &oa_whitelist, &hwe->oa_whitelist, false);
>>}
>>-- 
>>2.54.0
>>
