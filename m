Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCDCC02194
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 23:34:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 990D810E0B0;
	Thu,  6 Feb 2025 23:34:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Is8pvw+C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD2210E0B0
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 23:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738884864; x=1770420864;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WB4X7aJnb+ZI8kJHTuCLrW3ZgnGG72P21h0qcctlpyg=;
 b=Is8pvw+CvZHBYsToK3H/AV8Jol/RlgbXjBx0kAxihBXqLq3Bz1jCgsN0
 M2ghKUcY6YrJxDZuewl78rixBX2DcqvAubxzN7DgDVPFKvjIATu+3Od6z
 6LiaDQEX2NPzU+I1F0CZH5TOLNr2ht5j4Eag8J4ch9sQ/iXX0qfNyPXkq
 I2/yuQuv5RaocTtpcfe74leMybP20EbR2DwejDAeXl3Aj2HIQpdpQiard
 8GYpWRwhrofRF/wBzqBjxbS/IjNaj/P0fT5Ip64tRfnJlIGh6ktfI5qEf
 LjzU3bpQ/HwA4Eav3hDlMSPIOssU7/lAWNYUSq9+VIIngYL1OSyRYtlpT Q==;
X-CSE-ConnectionGUID: ihC+Ly0VTmy7P5t0Ayl/dg==
X-CSE-MsgGUID: 66p9bIeJReuoaTQeAuYpfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50948534"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50948534"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 15:34:23 -0800
X-CSE-ConnectionGUID: MjPIjtqoQAOsiK/pyk1rpA==
X-CSE-MsgGUID: Wb9cSTIfRhq0fgCSxW6tZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="111137950"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 15:34:23 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 15:34:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 15:34:15 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 15:34:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ICq5TUaWrYIIBdpr0Nj70s9ilEogRVm2WYGfJp1wAWYqK0xsCxfHhlMjoHehsjFTQG7+nDZPxwbZMt3IGVNsACo0SQNdjn2WiH2AFWQSWXl9pi9zUAkjEp5ljRVYxQkkeuGlqc2MZAgshY8w0g0g5NssRCcDD8sm7SmwD9ypRjxpjiBHcu9osNcmTHXkuBkZviDveZCkJXhx6hxFz/t3PeXQMNyFfw6fg9nvpWCmdTHijrIzM9td6n3Wgw7F6HvM2FrifxWlg3FUD2xcHOjLadb8i8StVf6vIcTioh0jeUkZzE+xP4Bn5GtjKfIYWyazLTKxcPBPl60hYHVwtQX2SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zv1s6yJLxcDR/pj3mvDl6g3zQTMosOkDrKCclo2aCxo=;
 b=YoyqKktWj931U6BWc98aD0Z3LH2XrMkBW2uNr9877/dX87Eyv5urPUBVeCERV6B2vqJ8+e5J2wCCQdBCLZsCTIG+eCYVMhOng6VC05cBqgap9pDkiXrh8TwbB3CoT1k1ysHuBJCnTENXGl0tb/MT8kw2UWi40cJRAxg/EAV9M+TMmRZNQz65wMVN/TRYMpDsVD8sikWKZN7FoSX8uUcj4qzf6FBRu6j8aPfmxg3mPVdnqcOY0Yn7BqLd2/J2+77W4Me0fzpTX773BXfWLODXBW07FfHesv6lcCTu1O+j0DJLc/6VS3lMZ+akAanRo6n25CQM2GMGVLDdDgcMtYWnmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4611.namprd11.prod.outlook.com (2603:10b6:5:2a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 23:33:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8398.021; Thu, 6 Feb 2025
 23:33:22 +0000
Date: Thu, 6 Feb 2025 17:33:18 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe/xe3: Extend wa_15015404425 for xe3
Message-ID: <k4s4hzkryw33v6iy77ippwfqpzgvarbey2ac4vaapue4glsonv@3jhaz6lteoaw>
References: <20250129005551.106214-1-matthew.s.atwood@intel.com>
 <20250130173030.GH4460@mdroper-desk1.amr.corp.intel.com>
 <Z6Ttkcj_XWatYkkF@msatwood-mobl>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Z6Ttkcj_XWatYkkF@msatwood-mobl>
X-ClientProxiedBy: MW4PR04CA0130.namprd04.prod.outlook.com
 (2603:10b6:303:84::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4611:EE_
X-MS-Office365-Filtering-Correlation-Id: a995a0a6-4543-41a8-04e2-08dd4706a55b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CcskSNGPKJ62N3sFbIC0D5b3itzuYIY6mZ56CElnu4QqdQpwrbub1BFNCBuL?=
 =?us-ascii?Q?64s/5izkWBKv47hhU5CPYq4Kv5FyV8xBVYAdPus2fZz+U8caMj1NkfZy12Ob?=
 =?us-ascii?Q?lN2oNfnWZO/yUC5BFqAiIVX9A9Xoxix6enHuBuj39GZWK2ccEP8CE48mSEtu?=
 =?us-ascii?Q?anFt3Z75e8imEwWGS4TYIqShLfjKP6pwfWG5bYknX72JoFeKKJN6f25AExF1?=
 =?us-ascii?Q?xEpTPM2p6wzs1YdH4zKt1RhCUvYq2soySt7cEhZU6DY+QdpcR5pGvsTxeIB/?=
 =?us-ascii?Q?zEf3HDHp5m+jBq/Rnjp5oJ5UeKgwQOsbV/hRJp5BOwms41d28HWhTyB977p1?=
 =?us-ascii?Q?zyomO4Vv1fLLpyJNeJKbyezj+Wa7twuHCYOEv4W8xUuBIHjZYXI/NE2lGKmq?=
 =?us-ascii?Q?ve7/YyKYl043ETWtEEqpUxDRRnWzGIGtsvCI7xw5zlS/zhpB3fKLZTasXw7K?=
 =?us-ascii?Q?3Y3gjyaaOObkbgQvrGzfetYq1dVNNIdixjDHDTmQMj5AuDA9tymQeFalxifM?=
 =?us-ascii?Q?KVmnwALPKjHIEJOObAAuaqYe4wG9JwvT224tTxWn0f6NuqK9m2ZY8zwnqXGp?=
 =?us-ascii?Q?U8u3cKRPkkEMTKr2Pdk7F/mnNNfpulosjp9ulor7HtKUyyQ9JF0OMaZEY33U?=
 =?us-ascii?Q?SMEW4ZSftMH1Xwh3a68X8XJt3bl+mn2elQ4YQnuniVKC3ql57PcUPrj2Riqf?=
 =?us-ascii?Q?jnUAFnZ+BIHxYlFx7mXWTv2lQVXKtmVP9dL3JyJCuvRrKvSbrfT7S+UshEiB?=
 =?us-ascii?Q?ZzKq5rE9oc/RN/MR2BCdt9EsE95tKQYvgQj71LyBGiMN8sqs2zsfPybTXlqG?=
 =?us-ascii?Q?DjmhWIExv2u3fMAQsSJNdsQbYVYIEC0DrcWoW0V6dsU1Q6NzTv3nOKQwNr+q?=
 =?us-ascii?Q?u9CnVSLIi6riXLtydk6mSPd0kNmsTk82qDslQujxPOezE046fImQQpoMIgpE?=
 =?us-ascii?Q?H0s1fdqjcGTRpfHTTFuZSFG/OihcOWt2nUgiOo2NBqErZf1w0duvx5qgqaGw?=
 =?us-ascii?Q?oOMC4DtfwO/digOCZ7wlV+8rPbtK3bP4E03JrrCDGb0q1n+Ab3yXp3E67Jpz?=
 =?us-ascii?Q?OTQgwUWfPGXz0EI5foiJ1u/cPtX7qH/CjIcrQLjhJ3stviuAZVc10WaDDcHg?=
 =?us-ascii?Q?coda43fXov6LZty8lAKtuVyP4KbcirM6M+ZkJtM0QV9cQIpaWnbLyNVk//MJ?=
 =?us-ascii?Q?bHkrCKKSX20nHQNs4IhcCM40lh6f/vin+V5uzkz4rZ4JQHIH4OHDwAmmfK53?=
 =?us-ascii?Q?TXBNOOKQe+UeYk3hrMiTzRVbLzEwCaPNmpvpeLD0sW3sEBf1l21xcnWjZsyl?=
 =?us-ascii?Q?GvUfU9lIdrABXWafbXQuQyBpgwKXkNehEuqUZ68MLGpIzEXMkNXe4ODnRBgR?=
 =?us-ascii?Q?10rWst7qmnkWbAVQgDYxSzAsGIEx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ge41fsjsxcT10QA2dCvKWoSLp+38myNUkHrYpcFQ1Ba6WXOzkV/lb8u8WSWY?=
 =?us-ascii?Q?QdletWkQCtBBVDwvKaKmphqlCI8ipO4T6uKpx5A43GnZBgnH/tT+39uOn1KL?=
 =?us-ascii?Q?2AhF2JkWiOToyZORAGJNnxxLESeqjshxvNEbJ5PgRe5k7G10YnTKlasMf95w?=
 =?us-ascii?Q?TS0mVfGc3ffLxSPq5zYj/A9rg7duTGR2KCAVEwxrXM/3POVDFD5mnGao93k8?=
 =?us-ascii?Q?AtUDzXsvdiUslXECCFzdPLIQ8UG0/UZRgtta6uT6x1v2dqoggndfkSStMwP6?=
 =?us-ascii?Q?149xO6JhedFUr8NUED8LiwTsWxt2Q9WUKeoLM7yKacBDQC4VsGz7q+nFkrpp?=
 =?us-ascii?Q?rxLWa1HRYG23dZ2x4ZMhR3OaxmRN/8eR9WJ2qPPYVjaHieGNUZYBPqvU4TOJ?=
 =?us-ascii?Q?OMm7S27/dpScmiz75eOfPXPDfx9qHSr4IPCMFDofdkUcJBdqZ5i8XAaxa4bu?=
 =?us-ascii?Q?KhX1BDyfmBZQV9LrLbOuwXaTttyC1u9Tc9R3V8ZRDSvWKNuDjWigS3KPHUJw?=
 =?us-ascii?Q?BkcNWTzE09fwCE0g1pUCjVc5mUmZndTO/iQXno9C3O5Bz/rRzSlWxJDbxivg?=
 =?us-ascii?Q?4AYRybMPic95uUrsLLrETPsex8Vix0GUAsok0Uk4ypb9KCc1djUGDez/4J8S?=
 =?us-ascii?Q?An13vK2qNGZ7VYAneUMIpGG6dqiJ21DxfIn0pJuhOTJf5wRjj+Ek/MDUAj2G?=
 =?us-ascii?Q?PexND2D5pfQYtYn+YCvcYy7/73OV5Si5yctJOUUKfbwaVNKHgQcc2C8CqIEA?=
 =?us-ascii?Q?P7TY20i6SCBzzHXbuKRaJBzo/Z6LxslzXAuMKbEbvPvOjpaHLTSwcsb1UTfy?=
 =?us-ascii?Q?B0Q+aic98l+SBjGplozz35V51wsf86fqFD6sVLoxgL2OZQ+iRP73e9AvDO6+?=
 =?us-ascii?Q?OqyNZp/Xj5JbRNi5s7rsWRKaVoaQJzckG3eOnJWeaDikU2yvwFNq/F66SKaB?=
 =?us-ascii?Q?fh0EO4BT9gjYyN/QhKXTwoenLssl8Vei1BKTLMriSfdDoLh/RlPLppGxXO47?=
 =?us-ascii?Q?3WBsH7aRKB8wuu+j6Jxd4wdDHQtWIOCL5KqqWga9e6mGqggU0SpLmpvU2vjU?=
 =?us-ascii?Q?x9KUiaz+5szPWY1U142+WrhL+1tJRosewpTCyyScPsbJT6ZMRGZ0C1Ju0pzt?=
 =?us-ascii?Q?V93dSfFzmRUWV6PtGOZBW3RYaFNaYsu385WZW+Mobkct4iQ+Sy1usktA64H8?=
 =?us-ascii?Q?L3VR9+18YnnkZDTHKcATr6vt48uH+JSWM99jg640ZDT27/P1D1AqVW2uKAui?=
 =?us-ascii?Q?cVRKbpe/1fg0zNyNYR85XgAPWgD1WAKp73H0jBTqgprR1RuuVqp/TvjHcxUD?=
 =?us-ascii?Q?LO1/RaC47A/3USmODOEoel5G5djUEc5Q/BG6E+oNG/r15ZPNf3p9tvV23R0K?=
 =?us-ascii?Q?2141P0JpnadKudeHJXwJXiJM420n+OSHbR6sw0zW3ZMz5Jm+KflUjEVDWUFu?=
 =?us-ascii?Q?2ZqWTk1Mt+gLkRpGJGQimmf3YEXVPamdzfHnfUIotFcmqxBweFQhQbwTUDjc?=
 =?us-ascii?Q?JQWsqrvIvw0Z3jT80XgldUY6to3lEjv9P1mj7vqaVlqZQbDnultQkJfyjuK/?=
 =?us-ascii?Q?PfzlsUNnckmmoNRoghdn1Y+PvwAaKSYNCP7lGJo/f++C/v9Jsj5G86Bder7h?=
 =?us-ascii?Q?Gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a995a0a6-4543-41a8-04e2-08dd4706a55b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 23:33:22.7627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xINFFmzwSeMECwTJXFAO9z52Ir8Gj8eiemLMW3fS+4yOZltOx8ZPIR4x3RFYmlxJBERoRAoGoHZSru2oaFQN8xPAfUA/n6KPAimickjA2AY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4611
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

On Thu, Feb 06, 2025 at 09:12:49AM -0800, Matt Atwood wrote:
>On Thu, Jan 30, 2025 at 09:30:30AM -0800, Matt Roper wrote:
>> On Tue, Jan 28, 2025 at 04:55:51PM -0800, Matt Atwood wrote:
>> > From: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> >
>> > wa_15015404425 applies to xe3 A0 step as well.
>>
>> We really need a better commit message explaining how this workaround is
>> different from our usual ones and why it needs to be handled in a
>> special way that's different from all of our other workarounds,
>> especially since someone who just quickly skims the workaround database
>> without digging into the details is going to incorrectly think this just
>> applies to Xe2 media and isn't relevant to PTL.
>Ack.
>>
>> I was kind of hoping we'd add a more well-defined infrastructure for
>> handling device / SoC workarounds.  Adding quick hacks like this is
>> going to get out of hand quickly if more of these start showing up.
>Any particular ideas here?

at the very least, use XE_WA(). You may need to extend the matches it
knows about to implement what you need here.

Lucas De Marchi

>+Lucas
>>
>>
>> Matt
>>
>> >
>> > v2: query based off SOC stepping
>> >
>> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
>> > ---
>> >  drivers/gpu/drm/xe/xe_mmio.c | 13 +++++++------
>> >  drivers/gpu/drm/xe/xe_step.h |  2 ++
>> >  2 files changed, 9 insertions(+), 6 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> > index d321a21aacf0..98d068ad33bb 100644
>> > --- a/drivers/gpu/drm/xe/xe_mmio.c
>> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> > @@ -150,14 +150,15 @@ int xe_mmio_init(struct xe_device *xe)
>> >  static void mmio_flush_pending_writes(struct xe_mmio *mmio)
>> >  {
>> >  #define DUMMY_REG_OFFSET	0x130030
>> > +	struct xe_device *xe = tile_to_xe(mmio->tile);
>> >  	int i;
>> >
>> > -	if (mmio->tile->xe->info.platform != XE_LUNARLAKE)
>> > -		return;
>> > -
>> > -	/* 4 dummy writes */
>> > -	for (i = 0; i < 4; i++)
>> > -		writel(0, mmio->regs + DUMMY_REG_OFFSET);
>> > +	if (xe->info.platform == XE_LUNARLAKE ||
>> > +	    (xe->info.platform == XE_PANTHERLAKE &&
>> > +	     xe->info.revid == PTL_SOC_STEP_A0))
>> > +		/* 4 dummy writes */
>> > +		for (i = 0; i < 4; i++)
>> > +			writel(0, mmio->regs + DUMMY_REG_OFFSET);
>> >  }
>> >
>> >  u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
>> > diff --git a/drivers/gpu/drm/xe/xe_step.h b/drivers/gpu/drm/xe/xe_step.h
>> > index 686cb59200c2..879486a818e9 100644
>> > --- a/drivers/gpu/drm/xe/xe_step.h
>> > +++ b/drivers/gpu/drm/xe/xe_step.h
>> > @@ -20,4 +20,6 @@ static inline u32 xe_step_to_gmdid(enum xe_step step) { return step - STEP_A0; }
>> >
>> >  const char *xe_step_name(enum xe_step step);
>> >
>> > +#define PTL_SOC_STEP_A0  0x0
>> > +
>> >  #endif
>> > --
>> > 2.45.0
>> >
>>
>> --
>> Matt Roper
>> Graphics Software Engineer
>> Linux GPU Platform Enablement
>> Intel Corporation
