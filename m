Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C91EDF161
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 13:30:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF08410E2F1;
	Fri, 13 Feb 2026 13:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z/yDtQrZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662D510E2F1
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 13:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770989428; x=1802525428;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3S3ufEL5sF5T9vzP2iSBGH59TZcIt8QC96DJhfipxQM=;
 b=Z/yDtQrZPhPVJ2l5cy1RAzJdyjE5Lsl3WGeQUci85T0sidwtEsJVWgSx
 8fRSrq600QRzRlkSc+F2GACPY7vt7HRNTxbgjvhHTmqnIuWvjSwTHdkBR
 6l6aB6/lQAJdH/xtE7YlUNauddgkTNmPcyXqx4dQdZAFgktL3Qx8CHmz0
 fUaQEE/UI/rAPRvnYnMnvGckVYlnkxyU7CP9FSLmuAlUQNQeT8YlOMnbp
 +Ph5WCghGAna4IYZZvWHXAYf8tSV0EKVB5tuxNAXNE8Y2TK+G8m1LsAlw
 BMKeOw4EKBaV4o7L+1yapdP+iKeu8S0Q4Mt5hvZrgOeL+VyYX6zdYj/Qd w==;
X-CSE-ConnectionGUID: 0fuUnI6xQ0me/HGRLHlXXw==
X-CSE-MsgGUID: 6MIlJhE0SKKMO9CVioEOpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="89759177"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="89759177"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 05:30:28 -0800
X-CSE-ConnectionGUID: K1WRVV/nS2iXHzjge1x5Uw==
X-CSE-MsgGUID: vBWy0i4tSNW4IeZ+vWWnUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="211824744"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 05:30:28 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 05:30:27 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 13 Feb 2026 05:30:27 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.19) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 05:30:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xF9Gs4vmdc8+LTyFUYc1NjmpzpSH4Ry9aJI0Letf2o7xa9VGCDFm2b17Rokn0+ct/D1tziblZiJC2AYLEol5GiC46J/mPd+UXMp46CGyJTsJfYlW3HoHkw5kycGlyw+yG8Xl0HBnRoPs787cNNGvlqUtgfIqZ1Qdw6JBMQvlwf+TEyQVEggsJjNryg71aP0P7WAMxCE3KZ+iQN8INhEc3m6AK2HNCoK4Siv3Wkl+x1o+I1aOHr8yTyHhsHaLnlHgd5v3ZunBIXQjZakoZarEyj8CwwbCgZddzA8mi8hZ1rIZWGoVyffFmQt69RrVgFFOLmkcU8gfDHCHUGn5IalEyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZVLk4qTeD92B2xK4qSAuGwDln2acJcfs64eEPMa/0qI=;
 b=VZt0p8kuGZdC77m01TbQLBU9W+WlgM5fr1aZxSs2dhhlyqvNv+BZ5d5olAgHRwJfWu1Jcf7jCbdpEPRMMeOd5OGJj6ZPEQiwuTxxGqnVUKL1exD/a+0YU7zEBn7eIwTTV2q/p4ReFpMJCtcKxt4rnyl3Girancp1r6TJ0+B4SG4j4nPK79BppS5qYDSvWQikZfdEtjNTF5wZpHXnvBOuTgDDi5O7NcQJzHp8ZT2rQs9JjQCSy/PTpvBcbSxtJgtIDX+B3VjmYhg/sFDg8oRWSlSDaCy0itIT80AKl6r6WLZyv7uK2jxY9QeznraU0JEIYVUW1cjPlx4nR5XWpmBbww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DS0PR11MB8184.namprd11.prod.outlook.com (2603:10b6:8:160::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 13:30:24 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 13:30:24 +0000
Date: Fri, 13 Feb 2026 14:30:17 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Pack fault type and level into a u8
Message-ID: <aY8nYAS-uh9V1vAj@fdugast-desk>
References: <20260212204227.2764054-1-matthew.brost@intel.com>
 <20260212204227.2764054-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260212204227.2764054-2-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0272.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::7) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DS0PR11MB8184:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ea2ee5a-aac5-45d7-ff40-08de6b040aeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HyAxp9XKETkr7e7ErcTKgTS7U05NLn4u+nMTBtNSWzbP9tlsRKHbTyyKZ4Oy?=
 =?us-ascii?Q?PkFGDRIESKHc2qUxZlzl7KSiLd0I6ZI/x6K2wNiVeHATp6uMkXWo9LaOY3n5?=
 =?us-ascii?Q?2m8fD9k5RcDL9IuouJbqMmBBz5HQCKmsd81gyhtKBv+5BA8nL0Qx/W0wym7j?=
 =?us-ascii?Q?LqXywdls7NbAjQDHC7U2454y4rX7A9DLigqrJuPCemE6SLRIJ8w39gx5kYum?=
 =?us-ascii?Q?PrvUjIHWET1InfUQ20Br7EXnGej3Ilqsp8IAihOI6kAsVl3JPp7La7epJD5r?=
 =?us-ascii?Q?cSWsVC/iLmIZdqKP0K71GljAVsf9UlmGoAhg2E4R+/vk3zKaPjOv8AMMxaWO?=
 =?us-ascii?Q?5xieEJ7Lnt+rTA0B2pD7iqmNMZkPiRpkT40zJsaV4kdXVPCc6NZkucJqfAXR?=
 =?us-ascii?Q?AALP2hCQQGFLorV/yIFp7IEhWSKprjNpL7oTnSXng5niZMoTpFyq1UB6vGvo?=
 =?us-ascii?Q?ta5GkfF4HjzFVlAL5GZHTDjxw+qUbcWL3ODsgyXKD3+dhh0Ubb5DDzivzAd+?=
 =?us-ascii?Q?pYOwNM0AYuA72Sv9QHUkzd4hQdPVjj8Eyo6Re6XvQrQEgzZVrZWsl+jIO0RS?=
 =?us-ascii?Q?7cU6oYGA5h93BzGVFOs+/ZUNKOJ4G7R13Xp+oLAIrrQ5/JhD4z893LJAAIVd?=
 =?us-ascii?Q?RcLoLsFZvfj11ln1P/k18ZBX0c5LJPusinubUWZTpyTWaDmHkNDEYPMadFMy?=
 =?us-ascii?Q?8EYK/LcAZdr4XyqxeqxynWkNEJtnZZSBUdJOU24FttxnjU2IZKQb8BNQ8Xzc?=
 =?us-ascii?Q?rQgmILgg94Oh2NIy//THFnbm6arhWvkx8olmxvlkqSsre1djUSxT22nPGOvR?=
 =?us-ascii?Q?0J4psGz09P0LN0IYAljM4dWA4NRIXax5Bi2DuKcaY2iN7EOC3VItkG77h/3F?=
 =?us-ascii?Q?sElu1zuF7x0+dYeW0kc1GMCEauLn0dD50VIKvzKG18/xUYMZ6mSKhGKnQYqg?=
 =?us-ascii?Q?2p+sfZL9d89r6v3Zd1xmCfbrmWTyGz722HACIccwDho2Ma25YRKX8GdZwd4T?=
 =?us-ascii?Q?Xd1G8+a7CR2k7CW1GeMthbJ6ovK6KfD5nGlsccJTucZwhR/IsJmUVzohN6mu?=
 =?us-ascii?Q?IPdvfEbmpbPaXa24lEMhNOeFuiWnyOup/f9xH7MfGaSzVlAn/MkeDV6pGjjn?=
 =?us-ascii?Q?+imlpPoya3a7/zbYOwT0J3wLk/qVHaJaaIaPxSbP8Ydr4Vn9gIKoIFNv+ibD?=
 =?us-ascii?Q?SfZNmHV17wKjA+v22XczHvCx8EoKn+6wa90PH3ckITf/E+cIHgTLWRg8GklV?=
 =?us-ascii?Q?X1XF3VzqJAnTqatIJd05KvMh134GKyXUQW1hYj3td+lQ1Vlyg9/855nOlm3J?=
 =?us-ascii?Q?vI4MaPfbUIvnVAVnoMFxlOVi8eoEKO1HvvJ9/aVbT7VLWM5aiXzo5cXTnxWL?=
 =?us-ascii?Q?/8dhOg4yGFz5zJ9GEiAVOUnHpILWIH6sjVqMuix/JBU1gxYoH8nZUb7cMBt3?=
 =?us-ascii?Q?W36Rs8cXR/dg2QddcgcaClKj7+SpfIA1q5h5wwX+xIaKuxN9hFGLrPa9DtPY?=
 =?us-ascii?Q?QTVx9slQ3CVaI5KxpofXZmfhvs1xq3fUcbTzRPUdtEpPwBwtZmdxUYrX62rG?=
 =?us-ascii?Q?aBQn53nn1A1hVuZ28f8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3bxlnC7vvfPZowqPPijiyl2Rt4Y1Z+wWD1R8iIhfldYvJG5mULpqhsQYnSt8?=
 =?us-ascii?Q?0DrL6HelloKr9ZEWeAmDSXg6oRLbUWcB9P0pkxlRpbzJ1WGKYHHptV1QDsDA?=
 =?us-ascii?Q?YqSwQgg6h1PkijyCR9rVUxYiYR+6Q2YBLQUIr6zteUmszQAPNm7pV7SV/o+C?=
 =?us-ascii?Q?Rdjm6tD11oAn3R0pDs2UzxIyX45T89pIeWjkidOSRSMcPrs+I8nlVgOwjM5l?=
 =?us-ascii?Q?DtxwG6fpGxaUt7QeKPQ2ptnCoT56dsNukusvwAhXmKIfE+/rCSb40O/DlJwy?=
 =?us-ascii?Q?V8y8Tis5wAwmgcqKUZ/LViSazz5s0gFzzrEsECLAj1mMsMX3xHri4mRn2TI1?=
 =?us-ascii?Q?yURSnhCY6SGr5vYjJDI4CV9R2uhjIM9MCoOF3jY6riPp6FDT4P/qxCnAOnfL?=
 =?us-ascii?Q?aoGjr39LdnFRSDqeIZkofihkQzjIx1YM32Mo2e7Vm+p4AHEmpNePtPTaovum?=
 =?us-ascii?Q?ndTZqEf2uPfk4BxRZGprHD5pS5Fbnvfoy0mFNy9tUjb+ExnhlpLE6rBtAPgl?=
 =?us-ascii?Q?JqxJ+4SvLePPUSRrw2sdtcteZdjmPhEusn58vTGL73tBKaBcSiMInJlQpvZt?=
 =?us-ascii?Q?2yZChNYv3clVlvdhm2rgrirCLx4BDOpCzs6r3iBikR7wjc/+Yqsw76knQq6c?=
 =?us-ascii?Q?ZZbQVpSM0iV3cPuRMIX5D0hCgAzncXpzQXBWxI8bXBso/tTUNDD5vwpdxyK+?=
 =?us-ascii?Q?BzFXatkaNyEHrGX/m4ijbeuxDzE+SWCeWxOD7ZA+263YzBuiIL3LRsXNqC4A?=
 =?us-ascii?Q?Why2VtdfY6/LzQPmHBYA0A8cYz4LM5pf6tDIvZjP8QMNn4b7DyyW7knKPleS?=
 =?us-ascii?Q?0AyP4PB6qIhNlki3xHDdiO16qkysQb63RTPrqS7iduTvt3usiZSqqOzsOOdR?=
 =?us-ascii?Q?2TKKueepsU+cymPRx4rYIpoDtBdjXQ8VkOmWiZ+q4u3vZyhlH3rGkiHbSqKh?=
 =?us-ascii?Q?zec3yoWgJBF24fTgN8Fe5ybYjdSHVKbESv4MExmAGWg3v5HEa4riCSQcD1R1?=
 =?us-ascii?Q?p93TNPemIVYcTBQ93znQMxsg2DfRaiU+2kWqm12A+CcGoKRarCGIpXdeTiyp?=
 =?us-ascii?Q?4Nzwvyuihti5A4S6aVVc4a5OtOR/1/zPXMSkQB7QzmxanVz+18LQFbK4++M/?=
 =?us-ascii?Q?ENeHbcFnRpWHULVNWfiddSWopU9NOq806S7Fnix43Yl7T45oau62aMN/OvJc?=
 =?us-ascii?Q?SbngFmpsUXRJN4UcUxmsdKe7SKxx+4mXbRu+o5rPZPzLFv6FGRcTjH3XfUi6?=
 =?us-ascii?Q?LXQ/tfzfVCQl1qqBcwCtt38oRLzHwpFV58dBIl4BJ3e0qmNxpOqAIJotgHfm?=
 =?us-ascii?Q?2sOX/28daw2Zne/JwA2gZhRu5pCfh3iDXNBgyvUy5BmQgo5RJrSID7iJNaD6?=
 =?us-ascii?Q?AgXWVOEttJI0PBItSaOoC7U2KaRVreMyCQnEBkwSCfvWnDgU9+v+xFQv4EYD?=
 =?us-ascii?Q?Duha6qCuYEHW3jDJUt8tr3Hzh4vODnHcV/mnPOuS/gLZ4bmG4b9XQTZrrzst?=
 =?us-ascii?Q?CI3fzvdsmzmnyUgd/C87uf1AkIY5TKLwX6CaJdM746FNr2xxz1+zvxGgLxn5?=
 =?us-ascii?Q?q20BCC4yjnBZLXp86Q+7m5OYPz5OUdJGMLaOrVlfDjgs4GKpu050smKTk154?=
 =?us-ascii?Q?UhlFBlRvgk1tsc/9J30kUXmra/+7x670bC+NmS/2JqhH5c0X5/ACU6d3QSw6?=
 =?us-ascii?Q?g1/SLfG/jR50jO2/9z72dyl8wgQWlAAcPsiwkY6Fvo3mGUzzLYeHc9N0/3Fh?=
 =?us-ascii?Q?yedpm+s4e6FVVzJetR3OJSuul3ryaQQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ea2ee5a-aac5-45d7-ff40-08de6b040aeb
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 13:30:24.1895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 64LO2kquhskoBl2ET21e9ASRuVyIgB7cEToSMqLMoYVlYyfyit6rV3IlLa9Fs8kfjukIxqw37qMelqzFcLRTK8KWlnXH4TPkeSXgi6NE3oQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8184
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

On Thu, Feb 12, 2026 at 12:42:26PM -0800, Matthew Brost wrote:
> Pack the fault type and level fields into a single u8 to save space in
> struct xe_pagefault. This also makes future extensions easier.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Both page fault level and type reported by GuC fit in their new masks
according to bspec, might be worth adding a reference to it in the
commit message: 59654.

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_pagefault.c   |  9 ++++++---
>  drivers/gpu/drm/xe/xe_pagefault.c       | 12 +++++++-----
>  drivers/gpu/drm/xe/xe_pagefault_types.h | 14 +++++++-------
>  3 files changed, 20 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> index 719a18187a31..1166b0a5fa21 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> @@ -76,11 +76,14 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  		 PFD_VIRTUAL_ADDR_LO_SHIFT);
>  	pf.consumer.asid = FIELD_GET(PFD_ASID, msg[1]);
>  	pf.consumer.access_type = FIELD_GET(PFD_ACCESS_TYPE, msg[2]);
> -	pf.consumer.fault_type = FIELD_GET(PFD_FAULT_TYPE, msg[2]);
>  	if (FIELD_GET(XE2_PFD_TRVA_FAULT, msg[0]))
> -		pf.consumer.fault_level = XE_PAGEFAULT_LEVEL_NACK;
> +		pf.consumer.fault_type_level = XE_PAGEFAULT_TYPE_LEVEL_NACK;
>  	else
> -		pf.consumer.fault_level = FIELD_GET(PFD_FAULT_LEVEL, msg[0]);
> +		pf.consumer.fault_type_level =
> +			FIELD_PREP(XE_PAGEFAULT_LEVEL_MASK,
> +				   FIELD_GET(PFD_FAULT_LEVEL, msg[0])) |
> +			FIELD_PREP(XE_PAGEFAULT_TYPE_MASK,
> +				   FIELD_GET(PFD_FAULT_TYPE, msg[2]));
>  	pf.consumer.engine_class = FIELD_GET(PFD_ENG_CLASS, msg[0]);
>  	pf.consumer.engine_instance = FIELD_GET(PFD_ENG_INSTANCE, msg[0]);
>  
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 6bee53d6ffc3..72f589fd2b64 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -164,7 +164,7 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
>  	bool atomic;
>  
>  	/* Producer flagged this fault to be nacked */
> -	if (pf->consumer.fault_level == XE_PAGEFAULT_LEVEL_NACK)
> +	if (pf->consumer.fault_type_level == XE_PAGEFAULT_TYPE_LEVEL_NACK)
>  		return -EFAULT;
>  
>  	vm = xe_pagefault_asid_to_vm(xe, pf->consumer.asid);
> @@ -225,17 +225,19 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
>  {
>  	xe_gt_info(pf->gt, "\n\tASID: %d\n"
>  		   "\tFaulted Address: 0x%08x%08x\n"
> -		   "\tFaultType: %d\n"
> +		   "\tFaultType: %lu\n"
>  		   "\tAccessType: %d\n"
> -		   "\tFaultLevel: %d\n"
> +		   "\tFaultLevel: %lu\n"
>  		   "\tEngineClass: %d %s\n"
>  		   "\tEngineInstance: %d\n",
>  		   pf->consumer.asid,
>  		   upper_32_bits(pf->consumer.page_addr),
>  		   lower_32_bits(pf->consumer.page_addr),
> -		   pf->consumer.fault_type,
> +		   FIELD_GET(XE_PAGEFAULT_TYPE_MASK,
> +			     pf->consumer.fault_type_level),
>  		   pf->consumer.access_type,
> -		   pf->consumer.fault_level,
> +		   FIELD_GET(XE_PAGEFAULT_LEVEL_MASK,
> +			     pf->consumer.fault_type_level),
>  		   pf->consumer.engine_class,
>  		   xe_hw_engine_class_to_str(pf->consumer.engine_class),
>  		   pf->consumer.engine_instance);
> diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> index d3b516407d60..0e378f41ede6 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
> +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> @@ -73,19 +73,19 @@ struct xe_pagefault {
>  		 */
>  		u8 access_type;
>  		/**
> -		 * @consumer.fault_type: fault type, u8 rather than enum to
> -		 * keep size compact
> +		 * @consumer.fault_type_level: fault type and level, u8 rather
> +		 * than enum to keep size compact
>  		 */
> -		u8 fault_type;
> -#define XE_PAGEFAULT_LEVEL_NACK		0xff	/* Producer indicates nack fault */
> -		/** @consumer.fault_level: fault level */
> -		u8 fault_level;
> +		u8 fault_type_level;
> +#define XE_PAGEFAULT_TYPE_LEVEL_NACK		0xff	/* Producer indicates nack fault */
> +#define XE_PAGEFAULT_LEVEL_MASK			GENMASK(3, 0)
> +#define XE_PAGEFAULT_TYPE_MASK			GENMASK(7, 4)
>  		/** @consumer.engine_class: engine class */
>  		u8 engine_class;
>  		/** @consumer.engine_instance: engine instance */
>  		u8 engine_instance;
>  		/** consumer.reserved: reserved bits for future expansion */
> -		u8 reserved[7];
> +		u64 reserved;
>  	} consumer;
>  	/**
>  	 * @producer: State for the producer (i.e., HW/FW interface). Populated
> -- 
> 2.34.1
> 
