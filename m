Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A5DC71136
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 21:22:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E330E10E445;
	Mon, 16 Jun 2025 21:22:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N3q+GLuG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4188910E445
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 21:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750108932; x=1781644932;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ogjSeiW7ILjsDni7AKjWVlyu6hz+SghK+/WQQBQ3pzs=;
 b=N3q+GLuGK1hhMrX1BlDAa1VuRZpovHSkdoIlE7EZEKmNQmBJbYyRAVna
 d9YhW+UL8RYBxIdK3LVTV+YuhzOfRf5e+uzL/duOO91e+Ou0FvnerVa+S
 I63TcigIGA2RrMqUyTMBjPByQIvqrKSQjRi88jOgmd//3YTxj2ioUFAix
 sX/huehEhCo8H7dei5hhELylUIHFL6RPaH7Nz7mYrxRBzmdnXpZQ3kLX+
 AwD9yCe1h8bbK8NXkEkEv7B6vATO7hh5gG7ZW/5QJAlcaqZcgQ0apxJxP
 nYWaZ6tK4CBVv3cQo3bQyKwgEuZCC/2LNk47jIVQe9h/ZlbK4eAGejb/W w==;
X-CSE-ConnectionGUID: W8eJZDS6Tae4F7R0Ov3AzA==
X-CSE-MsgGUID: bmxVMpGyQZ6cQ1g1c1SKxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52179988"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="52179988"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 14:22:11 -0700
X-CSE-ConnectionGUID: UmuOYZW0QUyEHkrrjJJlUQ==
X-CSE-MsgGUID: v22TF7cmRz+H7XWxMcqcPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="149043127"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 14:22:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 14:22:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 14:22:10 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.85)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 14:22:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KeJWn+vge3FDy95PgbAkzJ8Eocxb8lGJ0J0afHlFzi017PMqpngDYXDZlIQtdONfYoeSNTksll5LBakJXLlCLqn3fXuWcySaFxWeE9YUJpTAWRN03hNcRfyvx2AYBx4JocYXt2VoYM/PkgTqXEh6SDBvSj5iOKXjs0npIMDtVJwVdaAmoNVDoOqsdmyCxFK8EpY6olRIcgKahCxVb/kEb3UpobZrOXgFsaNXSj0NN2hbPZ72lqaLnGPhzqZeaAmjSlbRTRbBEURbqpgNiV18FLbBq1PtnVWDlnqcFDXfFhiLThJeYgFvHjbOL5KObMOk1tXnxgA9x4OhstfaYtYgvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1amSLt+TEAYhg10HN2SinHfjPi0X455rsXJN15CJj+c=;
 b=gRuh7Nqw2+SJRNikR9CGDtEksRTLnJhfZdSEWYbVzE5G98KRVHg4Eo74lWO+8OXXmDG55xguI9OdJsmDQIcAXtsUREfK6Ac8lVB9qGSvHjxibNJIKRiYyVojXtx5e/qhottUJCCRYy7pdKceEoYKpCJPlD2rHFWMzaOrFxDYLpyrxYNpH5yjUmw/CQhsmmrTA1i1paAVMdz7N1sGZEaSUP6X/QKIJLmIiGUFKNZzPhsJyBpnKD9SSR0w9u7TvekviLcVKAgLJ5vTf9ushIQ//3/YOOc/fF6oTA/nfxBUCmaxj7uEOMVtpM2jIKZZdSF+cPYSAAGOlS+fAU896i+vFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB8473.namprd11.prod.outlook.com (2603:10b6:806:3a7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Mon, 16 Jun
 2025 21:21:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8835.018; Mon, 16 Jun 2025
 21:21:54 +0000
Date: Mon, 16 Jun 2025 16:21:44 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 "Stuart Summers" <stuart.summers@intel.com>
Subject: Re: [PATCH v4 3/3] drm/xe/bmg: Update Wa_22019338487
Message-ID: <cho52ljh2t3eunu4itytn746xbsd7fp7ozliwjnjgjw7blfsyj@bmrricwl5sfm>
References: <20250615-wa-22019338487-v4-0-704830697cbc@intel.com>
 <20250615-wa-22019338487-v4-3-704830697cbc@intel.com>
 <aFAsPdQ8EsSdNUu0@intel.com>
 <mgbewtrfxkkqsejrylhjse4mr4eizcaipxiyl2vs4f4rhz3ium@dzsp52dzoy5r>
 <aFCAJADgm7teI-XD@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aFCAJADgm7teI-XD@intel.com>
X-ClientProxiedBy: ROAP284CA0208.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:10:2d::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB8473:EE_
X-MS-Office365-Filtering-Correlation-Id: ad891471-5fc1-4350-b68a-08ddad1bd114
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HXoPzDSRwi9kGARHV9Z5U0mXGOQh/qAed7oEcpuyrAc5dkpfCBi//Z/vkxY4?=
 =?us-ascii?Q?5Pr7PgKVo42XwcZQfLtBv85l8WE/t19EHX44RMbM6/wACB74eHy9jKJouJMq?=
 =?us-ascii?Q?DKAsV1inpT1zIZAkPSIVOKcHv7ndJr6wwgnXNdeBWBKDBDt5mqAdPI3ERijr?=
 =?us-ascii?Q?rDqq1Ta5brRfXSCrVybdBQJAcxsTJNXWEN2lfEEg+UhA9PAobz4OE7+TOewB?=
 =?us-ascii?Q?ycbVdNHEsruVp64ivWS+VeChj/6WNVq1q/J/1hFD4WbxSE/XZct82MQp1FM6?=
 =?us-ascii?Q?cQGFYUKovURq2oK0AdzZWt3XWnEhcqQsTZWT/JzjGDcw6c1yliyFW/gpaq52?=
 =?us-ascii?Q?Cap/HelYfpYh8r8bSne9jiIQ77D6BksnkR9I1MA8ESO+hJoP5Dl9ZMfbRE5L?=
 =?us-ascii?Q?MRlc1OzJV9sjOyGn8YGl4A/8h7pxWlrAQ7xU8cdWnJaO1tx6B3cuKVTp5MFw?=
 =?us-ascii?Q?uRovOg/PLD84iHUwYWSGxuTzFtP/tz7TSwEGL/nvfXvI1m2oMFZMViheB5vv?=
 =?us-ascii?Q?ECq7QVesW+E12E17mTtCC6t9rkhRRqges0GCJOAf6Yi1SM2DbVDsbkmpO+SF?=
 =?us-ascii?Q?ZehZwqMNkLJJb0r2MTi3OAZFRY0u3aNgigKbxh1+ycBGC8Af84nJ8yHdaSqc?=
 =?us-ascii?Q?ShTZ3NPofMQjP1gPJJJWwArk1Dr9gxvFejUcTMXMlyUyxCrHH8wgB1giXhoZ?=
 =?us-ascii?Q?ubNr1eejhhZRIZCrId2liGoQEAfWllpdh4u6k446fHUgHM1HRyfz28V+ry0r?=
 =?us-ascii?Q?sGYsipuS16dTYQcyj2XhIIXVjmGCtUc5kf0HEzbly2k7aJ1C8XEZLNwOZVqn?=
 =?us-ascii?Q?WyMAPyGj9p3FjDpA9o4CBt9hOyM1KQ7305V9n/Uv4bixROdTyvxPdRmHboK8?=
 =?us-ascii?Q?wVMRrDm2IvnsAhKPW2OEBscb1DrcxkBQYcAlkR9A63QqjStnn712jhVj9ofA?=
 =?us-ascii?Q?slwFVUZ20/CaZcsn8uQ+d6pa2wtgPjui8bdg8gCMflyN+hyFZQLu1glS0htH?=
 =?us-ascii?Q?9SAqq5yJFrpl7SDaMkCoU9mIGMK9Qd+QLBOVyum+S7TlIhGr2LCDWkmdOX8a?=
 =?us-ascii?Q?gLICccMinJwUiEPHyqYKPj1jwXBjOG7/pVH0mQgofHRo/vjQVeKtD2q8+eaF?=
 =?us-ascii?Q?GBMR0522wzpvoJKp8M+k7euXSnCeIkL9eb5yHwpsQEOmrcqtvdfAxTPRDPx4?=
 =?us-ascii?Q?UCzdYveSDA87+xFMgFweV3acG1zu0K90ZffV01ipf2d92yjxPGpDMyIiuNHd?=
 =?us-ascii?Q?+mBo1pp+yUq98vqzZapGS4scsEsKK5/L0gbHp2rf0HVD5HkAfyJHwVUYKjM+?=
 =?us-ascii?Q?MKLUiCyHbWBJVAyQHAwWNUsAJ6BtYyoSttUw1Vq4MfupqyjfHvNMbAset89k?=
 =?us-ascii?Q?FwfYh/Iq8Qg3M30lv+FwdDhLBzDZwqr2gI6StN0MtzK9e/OPWrzQHnHesWBQ?=
 =?us-ascii?Q?frylbfcn8tI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E61GC77svl/xJbgcRg1Sx6eQSpXjDI2LupFyKHdwud/s6BfjcJJ2M7nkQ24s?=
 =?us-ascii?Q?I/5QIahL69Sm+Fg7apN7KnGGWBu49jPncEL4JZVx/QOMkTktjBheTUfpgQfO?=
 =?us-ascii?Q?tEkUYkwiY1ti9CD2qZSVSEVFsFG9vcOyUDdbYO6rrHvbONcjOhmy0jiDFLiC?=
 =?us-ascii?Q?nxFDOHiofbiLrhlgXvmKeCTRD9CwAzbcv4CipOiiDNZ7u6SH1g/QSY1klbaL?=
 =?us-ascii?Q?iDgREllykMK4zSLQOG0kancXGXrM+F0ZHS4uhllR7IXq87dHLgsDvnhJUd0M?=
 =?us-ascii?Q?v6J6IBvGXiKks8uRi3O44VHmZR58A6/zTtiBIxeG0S9kKYtDNv3G5BdLl8r7?=
 =?us-ascii?Q?yQloWfC9xI6N6IzuIOom9pVRZNmeyLK0fB0ho4MHTnvsi2O9xeBwxJpZUbn9?=
 =?us-ascii?Q?RsOlKySgolxStxpcautTArIDmTm8dDoaxlIsTlZheEYR2p+zGdyAmg6iCs3X?=
 =?us-ascii?Q?8rLwpb12pN9cGPSm7pKmcYD1uMrTQwGPdHwllBjL5s6R2OJAEX1PE/cIjTS2?=
 =?us-ascii?Q?pBolfH0OzaIplnDO1EHr+M05UNr896nmTP6TN5eqxk8aNQME1s1yA+HkZeqy?=
 =?us-ascii?Q?LlBfnWfBafFwrw04oD/wvkNsLIWZk7irnQHi2WlPwxgAWiVQdmljHCL35M0Y?=
 =?us-ascii?Q?ynQ396kTHn3CtuWbdweTqmTiU0VvGeH+zRQOE1fYVn3blC1h6PMyy1MdddlK?=
 =?us-ascii?Q?RInZPQe/qIg3BTfru/ZXdNnbVi3Hfn4VkLzvok4e3g+QGF7im8DWCxAGUNKx?=
 =?us-ascii?Q?wnT9F3nHuhjrF9id7jhIRHqfXwYIp99qQHK9y7HMKb5nW8Bs5EUKfnGhNSv7?=
 =?us-ascii?Q?AIUCv/JQ3Ux3ZfFkiLsTaboyrizZIwm8jZHTpjUpHXEUTT5Jl0gRa1LD6Tav?=
 =?us-ascii?Q?z12ZwTEr4N2iK7jMSuxScy1tBmFmDhci03l7NIbzUlk5l6cBy57mdZTqVeP7?=
 =?us-ascii?Q?dQr/KeOcVeoesfVAtNYV+rW1Mx9M0JDHW6WC1rNwHarUgZJC6qtOE/2zoVIZ?=
 =?us-ascii?Q?glUGZpUdhbwdvqrxKWBgkbxfhNWiyDaNNDMgvmpysnNfHhlgGtc6iW2pqQoK?=
 =?us-ascii?Q?sWUcUPdc5FDEhNm7y4tfdfShaoEq+aJjz0OSdTglAR6syP5+HLMGuLDHEltn?=
 =?us-ascii?Q?7pLcIU/7vwnvnWCEHlH201ClK00T6sic24hk4EFXMW4bmydtzvCLEtiFTye5?=
 =?us-ascii?Q?FgcCG6t6faw/AYBFedwvXPEq+DfkPX+3E/yj1loNFa3XLVf1QrYcM/Qvw8Jv?=
 =?us-ascii?Q?BIjUvncPvkIi+eoLfrhdzg15MlZgasexNBYMq/ZhpjLydVSTisBNYw8AmqZh?=
 =?us-ascii?Q?GooZfJ/gbpAQoIjpKFKMEr3sSDnQyXi9KMij0co3eBNfwX/UWYpJTd7i0lm/?=
 =?us-ascii?Q?KFlFoT57ESiV+vMR3Que+SljTLGM97XC81p/3pO2b08xUZRbUgUinZKNDz1C?=
 =?us-ascii?Q?Bvw9nTVLv8GvXNJVpwJgfD2Qm14/YSsGiQ+nK1MX/t1QDydPM/Hbb8r01Wiu?=
 =?us-ascii?Q?Ofdq1nGcRln4TYrAq7LPYoIq7UmwI0Weszb6T7RKD0Xq6fZUNl2TzVJ+hM1f?=
 =?us-ascii?Q?IVIoKwTDzHWm7KYrqPnI9PSRZHs9ZUgh2zKQ9c6vhu69EhVMv3mg1b6BtQNt?=
 =?us-ascii?Q?/A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad891471-5fc1-4350-b68a-08ddad1bd114
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 21:21:54.2645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Fycc7u67NKaPgkOE+4B66crYOw0WbgTHtzfoO9ZqSFZalwlFjK4QJsuBcPONPVRzcAMTFx3luuI2r5x7XxdNvm+uhWDbSSWv9myYUYqttY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8473
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

On Mon, Jun 16, 2025 at 04:35:48PM -0400, Rodrigo Vivi wrote:
>On Mon, Jun 16, 2025 at 10:38:34AM -0500, Lucas De Marchi wrote:
>> On Mon, Jun 16, 2025 at 10:37:49AM -0400, Rodrigo Vivi wrote:
>> > On Sun, Jun 15, 2025 at 11:17:36PM -0700, Lucas De Marchi wrote:
>> > > From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> > >
>> > > Limit GT max frequency to 2600Mhz during the L2 flush. Also, ensure
>> > > GT actual frequency is limited to that value before performing the
>> > > cache flush.
>> > >
>> > > v2: Use generic names, ensure user set max frequency requests wait
>> > > for flush to complete (Rodrigo)
>> > > v3:
>> > >  - User requests wait via wait_var_event_timeout (Lucas)
>> > >  - Close races on flush + user requests (Lucas)
>> > >  - Fix xe_guc_pc_remove_flush_freq_limit() being called on last gt
>> > >    rather than root gt (Lucas)
>> > >
>> > > Fixes: aaa08078e725 ("drm/xe/bmg: Apply Wa_22019338487")
>> > > Fixes: 01570b446939 ("drm/xe/bmg: implement Wa_16023588340")
>> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> > > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > > ---
>> > >  drivers/gpu/drm/xe/xe_device.c       |  13 +++-
>> > >  drivers/gpu/drm/xe/xe_guc_pc.c       | 125 +++++++++++++++++++++++++++++++++++
>> > >  drivers/gpu/drm/xe/xe_guc_pc.h       |   2 +
>> > >  drivers/gpu/drm/xe/xe_guc_pc_types.h |   2 +
>> > >  4 files changed, 139 insertions(+), 3 deletions(-)
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> > > index 7e87344943cdf..6ff373ad0a965 100644
>> > > --- a/drivers/gpu/drm/xe/xe_device.c
>> > > +++ b/drivers/gpu/drm/xe/xe_device.c
>> > > @@ -40,6 +40,7 @@
>> > >  #include "xe_gt_printk.h"
>> > >  #include "xe_gt_sriov_vf.h"
>> > >  #include "xe_guc.h"
>> > > +#include "xe_guc_pc.h"
>> > >  #include "xe_hw_engine_group.h"
>> > >  #include "xe_hwmon.h"
>> > >  #include "xe_irq.h"
>> > > @@ -1001,16 +1002,19 @@ void xe_device_wmb(struct xe_device *xe)
>> > >   */
>> > >  void xe_device_td_flush(struct xe_device *xe)
>> > >  {
>> > > -	struct xe_gt *gt;
>> > > +	struct xe_gt *gt, *root_gt;
>> > >  	unsigned int fw_ref;
>> > >  	u8 id;
>> > >
>> > >  	if (!IS_DGFX(xe) || GRAPHICS_VER(xe) < 20)
>> > >  		return;
>> > >
>> > > -	if (XE_WA(xe_root_mmio_gt(xe), 16023588340)) {
>> > > +	root_gt = xe_root_mmio_gt(xe);
>> > > +	xe_guc_pc_apply_flush_freq_limit(&root_gt->uc.guc.pc);
>> > > +
>> > > +	if (XE_WA(root_gt, 16023588340)) {
>> > >  		xe_device_l2_flush(xe);
>> > > -		return;
>> > > +		goto done;
>> > >  	}
>> > >
>> > >  	for_each_gt(gt, xe, id) {
>> > > @@ -1035,6 +1039,9 @@ void xe_device_td_flush(struct xe_device *xe)
>> > >
>> > >  		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> > >  	}
>> > > +
>> > > +done:
>> > > +	xe_guc_pc_remove_flush_freq_limit(&root_gt->uc.guc.pc);
>> > >  }
>> > >
>> > >  void xe_device_l2_flush(struct xe_device *xe)
>> > > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> > > index d449eb0e3e8af..eab932655b2fb 100644
>> > > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> > > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> > > @@ -7,7 +7,9 @@
>> > >
>> > >  #include <linux/cleanup.h>
>> > >  #include <linux/delay.h>
>> > > +#include <linux/jiffies.h>
>> > >  #include <linux/ktime.h>
>> > > +#include <linux/wait_bit.h>
>> > >
>> > >  #include <drm/drm_managed.h>
>> > >  #include <drm/drm_print.h>
>> > > @@ -53,9 +55,11 @@
>> > >  #define LNL_MERT_FREQ_CAP	800
>> > >  #define BMG_MERT_FREQ_CAP	2133
>> > >  #define BMG_MIN_FREQ		1200
>> > > +#define BMG_MERT_FLUSH_FREQ_CAP	2600
>> > >
>> > >  #define SLPC_RESET_TIMEOUT_MS 5 /* roughly 5ms, but no need for precision */
>> > >  #define SLPC_RESET_EXTENDED_TIMEOUT_MS 1000 /* To be used only at pc_start */
>> > > +#define SLPC_ACT_FREQ_TIMEOUT_MS 100
>> > >
>> > >  /**
>> > >   * DOC: GuC Power Conservation (PC)
>> > > @@ -143,6 +147,36 @@ static int wait_for_pc_state(struct xe_guc_pc *pc,
>> > >  	return -ETIMEDOUT;
>> > >  }
>> > >
>> > > +static int wait_for_flush_complete(struct xe_guc_pc *pc)
>> > > +{
>> > > +	const unsigned long timeout = msecs_to_jiffies(30);
>> > > +
>> > > +	if (!wait_var_event_timeout(&pc->flush_freq_limit,
>> > > +				    !atomic_read(&pc->flush_freq_limit),
>> > > +				    timeout))
>> > > +		return -ETIMEDOUT;
>> > > +
>> > > +	return 0;
>> > > +}
>> > > +
>> > > +static int wait_for_act_freq_limit(struct xe_guc_pc *pc, u32 freq)
>> >
>> > for a moment, the name of this function got me confused. I thought
>> > it was going to wait for the *exact* act freq, and then it would be
>> > risky because we can never know what PCODE will decide on extra
>> > throttles.
>> >
>> > But I don't have a suggestion for a better naming and reading the
>> > rest of the code showed it is doing things correctly.
>> >
>> > There's a risk though... if for some reason PCODE decides to keep
>> > freq high for a longer time... but likely unreal for this platform.
>> >
>> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>
>> thanks... I will take a look in CI later today and think if we have
>> another better name or error handling.
>>
>> While we are here, a couple improvements I noticed while doing the
>> changes; see below.
>>
>> >
>> > > +{
>> > > +	int timeout_us = SLPC_ACT_FREQ_TIMEOUT_MS * USEC_PER_MSEC;
>> > > +	int slept, wait = 10;
>> > > +
>> > > +	for (slept = 0; slept < timeout_us;) {
>> > > +		if (xe_guc_pc_get_act_freq(pc) <= freq)
>> > > +			return 0;
>> > > +
>> > > +		usleep_range(wait, wait << 1);
>> > > +		slept += wait;
>> > > +		wait <<= 1;
>> > > +		if (slept + wait > timeout_us)
>> > > +			wait = timeout_us - slept;
>> > > +	}
>>
>> 1) wait functions
>>
>> except from the call xe_guc_pc_get_act_freq(), this is a copy and paste
>> from the other wait function in this same file.
>> wait_for_flush_complete() was also a copy and paste and I moved it to
>> wait_var_event_timeout(), which is a better synchronization than what
>> this is doing.
>>
>> All these functions to wait until a timeout are wrong: usleep_range()
>> will sleep for anything between the 2 values and we are simply using the
>> wait variable to decide on next sleep value. Worst case scenario, even
>> if unlikely, we will wait for log2(timeout_us) * timeout_us.
>>
>> The xe_mmio_wait* get the wait checks right. I think we need another
>> function for the proper abstraction for that. Previously we decided
>> against because:
>>
>> 	a) this is the poorest synchronization method and it tends to be
>> 	abused (see the preivous version of wait_for_flush_complete())
>> 	b) adding such a thing in xe_helpers.h/xe_utils.h opens the
>> 	door for things for doing other things there that should rather
>> 	be using proper kernel infra
>> 	c) previous attempts added that in xe_mmio or a new xe_utils.h
>> 	and neither of them are good locations.
>>
>> Proposal: xe_wait_for_cond() in xe_device.c. We should document when
>> it could be valid to use it: it's not a synchronization between 2
>> CPU threads but rather between GPU-FW-CPU; it doesn't fit the
>> xe_mmio_wait* because it needs to do things other than read and check
>> mmio value; and there's no other core kernel synchronization that can be
>> used. Then we migrate wait_for_act_freq_limit() and wait_for_pc_state()
>> to use it.
>
>ack on this. But it could be a follow up right?!

yes, follow up. I don't want to make this depend on refactors like that.

>
>>
>> 2) interaction with user requests
>>
>> I kept the logic implemented on earlier versions, just changing how we
>> are waiting on it to complete. However, should userspace really wait?
>> Why not just update the stashed value that will be later flushed?
>> This way, if there are multitple requests they don't all keep waiting
>> and applying a random value depending on what thread was woken up first.
>> For example, with thread number also meaning the execution order:
>>
>> freq_limit == xe_guc_pc_apply_flush_freq_limit()
>> set_max == xe_guc_pc_set_max_freq()
>>
>> T0				t1	t2	t3	t4
>>
>> xe_device_td_flush() {
>>
>> 	freq_limit
>> 				set_max
>> 					set_max
>> 						set_max
>> 							set_max
>> 	freq_flush
>>
>> Here all of t1, t2, t3, t4 are waiting on freq_flush from t0. The end
>> value will be whatever ordee threads are woken up later. I think that if
>> we change the implementation to simply set the stashed value, it will be
>> simpler (no need for wait) and better: the value is ultimately set in
>> freq_flush() and is always the last value.
>
>We could try, but I'm afraid that this will break our IGT test cases
>badly. Because when we read back what we just requested, we want to
>see the value applied.
>
>Or we will open the can of warms of the soft_freq design that i915
>has and all the confusions it brings...

ack. I will take a look later.

Thanks
Lucas De Marchi
