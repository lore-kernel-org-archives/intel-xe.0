Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2029C3064D
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jul 2024 14:29:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CEDA10E285;
	Tue,  2 Jul 2024 14:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LDKm15X5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6713F10E285
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jul 2024 14:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719930590; x=1751466590;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Z426pusek/0MiWeWAXx999X5Jl5pNElPqJg+E4+4IJE=;
 b=LDKm15X5wcScrwSxQbch36GqaTPtRwZlhgMx06R+tukUGTvsQ71vGwf1
 cGgjFPV4Faj8WScWmJXahlmEyVNk61Az7QHdbG01U5p2Hlx2HNFDnHjzH
 jZ2B81zGm5Rf/DnTknyp+zFAfx3CFoTvUIswwPcuhopeIlUKlXX/a7xhW
 qD/c4h8EJFiZWAiS881lkZai2gHU1XrToIYWz0Y8neSlGHbtjcTGTfREN
 d2fIkb6KHTcwI5eh8yTzXvjEZf4co0LjsRn9CHINjuwOg9LZx8ohu+aUe
 BaBjJTDAga1Yr7ewzpHLNxjAp5TgMbBpBbsAmPx5y5LGMKtIeo1QDqImZ A==;
X-CSE-ConnectionGUID: LUjOaGKJRCy2ao7fqVN5Ow==
X-CSE-MsgGUID: lI/7cmX/Ro22m7vkU+ig9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="42536626"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="42536626"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 07:29:50 -0700
X-CSE-ConnectionGUID: 60tjMhsbQ2mKgZotitU3Vw==
X-CSE-MsgGUID: FxutzYdsRW22LKCL8wMv0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="69119376"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jul 2024 07:29:49 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 07:29:49 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 07:29:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 2 Jul 2024 07:29:48 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 2 Jul 2024 07:29:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GL1gEkYwQHdAo2+YbdXEijOHxYXZQ4vsExK1Vf8+1Xm6ACxbnQmV58R/yiNVx9Fb1ebHO4noNkPbj8wHA7BkIlL70iAX7bd1zf0+KWSYACoBgmxMkUngEolZ/Bk9xrpPK6wgVpO4pjhYZuWFQWuI8PhhhaXvWSujqydfOYtnMOv0j/pc5YrhEQ+7JsOytAjPNT9UlkIvWMMDLEOYqfS/oEOsjTiz+GckR7tpyUkwgM64S9iD4Z4nEeVRlHVjOaokoHgu1kuPTeVLMPNWde3ho58ONip9ZQ+i7f+13Bvz5FL0BOccF8IzRXUuRIcSQ2F726HHch5C5UaAhWuGVUez0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkdYiZQTEb3hd1I/avhs2fnyLHTMmO0Ay0Jn4/4MWzs=;
 b=giTE+WqFNTL1hcTKsk3ho54uTtRqIsDvVqMmCa2bq9Qt1Xl7Mnuw/RKwfjb39q2j9UK9MHj+8dQBtwl8Ws2kw0dkIuYUGYnjqvn1U6dWt6rC7KI900ntqK9Vd4rR3lM++biqczvvN/vXBFfFBXiVCILF0OMxO0dnfNgZIoyEay9zw/eOxXdBvEcDUENIwXfGB4TUVsY8mRQObn+5ZxVYoaGlXBnPzgwSB4uzmjqbwwo4LX//bzsdOjlmDvP1dk9pujyoMfR+IEwkoUuLXLrAlCpEdnuDMnfK9YZpMnvypI53zrXKGjuCHwz3/vyTGl/b8O7nrpxxtuqmcFYVJa0TCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV3PR11MB8555.namprd11.prod.outlook.com (2603:10b6:408:1b0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Tue, 2 Jul
 2024 14:29:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 14:29:45 +0000
Date: Tue, 2 Jul 2024 09:29:42 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <ryszard.knop@intel.com>, <ewelina.musial@intel.com>
Subject: Re: =?utf-8?B?4pyTIENJLkJBVA==?= =?utf-8?Q?=3A?= success for Reapply
 "drm/xe/gsc: define GSC FW for LNL"
Message-ID: <mxtejwnl6xie7a7py2ntnrbq5s57o5ho4exy3gygwggau4hgt5@lg3ixotyab4j>
References: <20240702001155.2163743-1-daniele.ceraolospurio@intel.com>
 <171988208839.3729.11952250272154489901@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <171988208839.3729.11952250272154489901@2413ebb6fbb6>
X-ClientProxiedBy: MW4PR03CA0211.namprd03.prod.outlook.com
 (2603:10b6:303:b9::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV3PR11MB8555:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b8c2a78-a47a-4aac-e891-08dc9aa36b2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5qyF44eirCFM/63lVCgPS2xwVTVmc/JeK3Nd2pSZei59lRJFUOfiT3v+52ez?=
 =?us-ascii?Q?Laz1BEPTo4SHO+2uGGSd5mVwu//6lzMpdjz1LOWuT+h5bh2r1dNNZif9rao7?=
 =?us-ascii?Q?rN1GuScoIPbMAQpYZJGZJTv5v3lt787aL7XbOKaxQ33MHmjHW2rwjI+VTq16?=
 =?us-ascii?Q?uvEQaQTpMHDYfLtRA35QfseRCsFIXiwaHrFjiKh+2P7yQadTZmCCqrnLrByz?=
 =?us-ascii?Q?Sb6jue4Cln1/7OEvgQ6XF4fFVQIf+PoGFoRbL+xuGKm/l6HJfg3L2m9QL4ai?=
 =?us-ascii?Q?qqYd/OkawcZqt9v+LRqpLedKzbMW1JW6PVuiB5bZ+9/YBRGYdxj/6u0D0K+H?=
 =?us-ascii?Q?eDGFI51hbTPjgttcKihTdr+1zm0qn9zw32v4k5B/C8tE3sb5TeHTerAjIM+w?=
 =?us-ascii?Q?KNVYCzJS6yKJ+YVD+0d3Gm5SYvKZUXdYoq/i8jc21Jn2frDQMKdW8JgsjW/t?=
 =?us-ascii?Q?XpMbImMN7DPESemXja/KY0u4EP1f8Z3fWZnXEN+NUbDQ/xv+i7oF7EHy7d4N?=
 =?us-ascii?Q?zbpfbCEmplgBQTNynl1eLAjwIKU+VRadZrggxeLTunsGG3oln5m873YQI9zx?=
 =?us-ascii?Q?dS0PPzHUAl1TipD+0Z2xFfcAWYVoW54z5vk4Y2XZ7l54xb7qt+SXt81D+L27?=
 =?us-ascii?Q?hz29YrNDo1JlhM5Z3WVMBn/nPQNJsMx3ymSAGRrW3U6N8BDQyAg/nEFydtW8?=
 =?us-ascii?Q?bfQH695Gz3v+bXkbgctL3DSeiGB33x5ZSVG1A0+KIDiOr93NfLtetpoXrtXE?=
 =?us-ascii?Q?11gMKn6GgSxXsuEe2YfcehizK2cG+lSEsJCUkFMxJSjCVPGOdtnYrjV7yT10?=
 =?us-ascii?Q?FkFu+UHgetFKPxmG8UIW1J6xKj14TPCDA7HFXoLo1hBUkxy9uqHkRundWBMZ?=
 =?us-ascii?Q?Ph0nHAyCusjJ8kDgEwAB4JvjXpMsJnS65UjjbTfZsW/Fp4pKASHDhcOu8TrP?=
 =?us-ascii?Q?9bY/KucnII42UbTJDY+K9CShvvUHXf3MIwLY3fWOVx6Lp2KjrjQfpR7iEuR6?=
 =?us-ascii?Q?XpfCmPPmSlyX1THgXZLAVywKexF4prOIiCYDxfq9mW9Iy+opk2t7FtJUucPv?=
 =?us-ascii?Q?yUh9vkBh7XChb1HQZAgk+LrEaFQON1ewOpnWMl4TIk9PTsTolR3xdbPblJ4c?=
 =?us-ascii?Q?87f8Up8s0goqe6dlxytz4VjXk8dpQ6DvSBgYtZf51niJilY7AhDiM0OH73Wt?=
 =?us-ascii?Q?0MvGvWjP+lg8czqNjulfKss0brUc248uCUC27GfnhCec74bXDflNxaDehfCM?=
 =?us-ascii?Q?3GGY8fv4ncaQBcAn+sxvV5M2Rq1RNHjDWxX6/X/5CJP6S6fgKB1toMc5rZ+E?=
 =?us-ascii?Q?+08=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ogVUN2VWE33RGraj3pv7FCohxKjmvoB9X5WWfQN67ID/amdWl/uYAsNIvC3d?=
 =?us-ascii?Q?iPxe/toEcmMbzybt5Udv8AAJAtBtsjuouacsbN5Kzfz46aK/YF5go2OP45ad?=
 =?us-ascii?Q?I311/KaaB/aDB4v0qC1lkj+dXejF4oTNBoREJsgTK7ET1QtUK7oOBQGrYDbq?=
 =?us-ascii?Q?tdxj1ghJgdNmpDS6MxWhc9Pgkq0k+1tPzE1dtgAmYLpmozTCs8IPa74/6w2Y?=
 =?us-ascii?Q?tpn5u+KSEc6gTaXFG5mwpekO9rrXsdKA/4ERSR6ss+JZBpiZ9tBO45BEyA5Y?=
 =?us-ascii?Q?ehcP+QgLHGjpvYWIM3oSHvU3EfvI/1FdwqSQ+0EaseKhIc5pxKayWbP/uZsR?=
 =?us-ascii?Q?t/ipjtb6v/27B0etfw7ijDi1FjgqNoawIS1/CGUFy3O4KJGpdjs//8us4seJ?=
 =?us-ascii?Q?SwMW4m5/VMAwjSdVHaqBM0/yDG+bV18LydPbgTxY1U6C9MwyVrBLNMzDr3q5?=
 =?us-ascii?Q?htPZDhWE1tRQTGgf665sRfrFvmjqIwjSJTA/lM+MvvuRh1oDwKoeITUdz7P6?=
 =?us-ascii?Q?aq7dASaNSdD+Dn0nPZqWGqDkIva825FpkrNIZHUF6r8dtfBS+LXLXx2wNxGS?=
 =?us-ascii?Q?jhN9AjAlUXTNapWLcH04r1ozVxaYqrW1TRTzA+eLqAQA/MnHQZ7UKCn2alnz?=
 =?us-ascii?Q?cOD8SE/FLrfF85yIe9E1WDHI+yORpafbyamYWu2G2GtGb1yA0b2CFb8d3u7h?=
 =?us-ascii?Q?84BvtqjA5xjWIwNFWeZKqPajS/W/LnYGw6210R9Yq1UqXEflLtAoLUQXHAwK?=
 =?us-ascii?Q?DGbQhxu9hIW7F3x3hFydTWi1r6vmSK5tzU9ZH42Y0VHYjMtfM/ze+7MYBAsW?=
 =?us-ascii?Q?/y5cd3qLmCyM3ByyNtyPvoSIVvXwcKiD9q0UNJ4V+OtSDbUrlVIIpKuccthX?=
 =?us-ascii?Q?UCHkJTT1SuELBAdBEIt387rZd6rQVoI/4RcUTe3OEMEFINdGJlW+S6BEuk7t?=
 =?us-ascii?Q?9+MF/em4MYGh8ajYoHu+sG4IixQP2Oy5qExeyFMyVwzqNfeBO1JOC5Sna3DX?=
 =?us-ascii?Q?2A66fxFicy6TRtpkgxzPPIrKcfWOfNpDEEgaKfQ8YizAxaQ88ttp2Kua5jmy?=
 =?us-ascii?Q?vkJS83OWPXVCyatcESkW2CqsQoLMZloLkbnQarBOW9cfGbmAda0kyFN+LWr8?=
 =?us-ascii?Q?78dMXqjQ6Jjxn4TrDvAhShuj4PyhPvqkjdyJX1pilSRt1ZHYbRFcruEa4/Vb?=
 =?us-ascii?Q?P6OSRD3Eib1A/jjXYnnKLaF4tSTJBvvyYUi8qkQdHBP9xlf9amYq8ljQl9o/?=
 =?us-ascii?Q?5xegeg3o1riGlhnYKLmGYiqcyAfCojKJO9iuPjdzAJsOkZV/SbibHV2Buioq?=
 =?us-ascii?Q?K0Wlk3NApiiroJ0PlVbZ6HXqHhZPCzbTQKOuwTFmqWufs04Hfce8qGoWtImT?=
 =?us-ascii?Q?NYro0cxVT2P71Sd3jnmURqECJ3W8xp8oyPCXDF08GSbXw/TSjhI/HwwEKw0q?=
 =?us-ascii?Q?02LFmkA4V1aLS21HjY767mx6zNc88T0d48TTSGgIjdl0V+tiQv6GRBppomZ6?=
 =?us-ascii?Q?r0ePwmnaL4DwcmCejkDJ883226z2Sus+tJaWlJZQyJNHjrI8KVPKs943qvJJ?=
 =?us-ascii?Q?4XkQJuZiYb3BDr8ICLqI2Lcs1SPIqTOAnFsYwrZpH54KddWIxgRPzBh/ImtO?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b8c2a78-a47a-4aac-e891-08dc9aa36b2b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 14:29:44.9986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZcTi2tB3DDDASwEj2+XVQaj8dA8Y7e/JfGp7tdhvJrnvLISHjGud+nHg6IaU+XPJPb57sySRAXQa5j+xydJB54snpAebSNbU15wfXV7xsr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8555
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

On Tue, Jul 02, 2024 at 01:01:28AM GMT, Patchwork wrote:
>== Series Details ==
>
>Series: Reapply "drm/xe/gsc: define GSC FW for LNL"
>URL   : https://patchwork.freedesktop.org/series/135623/
>State : success
>
>== Summary ==
>
>CI Bug Log - changes from xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299_BAT -> xe-pw-135623v1_BAT
>====================================================
>
>Summary
>-------
>
>  **SUCCESS**
>
>  No regressions found.
>
>
>
>Participating hosts (5 -> 4)
>------------------------------
>
>  Missing    (1): bat-lnl-1

I guess it didn't really work. +Ryszard +Ewelina: Can we promote LNL to
be considered "a reliable machine from the CI POV" so we don't have
"CI.BAT: success" when LNL execution is missing?  Or is there any other
reason why we report success in this case?

thanks
Lucas De Marchi
