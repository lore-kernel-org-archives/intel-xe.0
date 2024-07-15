Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B46BC3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jul 2024 17:09:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F1110E452;
	Mon, 15 Jul 2024 17:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m9pW+p2j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB19410E452
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jul 2024 17:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721063396; x=1752599396;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WIm1+0a6926DVmAVJsFRL7I6OM9WDOfajgapF+FjGMQ=;
 b=m9pW+p2j70mf3G35kb81aIPioSeQh71VeIuAqLmlujLvU982dZMhDL7+
 tb2pu1KJf6OQQt2m02pjTNfJcq+JyEf379uQy3HlJLcrdYTWqxB+KlB9b
 8yVGXb5PlYzH6eeOOs+dKdw7JtNvFCsVYhPd6ugMh7QrmRCxCsix2jHaO
 4luCC4LWMaK6i3mEuH1ew9enShhwPz2+QLrjX0USx0Pe7LoRRuW/Jo5RA
 XGwZwj69OFkO7STtvUxJRTibUK53DFx9v35uzCP62huS7dVIJMlHIc7gF
 xlP4fGIjbrPbCGdj1lIFDBNDlCy/FrwxaBsgbgBYnmqd6cUqe5Vg5O45E Q==;
X-CSE-ConnectionGUID: /rgYpZmiTKqyrT/AHOkSOg==
X-CSE-MsgGUID: 5PZ0p7zITzi+2nzp247vJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18574040"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="18574040"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 10:09:56 -0700
X-CSE-ConnectionGUID: 2WUwNraER8mIHbpQGbHBEg==
X-CSE-MsgGUID: t8qkpf97Ri+KnD66Xv3Z7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="49432177"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jul 2024 10:09:55 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 10:09:54 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 10:09:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 15 Jul 2024 10:09:54 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 15 Jul 2024 10:09:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RDWgf5h3cTAtOyihyG3X9X3ygi5Wv5jb25cYJw831c2RfVR/yx+sj4JzE3TV958INOeidv2Yhpsw9UeaNCTCpazweseXftbOMKx2T46GbRpTovsE4n0TKezk7M4q1B6V22nOtPKuvZLIPK7v/O55BDm/XWqwgqmLITKzYC22frgp1BHFBVHcbfCkEZxpKphPjJ1sKV8qSBGhswYLFI6V4D5lXO7jI2RAqYNgXQXthQPgrvnWjmnA0tFBmOX8toRYT26nyk2B6Kkbd4jqC3pUPRfKZG6ScYLexDumRsOzvM2VYMaVnbRRodfoZu0frp0uhqX3PSQx07dkuB/6WxWqDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLHmmWhd80qK4Gom6OIiXl+/2uqpCyWCHCGimdoinHQ=;
 b=ArOGYGT+nbxpvWQFQIJy5PyGnIEXSMwDQ0gMKDC0dW5dpgPR2PrjjoV2PKS+per/oDlOfR5mhtfCN1jwF750MQw6iAGi9AHqYnFU21lfF559K+D00Pg+yhX0CXFS46kTVKDWxKIsRHetuty3ukc/uPrW6cFkEYpq42BvLJdpwOwwSGRQN5pi4HmycwdXvUS0d87ij4sqoWhfMAtzdWchQItZVoB4+DrSAMhkXEDWG64hQcNv5DhJCEvZx63Jjxqz1qINzXF8lhbvKErm1SGHGhOZCGq7W4OLBb6OTrZW20TfP1ndVqkUHImMF1OLMWidroCROfMPKd+Ty3Z4NLCqbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.24; Mon, 15 Jul
 2024 17:09:46 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 17:09:46 +0000
Date: Mon, 15 Jul 2024 12:09:43 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Piotr =?utf-8?Q?Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>
Subject: Re: [PATCH] drm/xe/pf: Restore TotalVFs
Message-ID: <rzlfgpxzbypgidpwtybd4usfsdk7kic4ieqjzawzpjziv2vj65@tp7zl6unxjpx>
References: <20240715114052.1330-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240715114052.1330-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW2PR2101CA0016.namprd21.prod.outlook.com
 (2603:10b6:302:1::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6467:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b118ea4-7c99-4f4c-6fa9-08dca4f0ed5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?30vnpfgHeTQ9d9asI3qPyI0Ln2ncSyqB7QTgwazQ5YC6EBTNElz1vyVH/g?=
 =?iso-8859-1?Q?CvQJpNhl39ET63GbNzBJ7awLrkyR/j002z9sJErgDJA1GYG1C+mAG50OXu?=
 =?iso-8859-1?Q?EbaMB66QXLw2FXtoQ7kewxMEgE9o6OD+QbLeFlN9OpeCbfq4Yam74pfOpK?=
 =?iso-8859-1?Q?wpSIJzmBMQsdUkkwE2t4m/u0DvRVs585pkrrrPDeuegAHqTX+bKrlSfQh4?=
 =?iso-8859-1?Q?Fb520nAGXXPxl4FfTM+g8UVJjxTZY1KmBIQmRIz2GGIGcMxzAct1/cMT41?=
 =?iso-8859-1?Q?g+9iEC4+0EF3kMqbEKQiNckv4Uc+kpFhA9fvtkshPEioxccJ3EYsmjvH8w?=
 =?iso-8859-1?Q?keO8ZuIwWl/cRBYaeZwKj1xeDZdVFhLY8QLcU4wnLNDxJLdIMVrRqsekc+?=
 =?iso-8859-1?Q?SfaHF+6TWbTJhbP5MMTHxMX/OZnuJJrd2llH9PjkBYWDjAsUYEPzlaBeCz?=
 =?iso-8859-1?Q?SBmGEA/FGtM0RgQ5GvL+ve07DSikCswscytmiBTe1NSc0lHX2xclMmYmGG?=
 =?iso-8859-1?Q?VFyExYMoRZhoQJ1g4jYjtOKSa4+cLv2WQlOmlAtpT+0eL9+wJTl2Ivzj4D?=
 =?iso-8859-1?Q?mawp2SqLWWXISIjjKH9gAYyRcGe1reffN1YlGHOz019fgqH1ZMOQZVGGSa?=
 =?iso-8859-1?Q?14M8zBOs+pyTfAwzRpR5+3whYGjz7cypUYOVTXhgC+dpCu4tplsGzZS5Ad?=
 =?iso-8859-1?Q?Aq+s6iSfSN8G0IxPm+Z96L0N72ZciYsicBGZw8O3/ZG+YBsdTPx9ikd0Wv?=
 =?iso-8859-1?Q?2KKQ1qMcIcrcAqdHjTEQr7BLrxATnCOvSGwAf2zvHPfr4BZjgsQXNQV1Ly?=
 =?iso-8859-1?Q?740yXJs61oLZMJqMAgoMbjECW6utHwfzrAkCiH7HFZNIkAaQLQb2osBFfk?=
 =?iso-8859-1?Q?Efrag59vBXle7try7PGPm2oc1kLKrN6JVFonQ0ysUgVDPfc1gX90CzEGu/?=
 =?iso-8859-1?Q?y8gG4QIRzSJzjRZe6PKTMSg2NZyNOU9rSnIzlxqK10rvCtegzmtXnql7SQ?=
 =?iso-8859-1?Q?HzY+xHOsQbrtlhFzkW6hcrCpEsY50Cz5oAYCfOuBwScL2RniJGN6vWaxFM?=
 =?iso-8859-1?Q?dt9zSdISccRoV+JloGfnT49AI9JQufaW7wMr5kAE125HzY5L88WsfMtw8T?=
 =?iso-8859-1?Q?/OdDXS8ElLp6NVAPIuRz7AGwHA4K9gaEK/aDlEkiI8aTUO+Ak5wTHtjV1m?=
 =?iso-8859-1?Q?zR5DISfoktSOsGz6qTp26y9BOZqfqU1Qj+Ij8Ka591wpjU6UhKzIDvtDD5?=
 =?iso-8859-1?Q?sY2pdSzROQTZjX1slhN2khhyYX8RZcx+g+Mo9ayOyw67hNY/XfWSi5fEKu?=
 =?iso-8859-1?Q?PPgT00YLmU8DukbtE6+JtMQhMSyc9JYJgFs0HSuTFiZ5W2Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0rfFazUVU0c3/v+Vyz5pv9vFO3P/lRiSJF8GdEoK1/lqPDKbHDtVM+aQ82?=
 =?iso-8859-1?Q?kYlgM7Rh2uqhwHUJRyo4t2ha+VkWVCmF3bWqkug36ZNVnJezO8rCngLMsX?=
 =?iso-8859-1?Q?VHjwwi7bisqez9CsDbuB2YIH1vf6+nU4mG6BWzKjZe+XuULqUpwBra1+lT?=
 =?iso-8859-1?Q?e1/IVZXm9yH1RQR4AjswTW1WX3IUKA+sWPusSCC910Ymh3lgX0szhhjj4Z?=
 =?iso-8859-1?Q?oZvg3oo2gzF9TDuHKMYZ2Wyp/kxPf1DRUQYxK5fthikhDJMoMI1xYxufjX?=
 =?iso-8859-1?Q?u/06x8hLgT/wSp5OGy2JAwa4qeZsgtX0ybQSBYYo4a8eJdfrSjkfC2Hb1s?=
 =?iso-8859-1?Q?7dFU0FTLbwEEFkDJYvejIOIULu2CsLyp/mdTa8zODeb+P/TLtUefCC2Ups?=
 =?iso-8859-1?Q?P2vksJ7VcB2xuTG7glSgqbsh4PokTKy8apKxwDPCfCS43Z85EJQKnJZ8FD?=
 =?iso-8859-1?Q?B4suF+Z/HQZdce36fPoajV6OTJB2Rk0CIYCiC6mg28FVnG9bAaCHbkQKzt?=
 =?iso-8859-1?Q?p6BWjc2AtezlDi15j1HDz0XFFd651g6Dw0lsqVKsNbpAJ05Cpj0UxQ6H8W?=
 =?iso-8859-1?Q?VXaUFlQZiK0Rez2fpkTDpz/0Eb0/xj8iMZ9V9t2p355dRKnYQH5W3lSqzh?=
 =?iso-8859-1?Q?4karB3Tku/FuW5ciazZJMYHgnvY+7T5RidMTB7l5aBg0VS3HCm2Zxy8RRD?=
 =?iso-8859-1?Q?CiiHFUZ5Gcv7Dvo55T9tD4Ty6yPvhR1uKeZNUCaYuoDYyfObwt6cvsrqMN?=
 =?iso-8859-1?Q?9wyweVvxnIFbGVvlbgK3OxZEyUzvuR9TYbao586Wc1XHwyaz7SjE7Jk76C?=
 =?iso-8859-1?Q?jixOtlCz+YTMHthqv/enGxZNCxAbOT4xchOwAYUFqL+0zIuij4IDpYa1Rj?=
 =?iso-8859-1?Q?jolr+kgKMeB4SSklrzul0NFURHA2Hayqj7bCC4IZ5gwJ1ShrpGQJuMPd9e?=
 =?iso-8859-1?Q?CLEgjaNlMK6OZw0iO0g96LW8eBUOa+sQ8mVRZjzNl+IK3XIxhcGZNX2wII?=
 =?iso-8859-1?Q?EgXQZ6qXXMz8gd/mdlWIA/3IkqLT2VYlmfB9kbePnCCJ9+gqnIvvKm750Q?=
 =?iso-8859-1?Q?gfzOIU6rhsy7oHPmjfAJ8J0Jl5tJkG7QZZID+exmRGcYdARzww9J2hCRPe?=
 =?iso-8859-1?Q?7fZJOr3G0rG5fMcKEKYWEXFymfbU53RQDaC1nJz54ZzBEGDsECNC075o65?=
 =?iso-8859-1?Q?1GbnyZ2NpHCXNv9P3Bn6aqMJfEKMCqYagKvTRJMhFMAq37q7ho2Tk3XU1n?=
 =?iso-8859-1?Q?klSj7J7eNHjgXerPd5Z5xplWcA/M8Q/URlJLQFo0LlYDNlhw51J4m4GYjY?=
 =?iso-8859-1?Q?7YGaQQIEFgeKOnvjpio2r05Hc+yfm8dWY2D7VRFm4c0q06DQpgrLnW/uEm?=
 =?iso-8859-1?Q?bzhi6Ujr7Nx9bI9XLe0GluDOaZNagdSz5rUofFiZ8gXzOUW50rflRvAnw8?=
 =?iso-8859-1?Q?vqBkc96CuIXRS/Iiayo13RaZaXlRvmmZd1RVyl2XO69P5CXjeg9bua00GI?=
 =?iso-8859-1?Q?2MxqSQ748Qfnv767bZoaL6Xl+rGLdcZa9qgKf6qpQyWhjEaWbsIo3+ddK5?=
 =?iso-8859-1?Q?eJY9x0crre5WZBV2k5JcojGoaJsciXlFdj1+O7QqAY7S0xAeLnu5qnHO1s?=
 =?iso-8859-1?Q?fDtmv/MIC2GHf2gDEVKb7w02lK1R+YFAwn4egbwtZWX21RyfMyt0zFQw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b118ea4-7c99-4f4c-6fa9-08dca4f0ed5f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 17:09:46.4536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v1wg/u30ZOiara8p+CrpqWhdlKKz5M/IBOwgtjkzrqxm/9Qjj2NILylK4XgTTGQCJiTs4gISlCmdQj/FY7BnBbGYjmk2F3ymaZpewyxO/N8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6467
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

On Mon, Jul 15, 2024 at 01:40:52PM GMT, Michal Wajdeczko wrote:
>If we update TotalVFs to a new value and fail the .probe() then
>the PCI subsystem will not restore original value, which might
>impact next .probe() attempt. As a backup plan, use managed action
>to restore it ourselves.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
>---
>Attempt to fix that at PCI layer is here [1], but until it will be
>available for us, we can still fix that on our side.
>
>[1] https://lore.kernel.org/linux-pci/20240715102835.1286-1-michal.wajdeczko@intel.com/

I don't think we should merge this while that is pending with no reply.
If that is not accepted, then we can think about doing this.

>---
> drivers/gpu/drm/xe/xe_sriov_pf.c | 48 +++++++++++++++++++++++++++-----
> 1 file changed, 41 insertions(+), 7 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
>index 0f721ae17b26..d61933770f1c 100644
>--- a/drivers/gpu/drm/xe/xe_sriov_pf.c
>+++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
>@@ -17,12 +17,40 @@ static unsigned int wanted_max_vfs(struct xe_device *xe)
> 	return xe_modparam.max_vfs;
> }
>
>-static int pf_reduce_totalvfs(struct xe_device *xe, int limit)
>+static void restore_totalvfs(void *arg)
>+{
>+	struct xe_device *xe = arg;
>+	struct device *dev = xe->drm.dev;
>+	struct pci_dev *pdev = to_pci_dev(dev);
>+	int totalvfs = xe->sriov.pf.device_total_vfs;
>+
>+	xe_sriov_dbg_verbose(xe, "restoring totalvfs to %d\n", totalvfs);
>+	pci_sriov_set_totalvfs(pdev, totalvfs);
>+}
>+
>+static int pf_reduce_totalvfs(struct xe_device *xe, u16 limit)

		^^^^^^

so the current logic assumes the maximum comes from BIOS, but it could
rather come from a previous (failed) driver load? once we set the value
is the information lost from the device or can we recover it from somewhere?
somewhere != where we saved in the this driver.


> {
> 	struct device *dev = xe->drm.dev;
> 	struct pci_dev *pdev = to_pci_dev(dev);
> 	int err;
>
>+	xe->sriov.pf.device_total_vfs = pci_sriov_get_totalvfs(pdev);
>+	xe->sriov.pf.driver_max_vfs = limit;
>+
>+	xe_sriov_dbg_verbose(xe, "reducing totalvfs from %u to %u\n",
>+			     xe->sriov.pf.device_total_vfs,
>+			     xe->sriov.pf.driver_max_vfs);
>+
>+	/*
>+	 * XXX: If we update TotalVFs to a new value and fail the .probe()

why XXX?

>+	 * then the PCI subsystem might not restore original TotalVFs value,
>+	 * which might impact next .probe() attempt. As a backup plan, use
>+	 * managed action to restore it ourselves.
>+	 *
>+	 * Note that it's not critical if registering that action fails.
>+	 */
>+	devm_add_action(xe->drm.dev, restore_totalvfs, xe);
>+
> 	err = pci_sriov_set_totalvfs(pdev, limit);
> 	if (err)
> 		xe_sriov_notice(xe, "Failed to set number of VFs to %d (%pe)\n",
>@@ -37,6 +65,14 @@ static bool pf_continue_as_native(struct xe_device *xe, const char *why)
> 	return false;
> }
>
>+static bool pf_continue_ready(struct xe_device *xe, u16 max_vfs)
>+{
>+	xe_assert(xe, max_vfs > 0);
>+	xe_sriov_dbg(xe, "preparing for %u VF%s\n", max_vfs, str_plural(max_vfs));
>+	pf_reduce_totalvfs(xe, max_vfs);
>+	return true;

what's the point of splitting this function that always return true? I'd
rather leave it where it was

Lucas De Marchi

>+}
>+
> /**
>  * xe_sriov_pf_readiness - Check if PF functionality can be enabled.
>  * @xe: the &xe_device to check
>@@ -58,18 +94,16 @@ bool xe_sriov_pf_readiness(struct xe_device *xe)
> 	if (!dev_is_pf(dev))
> 		return false;
>
>+	if (!totalvfs)
>+		return pf_continue_as_native(xe, "no VFs reported");
>+
> 	if (!xe_device_uc_enabled(xe))
> 		return pf_continue_as_native(xe, "Guc submission disabled");
>
> 	if (!newlimit)
> 		return pf_continue_as_native(xe, "all VFs disabled");
>
>-	pf_reduce_totalvfs(xe, newlimit);
>-
>-	xe->sriov.pf.device_total_vfs = totalvfs;
>-	xe->sriov.pf.driver_max_vfs = newlimit;
>-
>-	return true;
>+	return pf_continue_ready(xe, newlimit);
> }
>
> /**
>-- 
>2.43.0
>
