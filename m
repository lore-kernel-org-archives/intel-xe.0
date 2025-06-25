Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4ABC77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 19:51:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADCC610E121;
	Wed, 25 Jun 2025 19:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XEXQYEmF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CE710E121
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 19:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750881087; x=1782417087;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Vk5ilh459IGTrnDLjpvdAPUltkVNoGNDd6Q+aOnsanI=;
 b=XEXQYEmFwVLt7VUotsOrETVcToI2QAzoDn71Dx2URLfm2i6eBc5Opjsu
 mU7tlvoEWtfT2L2HI/HOHpP0jK95XS37+d9vB0nC05fZLwF7TCeH8RiU6
 z1+X1zKfrnfiN4gllYYge0acXA3/aulwzwh8XI+M/enwgHSNIDtiEu2IC
 la85VRneRdQjqs9UAsKlvBL4IeB6ppLxos6ab/39jaa826VBPX5a9ppIZ
 8FkC5WXUotD4k/kXvZLSmvSRm/Ah3+BaZq8rtSn1/9R6zR4/jLwwSHp+l
 Eoql+Xt1Djma1EnCc+YeE9/ErcNrSqKVSXp6ToZuShgsYw3gA5P7+Hvsq g==;
X-CSE-ConnectionGUID: 2aiIu9tkQHqC2+SgYMCY9Q==
X-CSE-MsgGUID: Jr9CpGKZQgKYmvmhCQ5RHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53260784"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="53260784"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 12:51:25 -0700
X-CSE-ConnectionGUID: m3zwoqYyQpC2iTGDP/N9kw==
X-CSE-MsgGUID: tCXG2FWDTJ60FXrP1MBqaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="156874878"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 12:51:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 12:51:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 12:51:25 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.72)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 12:51:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s+uSdGWVfomHu4M/NNT+BvvUbkHkiqAjpJBvI7ysiYiihpC/nK6pb+xdvI02K8kEJi9v1fuLNzT5VeSwxlXFTbukvqv7/gYMqIIL9iy/qB0B7F1grM+gLuf7XX5KHJLTR6AWpi+xWlEoV/9Kd/c68hF6ellICGHnGw+U4y59YptrgRadnAqTt29c27GY6QgfBNS7LiJTQllX4Bzs47CSEhk4jFaONeZmCPRobQQ55XBly0J5DzFZwIpyl+IZZcPWkxvgWys7MLqKpY3DnVm5Lt5jurfpHe/dlspCAWgx2d4znae392pd7G06YP1/QdKdThmWobyIiYlSDvtrc4Kf5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pihVFxR1jMkqh3DOUr29qkwAFVMGLgxmm3ynDdbXsPU=;
 b=jaeGQ0ioihlEg3HWbZLlciT9ccolCvqe2Fzi79g+YrhRoG/ewtuTKagpIm9FQMeOO8hB+VV7uPDzGH7WqaDp+1xPAl/+3pZJZoNQ2bSMNldhxpGgEque7UDXEh+kKeCg86InlX+Nhz4dqzr/rvO3GnN/F7LPdq1Ubr8/CQW2f3tszUyqZd6vYAZX3AgMDbsFj1QgT8CSrgqTJkwq7uSLODvwV9p82HXfn8VCrkhcCan67fiHcqccBEERgrbKuPjxL6WxtOUY+soz5GamHpcTdxXqOa2HCu3LlvLIaNbNfGmz0pnx8BnaJLo1ZJWmid8HAE8Pcby9+lI8UbfFSID9wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB6417.namprd11.prod.outlook.com (2603:10b6:208:3ab::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Wed, 25 Jun
 2025 19:51:07 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8880.015; Wed, 25 Jun 2025
 19:51:07 +0000
Date: Wed, 25 Jun 2025 12:51:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3 2/5] drm/xe: Add infrastructure for Device OOB
 workarounds
Message-ID: <20250625195104.GF4868@mdroper-desk1.amr.corp.intel.com>
References: <20250625193340.38971-1-matthew.s.atwood@intel.com>
 <20250625193340.38971-3-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250625193340.38971-3-matthew.s.atwood@intel.com>
X-ClientProxiedBy: BYAPR05CA0105.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::46) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB6417:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dbf8132-e36a-4344-869a-08ddb421a068
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rGFqMtide/ETsgCZZTyCuZLqkDG5JjyXipstOpVV39F8lQ0A6Tuf/MSvgyZV?=
 =?us-ascii?Q?+11vVPc6dIg/WMe4h0m/nRMTEIkpHeKEG6By8BxUEGR/iLjkQfFW05R9+leA?=
 =?us-ascii?Q?NhZJzGtGx3FU0CP5LTVS0tTPcfS+Hy7JzZ8RXlM/4lNBFS+Hx3z/6bLDOlhI?=
 =?us-ascii?Q?GOJy4TxZdcxjmlPWR/aGJNGhoOR50RUn5e0xM8jIIeOhyZCQ5Us1UbSIMoPa?=
 =?us-ascii?Q?DqrLQdj242g8to9WENLNSHY8s/oD8jvCsdTzXBIPyI5ugqvnpI7JZNWN3jnU?=
 =?us-ascii?Q?eBh7qhWHb2XPngRelQFK+hCS3avgA343fxVfuYuF78RSN801LCDmrqRCNBqR?=
 =?us-ascii?Q?Z9PxzHTJOg3xggd6VKOI/YzfjLD4671ykvLznKAjvmkH27FWoEnecVLYfOck?=
 =?us-ascii?Q?fC6uGZq9Tnj/bwr/MEa3E0UxO6Wg6mz8cPbd9tDe6oG72BeusCN7CCt8uxk6?=
 =?us-ascii?Q?+ZIWeNyU59lrBbIaB3bQBHXdC6xQY0PBq16DXe/q1UaXosbAjsBxN32JgP8U?=
 =?us-ascii?Q?bfbZ+HUvGytw5RrJx2M4su9J6ZxOWPYo+98tQK2QKVDgik2VF1OkCkWkuqd5?=
 =?us-ascii?Q?1xuSs9QADLjn6+dQsh9l/nAhwJ1Yza3BxwFv3UWjvPiiG7I5Ac0KMmT7HOSM?=
 =?us-ascii?Q?MQIsdT/htWb8GzXU6fBQZl480YnuosWUGpQAG+4EXtMHkJqt8Nnb5ad2FASN?=
 =?us-ascii?Q?s3KuSKxyBnT8BtG0oTFqiixhwBrIzgT9vmBwoeuujZdy6aEhIeOpuwycQbB8?=
 =?us-ascii?Q?ba9dVPkMa31EmuCnsU9S2pHc/cKBGWEPuHsJQtVEeB35I3+K19ggIvcxMg8s?=
 =?us-ascii?Q?5UMDAayXR6m/UcSwg8wTZwAu+x1H5ZlymD672vXpDn2jSValjneMAZOiV1kX?=
 =?us-ascii?Q?yzYE7IyQvzPa2fULxD64vZUspTG4sYU8HVw22VbQawl7HiUyiMiBdOrv4AYU?=
 =?us-ascii?Q?9UYpVSbJ7ITZmfCqlAkLRqvdS/pRht+ffD6j0xxfAmxKhzEAXzidgdXdjO1a?=
 =?us-ascii?Q?njY4JXUMswLiJ3m/1oxmX6K7Y6ouxeUoqT9jdJk03O/UDYegMQfd8O14ugZg?=
 =?us-ascii?Q?wt8HOYheWD58rPhAMl5Sr888EiSRAyUOjKKlcLGpgT9OFZfLlRwWibtWPj5h?=
 =?us-ascii?Q?MkVydeQ624PtB1DskCamorwiXnJU1kBArzy7migugwfv8v4QXGv1cgBSyDxS?=
 =?us-ascii?Q?Bb8UHRAGVx2Edn48VolkIp45NfoSBtrhBl4YJdyFwJvPDSPShPWu3xwSd/Zp?=
 =?us-ascii?Q?GVLHTV88tCuubAbjkTOlQPVCeWeufgK66DlFGvA9AUtWx+aJ2QtLMQ1+SVDE?=
 =?us-ascii?Q?7FmZyfm8t5JafxqLfOq8cScd5VQp3huA4cKT+Q5+0HlGhIru5ADZ9rZDiVpg?=
 =?us-ascii?Q?S6St3CVfyDuhJYDoubeMISvlwl8gzWHCttzqbebxxgm40WVTbGn2Icc4WLBU?=
 =?us-ascii?Q?eA2DC8Wq878=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qgoXpmfXD2jPETg/JvadMZIPAhEAThFVwlEvh6gXxMU+/xewvjt7oDJ3YRNG?=
 =?us-ascii?Q?WUlrknOAlfP/3qIcb8v2r0So+n8rrwJSA0icQ+45fdODd7900ybfssJONkeo?=
 =?us-ascii?Q?4N46Spyn8bhMc3sKL7hs50LKxm4keXhRspYNKHIffwt/L3XLWwDtSDoy8doC?=
 =?us-ascii?Q?VgLlHQ7rRtQTeCQa4AmzTr6S/fn4tGpf4KjlQiLgBhMYvIiAFwTcG6JD7ZvF?=
 =?us-ascii?Q?SdQDr5mGUelnr0VW7mxdLnvFU6XeRhjH/s26gdjCAsOvtQEbcq3Fw/sZwZXT?=
 =?us-ascii?Q?0lcBygCaGeSilH8d8hud7GxWHQj5otku+fRkjZdbQ42dU3w4h3M11wkWhtYM?=
 =?us-ascii?Q?dTkvnaIT+IiqADkrCSrg2ld0HVItudJ/OYZhKrtYEyqxXRNsRUMctqNNtjbr?=
 =?us-ascii?Q?uoMsMd5yKdRwAcdDpfPe4RVaE6RC1WRIXNH+i69isq0YKwnLa0rrcec5aZBz?=
 =?us-ascii?Q?JG1Cj2xpSS+BNaDfEcPJZGx3wd1+vHwhsNKouFE51bGoeOoK0MfjtMff4hi7?=
 =?us-ascii?Q?OLdl+MqhIQ+GxHY2Bop8chS1mRkAK5w/ibA9uOnykdEICjG9e8Nl2RqUVuFX?=
 =?us-ascii?Q?Yjh58wBFxW9T2HsVpRv1hEvbtJ6HP9Hb7bXUP0APsOL9FlvVQI7uIWoZuCSc?=
 =?us-ascii?Q?hLciHnmH2tsgCyx8K+jnVQ7PMyPnafA+4do43GsEcjKwUDdCEQgED7GpRDs/?=
 =?us-ascii?Q?VQ+VR61lo9Tqft9z/obQgsdaH372jyCI8ovnsK1R4N+hT/PFFSbwZJee1I1a?=
 =?us-ascii?Q?ppl+JSwu0mBhtDWpWNwCsEkyfBKdlXiA/vEJZT4wHyzQ8m0pobSc3r5Rz3Z7?=
 =?us-ascii?Q?/ofhz6HzhtmBJo5t1eJC0LGRwIVZq3xEb7RbCkxgYbb22CB7GqZsIeh3gIQd?=
 =?us-ascii?Q?NS1azZWXfKN6n8S5sgLGLprQOtQ+ale3s3v2gych+ZyIG2s8RF/uo5YeFRmV?=
 =?us-ascii?Q?uuzjqGDLeCEhGHbyH8R1yGCMNZfY91lmjGIEasvma8LUyJETPHfvsiN4LO7m?=
 =?us-ascii?Q?Nfub05PLFAnhFZTdx9xvIZH4K8oRp0OG7shHa3P9fM20m8Ah4BtgZ0XjWRrn?=
 =?us-ascii?Q?+1/e1Or0EkiHd2v2NO+2o9HfNiuYjvPlirR+R2YElTQD3RFnhZCGVppW42m9?=
 =?us-ascii?Q?O5KgFAyvA3aBmOOux/0pIugTQFD6h2MGeQIbmcrmCsWRfjnp71jxKHUo/3wa?=
 =?us-ascii?Q?2n/wXsbw81HJQKPWKtCLJ8fnUkhFaerS2gv29AwnzuJGE7e5OA+xucS3tB72?=
 =?us-ascii?Q?npQVgrHsxMPAAcvsm1WDHu2icgtoHotGX0ghxv1Zx5hWUmCaO2ayjKlhx0Dv?=
 =?us-ascii?Q?CF7PbYVAxzIouHXh50J9dxKJZMyG5B/VOo0Z231PU0A6ivay/m3xKbLoS+OI?=
 =?us-ascii?Q?ZWRhS6S6nwkOyIkTGmDHmcp5VacuiS02AeXpLYOpTe4aJWtd1YF0QqjEP8A7?=
 =?us-ascii?Q?JP/+5wpJ996XvPtc44x2TGMaLxipgaibJHJonYbq1BDVGjn8l5NGAkrDZvIM?=
 =?us-ascii?Q?zRVD8QDfcaLASzPby05NRB5MOL6OUalO6gZ7Fv+yr489kGzQL0adWgp3RsSn?=
 =?us-ascii?Q?91BedQ63E3Sw4k2mVZlmE58ZzXG9SCkcTpr6LESiZm/BVomb65EVHYzsDyrj?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dbf8132-e36a-4344-869a-08ddb421a068
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 19:51:07.5704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T2b2WFNUkObxWErmMyaf027234cUG1uWdvAL1oOPv23Ca2mn1OjCeFup76+EGd08iV12Xp3ov0Mqn4y+YGCCV1Co2/dPk6OgQaRe819KEd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6417
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

On Wed, Jun 25, 2025 at 12:33:37PM -0700, Matt Atwood wrote:
> Some workarounds need to be able to be applied ahead of any GT
> initialization for example 15015404425. This patch creates XE_DEVICE_WA
> macro, in the same vein as XE_WA. This macro can be used ahead of GT
> initialization, and can be tracked in sysfs. This should alleviate some
> of the complexities that exist in i915.

I'd be inclined to break this into two patches:

 * A patch to RTP that adds devices as a new type of RTP context.  This
   should also add WARN_ON guards for all of the existing RTP rules that
   require a gt (similar to those that exist for engines).

 * A patch that adds the the the tracking information to xe_device and
   calls the init/process functions at the appropriate place.

> 
> v2: name change SoC to Device, address style issues
> 
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  9 ++++++
>  drivers/gpu/drm/xe/xe_pci.c          |  4 +++
>  drivers/gpu/drm/xe/xe_rtp.c          |  5 +++
>  drivers/gpu/drm/xe/xe_rtp.h          |  3 +-
>  drivers/gpu/drm/xe/xe_rtp_types.h    |  2 ++
>  drivers/gpu/drm/xe/xe_wa.c           | 46 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_wa.h           | 18 +++++++++--
>  7 files changed, 83 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 6aca4b1a2824..62f09d2923c3 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -360,6 +360,15 @@ struct xe_device {
>  		u8 skip_pcode:1;
>  	} info;
>  
> +	/** @xe_active.oob: bitmap with active OOB workarounds */
> +	unsigned long *oob;
> +	/**
> +	 *  @xe_active.oob_initialized: mark oob as initialized to help
> +	 *  detecting misuse of XE_SOC_WA() - it can only be called on
> +	 *  initialization after SOC OOB WAs have been processed
> +	 */
> +	bool oob_initialized;

Did you mean to wrap these in a sub-struct?  Because right now the
kerneldocs don't match the actual placement.  Also the "SOC" stuff is
outdated.

> +
>  	/** @survivability: survivability information for device */
>  	struct xe_survivability survivability;
>  
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 824461c31288..a9f708608f3e 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -32,6 +32,7 @@
>  #include "xe_step.h"
>  #include "xe_survivability_mode.h"
>  #include "xe_tile.h"
> +#include "xe_wa.h"
>  
>  enum toggle_d3cold {
>  	D3COLD_DISABLE,
> @@ -832,6 +833,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	if (err)
>  		return err;
>  
> +	xe_device_wa_init(xe);
> +	xe_device_wa_process_oob(xe);
> +
>  	err = xe_device_probe_early(xe);
>  	/*
>  	 * In Boot Survivability mode, no drm card is exposed and driver
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index 29e694bb1219..2a0b0a1a8969 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -196,6 +196,11 @@ static void rtp_get_context(struct xe_rtp_process_ctx *ctx,
>  		*gt = (*hwe)->gt;
>  		*xe = gt_to_xe(*gt);
>  		break;
> +	case XE_RTP_PROCESS_TYPE_DEVICE:
> +		*hwe = NULL;
> +		*gt = NULL;
> +		*xe = ctx->xe;
> +		break;
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index 4fe736a11c42..ac260feaabef 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -422,7 +422,8 @@ struct xe_reg_sr;
>  
>  #define XE_RTP_PROCESS_CTX_INITIALIZER(arg__) _Generic((arg__),							\
>  	struct xe_hw_engine * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_ENGINE },	\
> -	struct xe_gt * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_GT })
> +	struct xe_gt * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_GT },	\
> +	struct xe_device * :	(struct xe_rtp_process_ctx){ { (void *)(arg__) }, XE_RTP_PROCESS_TYPE_DEVICE })
>  
>  void xe_rtp_process_ctx_enable_active_tracking(struct xe_rtp_process_ctx *ctx,
>  					       unsigned long *active_entries,
> diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
> index 1b76b947c706..123579ebf2cf 100644
> --- a/drivers/gpu/drm/xe/xe_rtp_types.h
> +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
> @@ -112,12 +112,14 @@ struct xe_rtp_entry {
>  enum xe_rtp_process_type {
>  	XE_RTP_PROCESS_TYPE_GT,
>  	XE_RTP_PROCESS_TYPE_ENGINE,
> +	XE_RTP_PROCESS_TYPE_DEVICE,
>  };
>  
>  struct xe_rtp_process_ctx {
>  	union {
>  		struct xe_gt *gt;
>  		struct xe_hw_engine *hwe;
> +		struct xe_device *xe;
>  	};
>  	enum xe_rtp_process_type type;
>  	unsigned long *active_entries;
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index f51218a7a580..2cb2fab20070 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -11,6 +11,7 @@
>  #include <linux/fault-inject.h>
>  
>  #include <generated/xe_wa_oob.h>
> +#include <generated/xe_device_wa_oob.h>
>  
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
> @@ -876,6 +877,13 @@ static __maybe_unused const struct xe_rtp_entry oob_was[] = {
>  
>  static_assert(ARRAY_SIZE(oob_was) - 1 == _XE_WA_OOB_COUNT);
>  
> +static __maybe_unused const struct xe_rtp_entry device_oob_was[] = {
> +#include <generated/xe_device_wa_oob.c>
> +	{}
> +};
> +
> +static_assert(ARRAY_SIZE(device_oob_was) - 1 == _XE_DEVICE_WA_OOB_COUNT);
> +
>  __diag_pop();
>  
>  /**
> @@ -895,6 +903,39 @@ void xe_wa_process_oob(struct xe_gt *gt)
>  	xe_rtp_process(&ctx, oob_was);
>  }
>  
> +int xe_device_wa_init(struct xe_device *xe)

We've been trying to be better about naming functions from xe_foo.c as
xe_foo_*().  So these new functions might be better with names like
xe_wa_device_init() and xe_wa_process_device_oob() and such.

At some point we should also probably go back and rename the existing GT
functions to include 'gt' in their names at the corresponding places.

> +{
> +	unsigned long *p;
> +
> +	p = drmm_kzalloc(&xe->drm,
> +			 sizeof(xe->oob) * BITS_TO_LONGS(ARRAY_SIZE(device_oob_was)),
> +			 GFP_KERNEL);
> +
> +	if (!p)
> +		return -ENOMEM;
> +
> +	xe->oob = p;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_device_wa_process_oob - process OOB workaround table
> + * @xe: xe device instance process workarounds for
> + *
> + * Process OOB workaround table for this platform, marking in @xe the
> + * workarounds that are active.
> + */
> +void xe_device_wa_process_oob(struct xe_device *xe)
> +{
> +	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(xe);
> +
> +	xe_rtp_process_ctx_enable_active_tracking(&ctx, xe->oob, ARRAY_SIZE(device_oob_was));
> +
> +	xe->oob_initialized = true;
> +	xe_rtp_process(&ctx, device_oob_was);
> +}
> +
>  /**
>   * xe_wa_process_gt - process GT workaround table
>   * @gt: GT instance to process workarounds for
> @@ -1000,6 +1041,11 @@ void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p)
>  	for_each_set_bit(idx, gt->wa_active.oob, ARRAY_SIZE(oob_was))
>  		if (oob_was[idx].name)
>  			drm_printf_indent(p, 1, "%s\n", oob_was[idx].name);
> +
> +	drm_printf(p, "\nDevice OOB Workarounds\n");
> +	for_each_set_bit(idx, gt_to_xe(gt)->oob, ARRAY_SIZE(device_oob_was))
> +		if (device_oob_was[idx].name)
> +			drm_printf_indent(p, 1, "%s\n", device_oob_was[idx].name);

This function generates the contents of a per-GT debugfs node.  We don't
want to stick device workarounds at the bottom of a per-GT entry; we
should probably have a different debugfs entry outside the GT hierarchy
to report these.  That would also ensure that we can track device
workarounds on platforms with no GTs and no GT debugfs (that's not
something that exists today, but there's been a lot of interest in
letting igpu's run in a "not GT" mode for debug purposes, so we'll
probably have it eventually).

>  }
>  
>  /*
> diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
> index 52337405b5bc..09d065e0abb5 100644
> --- a/drivers/gpu/drm/xe/xe_wa.h
> +++ b/drivers/gpu/drm/xe/xe_wa.h
> @@ -14,7 +14,9 @@ struct xe_hw_engine;
>  struct xe_tile;
>  
>  int xe_wa_init(struct xe_gt *gt);
> +int xe_device_wa_init(struct xe_device *xe);
>  void xe_wa_process_oob(struct xe_gt *gt);
> +void xe_device_wa_process_oob(struct xe_device *xe);
>  void xe_wa_process_gt(struct xe_gt *gt);
>  void xe_wa_process_engine(struct xe_hw_engine *hwe);
>  void xe_wa_process_lrc(struct xe_hw_engine *hwe);
> @@ -22,14 +24,24 @@ void xe_wa_apply_tile_workarounds(struct xe_tile *tile);
>  void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p);
>  
>  /**
> - * XE_WA - Out-of-band workarounds, that don't fit the lifecycle any
> - *         other more specific type
> + * XE_WA - Out-of-band GT workarounds, that don't fit the lifecycle any
> + *         other more specific type,
>   * @gt__: gt instance
> - * @id__: XE_OOB_<id__>, as generated by build system in generated/xe_wa_oob.h
> + * @id__: XE_WA_OOB_<id__>, as generated by build system in generated/xe_wa_oob.h
>   */
>  #define XE_WA(gt__, id__) ({						\
>  	xe_gt_assert(gt__, (gt__)->wa_active.oob_initialized);		\
>  	test_bit(XE_WA_OOB_ ## id__, (gt__)->wa_active.oob);		\
>  })
>  
> +/**
> + * XE_DEVICE_WA - Out-of-band Device workarounds, that don't fit the lifecycle any
> + *         other more specific type
> + * @xe__: xe_device
> + * @id__: XE_SOC_WA_OOB_<id__>, as generated by build system in generated/xe_wa_oob.h

The "SOC" here is outdated.  Also the wrong header is referenced.

> + */
> +#define XE_DEVICE_WA(xe__, id__) ({					\
> +	xe_assert(xe__, (xe__)->oob_initialized);			\
> +	test_bit(XE_DEVICE_WA_OOB_ ## id__, (xe__)->oob);			\
> +})
>  #endif

This is probably fine short-term, but I think eventually we should just
have a single XE_WA() call that _Generic()'s on its parameter to do the
lookup in the proper place (gt or device).  If we don't want to _Generic
it for some reason, then the existing macro should probably get renamed
to XE_GT_WA() to clarify its purpose.


Matt

> -- 
> 2.49.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
