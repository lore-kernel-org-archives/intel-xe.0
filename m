Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDC3C3DA59
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 17:06:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F75610EC6B;
	Fri, 19 Jul 2024 17:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="alMsS/wM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E1F10EC6A
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 17:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721408774; x=1752944774;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zwritQQ+qjVZTnWPxadYEWX4X/q8wsxAW4c2ooyCLBU=;
 b=alMsS/wML5OT9DL02XNqLpKPQf9XxcjlhbOwXnRrGxphIN+YzrmyNW0m
 S3szFBeq4cWltOZyB0dJUWa6aXgXfA5GPEBjmdj0Dnee8E6TTsvfKlN9S
 Ux/gTVc/FHtmFlNU6UJhpr5cMowxGxzcqC7LbZOOK8iDjB9CtuKVbYb2l
 LO5CZDq6dYH6vw1SWi13bKwSZ+d2c5wb0vuW1jT99KsDFPuS0qE3L+Uhq
 9fwcvo7VUqDQdM7kb9zS0fRjl9E2qTf5xFilwH9kWiCFY1TjwPzUDz9O+
 oAEtqazOnzXrK0dlPwHURapUaMC24ShviP3o0+1amXQ624yJB8LMbUCDF w==;
X-CSE-ConnectionGUID: ZMT/LYemTbmJuvza/xDXSw==
X-CSE-MsgGUID: IfJ2qFpLSkGV6or48uIdoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="41559006"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="41559006"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 10:06:12 -0700
X-CSE-ConnectionGUID: yv4vc5wkQECm0XVEpSBMnw==
X-CSE-MsgGUID: 0QetisoEQJy4f65quY2Bew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="88657715"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jul 2024 10:06:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 10:06:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 19 Jul 2024 10:06:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 19 Jul 2024 10:06:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdvVTR6hQnpKWJeHwVh045sp0k/QGtqlgbmuIHkCptInd8gEWHs3z58w5rj0NPvQolcQwMWdMKqc0YnD3hBuU8zwkULS4q3rlRChfCtejifTPJnGRDA+AQXV2RLbubKlgInegl2pVYvRKQp8ektu0WyiR3olnmTHZhHNCc8pQRqRJStdIumYpDZXFxoUR5VILAHYz+5RcqeWUSiIGHmDyTAMLouLm61ZcQLG9wDmmfi10ihEXWxMZ1FuGqyOpKJ6MGdYuIeS1+HovxxGj0E/a08tt8XdSJ0HLRjeRVrFGbpi31wecZzsLRJ4PVw9Ueq3Zj2ko3jsy5L7xOImZU2txA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGi354hWLG7NWbmqN4ya1M1GM6vVfBCNPstveeShd+4=;
 b=tfxb4/t9jzivF8frg/3khuYBhUV5Hj+JVNMaUjAf2nh2UXmUXWEGHDneQ4ukMSGzHNfjxnVNPgVgWOsEgKfaCllgrVZTU01amO7g5a5/KEsrUXA+TVXGIq7lQmNGOc+K6zZ0zwjRZfxfOaNgzIXLwrxEg/+TIVKHeZp0SyvMO6b5uSxr8IWuTs5QzTyl9DdBcHXVOkuZc661IGJO/k5SmWz0zUJn0ApV6iFpzlviIdQSwHaoZuSYypfCPY2hniAj6Sx71bq5r0AXV5Kx++YzW97YVgse9idLiPD4R72ileamniqL3iyaRKj/DmAxM/9lRx6c7Lm5B6osxHio9sIK/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB7689.namprd11.prod.outlook.com (2603:10b6:8:e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.24; Fri, 19 Jul
 2024 17:06:04 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Fri, 19 Jul 2024
 17:06:04 +0000
Date: Fri, 19 Jul 2024 12:06:00 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/7] drm/xe: Introduce const cast helper
Message-ID: <ggowzqb6luh534mzkx26x4h7fgedpjrmih74xm4czezjoryqwm@wgonpqaytbit>
References: <20240717195155.442-1-michal.wajdeczko@intel.com>
 <20240717195155.442-2-michal.wajdeczko@intel.com>
 <gs32gpbe62ph7j3l7akrrtcc4z2wr3kv7xnezb3szwedcaezds@hohvqsmqilc2>
 <280022b5-cbb0-405c-8285-92335edf5d3b@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <280022b5-cbb0-405c-8285-92335edf5d3b@intel.com>
X-ClientProxiedBy: MW4PR02CA0021.namprd02.prod.outlook.com
 (2603:10b6:303:16d::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB7689:EE_
X-MS-Office365-Filtering-Correlation-Id: 58851f99-a88d-4e1d-4c5f-08dca81512de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|27256017;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?qM9kY2kpl1HZS6oMM8TxX/G0mE6btA2MLpHn/1q31Relq3Hmh+7wrUFt1J?=
 =?iso-8859-1?Q?rGWjM8VGeOZ/I+HgIWufkUQN+QnkCDLKRdOjO/YvxUgQaDg/Sf6JAB31im?=
 =?iso-8859-1?Q?CbopkZyc1h3QOO9ai0Gkln7KMoup8r7vtGwtb3+n+mp1xe2Egz2kCCfQRT?=
 =?iso-8859-1?Q?hBig3shEabXW7bVUqEtuAZj3W18k9xtd5z/Qk4er8WYOuKFysqsMGKLyHC?=
 =?iso-8859-1?Q?kNFsWhRlIhUSj5mGmSFPoqcbIqXzqa6k2PUXvweGLWMfuXqqPr8NewpGa9?=
 =?iso-8859-1?Q?x/Ep9hiPcxiFkGl3p0nk6Px/sHEquciaYvsUjjgN24vWW+LJX8/2pjyt74?=
 =?iso-8859-1?Q?k59Kemp3GjMaydZpdxJo3IBeZJOJVNIEfpYC/SMTRNYCyj2TubRgKG5CI2?=
 =?iso-8859-1?Q?0LwhkD8nVyj4VIww+8o2j4mrdI+rHoBg29jYcYcNlhWq0AYyXbFV95yohf?=
 =?iso-8859-1?Q?OusqueNqE/uDj+WQcsCtUjwFlihs6vvb0HrKFNTpkThcgCpDxGo4LNseiu?=
 =?iso-8859-1?Q?LKaWkGXVvJsRJROJWAiZSXkMce9atRLcju+AvXPZEDNpcEmEmW+zedyPOy?=
 =?iso-8859-1?Q?08Q9Uhe4FWU5feifXzCFMDe5ydgdTA5fP/a/O76y/Ow1Byz2nLyOP6BCey?=
 =?iso-8859-1?Q?YfN39i4hZvAz/vkZVPDd6Jl91a3FPunEtA/Ef49/SOkJ3oCPVFKBntY+7S?=
 =?iso-8859-1?Q?hgH+lamtoRxtyT5wbQleTGzumQZIQt/O1UIKp2AfJrIe+r6ZOCfUrkcgkj?=
 =?iso-8859-1?Q?1IB4y5sSjPQqISTQvlSI31vqvcphgk1bTYiHBW0GoZRGBvSRaq2hZWVT2q?=
 =?iso-8859-1?Q?HoVL7O9rNv5CGY229OTF8t3/CZD8H3XJyFRAZNaGf3e3613qAJ+8aDW2kM?=
 =?iso-8859-1?Q?wEDVot3/q2cPSl3Bv2FBlUu8aKc78zN+N4HohsVIPVw/u3fPv7qbPIfSzT?=
 =?iso-8859-1?Q?kkLvo0yte6zJ7VbO6/XcCrjVXwsJT85EVTkv+rquWUQpWULxLUTwivAKDB?=
 =?iso-8859-1?Q?f/ipAMxlAQst4BeFOgKiABwSyj1JDxemUZajhCpl3dOzBzZ3EyH6JQHNTr?=
 =?iso-8859-1?Q?mdKfgFhcad9624jZwVnkb73Q8x+4miK3bnxTgj1bPc58hAN4FMXykzV07W?=
 =?iso-8859-1?Q?sUG5uKWodNg2cP+2bs/GBnTqgQohwG+NdzABnjvDKqYqFf8yb/cFueQRnU?=
 =?iso-8859-1?Q?noaU2EglV/7UrqCfeoreS+NH02Rt8XKlvR43ifrsWlkT42AvYfk/ze5v0p?=
 =?iso-8859-1?Q?98ofek5ORhPUCYXDgynM8oYeNlPCnthZT3VcVQQxCDAtqdjVfoNY1T26Ck?=
 =?iso-8859-1?Q?Bem0A4BjS/an3uEfaX7MTPXJy6N76ZNAjQk0OFCdMEyKMKeUCNj6eK4nhZ?=
 =?iso-8859-1?Q?DnH4VtoCO87iX/1FssghQQ0WOpgz6Vs7YWy0SRkLSbIp78Hf1dghBm8Bb2?=
 =?iso-8859-1?Q?JxS7LL43YrAT6goOKEMpzXUKuVG6mTKAeZa5Aw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?AdQVngM5XqIjibbZzSY/kuRILVzjZsftYg6AMxrahiubna1oM2n7bnWTZN?=
 =?iso-8859-1?Q?Bi9LegqAojrLAXAErZoQ06jpBedlmSluljCiy3ReCICFReOgrcyxan9KKa?=
 =?iso-8859-1?Q?nGvp4LtQE+sqp/KU9DSyiW5Nn1oihkiAi2NXNL/oAmsqryHrPLL2xiIQge?=
 =?iso-8859-1?Q?YTsiYoBi5OYtGhAscQ58r+DUCVSwtXmkVsb1yf31FEaM9/alq0QeaO1FcW?=
 =?iso-8859-1?Q?2r3HB3RgE0sOsC4rRMS0yVEn+6hqTR3AZH61Ld1EaY/5h1tx3meJC811lc?=
 =?iso-8859-1?Q?wF/sc6Yo7XRkTJZ4cqerrjYRdygxwuvy6vG8ZlYrO8DVxTnmt3nkq0VApl?=
 =?iso-8859-1?Q?HzmywoQoIPytsrbkQ9nN/tthCWwwEh7qe34+RfRKKJHbh03A0qsz0mguLn?=
 =?iso-8859-1?Q?PmcmwdRwo8DiVUUjwCEm8K0Oy7m4e+D1IEwjdP45+h6tHJQo+iuSDRDOAs?=
 =?iso-8859-1?Q?etDQ0ieBeUMdmReVi/FIhyJtEHuyF3D0xTwBOPB2TDMAlBHklcv5ghTrr5?=
 =?iso-8859-1?Q?68wFTnaGrFajqqLhsqS4a8XKdfyxVjIfB9RkLK45lKQctPSXxblBtaKhuk?=
 =?iso-8859-1?Q?jyN+tewAn4t3TxqsmWcG4NjAaGipF6xP76zOKUQTbTPpRoFKFGlucAHiEz?=
 =?iso-8859-1?Q?XB1PCQxqQOhS6MJ5/9uRu3VqcoR8T7AXFRqxOpTNHEjnNGpMxjCtPLGC/L?=
 =?iso-8859-1?Q?dhk+GHBVcXYcMPKL9b0qCqIxdNOMAIvpq9HeoHeoKzfj3n/AyCHY43moRV?=
 =?iso-8859-1?Q?CnlN0oETjG0ugXJ+T3kjkOjxmIvxtvhI8eKMifrB1nlVVX4Pk/ICCQA7iH?=
 =?iso-8859-1?Q?jgtgXlAk/54O9fLIMDdYPsp3yviAQCtdaDSZPWciXlXALm6/QYQ8gg7RgF?=
 =?iso-8859-1?Q?xc4QPaoYTCxcnWwjlWzy1Ab0sx0L1l+tv166EoxvqXBE+kA5Qcip+/sPmu?=
 =?iso-8859-1?Q?ZnRTAMHcUfVJl2QYy98ZDs8u1dHrhtHivU2QYxeyLFYaLhSflJzOi0oC5M?=
 =?iso-8859-1?Q?y21/cV8aSw2TzBr9m2VbNpf2aVwa87at4Y9DT+M5TM+qxF2bnvudpQkIhC?=
 =?iso-8859-1?Q?kHzMyBqqyNj3emjtQ7nqN1ZkkdGKBxnpQaXtNEF15o54e/VdE+MLP2Zna4?=
 =?iso-8859-1?Q?k68/TfYAqQueDoj0AkFte1Jpal4N/kJSzb9LFYIqB/IlhbCjk8+IYO05+Q?=
 =?iso-8859-1?Q?GiHQzL3pvbuTAv9tR6T/z2vvXKAzpAFOWr29yOh6J3F4fCezoodayMG1K/?=
 =?iso-8859-1?Q?DuAZNByrsN/cCVmi78gCCdWa/T2CFoUU9TGZc2Yw8FDU2ASWCaT0vTBCxp?=
 =?iso-8859-1?Q?jOWIxQsA6yv62M8viPX9JPGQ1pZ7abhOP1NLxjrtq9zvDf6wG4D7hFfkTb?=
 =?iso-8859-1?Q?K5wVAvyZoCWmR3NWbRxeKuCaCmn6Rusd75sF8VcDNRt3l7m6Z8IIbYT3xP?=
 =?iso-8859-1?Q?H3rVgZpo5fEVI1AwHaRTW54P/uizETBhcHkHKpqKXP4+nJ7jrcN0OhFWr/?=
 =?iso-8859-1?Q?kH+R6Hz1/Wz6huPunrb7bB79QEV5cFB3asa75CUCuWd5yOemlhmwPaoKoN?=
 =?iso-8859-1?Q?WeV9+LRNN2CeM/PEMoEkqKy2l3/pioxSRW+nhLqMtkNy1z3MuBwXKIMgsw?=
 =?iso-8859-1?Q?PJRTyEiUdYZu6TDEoPSHhrOvfPV+Q74m5YKvDeRnK2luZYdDO8WXpgcQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58851f99-a88d-4e1d-4c5f-08dca81512de
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 17:06:04.5879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q/gk0Cg21CI9dIJr8PZLK1oV9or3QT3tgCZX5E/1ojtGDOf7VtoQlVeSEcPttD9K0zAwPPzc7BmJGAsWe1ab7m2KUI2mFGVmyENtzhHWzyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7689
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

On Fri, Jul 19, 2024 at 06:55:43PM GMT, Michal Wajdeczko wrote:
>
>
>On 19.07.2024 18:32, Lucas De Marchi wrote:
>> On Wed, Jul 17, 2024 at 09:51:49PM GMT, Michal Wajdeczko wrote:
>>> Typically we want to preserve pointer constness when converting
>>> from one xe pointer to another, but in some rare cases, like kunit
>>> parameter conversions, we might want to discard this constness.
>>> Add a helper that we will use to clearly indicate our intention.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> ---
>>> drivers/gpu/drm/xe/xe_device.h | 5 +++++
>>> 1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device.h
>>> b/drivers/gpu/drm/xe/xe_device.h
>>> index 0a2a3e7fd402..c2b1f9f066bd 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.h
>>> +++ b/drivers/gpu/drm/xe/xe_device.h
>>> @@ -20,6 +20,11 @@ static inline struct xe_device
>>> *pdev_to_xe_device(struct pci_dev *pdev)
>>>     return pci_get_drvdata(pdev);
>>> }
>>>
>>> +static inline struct xe_device *xe_device_const_cast(const struct
>>> xe_device *xe)
>>> +{
>>> +    return pdev_to_xe_device(to_pci_dev(xe->drm.dev));
>>
>> why are you going through pdev_to_xe_device() rather than doing what the
>> function name says and just remove the const?
>
>IIRC this was my initial way how to get rid of the const without doing a
>forced cast and it was before I decided to introduce a helper for it and
>before this helper was named this way ;)
>
>and while explicit cast is more direct (and I can still do that way in
>next rev if preferred), then it will be just pure C language concept,
>while the potential advantage of doing that through pdev_to_xe_device()
>is that it shows that this non-const xe pointer could be still obtained
>indirectly, so it should be safe to do so

it just relies on to_pci_dev() dropping the constness by using pointer
arithmetic to get the outer object. It's as safe as doing the most
obvious thing for this particular case: a cast.

Lucas De Marchi

>
>>
>> Lucas De Marchi
>>
>>> +}
>>> +
>>> static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
>>> {
>>>     return container_of(ttm, struct xe_device, ttm);
>>> -- 
>>> 2.43.0
>>>
