Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699E4CCD193
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 16:11:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6A610E658;
	Tue, 14 Oct 2025 16:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CNLx+9aK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C77D10E65A
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 16:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760458307; x=1791994307;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jQvLPAqkNCtSr9cLJUkrxhtndbu183xoDWdKQa7A+fs=;
 b=CNLx+9aKcYiNwcA5rjqhpg2UiqDdQSmZaen2bm8Kahui6K7kGqXtxNFm
 acR0y6Z7EiLCxLGlPa1aLfKIA/hyIgIhKYdhZ1W3ZCcjeY+V2GTEatEMn
 ISqM3aEKKNqpGoW2HhrV+dvnptbkryMmlZYUUlTSLJgecVfTsZ9hOWQ/J
 EbZkWZUIf7yDZlJ8HJUO+krv/bJUPHT2txZ1LVrhRU7Dp/SRnw/h/WTU/
 vT1UAFXIuTjzlmeHpcEs6KUtsZB4XZDpIiMcaBkGGTqFK7dTvZoy8Lyqw
 N9LsfSTuRncSDk3vFq4vx2xoxqm5QgLVJOzfIO7FGBL69wuoac1TVeAcx A==;
X-CSE-ConnectionGUID: PZt5OnTJSUOWTYvJSxFPdQ==
X-CSE-MsgGUID: SM9zzP8FTLGLudnrBQg4sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="66276824"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="66276824"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 09:11:46 -0700
X-CSE-ConnectionGUID: qPXzz+vVQpiTJUfyEiYYBg==
X-CSE-MsgGUID: WgVurLTXQUypECVXOHO/FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="186178552"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 09:11:46 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 09:11:46 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 09:11:46 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 09:11:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bz6SGIGlwR/0kJi4mExnZVweZCCgJKcCxqjngRGKBjUYbMVSAS4mbnG/Kyou4eQyR8L37lT0mAkRTyVUq/2O4G/4dXqOvoR/D4tqEKWNU0mco/jEgEF6lgukjoAhzlYxNTsyrFa2vBdoUnpWyHGI4QZUCdajLDO7tXwaduBYzpMxntPfXgwnQb9NBV6ZK3oeWnFEFtBm2CqEhiwm6SqCHVsRUQsblZV/SQ+eVo3FC1VA5F0RgOeFtnyrIScGjC77AwY85ghfTrUk+NbvTIwbFmUntmLHxoekNLOtjMVH390XCMAv0Fgjfj2kQcXeEttdlzw4lXvsxm7e/UtZrK89yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfnk53n9ONnAVo9yJTykyX9YhZEopHZ6BanavF2LZ/s=;
 b=JrNgzDJUrgh2HQpKbL6df1K4Frl+hGDNy5ffOX2it9YjUr6csoorLU0ftQwQAsgr669Mlh/rr+Qp5r0BlvHFQdY7FM2A5vNuIErHbeUcG7Qix6AF4G6kYM5Mbwv+XQ3D+f3KRJIXnKYq/xky+rz4kJyj0mgKr73bERK+363mllsVNZDj3J74oHVkwnVwEHiUCp+RBwviqtBRs8FZUqQGQX5vhVPluhLwWI5o4c4S8ptM/FA/sdOElNrrMeEININ4iIOmtCdBnUL57oNn9njrcoFB5tYlBMLpLEYsj5DF5Wmapv+j8mRrm4NIJhWkuainkNNjx7htKJrLdItjsPa9oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB9471.namprd11.prod.outlook.com (2603:10b6:208:5b3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 16:11:43 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 16:11:43 +0000
Date: Tue, 14 Oct 2025 09:11:41 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Sai Teja Pottumuttu
 <sai.teja.pottumuttu@intel.com>
Subject: Re: [PATCH 01/23] drm/xe/xe3: Add support for graphics IP versions
 30.04 & 30.05
Message-ID: <20251014161141.GM5409@mdroper-desk1.amr.corp.intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-1-bfb74f038215@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251013-xe3p-v1-1-bfb74f038215@intel.com>
X-ClientProxiedBy: BY3PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::10) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB9471:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e24c148-df89-491d-0c47-08de0b3c5de9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4RddswZ0OoPqK++Z3/GRcTCVs/ZMc6MU4cWRMb/pGaMvxxEIPhZbMwqkWbiX?=
 =?us-ascii?Q?0SUpx7qc7sannfX5SsYvVBqIfNsmXVn7AG4PGZueAOCyp2ejGOu1EZOOINfr?=
 =?us-ascii?Q?KER6iTMWLkvbJDc/G2YaTGsg9IAWL+Aq++tKuPK0MT2EyL8poL4tzZi4xxI/?=
 =?us-ascii?Q?Ert3q/dGP83CQzAAcG4cGIeuf+YDohJ++bfQLVVTIKqhLZ54ANI25I04cOxh?=
 =?us-ascii?Q?o9PEG1rdlCl6ccFXsekiX7I96SL69sRWH9TOEiH7FNqjv0gTGHilQ398bfyp?=
 =?us-ascii?Q?cy8YIQiMI3ouwOzrmlgYHao57J8YA51+Ix754OhTGU+9XSJVNqzkCOuLm+Jh?=
 =?us-ascii?Q?+HaTi2YA57OPbFM5uEeVLYBYBHDaWi/LLAdgWfUxjEHBZmD3oPnqzffgXVgM?=
 =?us-ascii?Q?0KT+0lfMnmoCzYj1sNlFstDEXjWIJR+xmGyyBQ5EIaJppTut5E5U5DfzOl9d?=
 =?us-ascii?Q?Nfm2m3yjNtaOJizO9ulqKS9DQvWQblArsXnbPPE37mhh16u8NoVDpa+jhIyp?=
 =?us-ascii?Q?SJOb6e1nQ1DaFNvABSOV7KDzqad3V5soG1aAHTyEF9ZciGTvDsLQLS3Z+UX4?=
 =?us-ascii?Q?z2PzfMekzjzHAgBoAPE+WFyO5oIWepIJbV1uTk7RIOz8J3yZsh9wslTuXzoj?=
 =?us-ascii?Q?XX9QlMLHpae9GU6i8JxflS4ueOrZEVDcRi0sb2TPpwe59Y8lxt3h5Mio75k2?=
 =?us-ascii?Q?YRQ07aAufe9QtJ9C7SJp8nEiT1B/n0yHDoilegdlM3z10LUvmsNNqPS+EMoy?=
 =?us-ascii?Q?e6h1ZR4XWzHquPP9CdpL2IBRpVm/ILBzQ0jjo4AVEL0+X+MZ3p/jYK9jFLLq?=
 =?us-ascii?Q?ewjywFAOW4ZG4zIb2ap91kF+yifkF3X0cGhqA4VjLNRy09zpi6Edy++KWClq?=
 =?us-ascii?Q?D6s0g2MRVC1yXsjrua7mXWNWkbdwQk4GCYmd1NHIURSlSejNosJOBHjHJFOr?=
 =?us-ascii?Q?sVz5id+sHCDs1L6IDHi3AccGcd84QY1H9f8Oo+AxQrA47du40uK3aW8HjL7U?=
 =?us-ascii?Q?FhJsb/9F0crWkYQewu/4zTYacIR0GNMSxzy6kr0/Up1ZeW+g6TmVEGrcxvqw?=
 =?us-ascii?Q?aq4QjNp/+2d5EBKFrMxGBaRvNk7VAhF6ld7MNVB7qQcRwZ3RQD72OZO/M2A5?=
 =?us-ascii?Q?leIvixurgyzhcprKrYp3c24RxHl2OqB3mivV1qQJMivaifchGpdviY5A1WCb?=
 =?us-ascii?Q?SQSFhNJrwBXN7Pbm4oQR1eIfvLw1A8VIwFYMfLbzBPko1H4KXEaqKe5APqP1?=
 =?us-ascii?Q?FE8M6XQddOTf1V/o+j8aqblgW2TEKS8pOrxS8qqT+1dSBj51iqXS0aiaxFCJ?=
 =?us-ascii?Q?rarD3udus5vhTutKNpIcB/4t7H0bw2et3X5Cl0LYnQtRyGuPEPP+o87mvbI9?=
 =?us-ascii?Q?R+O8/XF5nGj1l2ampf+NqqcUTV8gWeS/f9QDPyOSshoZ8Okur9jQKFuIwIov?=
 =?us-ascii?Q?ddy6QDu9d4RNkTVLada2HjVIC2RlBvuX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7BzvSOOfqcgjlyP//OoX65d3r0tuSrqMn7V77n3RT67apzAAqVfhKXx0F+xO?=
 =?us-ascii?Q?and66DI+mwxyb5TVf8boNo7ob0gKaUWeTcIVwlFmZFYLjiY6psr6TkgWltXs?=
 =?us-ascii?Q?4hibbrdPdnXaVhE4eBlqOLwVF+XCY1Dx3M5inzF1zDJXrNZ7mLTV6x3qn0rA?=
 =?us-ascii?Q?59LC/ZRrZB0KaxMyOikHzJSIjSGe2MA5hT3OmwP7NGrMPQ+HhiGusc+2bXkY?=
 =?us-ascii?Q?tvHNlW//smhxG8OTu3nJmbP0hwk0BFCJ1b6eIPZGOTeLeUo2fjICbCMlKANw?=
 =?us-ascii?Q?gcOF0csiUi1w9VPACzM1MIk2zgaGGvDEqmqmv4iau8rct35Oyfzchv3eg0UU?=
 =?us-ascii?Q?xIWsuviiQCLm68KDaPPChlt1m+zn6dn2Ve8HSLbdp2VaShJgDTFRfm/S2Ez3?=
 =?us-ascii?Q?Lu3XDKJlVykF00CE4zCJq2VPOIuahjqmGET5UDWQYHAnhzRU6IjeTvbHox5M?=
 =?us-ascii?Q?0tgald6xxY3k4JjKZdx3zi8iVHV/t8Mlrjh8mrVfxlBz0x+RdywOjCqaqgn5?=
 =?us-ascii?Q?BBpuKWCAGaT2T7eOdwGKeL1ee3Za6L6V7Lh2V7trxUdGA/FaAE8bE7vL9MCw?=
 =?us-ascii?Q?Nd+2ZUFpjezU76b2gupXoxFe29Vt4EixQ6wLvR4smOJlzs6WxPed/Z7yJiqZ?=
 =?us-ascii?Q?2mUTWiqrg2aiUMZLcO/xM1XYL1gh36HXMoTaAttOxmSg21FnE/RYFZOCqdzr?=
 =?us-ascii?Q?eNgy58KlxySQHXTA/cMsflmxIT5TVgOhTvfb9fSH8IXJcwV7KAKxzgfDD6Fk?=
 =?us-ascii?Q?2CSnwQF5T0YBM/ayUifyNZuS+SHhK7r4sAwMruH8nUPWa4U6CL4Ib2fFzCmx?=
 =?us-ascii?Q?Cp4teLITMfgsXOzl0Kbgz1x+ouxK+L4i3ESI1dQttklv7zHRZvTiIKtC+l64?=
 =?us-ascii?Q?t/K+XYcV04gt37plUhLLOf8ySfdBQhEhwbrOlxhQit7pu+U9k0KQ/zfsqT0D?=
 =?us-ascii?Q?O8Dh0VX/jEgo+Clmvd+zeSelw2pxlPaIGba6K+hTxpsbg0dx/xtFCz34OQrA?=
 =?us-ascii?Q?O+fvEDaPKoc7UsBTLqPeBvFnEkOpnvd3uGHUVoaHDeElU4lf2TZl5wKZiy0S?=
 =?us-ascii?Q?bGOGEu6QZ97iHVz/qYYO07GRbfU46/IGzuZtgDO89zb0jXf0BeQSBwX0cnzB?=
 =?us-ascii?Q?6ZVUm1JYR540FO3+MqKL7cOH1/L11KMyPpz68UXph0D4Ik5YjNFDJ5bpeWBE?=
 =?us-ascii?Q?NnmZ5bu8lOE5uoTcLUf6cLUz46xVMZjgEZ2vkEmYfJHDJkpviNmfQyB25lEX?=
 =?us-ascii?Q?CT1muxZnKUGm7qi3rD9sKHDAIe3fN+V7mhRZSStPaIg8s+6jXBNSNgcacwGD?=
 =?us-ascii?Q?HY9bA1S8vS2jL836vLGdUkQj15CDn/cgtXqyNmcOVMjsgzkXOrJ6YyixO0uc?=
 =?us-ascii?Q?7I6YsaIFvPzqwSaPrqBKHZEyDRVsGcurwn9etq0NEepTl4w9msIfiIIhS40/?=
 =?us-ascii?Q?ertVCex2vzeX1xuZr4oW+Hlb2d5/DJDvvG2nvsrflRDBTM/p738UWnVZLt48?=
 =?us-ascii?Q?rXN7PaG8u9+7uhsnu86ewOj8WjyaCtz7QprR6nWG5eHTHZyHUl9iER/fxJrS?=
 =?us-ascii?Q?j/e3k+t+uZ/k7X6ojYQ7cKMhD8eFiHSEGnbubw7srKi1JtbxWSY1I2yhOrC3?=
 =?us-ascii?Q?fQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e24c148-df89-491d-0c47-08de0b3c5de9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 16:11:43.6703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e4F7PtAD3NralPj8D9gisji9m+aHsNAYvmNsRnjz0wrGmwawD81i7qncYPzM7akHN88QaUWnvk/ewOqNVGUD6EIv2oiEcae4lopbS6mgve8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9471
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

On Mon, Oct 13, 2025 at 08:24:33PM -0700, Lucas De Marchi wrote:
> From: Shekhar Chauhan <shekhar.chauhan@intel.com>
> 
> Add graphics IP versions 30.04 & 30.05 and initial workarounds for these
> IP versions.
> 
> BSpec: 74201
> Cc: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c        | 2 ++
>  drivers/gpu/drm/xe/xe_wa.c         | 6 +++---
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 7 +++++--
>  3 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 944c698808ace..c1e89689953b7 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -149,6 +149,8 @@ static const struct xe_ip graphics_ips[] = {
>  	{ 3000, "Xe3_LPG", &graphics_xe2 },
>  	{ 3001, "Xe3_LPG", &graphics_xe2 },
>  	{ 3003, "Xe3_LPG", &graphics_xe2 },
> +	{ 3004, "Xe3_LPG", &graphics_xe2 },
> +	{ 3005, "Xe3_LPG", &graphics_xe2 },
>  };
>  
>  /* Pre-GMDID Media IPs */
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index c60159a130014..24b6d4bb0b962 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -684,7 +684,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	},
>  	{ XE_RTP_NAME("13012615864"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001), OR,
> -		       GRAPHICS_VERSION(3003),
> +		       GRAPHICS_VERSION_RANGE(3003, 3005),
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
>  	},
> @@ -695,7 +695,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>  	},
>  	{ XE_RTP_NAME("14021402888"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(3003), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3003, 3005), FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
>  	},
>  	{ XE_RTP_NAME("18041344222"),
> @@ -913,7 +913,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  			     DIS_AUTOSTRIP))
>  	},
>  	{ XE_RTP_NAME("22021007897"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3003), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
>  	},
>  };
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index f3a6d5d239cec..9aff2e56fd3e4 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -34,14 +34,17 @@
>  13011645652	GRAPHICS_VERSION(2004)
>  		GRAPHICS_VERSION_RANGE(3000, 3001)
>  		GRAPHICS_VERSION(3003)
> +		GRAPHICS_VERSION_RANGE(3004, 3005)

As Shekhar pointed out, 30.04/30.05 can be combined with the 30.03 line
for all of these.

Otherwise,

        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

>  14022293748	GRAPHICS_VERSION_RANGE(2001, 2002)
>  		GRAPHICS_VERSION(2004)
>  		GRAPHICS_VERSION_RANGE(3000, 3001)
>  		GRAPHICS_VERSION(3003)
> +		GRAPHICS_VERSION_RANGE(3004, 3005)
>  22019794406	GRAPHICS_VERSION_RANGE(2001, 2002)
>  		GRAPHICS_VERSION(2004)
>  		GRAPHICS_VERSION_RANGE(3000, 3001)
>  		GRAPHICS_VERSION(3003)
> +		GRAPHICS_VERSION_RANGE(3004, 3005)
>  22019338487	MEDIA_VERSION(2000)
>  		GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_not_sriov_vf)
>  		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_not_sriov_vf)
> @@ -63,11 +66,11 @@
>  16023105232	GRAPHICS_VERSION_RANGE(2001, 3001)
>  		MEDIA_VERSION_RANGE(1301, 3000)
>  		MEDIA_VERSION(3002)
> -		GRAPHICS_VERSION(3003)
> +		GRAPHICS_VERSION_RANGE(3003, 3005)
>  16026508708	GRAPHICS_VERSION_RANGE(1200, 3001)
>  		MEDIA_VERSION_RANGE(1300, 3000)
>  		MEDIA_VERSION(3002)
> -		GRAPHICS_VERSION(3003)
> +		GRAPHICS_VERSION_RANGE(3003, 3005)
>  14020001231	GRAPHICS_VERSION_RANGE(2001,2004), FUNC(xe_rtp_match_psmi_enabled)
>  		MEDIA_VERSION(2000), FUNC(xe_rtp_match_psmi_enabled)
>  		MEDIA_VERSION(3000), FUNC(xe_rtp_match_psmi_enabled)
> 
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
