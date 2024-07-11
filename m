Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E86C3DA45
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 13:47:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C36910EA82;
	Thu, 11 Jul 2024 13:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OjLTMfF/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5392010EA82
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 13:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720705623; x=1752241623;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ck92uLEuW0OQZ3YYKGvlTkYlGibuWLZPyJb1k93ULn0=;
 b=OjLTMfF/UopYnUpfynJgsVR2nXKG0nvqepkLnypRqufc4qBVpatk3d9Q
 kEiF6QdYf4u/FDj5qe6FxvyKFsGTepfusWiQK9QTfBJsjmWhgSr8ms7XU
 HLmVYUfh0M1tS5+DxPy8mey+0P5ulenKqkKudcBeL70UjJSNUbsW2gmgV
 gTeMeaqR85HpGhl8H67F+Ame9NgIS2vSfEz+vKDByYdt5SvZIcZWJ0RMo
 TMN5OIxKQKCoJfj/UuFD69o2damyfTvVSCJ15ZBDn1pvo91h6vm9Z7pae
 AGfbSN88TiyXlHMbxZtIIDQ0LgrcNhHXAo9wZHOC91f7hidMB86cclAW3 w==;
X-CSE-ConnectionGUID: uSSoz/A8TUOSbUvaK5Ihsw==
X-CSE-MsgGUID: RMbJVvY9RF6DUhcZ6p02qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18228080"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="18228080"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 06:46:31 -0700
X-CSE-ConnectionGUID: j4OX1Ha+Qc2ZQX9Ll3Tuog==
X-CSE-MsgGUID: oo4frHDFS9+brEW2k2TTLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="49204656"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jul 2024 06:46:31 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 06:46:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 11 Jul 2024 06:46:29 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 11 Jul 2024 06:46:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 11 Jul 2024 06:46:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T3+HCm5UUpdgbIfMsB1trlPRVNC9lcr+7BikL2wZJg5dfg40M1ZjmtfD4UJuxHqMu+Kz4PtnGwTggxjFDL4OEKb9n4VfS0yWOBmuy/3KphvZO5+9FU3ie4lXFJkcQPnQ7IcQTXhqFCSnaqB6uc+lTaXomUo9+pha6Wvxagdzk6fOV7Fc0YHKjnvnZSoogvK7b+QMYBF6jHUvDXFG1HOP24IMWo/Uhq7SuNzJA+76CEtxa9nnHDJE09mV81H/KwSSXA7kxEk2F5ATpcqySSDTZFXBQaxFcdWN4BcxjJDbXSraelHWET/pSj2peO5+FEbBL0oyT2lcwRZzeV7kQyReAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nv6J6lz5jkglTP0r4SopXzxyQYBDYK0i8abUkmgR+1U=;
 b=jSeB68VLQ2Hi+S0EaDRi+FFgdCxf3/XSpabm1fNGinK9y0nzx8X23pVExKHibVsaxCt3SkI6+nXljyBTwKk5LWuGbx175KP4YH3JPwoCPuha/5fh2LzJe+DK9LgW9rEGDZL1TpRJz7JI+w31Mot4gx6xRkHgQa56Kkdk5YvlvvBJ3mwG3P9XorODgKFNumPW1n+WuASGeE4LjE+Q0nZAN5AxsCwX1jfwiwFC1HV8OxfhO/5UKgL4/SpQbizkVk8lRfVTgh+nmUk6ZePNhOwOS55BGrmnWp6W7JjAVhDohrkC4JYmjz2oxtbNIMMha9FsBo44oJaO2+C29x+DixrhIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4972.namprd11.prod.outlook.com (2603:10b6:806:fb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Thu, 11 Jul
 2024 13:46:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 13:46:26 +0000
Date: Thu, 11 Jul 2024 08:46:23 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>
Subject: Re: [PATCH 2/5] drm/xe: Add ref counting for xe_file
Message-ID: <nz76s6fjxvrz274mlm4pcken5pfivixuiyvcs37kjr3iir24ji@riqoducma2wo>
References: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
 <20240708202103.3347869-3-umesh.nerlige.ramappa@intel.com>
 <5vo72c55ibxeyhyokdmr7ogilf25fo6jk7hht3vkc7ekkixgpl@tmdzibnr3mjz>
 <Zox1iBxWvN7GtG2Z@orsosgc001>
 <ZoyEO5sqdnuWzKH6@DUT025-TGLU.fm.intel.com>
 <mxnhwrka3iarajprb75wvsbeem3kxv4yxkxujqjgirkyghr3pv@i5cxlljd6j2j>
 <Zo1nYs4AA1Hp0QQH@orsosgc001>
 <Zo2fdoxSExq8NF12@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Zo2fdoxSExq8NF12@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: MW4PR02CA0023.namprd02.prod.outlook.com
 (2603:10b6:303:16d::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4972:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a0921ab-cf9f-40b6-7774-08dca1afdc21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZWyK/Hx5xAVQ46pI/g9bhFx9e0jIfM5cIP/FqzrAPK2H8PYsRshRdA0nOvlZ?=
 =?us-ascii?Q?vK+Pz1RfjI/eCrZpE4dFkmF9Mamc4NduuN1CqnyNaTdgnRTFoM5xcm9ULy7P?=
 =?us-ascii?Q?HNm2h+//qXVQDGXcWfyUSqdKONfSJtCVQQ1GI17qQYBXSDBhdkD8w9vilOGV?=
 =?us-ascii?Q?7gcZ4JxjZwoC9maLVcRNoRC6NM6ESKoQvrknlpI9ZtjXxOPMx3o0Tgjs8ECw?=
 =?us-ascii?Q?ki8OPwmWx1oJtlFFvDWi8eD3N+gonKBpjlUWXHy4AJxAtBjTvxofJkXJCCDz?=
 =?us-ascii?Q?XQOIrac1RRyiajGNu31VZ/lT+NBugoVivI96pfCqIH0ZC92rD6cxeIn4Zaaq?=
 =?us-ascii?Q?8t0LjL5qNyvvrNztRz7ZIaKIhtQAgyYIhXxr9O1nMib27J5tbm1gP/4xTIEd?=
 =?us-ascii?Q?UGVRAhPdYdIgoeowKbcXMo9axHtXI+Cnn3Xe5BEZBv0rTOUINw//xKrIGzA6?=
 =?us-ascii?Q?Y5qTE7DYJQvwlAVb5hHtyMqBoSFwmmQ8Ek+KiMgEaUaQjP//ON6y4RuQaIGU?=
 =?us-ascii?Q?ATdgKrIYXtQiO36Q8ke3X4x/8GjcYgxa+gAczbfRHYaQmfq8sny++4bQeyIn?=
 =?us-ascii?Q?M6AZBHwebCz1kVObUM6bVgoh/mCfRGqjeiVWMPCHhGg9YYpjppJN3nSoLE78?=
 =?us-ascii?Q?fbE5LihE2z5lY9LlmT4YFSztPJQzO9NGD3Gb3LheGaEVlmXbyGT8qjNZ4VUe?=
 =?us-ascii?Q?720sl4kqXJia/lsvMCxD79QjHj79R+CWriKyQpa4NKfN79KPjDGlrhIPOABk?=
 =?us-ascii?Q?6j+Zx5SuS7h9CNOkDhN08mVJCWDq7MCtQekBTTDfHSLwsCBdPy2qr+13yjrU?=
 =?us-ascii?Q?ktONyzXhpXkfWlLVPNPcvv6cEkGxASTcW0acdC1xz7MZw6+gRN1XZSsXwisN?=
 =?us-ascii?Q?hhi+1zIO/Y0hwj3iSKwLoP+SpRq7+HjEgrO6b30XnjDCyEhcxIic3KoZ6R2P?=
 =?us-ascii?Q?C4dGIR5H9ULrr1eJtgC/AerGRrnWKKIO/6oGSpAaXmByoeItyu5zRJWIifDS?=
 =?us-ascii?Q?K09jQlK5CPLurZP2hsguMsWbnQYapbBO365urZYHXwNyLAqqmhkXM/DsGSBj?=
 =?us-ascii?Q?jfymMcL7MyLxYvvHhR1hN1bgHNmR+hOP47Ap9XH8jilXv+9wb8Z36o/MakTo?=
 =?us-ascii?Q?hfokz6QoJ/jRiq7SUNe3wPX+iN0uYf+zdYR/NmQRVNqqzKNitIwCetGKFUW5?=
 =?us-ascii?Q?TsZ43fsEIzaZzwOi6RD3bC6J6MOhIv2Y8jwiZYk6LiTOXxRA4LaxWPhiqrGX?=
 =?us-ascii?Q?qmH/2EUft742/pY94udlCVfz+3EaDVv3PppRO42fcWut8HO7ItHBgOML1Ocm?=
 =?us-ascii?Q?IvrZtG+Vv1zD/+QhoRiYrfHgQ/DrM35ez6mJHXwus7vh8Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5H8KX0prjTtSM47sV4IJdmV8VD86nJAitYe2NHuCy8ZLgXjJyDlQZyhfFAY6?=
 =?us-ascii?Q?cw5HyZINk6BscC4EEqZIDpEADXOQn/61aTpmmjKOBzCWU2W4BrySqNFJ0Eqi?=
 =?us-ascii?Q?Onui1X3veF7ppU7mAXHA18euVEfWNambv2Jol82QJVCZT3YffTuEiKmxV919?=
 =?us-ascii?Q?M1mbBXWoDGNCzkBwNp6AhEW8nqtT/X3bBQWUQQcf+IiQEIPYHVtO2oaNSf7Y?=
 =?us-ascii?Q?sTjqq3x+4Dq1NMc6k9Bejcv4F5orwB4CiYRQ8fTuiAxJ8YYsikkVwlrPXVlA?=
 =?us-ascii?Q?ydZ/c2R3QDQ6OtxMgLF/9+UtiQmmHGNolcUfw00BVOvQNU7ypXGj16Gw2PCh?=
 =?us-ascii?Q?k3U855mT9kKYKyV71JDy3Gw8Gzz7TqbrhfI7/E+QYVFMOX5fzCeBnx6svRmC?=
 =?us-ascii?Q?LmElQ0Qe+SpSmPVBvYWII8UlSyoR6SRaZyhwh1of1JEYfADqb1o6i2UHHHjG?=
 =?us-ascii?Q?lQO10TPgpOVF2PcV+JE5slmhCoFUle3qlll2E12TOcX5UbqaHzTNQRpyKrJP?=
 =?us-ascii?Q?6ubtx+384qlBnUsHbzBkYH07yMUxvBX5Gu3Dy3h69ycf7NIxyisyndZjcYkt?=
 =?us-ascii?Q?NapX+8OY6PT2Wrji+AEgDXsGbm1UvgImIO9s6e3Hix+SOOojBPQNlTKDp5yv?=
 =?us-ascii?Q?a7WG+oIpeKFHehdUOAsjzGbfA94kIpjbvYo2Ptvm219fBpncx68UTQQPMVAA?=
 =?us-ascii?Q?SMVzTqSoN061/pe38jAdSpv4jyBt1zCmHc8hGGDnAPwbmr+TlX29DxpZ7n0n?=
 =?us-ascii?Q?+FIpVJXD7iJkooJUx1zoRxdkxYrArztdeiJrulB/R3Ik644MwzlKxoCsC1v1?=
 =?us-ascii?Q?/BGqokThosGrjDEXgVkGE1ii77F65eY0rIMsmm3UYrHdzDHFwV8veo3RdZf2?=
 =?us-ascii?Q?B5PUQZSIKYMZ7vTn9Rl8HcFiMcPf8wklOyJxtpH9GvG+g+Sf/kGLIF2gn19a?=
 =?us-ascii?Q?a3YHcwsk6JGMVt7YEFJyu2VRqCwmPFUZdezwuWXFkGBntyF2unbXe1bDr1gI?=
 =?us-ascii?Q?ewU29YrnqF2moB24OFDLTOn5ChZJ3QCXvtFIf6KMEzRRE54GgdLou5NaS3cJ?=
 =?us-ascii?Q?haUNhYMKKdhv2Rmrgu8FFDX87AyFc++baeHLx2SHa2LzWic7nQ5aGerK9+yg?=
 =?us-ascii?Q?TxUPd8VyewIWE/BVqemfhxQLwaDsy1CVJ1mYBsPEspsjJaMxbTcusFBBqc05?=
 =?us-ascii?Q?k2M7L/mxLd9k5MPjAYNe4vUSmIMKnyoV20BfW6B5l0V3fUsFQVUteglhqLWK?=
 =?us-ascii?Q?x6oZYY8QyB7xtsmSLCe/ZtkM0wFd6cKvNzD8MPwr6MgbR60aYpTViXMlPxBK?=
 =?us-ascii?Q?/vMNBvXn5EFU0+drsw11MdktblmAqWiSkKBneTOm7Hd0rKV/vCxh8Wyy7JNv?=
 =?us-ascii?Q?g/QZJ3ohhrup6XvpekxdCMrzdeGb/OKxzxXC9MYvDo5QHs+pp2lj/gB1lfa/?=
 =?us-ascii?Q?GQzpQ3NwhGHa9bF4qp39Ncv1BYewjQ7piSMRYoFtuE1ATLKE+r/YX7D8pVub?=
 =?us-ascii?Q?eYt5AoAmVzVcrC14Ta39Sr7/9fzF2MNDHQepenpCzw1LZUYtWNGAbnlixUvv?=
 =?us-ascii?Q?OUZgoJP9o5AshlABkF8SmpS0cq/JUci0BD/q2ARzopXV10fnUYzNb7gmZPs9?=
 =?us-ascii?Q?Eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a0921ab-cf9f-40b6-7774-08dca1afdc21
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 13:46:26.5950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vatp+7GvXONQaSY6eTB3frAhFdPS82if926fG3uagtSrkl/DIw1RYfFYoEhdqQ6cOsSBNx2RQxufQfzuLyCAFPTFf5GQ3W0LZz7N8sZagt4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4972
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

On Tue, Jul 09, 2024 at 08:37:10PM GMT, Matthew Brost wrote:
>On Tue, Jul 09, 2024 at 09:37:54AM -0700, Umesh Nerlige Ramappa wrote:
>> On Tue, Jul 09, 2024 at 10:11:47AM -0500, Lucas De Marchi wrote:
>> > On Tue, Jul 09, 2024 at 12:28:43AM GMT, Matthew Brost wrote:
>> > > On Mon, Jul 08, 2024 at 04:26:00PM -0700, Umesh Nerlige Ramappa wrote:
>> > > > On Mon, Jul 08, 2024 at 05:52:00PM -0500, Lucas De Marchi wrote:
>> > > > > On Mon, Jul 08, 2024 at 01:21:00PM GMT, Umesh Nerlige Ramappa wrote:
>> > > > > > Add ref counting for xe_file.
>> > > > > >
>> > > > > > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > > > > > ---
>> > > > > > drivers/gpu/drm/xe/xe_device.c       |  7 +++++--
>> > > > > > drivers/gpu/drm/xe/xe_device.h       | 12 ++++++++++++
>> > > > > > drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>> > > > > > 3 files changed, 20 insertions(+), 2 deletions(-)
>> > > > > >
>> > > > > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> > > > > > index babb697652d5..e6eacf1bcce0 100644
>> > > > > > --- a/drivers/gpu/drm/xe/xe_device.c
>> > > > > > +++ b/drivers/gpu/drm/xe/xe_device.c
>> > > > > > @@ -87,11 +87,14 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>> > > > > > 	spin_unlock(&xe->clients.lock);
>> > > > > >
>> > > > > > 	file->driver_priv = xef;
>> > > > > > +	kref_init(&xef->refcount);
>> > > > > > +
>> > > > > > 	return 0;
>> > > > > > }
>> > > > > >
>> > > > > > -static void xe_file_destroy(struct xe_file *xef)
>> > > > > > +void xe_file_destroy(struct kref *ref)
>> > > > >
>> > > > > why do you export this?  I don't think anybody should be calling
>> > > > > xe_file_destroy() directly and this function being executed should only
>> > > > > be the outcome of kref being 0. Also, if it's exported, it shouldn't
>> > > > > really have struct kref as argument, but rather a struct xe_file
>> > > > >
>> > > > >
>> > > > > > {
>> > > > > > +	struct xe_file *xef = container_of(ref, struct xe_file, refcount);
>> > > > > > 	struct xe_device *xe = xef->xe;
>> > > > > > 	struct xe_vm *vm;
>> > > > > > 	unsigned long idx;
>> > > > > > @@ -130,7 +133,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>> > > > > > 		xe_exec_queue_put(q);
>> > > > > > 	}
>> > > > > >
>> > > > > > -	xe_file_destroy(xef);
>> > > > > > +	xe_file_put(xef);
>> > > > > > }
>> > > > > >
>> > > > > > static const struct drm_ioctl_desc xe_ioctls[] = {
>> > > > > > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> > > > > > index bb07f5669dbb..2a8b370b1fda 100644
>> > > > > > --- a/drivers/gpu/drm/xe/xe_device.h
>> > > > > > +++ b/drivers/gpu/drm/xe/xe_device.h
>> > > > > > @@ -169,5 +169,17 @@ static inline bool xe_device_wedged(struct xe_device *xe)
>> > > > > > }
>> > > > > >
>> > > > > > void xe_device_declare_wedged(struct xe_device *xe);
>> > > > > > +void xe_file_destroy(struct kref *ref);
>> > > > > > +
>> > > > > > +static inline struct xe_file *xe_file_get(struct xe_file *xef)
>> > > > > > +{
>> > > > > > +	kref_get(&xef->refcount);
>> > > > > > +	return xef;
>> > > > > > +}
>> > > > > > +
>> > > > > > +static inline void xe_file_put(struct xe_file *xef)
>> > > > >
>> > > > > I think if you just make this non-inline, passing file_destroy and
>> > > > > leave it in the same place, it should work.
>> > > >
>> > > > the put is called from xe_exec_queue.c and xe_vm.c also, so passing the
>> > > > destroy may not work.
>> > > >
>> > > > Based on the patterns below, xe_file_put/xe_file_get will need to be moved
>> > > > to xe_device.c and then exported. It looks cleaner, hoping that'w what you
>> > > > mean.
>> > > >
>> > > > In xe_device.h:
>> > > >
>> > > > void xe_file_put(struct xe_file *xef);
>> > > > struct xe_file *xe_file_get(struct xe_file *xef);
>> >
>> > yes
>>
>> ok, posted v2 with this change.
>>
>> >
>> > > >
>> > >
>> > > My opinion is the way you have it is correct.
>> > >
>> > > Most of Xe is coded this way...
>> > >
>> > > mbrost@lstrano-desk:xe$ grep _get\( *.h | grep inline
>> > > xe_bo.h:static inline struct xe_bo *xe_bo_get(struct xe_bo *bo)
>> > > xe_device.h:static inline struct xe_file *xe_file_get(struct xe_file *xef)
>> > > xe_exec_queue.h:static inline struct xe_exec_queue *xe_exec_queue_get(struct xe_exec_queue *q)
>> > > xe_lrc.h:static inline struct xe_lrc *xe_lrc_get(struct xe_lrc *lrc)
>> > > xe_sched_job.h:static inline struct xe_sched_job *xe_sched_job_get(struct xe_sched_job *job)
>> > > xe_vm.h:static inline struct xe_vm *xe_vm_get(struct xe_vm *vm)
>> > >
>> > > I'm kinda confused by what Lucas is suggesting.
>> >
>> > just don't make xe_file_destroy() non-static, which would basically
>> > ignore the refcounting. xe_file_destroy() should rather be local to the
>> > .c implementing xe_file_put().
>> >
>>
>> In the above instances from grep, most of the destroy helpers are indeed
>> exported. Those might need to be changed as per this review comment.
>>
>
>This really just bikeshedding, I prefer static inlines so these being
>exported to make get/put as fast as possible. Perhaps this doesn't even
>matter with how compilers work these days (e.g. even if exported
>functions they get inlined by the compiler?). I don't care enough so
>push back though.

my issue is having a xe_file_destroy() with no indication whatsoever
that it should never be called... the only valid caller is by giving
it as callback to kref_put().

Some parts of the kernel uses a __ to make this clear (we follow this
approach with __xe_bo_release_dummy, __xe_drm_client_free) or don't
expose the release/destroy.

Another option to make it even clearer would be, e.g.:

// diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
// index ded77b0f3b90..e7111e2aa7ba 100644
// --- a/drivers/gpu/drm/xe/xe_exec_queue.h
// +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
// @@ -23,7 +23,6 @@ struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe
//                                                  enum xe_engine_class class, u32 flags);
//  
//  void xe_exec_queue_fini(struct xe_exec_queue *q);
// -void xe_exec_queue_destroy(struct kref *ref);
//  void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance);
//  
//  static inline struct xe_exec_queue *
// @@ -43,6 +42,7 @@ static inline struct xe_exec_queue *xe_exec_queue_get(struct xe_exec_queue *q)
//         return q;
//  }
//  
// +extern void __xe_exec_queue_destroy(struct kref *ref);
//  static inline void xe_exec_queue_put(struct xe_exec_queue *q)
//  {
//         kref_put(&q->refcount, __xe_exec_queue_destroy);


... And yet another option is to add a warning in the destroy() function
if kref is not 0.

>
>I do agree we should be uniform in this though. Maybe the maintainers
>set a policy and we follow that everywhere in Xe?

Cc'ing them... but I'm not sure how uniform we can get.

Lucas De Marhci

>
>Matt
>
>
>> Thanks,
>> Umesh
>> >
>> > Lucas De Marchi
