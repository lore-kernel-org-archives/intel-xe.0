Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC20D78794
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 15:59:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F6C10F04E;
	Fri, 19 Dec 2025 15:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lQx0Xcxd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1DD10F039
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 15:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766159974; x=1797695974;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TJHFFIq0UUsISojCw8J6cW0xGE28BI0aRJSdhPcBtmE=;
 b=lQx0XcxdjuQGj/+XI+O0merqwWxzkA1ngjBcWaTOusVWMqRRWU9Gva4T
 daCu4likTdonrlEilrflGoks/4hcznH2rcqUjnUoUNTK3aweZvvN/NdXs
 BRdq+xZ1sX3MvfrQlWjm28AoUCbVTbv/jKKU6fzoRcs48OLXAMrSbjYVS
 C7VDvujBspQxsnloqgiP37jKQzIa1RnTci+O+QhPtR2NBKB5uRKGLAU1R
 ox6Mr+kWGiQXiMHCZ3Rp4wxBiC1D5KE2U+0p/IoQKhoH1WjSKWNkGYBP3
 D+8jdweG4MYttohlBwAxriSukcErzUvnBcwJqil3swEYkykvDf/Ygd/rm w==;
X-CSE-ConnectionGUID: wc+7PmD9Q56luzHeNhpxxw==
X-CSE-MsgGUID: smNHnwSRRoKzy/+kxUew6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68273414"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="68273414"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 07:59:33 -0800
X-CSE-ConnectionGUID: I4wijSSxQrKwCqZXPM0OOg==
X-CSE-MsgGUID: xkmXx/u+R7el0RqE/ExIoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="198149562"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 07:59:34 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 07:59:32 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 07:59:32 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.13) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 07:59:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BtM4UdCjCx8RDXP6CHa/KySVnZaVKxYJ+WQ/qeCh8SRwR5FbAywvodr/A7XwU9mCeSWtW7UglBFV34yQov64em3+jGJObUDuobwXR8oQd0KN3l2Zkeovxe3RN3KO+OptTgMtq4jnDjZyk7dAmIxts0bUDER557K4uK4w5tAbBInIDjF8lWagIcOtzNUyAOMvHRJzA8pzqPCUO1AxvasbuwJKo112K7vMuTReWwKK4x3y0X/H46w1hfvHAUXiyjzORdzuhP5LYs7NIo+7vU5isQDaMEH1MYPQQ1ojyPy/xJPF+iJf4tDTL/eueI2DZOdGlVicnPfvCaMTkoahCfQhog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/UR//JUMpjPH0qA/bMGcPb8PmWk1fjTDbwWnWp5+kk=;
 b=DgD1MnTak3/bafAaFNfCVHij9l+hPBJcnqIWIQCBjQqm6OVGKoUryz6aRzjt20l7hxWoqlsX0Kn7NsIOp8d8GeP2i0PJrxBjVfe0UzB4484Oqk2ouU3nfPcUV44CoccPbFEzAzZCtc5iUY3q9PQxGPgjkER2AfZigKZFoSpz/zHAHBTir8EvvnfPRscTjUxPVjlmCNcXBZB4GAPnx03WZxwhxGKzGmRFtea76AKyiawnR4tB8Cd8ceXXzn52wPDLqwisgicdmGNU+8qjA5NEEawmL6j8BkVkikQIetLsKjTDa5F8mhmnAw5n3liaC9QV6TWJCXZm2f1GWnD7zxtg8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CO1PR11MB4819.namprd11.prod.outlook.com (2603:10b6:303:91::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 15:59:29 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 15:59:29 +0000
Date: Fri, 19 Dec 2025 10:59:26 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v3 2/2] drm/xe/xe_survivability: Add index bound check
Message-ID: <aUV2Xk-2P1rze7bQ@intel.com>
References: <20251219105224.871930-4-riana.tauro@intel.com>
 <20251219105224.871930-6-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251219105224.871930-6-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR03CA0061.namprd03.prod.outlook.com
 (2603:10b6:a03:331::6) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CO1PR11MB4819:EE_
X-MS-Office365-Filtering-Correlation-Id: a8e6ef06-0d21-427f-bceb-08de3f1797bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2GEA7DQ/YwaUSDDhAeKADEAgKzzlsE2witSiYYMTFsKgnGLZg15f92Nwdp3b?=
 =?us-ascii?Q?PBh1AlUBQpODcubbIo7k1zmgVK7zWMMjxpi+2KNP9cXOlbten57eegadO9W/?=
 =?us-ascii?Q?8+unyqP5TDgzYdmjqlHHXx9yepZ5xwq0H/oIGJmHfMb3wlHpm+kQemTCCBAR?=
 =?us-ascii?Q?IfqMxLbBKeBVvp8joEWoveIuo1jK4/gFF6fFQ3mkfH2ulcbci8CHE9Td8fMB?=
 =?us-ascii?Q?zWjINdEw67SE5qekrUDYTOzuMQyZ75NnKc8bwEPMJQ6nXZ9rFOcV4yA7ujeT?=
 =?us-ascii?Q?hVWrcUNjCjCpsvJDg4yTQg7wSTL8JXX5CqbhrphhGdJMbAqKb4hwvdOrqSjB?=
 =?us-ascii?Q?mJFW4iW6o8r+YqAnMJ+YASZkEGQ+9cZLgPDFgSkD3ZhcMmH6Jy607m2AAgIv?=
 =?us-ascii?Q?3E5wAFm/Ztu4L5a8u9ZRIvV/vbkX58P3JTox28uMVXM0uDJg5cNferxM1wPP?=
 =?us-ascii?Q?ELM8Q71fPHS0l9S0JvqAhsKNXD8HdpFjsetM24SKv8vAdC4aznF4Rb+fLvKm?=
 =?us-ascii?Q?5wZ2vcx5GxaGj+ETxJvifx+p3oPAZmxWHiRDfYEgjr1Ns1WL8UsHMrJuCb2C?=
 =?us-ascii?Q?jm9qYm5xvEuVKRFreVyX1DxaeEF/Mdm1k1W74mJuy1InWy1PWsf1C5l1nJEF?=
 =?us-ascii?Q?5OfLUzjNsKSaOW7B6wlnFjh7lVZXV3L9DTfmLxlnvIpt4fOYtp7Liju7lglx?=
 =?us-ascii?Q?J1YBk21xhC8N9TCOqJ1rWokLFFSzZg3G6IKDBTC4TAq6VOjaaN+fPWG9y4qD?=
 =?us-ascii?Q?gGbYkeEC24VBeoM/OqDTWOWc/Bk5LRrgDvSwZXNzNJdI/Zve9AIoaYVch5pK?=
 =?us-ascii?Q?cSObJv9OaQRa/ExWm2iAT/JBmjyn4QY9A/htQv6hQmKV9iIc7G1Yadp1QBzJ?=
 =?us-ascii?Q?wXMOnFgZ8TB7Cf/iv9bB8Hm35FIIhEadqsQloEfYhQcKIIAKCy9TbcVCCFFr?=
 =?us-ascii?Q?OemprcTqLZEN+epN7SOnRY9ho/zEccO2iSccWLvl8JvrQHs/mdCehb0glqHH?=
 =?us-ascii?Q?sB1v3liUN1Bpo4tVIvFmWDi1zbsipOjnxZk7OiVxafFerjD9F83sBIaIQerE?=
 =?us-ascii?Q?rtE5QpVGN33NSORi5Quu9n7ytuUcIK2iIKQ91u+Vhq9L2gmUv1FV99T7q9od?=
 =?us-ascii?Q?9WsLNaHSL33E0lKhGK+aGQe/f8WNygnYQFiMs5/fhukIXaFOcsBUCfkDoaA1?=
 =?us-ascii?Q?Z9/rm/5Mp990tCCsWcW7g160xjwHluKG9TThd79gJNywVJLfvQ1cAElSE6h+?=
 =?us-ascii?Q?PymZmVJzShP/cWM3FGPTtW+F1vqXEotZ1jqnfLrZAXOxQ4pi2oj5XokCSsVM?=
 =?us-ascii?Q?nVDjBXg4ZTamP/sN86Yj8TA7Ot2tBG9qhX0Od9kDzabzGzq1zx7ACAazZRx6?=
 =?us-ascii?Q?u8aDVj/2ZmVzZrwBszZGXZphSd6OulwYsqU3KAge4CWJaXdtxN4mcD+RUVfJ?=
 =?us-ascii?Q?fjSfTB+J7+Js+936W8ZwcCaSyT3aS+xR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hNoKCSrO4U037Nx/ST37fS8wOmzeR0faZcRMIXmWPrwCgugCiiSnt3CnNlov?=
 =?us-ascii?Q?i82WQsBssqYpmzrgw6S65nZoeknZHrYH2TILY8wWFjyiGsDSxgWgGqNMd8f8?=
 =?us-ascii?Q?77X/Iyh/rL2vX4oBEPtdyMQR13AzXZl8hEagCjEkrR5rwDw9pJntPKItsI+o?=
 =?us-ascii?Q?Ns5Uubbu5PI20kHyYtZzX5fogl7H4GHEwYBS98IXhASBA4/psJ/lYmWdxxRw?=
 =?us-ascii?Q?GMkrZ4yMpFhpXvmYM5gnUunfBavImHMVXTWHVUTdYjkRdvnOWoAmCrlsrvUZ?=
 =?us-ascii?Q?GFKizWJB24k//Hqn470JF0HGQUTux25KAMEKMH77Swb2pUitxneiPQE+iJEF?=
 =?us-ascii?Q?3BmvglDIGKvMleUJjIJgETK1yTPCczwzh0tl1k7L2nZRIrkRabOVVWGdPxib?=
 =?us-ascii?Q?Xf6JfyvuaFY7dp+lbizXsEVUMXKQFntqc4zdWD1tLtQNESb2/9KoG6JWqs/O?=
 =?us-ascii?Q?MbtcwTsgF8Q9IyXA6St5LdZJWAeff19Uny5pztBp0swdfoIH4Us30xc2okCY?=
 =?us-ascii?Q?CWrOkb4SVs3yjvZuZ1UZTxIcy1uASxzh6Tc2gS4UFYbXwkklVnQtGHnsuycE?=
 =?us-ascii?Q?mlw9u9qJ/P6BUtz62t9jqKEZSqwX3x0X6YrHilUu4YDKCxVnIhBBSfcu1/5t?=
 =?us-ascii?Q?IRE4ACJQ3P2i7Dp+JJjxS5rV7tIafeoSCDxBWrpjOxL1ZFlW/ES9lb92jyjG?=
 =?us-ascii?Q?36eMK6jtKmqyTpvPRd5SAro8nDoUN2i12BHsy//LM4uCHBz7ALabb4R2E40u?=
 =?us-ascii?Q?pWWn6BGk7IFJHmaV0jCaSVMphQEntDtHJ/MwNavc7BAV/Mvic67GqWX7EsR3?=
 =?us-ascii?Q?XKrnIPUlT6KfzNXM4FYWuVnzKb9uBPLFsOIpBRmp1HYEDpCo3zf1rPpF4HXn?=
 =?us-ascii?Q?1PaElEfchq9PO5TzV4aAaEyk285y9IU7TZ7Vhx1RooDDN6CCNejj4uOj2so5?=
 =?us-ascii?Q?0QXhiaNtT1yGklTSiSB6Vtd77IKCjNufpwS6mdwr5SfNu2PQebsls7N6Sdtv?=
 =?us-ascii?Q?sFNyBG4NTRUJcImnnkWomvFt8Y3Ae7ro4u2rF9jIBhf2OX1dR3vPP3Zz+MHt?=
 =?us-ascii?Q?d99jYT+CvROpZtuNR4l7xwFGRYCmzBHlrUK+1nyOzJha1Sh0cY0fAApJJDwV?=
 =?us-ascii?Q?PLOIf8qq51u/dSz8Px60WCRFTRg4G02EjxlMf8l5huUKyegWgpTO1cCr6atl?=
 =?us-ascii?Q?EN6SxSTkX7L58ntbks/rnimx4+BozAeM9XMx05ukn2QYNwvKRVIk73cDq2SU?=
 =?us-ascii?Q?s2X2Hr5iUMoZUBcvdXtu8uFmDDot3tCo5Xm8fhT6OzyZy1Q1TyO59wR/AQAT?=
 =?us-ascii?Q?8kH5BNR1phTUnSWdBxweLtC5LJhCV/5DEer9ze+NQ0T2+5YsG4Jz7Smyj/+U?=
 =?us-ascii?Q?U6mH7+9afXg4dDGxAz8zVXxP5DyAy0b2GeR8A9o9QJM8ajdh/BlWAB9L37NC?=
 =?us-ascii?Q?v+r57YgVPBqLHDtCzg3C+Hv9LoSYTxcobbXYM8Ic2h7ozEGLSW39VQEfuFyr?=
 =?us-ascii?Q?F32/5Dxa5jGPUOpPm+ZAIaqw57v5R73y6aDfBk2zt/dYEk5LdTZZjugo7uHg?=
 =?us-ascii?Q?vZ1tFhrHWMjjxHZWEBoNyq7aMUBTeXnRftyzXC5HHVz9VWszbesnVmFaDui8?=
 =?us-ascii?Q?JwGM1zL6gtMTyYq6BoHGw7VEA1PS2aKTZnWKvDXAyyckckk/XXsvzNxMz+Zr?=
 =?us-ascii?Q?4G2BawPwlCeUe726zTyr8tLEmPyFB1iXU7Lm3l8lu+6TbIRHYJKh8j+1VY2U?=
 =?us-ascii?Q?5FGh5GjYKA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8e6ef06-0d21-427f-bceb-08de3f1797bb
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 15:59:29.7473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NE30scSEBHJvAPR9oUTUsJqOhOtJcD9/4fqzvGYmrR3elb6geM4hKiwfZPVu1nG8UgbIJLCHdXtYXLYnYnLZng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4819
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

On Fri, Dec 19, 2025 at 04:22:27PM +0530, Riana Tauro wrote:
> Fix static analysis tool reported issue. Add index bound check before
> accessing info array to prevent out of bound.
> 
> Fixes: f4e9fc967afd ("drm/xe/xe_survivability: Redesign survivability mode")
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_survivability_mode.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index e6e326dfb92b..ce55859a9a84 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -258,10 +258,14 @@ static umode_t survivability_info_attrs_visible(struct kobject *kobj, struct att
>  	struct xe_survivability *survivability = &xe->survivability;
>  	u32 *info = survivability->info;
>  
> -	/* FDO mode is visible only when supported */
> -	if (idx >= MAX_SCRATCH_REG && survivability->version >= 2)
> +	/*
> +	 * Last index in survivability_info_attrs is fdo mode and is applicable only in
> +	 * version 2 of survivability mode
> +	 */
> +	if (idx == MAX_SCRATCH_REG && survivability->version >= 2)
>  		return 0400;
> -	else if (info[idx])
> +
> +	if (idx < MAX_SCRATCH_REG && info[idx])
>  		return 0400;
>  
>  	return 0;
> -- 
> 2.47.1
> 
