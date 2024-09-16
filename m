Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99D4C3ABB2
	for <intel-xe@archiver.kernel.org>; Mon, 16 Sep 2024 08:46:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6426310E30B;
	Mon, 16 Sep 2024 08:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J+GZHYSZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46C710E30B
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Sep 2024 08:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726476380; x=1758012380;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hq8ev0HSnA7g18EiXl1zhqcCXRQheCAWKIvqYz38lgo=;
 b=J+GZHYSZ+mFPdquJvxAG1acJ8jpS49hHqlpi6p6WgkJVAVvwqbCk1jOg
 26jVhLbXOWDnuYtcBO5foybv8/K3h7RgRrBNKlepjFDXkh6i5sRWcZNm0
 yGBSeOMxenKyuqnXLDLR1OuJZ/239l2TVaxxui026QHfKlz6Ty93FKTHm
 m3Cp89IR5OmSyqggNuN41lqG5NsJ6ULH24FZKimrtODQJ9CFW9NQu2U83
 KkqTZbJ8cyj8LA93zB5wiz85EbofAk+frWfnFAsiucw3GBuC+5BiaZY9p
 20gEL3c8pbMpVZiAUoMtFrjxLL8cKJ3/7jSy2do1Uj6OlA+bb14w44Pvb A==;
X-CSE-ConnectionGUID: eZGWLR82QJWnox2vTwfS7g==
X-CSE-MsgGUID: rx1uEk74Ra2sCK2+3iM6nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="29196452"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; d="scan'208";a="29196452"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 01:46:19 -0700
X-CSE-ConnectionGUID: hXrHpC8GQAGJH0Hj2mM9vA==
X-CSE-MsgGUID: g7PklMNnTgCv1iETy9VzKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; d="scan'208";a="106256657"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Sep 2024 01:46:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 01:46:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 01:46:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 16 Sep 2024 01:46:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Sep 2024 01:45:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xMESMxj2Q70m11pOb33ASObzq90kI5fC5UW2j4lTLtisn/07zrtcnpprjQwxHfVxwkPz8r+8TM7sAlJms4O4CD19GaR7JFlir1swTmUfPrPvzL1ntVBx9fy1Rp5Fj4EjymrXjLyU2y1VVpSK55DsV55ZXNTLiWCyW9Qye2/P9S1x3OoyHDgmYQsy0OK4XP78gWXwIlPaYp//vtB7+N4fnn/LdJYuixj7GS+H+CcpquhnxKPrRYrMELm6cBXLO9rLQvjZOkRgmICgKOBdcVysY2Y4TfaAkOXLjqFkw7fgG+Mv0bmHoXm/jhPQ7/pQgG6fN2fnCEcfHe0y/z3epOwlxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fw7Xpjqzzr0/jU3K6AI6TY3KZPFq+3P34vMGOTstXEE=;
 b=i8H5EXuz70Oq8YrrKz+ahYuxIrxdQzD0DQ+0m708Y6R2okHckBWzy6vcGfy6t7zmmWtPIcbXTg53faMLoZf2ocS2OlC+moYVOnLBTPRtxACB1WeKoGtJfPOKNO4FM5oUN//DsLO1Gg+8Za67x8DGhqmA9tWnhfRaM9odJLUeZ7Pg9sg7xLm1iO2mx9acAl95MqK9jm92ZoQRQrM3f9tKt4HxLn3UJspDtWBNowVGKcgjI7M9tw1iYYBrgNtfUILwC8fwmtnksmS7WhPcntaRX4e0usjgqtZtb6cbR3nKh5drAueS7kWhaeDtvr/TxLUs9c7kHOzzh+acgRp76WHKUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA0PR11MB4735.namprd11.prod.outlook.com (2603:10b6:806:92::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.22; Mon, 16 Sep
 2024 08:45:45 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%3]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 08:45:45 +0000
Date: Mon, 16 Sep 2024 10:45:37 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [RFC v1] drm/xe: Use fault injection infrastructure to find
 issues at probe time
Message-ID: <ZufwMSTB4IlNcOKX@fdugast-desk>
References: <20240913143305.2262927-1-francois.dugast@intel.com>
 <ZuSdddkrFZgCDkqt@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZuSdddkrFZgCDkqt@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: WA2P291CA0042.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::14) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA0PR11MB4735:EE_
X-MS-Office365-Filtering-Correlation-Id: 68e729a4-30ef-45b3-5654-08dcd62bf456
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?MEsd+mMGjRX9RYpo51r1+YHC4RsSXqWv4UtBPTy9/jkUT315UE0B7YWSfa?=
 =?iso-8859-1?Q?wr4bKaZD6wAPUeX+McUD/upOzXOsQEYNRlk08w0lUZCOpct9XhtfuJ03fZ?=
 =?iso-8859-1?Q?R4s4aYso2mg44bCkLQHHZVD5++NQkPD2p7uLfB4UztQZ+yfY1cWkTYbrBz?=
 =?iso-8859-1?Q?6sQ+gXwkyqUNf3mWYi1WabyBodMa+ssajRbaHVnIHtJupCDmxtdatz/qKZ?=
 =?iso-8859-1?Q?c+8plmXmEo44C7lUkw4AlH2cMbZfkrC9i5RSdSAaHDgXxzRF8PYCyM4rrm?=
 =?iso-8859-1?Q?wokRI+/TskMMwzHGd5bPMJ6MGaTmE6dgHZ/dbvDvS51fFN0VqRWzBN2aWP?=
 =?iso-8859-1?Q?EoohZu1XHWMmAThS2Xb31OF1TKwegRIm10Jy1an8qh9bmLGNfESiwFJfbS?=
 =?iso-8859-1?Q?7dkW+aBD0cjco6pdWYYGiVG2YryZI6Pq17Y5HRHgXSIuSILaNJZ1SWBuzo?=
 =?iso-8859-1?Q?t27kZAf75OoL6CC8EqvQVuyW01xrGJfxoqqimHDjEVejtcAKMCE4Ov+ug5?=
 =?iso-8859-1?Q?e9nRM3x5SoEwBVoTYz8V2lCTCDjZaZZPfANCew8nu00lYXs3Bi6V8hm9SE?=
 =?iso-8859-1?Q?luQY2EuCa0u6iIMMytxA+is/e/NzIiO14SEPETKm2SqTKuMb2WWwfTU7hH?=
 =?iso-8859-1?Q?Yez5j1FEE4qmyyl2wjeF/wWrX7nHGxiKzxUvUc+eg6ezzUIM+lDxl/HJFz?=
 =?iso-8859-1?Q?cbQImILnSLFIp9gyz05ahCzVHROcQ/hZ3c5FEUMOgzKIs0l5RxtIZ5UOUJ?=
 =?iso-8859-1?Q?NaHq7PoMYpbPqHutgvZLdwHnVZf8hfP+QRHUsaPCQaRQGTSfOXHiUA24PN?=
 =?iso-8859-1?Q?BnY66eyW5T9PctIEV8LSlnAcP+a13R3H4Mm5ArsxxqEWsu1An9YzUrqK/r?=
 =?iso-8859-1?Q?K8X81LoMBKWtGPGLtBv2J+iYR8UiKI3SOhAKSMRZ206yFB5mLMV3ktATwk?=
 =?iso-8859-1?Q?i1rk0iHm+5vWhBTcosPvUW/kCKDG89Izl2vlRi1yDE4aVf8QSMZ6uZsG4g?=
 =?iso-8859-1?Q?AgKrH4bJzqyhZdvp6B2lFvKkrnih3MeMS0UEqcCWAKu/TjQvfZLYn093d1?=
 =?iso-8859-1?Q?J+xkIQvhElubYuq++qdWf8rQwGLWtysj9FhjqdWEgGgfYdg8LqiK00KKpN?=
 =?iso-8859-1?Q?8llj228O6pds/MkX8oinXMcd6phPoPmZOel67fgtceOvbRJLeOgkPn30lF?=
 =?iso-8859-1?Q?7RUc20qshehfwIy3qXkCJf54Dr/ctaTWp+p4WxkfJIiueggi5VRa0oKVHJ?=
 =?iso-8859-1?Q?t8ZoMGNaRn1Vb0UgPEcU4qjuJTAJYfTFG3YeSlo7e7aesl3kbjAG2PULwA?=
 =?iso-8859-1?Q?rlnXUGUr24tF+6/G/agviMTAP/T/JhCJ7JV9BIChE5ZmSes=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hizlEaKS7VzNttEDU0fhPA2HwcPeRTMQy0Vx9RqrvWK5qOJdlIEHU8tznO?=
 =?iso-8859-1?Q?Ub1yGkiRHjYS/g+OLkR5NXP8HpYAF+w/f5alxDwXVx5hFBacfgIcbFs/1R?=
 =?iso-8859-1?Q?r7Jok5a16xdB/Ix2gZLaBRpIlYv5BEzoBWE4zzoH7+ggljqwGMggc2qgmO?=
 =?iso-8859-1?Q?CIi02V/pHaB8HAINvOsGpNJ7KVO1hnJqHSsCUTYTceT0/uMHr34csX93BP?=
 =?iso-8859-1?Q?/QdwZZCWhzKFD3qg7k1AGelPxAYRj8Yq7Ro9lbem6Os+SPsFt+mZnNHk+P?=
 =?iso-8859-1?Q?RU54VbyzxKzzKzrp9lIfyrPAo73PgPr4IC5pSHRv+ln3XiA7+16p/cneW/?=
 =?iso-8859-1?Q?SG2myiIeW9bjiOV14z52xmIgJMVfT/uKXfLnmPGY088tru7Ur8YPq0qO9Y?=
 =?iso-8859-1?Q?asq42326nR+TX/3d7dLZ57ZJ0UcGs+atsqvPIbseWoxecK18goUx9jkCJ0?=
 =?iso-8859-1?Q?6sF/62GfjJouMpMZfgS+h8WM+mlknWwmiI3ApHsv25FAbzgSPo5gXA6efp?=
 =?iso-8859-1?Q?5hmwH5Rgh7M1bEYPt7SU0WpgPl7I3kKacfDqskNDSWLqIRbDyTMdpblfg7?=
 =?iso-8859-1?Q?+A4PhnJ8nRxmdHl7IsXAOiUV8sNARbXoCXhcDQHhBx4tDYJ1Y1GE3xFN0Z?=
 =?iso-8859-1?Q?ntxEgjRwiTSgc5G8O0Ofc3FuzKMUowUXKVmc9WPCNNysfaMsaZtc/6Gome?=
 =?iso-8859-1?Q?5LJjUo6uw1+qdhVzswf+36ZgyjEyvyRNWxW67Xw6slEz/q+nXr67xAtHIm?=
 =?iso-8859-1?Q?nP+pB9UlP2/SkHXiCW+UmGqvy6Fyrh/EL5DzUyXy4UKGYNls4/LEkFq0se?=
 =?iso-8859-1?Q?5KTmISqhD5FVuFu7P208bLHcKijpZ3GUX2DtlQXDfgqVrmjtYeDeEPfOpT?=
 =?iso-8859-1?Q?LS3Pm8O9w0CZ9u4Gz4cpPTmh19l9Cn7MPcmFFySgNklvIGgcRG+Q42jFJy?=
 =?iso-8859-1?Q?E7xrKmFArzZnYHFHeqDkrYQIJMn5lNLGW1migSk/ytayFBLidUDSd8W0l5?=
 =?iso-8859-1?Q?h2aN5jh0326hNL0uP0DGqeTzMoOvz/BVPNx2XFr55lqLuDcBdAfVzfQH3L?=
 =?iso-8859-1?Q?Am70ftdGWaHH7ZHy8Vw4JZKUct+jb9jneLkhL6JgmYBZfUyaVuhffomrXQ?=
 =?iso-8859-1?Q?nyRkJdQd68dVFQXAL/yrKZAXUFpDbtdGJ+uH39ciFvD0lix8GRh49aXZM2?=
 =?iso-8859-1?Q?ALa09e1VNx8nM3nvHFte4OoxokU1RZ2J9rDkiAS4mZyjiqB2LLrCizZry2?=
 =?iso-8859-1?Q?S1GbLZSZc2myVR/8V9xksQyCKqv697UyutiRTiipd4xbaqCV1rEZWy2A7Z?=
 =?iso-8859-1?Q?VMkCL46/Ktsyhw4hx7L7IYWxJjQl0+rAVi4Li8UXgKw38/BO05y42G9R29?=
 =?iso-8859-1?Q?g+9nSA+SDyhcs+CmIHwxASZeE2jERiHGv1t9y1Dg5SpS9oLR4TwzBVVedT?=
 =?iso-8859-1?Q?UlufmFDyvx8HJaBshGFO9U561OCs9WuGDfFmW1iUCX/jMulc6QCXV85gj7?=
 =?iso-8859-1?Q?vpxqXnWKBi5vtrAeGma/BIyD7MIM6fWIyppt2kAzs0FLMghDzjJdftBndF?=
 =?iso-8859-1?Q?dhXy5Q9LuodAELKhCyrX8xvAVvtVdT5zVwM738de5ehWox+4YB9+csRbQa?=
 =?iso-8859-1?Q?hqXapNikYfxFbCXTJJ3blw2AV0TwXi74iOK7eesU7Iu3eZ9qHzSkkP5Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e729a4-30ef-45b3-5654-08dcd62bf456
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 08:45:45.2550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5+gQAp7OPuTcNICSnU8X29wm8k7eDc1ECK9iNqRslFPZtUu4TXhI8LVUSmdk4ZzJ6ERhkb2wx0EKVmP1a1HT6PLRHQiXMKkYz3HVTlI/ILg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4735
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

On Fri, Sep 13, 2024 at 04:15:49PM -0400, Rodrigo Vivi wrote:
> On Fri, Sep 13, 2024 at 04:33:05PM +0200, Francois Dugast wrote:
> > This RFC is a rework of https://patchwork.freedesktop.org/series/137314/
> > but instead of importing custom macros from i915, it makes use of the
> > standard kernel fault injection infrastructure, see fault-injection.rst.
> > 
> > In particular, it leverages error injectable functions with the macro
> > ALLOW_ERROR_INJECTION(). This macro requires minimal code changes to the
> > faulting function, if it meets the injectable functions requirements:
> > fault-injection.html#requirements-for-the-error-injectable-functions
> > 
> > Unfortunately this is not the case in most of the injection points of the
> > original series, so a wrapper is added if needed. Only a few examples are
> > shown in this RFC to discuss the proper pattern to apply.
> > 
> > The return code of the functions using ALLOW_ERROR_INJECTION() can be
> > conditionnally modified at runtime by tuning some debugfs entries. This
> > requires CONFIG_FUNCTION_ERROR_INJECTION (among others).
> > 
> > One way to use fault injection at probe time by making each of those
> > functions fail one at a time is:
> > 
> >     FAILTYPE=fail_function
> >     DEVICE="0000:00:08.0" # depends on the system
> >     ERRNO=-12 # -ENOMEM, other value might be needed depending on error handling
> > 
> >     echo N > /sys/kernel/debug/$FAILTYPE/task-filter
> >     echo 100 > /sys/kernel/debug/$FAILTYPE/probability
> >     echo 0 > /sys/kernel/debug/$FAILTYPE/interval
> >     echo -1 > /sys/kernel/debug/$FAILTYPE/times
> >     echo 0 > /sys/kernel/debug/$FAILTYPE/space
> >     echo 1 > /sys/kernel/debug/$FAILTYPE/verbose
> > 
> >     modprobe xe
> >     echo $DEVICE > /sys/bus/pci/drivers/xe/unbind
> > 
> >     grep -oP "^.* \[xe\]" /sys/kernel/debug/$FAILTYPE/injectable | cut -d ' ' -f 1 | while read -r FUNCTION ; do
> >         echo "Injecting fault in $FUNCTION"
> >         echo "" > /sys/kernel/debug/$FAILTYPE/inject
> >         echo $FUNCTION > /sys/kernel/debug/$FAILTYPE/inject
> >         printf %#x $ERRNO > /sys/kernel/debug/$FAILTYPE/$FUNCTION/retval
> >         echo $DEVICE > /sys/bus/pci/drivers/xe/bind
> >     done
> > 
> >     rmmod xe
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c | 37 +++++++++++++++++++++++++++++++---
> >  drivers/gpu/drm/xe/xe_tile.c   | 18 +++++++++++++++++
> >  drivers/gpu/drm/xe/xe_wopcm.c  |  3 +++
> >  3 files changed, 55 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 4d3c794f134c..2db62aa45b39 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -6,6 +6,7 @@
> >  #include "xe_device.h"
> >  
> >  #include <linux/delay.h>
> > +#include <linux/fault-inject.h>
> >  #include <linux/units.h>
> >  
> >  #include <drm/drm_aperture.h>
> > @@ -300,6 +301,37 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
> >  	ttm_device_fini(&xe->ttm);
> >  }
> >  
> > +/* Wrapper for fault injection */
> > +static noinline int device_create_ttm_device_init(struct xe_device *xe)
> > +{
> > +	/*
> > +	 * In case of error injection, the flow is modified because ttm_device_init()
> > +	 * executes (likely without error) but the return code is overridden in any
> > +	 * case to indicate an error in ttm_device_init(), which likely did not
> > +	 * occur.
> > +	 */
> > +	return ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
> > +			       xe->drm.anon_inode->i_mapping,
> > +			       xe->drm.vma_offset_manager, false, false);
> > +
> > +	/*
> > +	 * The alternative below would also change the flow because in case of error
> > +	 * injection, ttm_device_init() would not be executed at all.
> > +	 *
> > +	 * int err = device_create_ttm_device_init_inject_fault();
> > +	 * if (err)
> > +	 *	return err;
> > +	 * return ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
> > +	 *		       xe->drm.anon_inode->i_mapping,
> > +	 *		       xe->drm.vma_offset_manager, false, false);
> > +	 *
> > +	 * ...
> > +	 * static noinline int device_create_ttm_device_init_inject_fault() { return 0; }
> > +	 * ALLOW_ERROR_INJECTION(device_create_ttm_device_init_inject_fault, ERRNO);
> > +	 */
> > +}
> > +ALLOW_ERROR_INJECTION(device_create_ttm_device_init, ERRNO);
> > +
> >  struct xe_device *xe_device_create(struct pci_dev *pdev,
> >  				   const struct pci_device_id *ent)
> >  {
> > @@ -316,9 +348,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
> >  	if (IS_ERR(xe))
> >  		return xe;
> >  
> > -	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
> > -			      xe->drm.anon_inode->i_mapping,
> > -			      xe->drm.vma_offset_manager, false, false);
> > +	err = device_create_ttm_device_init(xe);
> 
> I believe the function name could be simplified to xe_device_init_ttm...

Yes indeed.

> 
> >  	if (WARN_ON(err))
> >  		goto err;
> >  
> > @@ -550,6 +580,7 @@ static int wait_for_lmem_ready(struct xe_device *xe)
> >  
> >  	return 0;
> >  }
> > +ALLOW_ERROR_INJECTION(wait_for_lmem_ready, ERRNO);
> 
> I liked how simple that is....

It is quite straightforward when the function is error injectable, which is
often not the case. Especially this requirement is often not met: "The
function does not execute any code which can change any state before the first
error return."

This is why other examples in this patch require an extra wrapper, see below.

> 
> >  
> >  static void update_device_info(struct xe_device *xe)
> >  {
> > diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> > index dda5268507d8..22c0a42af9c2 100644
> > --- a/drivers/gpu/drm/xe/xe_tile.c
> > +++ b/drivers/gpu/drm/xe/xe_tile.c
> > @@ -3,6 +3,8 @@
> >   * Copyright © 2023 Intel Corporation
> >   */
> >  
> > +#include <linux/fault-inject.h>
> > +
> >  #include <drm/drm_managed.h>
> >  
> >  #include "xe_device.h"
> > @@ -99,6 +101,12 @@ static int xe_tile_alloc(struct xe_tile *tile)
> >  	return 0;
> >  }
> >  
> > +static noinline int tile_init_early_inject_fault(void)
> > +{
> > +	return 0;
> > +}
> > +ALLOW_ERROR_INJECTION(tile_init_early_inject_fault, ERRNO);
> > +
> >  /**
> >   * xe_tile_init_early - Initialize the tile and primary GT
> >   * @tile: Tile to initialize
> > @@ -117,6 +125,16 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
> >  	tile->xe = xe;
> >  	tile->id = id;
> >  
> > +	/*
> > +	 * The flow is modified because xe_tile_init_early() fails before the
> > +	 * first possible error, from xe_tile_alloc(). It is does not match the
> > +	 * 2nd requirement of
> > +	 * fault-injection.html#requirements-for-the-error-injectable-functions
> > +	 */
> 
> I'm afraid I didn't understand this.

In this example we end up returning an error from an artificial code location:

    err = tile_init_early_inject_fault();
    if (err)
        return err;

... before even starting to execute the first statement which could return a
real error, xe_tile_alloc(). Not focusing on this particular example but in
general this can have side effects and create false positives if the state
is not changed as expected, either because the first statement that can fail
was not executed at all, or because all was executed successfully but still
reported as error.

Not sure if this is overthinking, after all this issue is also present with
the i915 macro for error injection and maybe the pros outweigh the cons.

Francois

> 
> and the name could perhaps start with fault_inject?!
> 
> or maybe:
> 
> xe_fault_inject_tile_init_early();

Sure, whatever helps easily identify wrappers only added for fault
injection. Maybe we can even remove the xe_ prefix as the function can be
static?

Francois

> 
> > +	err = tile_init_early_inject_fault();
> > +	if (err)
> > +		return err;
> > +
> >  	err = xe_tile_alloc(tile);
> >  	if (err)
> >  		return err;
> > diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
> > index 93c82825d896..88a201122a22 100644
> > --- a/drivers/gpu/drm/xe/xe_wopcm.c
> > +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> > @@ -5,6 +5,8 @@
> >  
> >  #include "xe_wopcm.h"
> >  
> > +#include <linux/fault-inject.h>
> > +
> >  #include "regs/xe_guc_regs.h"
> >  #include "xe_device.h"
> >  #include "xe_force_wake.h"
> > @@ -268,3 +270,4 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
> >  
> >  	return ret;
> >  }
> > +ALLOW_ERROR_INJECTION(xe_wopcm_init, ERRNO);
> > -- 
> > 2.43.0
> > 
