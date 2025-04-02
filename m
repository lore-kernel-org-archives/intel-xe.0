Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA04C28B20
	for <intel-xe@archiver.kernel.org>; Wed,  2 Apr 2025 16:50:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CC010E856;
	Wed,  2 Apr 2025 16:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gu30bXDg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEEBB10E856
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Apr 2025 16:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743612612; x=1775148612;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=K6aKxj1h8BoDgNASqACMfsCyWAE9Pa9h+U7nsY1pG60=;
 b=Gu30bXDgkTjN3QThZEKU7hvVOB6NrwyfKEJ+rxItll1Jh16r0N/3uS++
 YH1eakhk6BV0NmgX9cyzN+dv4FgnRTRRhcSpSu+NCEyrXp/9TYtvONSo6
 Dj1FSR5hSDzKPLocmCHcsW2SDU7Eu+klVgng9saQB/mpt9QadkxHHPPEF
 sDOgH0C+mFMk+dHv8eAGqYdjAT8wWLrPDnObQevcm22qxUdQhbPfDfqw0
 9rt45f2QLMr3O2RXQJKsVf1BE3qyZRt28D6N59aJLlxiF5AfUmoos6iuC
 Le7Ln/939LYCFpTdhrnqo9iTJFJeXWvq+6elOGDB08qHJRsosdICnHzoA w==;
X-CSE-ConnectionGUID: 8ikiKC6/T0uAXhm2hiF1rg==
X-CSE-MsgGUID: XwMRQ6pyROyvb1LTOhvU8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="55655228"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="55655228"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 09:50:02 -0700
X-CSE-ConnectionGUID: 3x+1hNc6Sne4LwR3li0REw==
X-CSE-MsgGUID: p3klgqbVQZWxUeGMJt63VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="157746114"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2025 09:50:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 2 Apr 2025 09:50:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 2 Apr 2025 09:50:01 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 2 Apr 2025 09:50:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rpQuSv3hSHpejUbzyBvPe9r4KaKeZKWkGHqNwMTUTByFqhT5BmTuXYbnAJx/FXk/3o+Gwv4agu/SPs7n9xNnwSB9yvYWSH6tk+Nhg4AmmYbP4A2bdtsc+U1SpV0PE4EPXZTKdSMbUQIS1utoilZnw54lEMTQyCTzaLrOstxzINOJHLMwZ5oKHak/jqAC8+Jm2Y/k4+9HaMb0fkyBXjPfkPFiRnILgYPjO9zNOK4Pe5s2uh2I3Hrb7bAUkAujfCek0Hg/5bDWXIEQucvU3ZahBissMa0daXVORaIfiy6mRGnpcArUOmVMRWSqAQr6lkIETl4A5rC6t/SZSs6icoS8rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cq3bMQMwD4wsHXRPCi/ow65Gw4zIdTkWSfmlr44hfR4=;
 b=Jgsux0v/SB8M0EZrUMT4iROFIsHYiwuh4FOvTwXBxSJWUNwHgi2H5CqCx8pae+cQ4ScY5AWqVLNaTFgUsnXJHXCURHtupk5iklCYRDG9AIK0HaNN2jSB2Jq0x28nkN2liXVP9rwD/g3G3EV5jTsum+UFbU7dz/aAoKmfWqseRWYTbFiGdotSzzXukaktOlw0DVqR8es176Zz3Mc0229ocxf4bPmSvloQhjSk4F6dNFYG9cDb6LKm5RsRGFf6sQ30wudfEBurqs5V+G0xf9/Kt6bU+1LXPhLYm3OvsYLJNQOVz9EyHX3DJZKj/zjbTTMc/tio/vf2GiUx4FywFubsgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA2PR11MB4953.namprd11.prod.outlook.com (2603:10b6:806:117::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 16:49:54 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%7]) with mapi id 15.20.8534.048; Wed, 2 Apr 2025
 16:49:54 +0000
Date: Wed, 2 Apr 2025 11:49:49 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Fix xe_pt_stage_bind_walk kerneldoc
Message-ID: <zhuzm3doafqpqh5enfz5dx7tbjmsuj7gx2nbcaa34nzuztlr4l@hpcwgyfy3sxs>
References: <20250402122924.25526-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250402122924.25526-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0374.namprd04.prod.outlook.com
 (2603:10b6:303:81::19) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA2PR11MB4953:EE_
X-MS-Office365-Filtering-Correlation-Id: 08d5b3b6-0e62-40ad-240b-08dd72066477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ioVkRDI2tjp/QgF9v8bPR4G1b9OXZEZKV5aPrqGzAh+gwwul7dYc4XYIJ1?=
 =?iso-8859-1?Q?5OmWAuoV70Ee9WnHfnRbWUtsCBgJZPb5mpes6530W3TNnVwJPxljwq+bAt?=
 =?iso-8859-1?Q?Ays8bBPhqukqIpRVSJ05fV0HT9EZ50O6X0d8QcI08tCHy6i3kAndbKvqsv?=
 =?iso-8859-1?Q?3fJe6ZreDEcsU1U+KrR/5y9ROWRDPxqI+sSY3UrbN5SRo9ohfGucSYggr1?=
 =?iso-8859-1?Q?N+Y3SVZvqM7VvFrSiHW1b8+4w8daZ2yzau1d+1pRwlOzsQSZ/X70CaAPpx?=
 =?iso-8859-1?Q?TGzDhYfFRagP4MxZsejY7bWgpVW7sdAaX+VvtMlSjRM/8H/h+JQbYjArgo?=
 =?iso-8859-1?Q?+ovU7F1IZGdYdXAE2pv2imTotwkk9xRb9W+zlDf1QoDXUbBHZPVdcD+zT1?=
 =?iso-8859-1?Q?xrRG9fteKOs0lM6too/Unp8MEsyCsaIdGz29zlgFPmE7Gl/fJUgd5ulvv6?=
 =?iso-8859-1?Q?06Z4X9eJBJobnwXCv5A+FsIvFZqpt++/1UxXHlENNq9sREdoG3aiyvxnZV?=
 =?iso-8859-1?Q?mO55JG709kLpOCidMqhZdKCUGI+m72ruEwi19SgTGWQufkuUhuCEzWdzOW?=
 =?iso-8859-1?Q?QO3traPwFkO8uPvUvFXuPZrVhg/ItUhqWtqVzxdEMzEgURvgd3c/gt83be?=
 =?iso-8859-1?Q?9YW1YfpKcJ+LJJKFjskAqaXJEUkH2eaCA2SiuZoKOmcyIRuIVdCszejVe0?=
 =?iso-8859-1?Q?TQrRTEybkQ6wePLhDw7SFxOq6HA6egy8EczQ63kddnR7+cyHiJJwQjK7Sp?=
 =?iso-8859-1?Q?d2tmkrFTz6Okqu8d2MD+oIkXM3CMNmmsMDTgZ6ILuBoUWd2a79xriSKPRv?=
 =?iso-8859-1?Q?mD5uPfa+FMdBmb6wgbGxDxLeDI9Z10x5KZIUgeyR9TDR90UCqQBqTX21aR?=
 =?iso-8859-1?Q?OKyOyWTFoKToVD20mwFsickiSEOpCRPwoGX0glUX6B05eNjUbV+wXtj1i3?=
 =?iso-8859-1?Q?UJM5FQQexAHGK46gdXEM6BCqdk4Hj2bu9TWR2MH6aNx6kzRLOHuWiTBSDe?=
 =?iso-8859-1?Q?yAn5vrwlFB15ixnfQCXChXRUqfNKS35LHwLFvVKFcEHFbdSEC4mhAFtSda?=
 =?iso-8859-1?Q?v/8ZoXZPeydoy4OFjnuaJAXwRm4+hOXFPLPjzyLgR0u+XsKkGTns4eeTEt?=
 =?iso-8859-1?Q?dMqm//4hTCBV6R2nNy4u6TUFa1FiH0G0oQ0LawbIb/qpg9AdQZgsLjqFcy?=
 =?iso-8859-1?Q?U0uuyrYOKN0WJ0RN6qcY39nO2SII369BxGlaegWlI/Fflvtp3X1YR8cBV/?=
 =?iso-8859-1?Q?FCx+cMmJlxZ7xxNtvqKE2S0fi4OuJOyBsErN8WsXefMgDptd5iWn+qeeCu?=
 =?iso-8859-1?Q?h5RA6q6++fzRuD2PmwcrVD7iq40WkDLq4x9uKj3AXTb2phGh+AhKzdV66s?=
 =?iso-8859-1?Q?SrrC6pzuzH68DwydJcwHKP4X/Q6RWg1+/ILK8evNtCLUC3DX7yFHACeDjF?=
 =?iso-8859-1?Q?sx3gZ350sg5mePiA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?nrq0oRacYzi9CdsX7ICDz+fL5CUDcdwew7769THyThkwW6b2fy5HM9ksM/?=
 =?iso-8859-1?Q?hNE5J8PPWgcplKx10YY0x94ujiqchJ93Ps/rxnUrqTFWG4upZxJBNsGPGn?=
 =?iso-8859-1?Q?8X0ljdxBVN0m+DM1UkHRGK3jSiWNRefup6fgue+oP+TuWklubWfmAXGcLG?=
 =?iso-8859-1?Q?y8/7NlYRd946jJd/BbM5wJ1S5b1P0NF155uwG0MZdEqVnsKFMN8HqJXhZM?=
 =?iso-8859-1?Q?HM3BVyM1vB6H+1XCXTauaTz+9x+ZiGcS7DPfA99vvo26jfxPmJYp51QBWl?=
 =?iso-8859-1?Q?EOgmYevJyEgAWS7aPQMjM9aWtBbWKHIvKviRtxxrcI0axoXdZ1vDGaBTkY?=
 =?iso-8859-1?Q?9SCkuLqzPi/jt+NfqtvUG02I59u6RXKi/ctoOI5pgMjPqtN5Byh6sB6oAa?=
 =?iso-8859-1?Q?7+Jm1qP4JNfCvBwvlDcnDLLk5B6ih+gcfiC5+ny1bEoH/5LlaMd4V00uro?=
 =?iso-8859-1?Q?SQTdPvi4PxetS7PAarnyvpMx19dllA/NdI2ohobbma+w/g+vaMN+irRFXi?=
 =?iso-8859-1?Q?W7GH4WCk8KtEby7MomKBl/ynsG5jEtSy/hvZlYw87wqLPul3DCPqYnnYBr?=
 =?iso-8859-1?Q?cfQIMAx9DnNtfpZBDWWlLTQqeyvGbKrV4XymnVwtpUG66f8GvL71yBxnWJ?=
 =?iso-8859-1?Q?ADOCM3Tpwkk/nROLi5h591Txd5+CJQ/BiWu/PZ9BWr5bMtsoLslerx5MrC?=
 =?iso-8859-1?Q?s3ZQ/6m8aqH8nb+san/PvuxuEZ9m+JHApkXxUman+nahYttBf4/JI1cz4v?=
 =?iso-8859-1?Q?DVzJ6iL9S/icG7JZZwuhnX8vUgS4r3j9+9bMBUaTYutQndDPHzwQsi2psC?=
 =?iso-8859-1?Q?ll6dYtN0zYtVcb/NjY8hF0G0pggZs9slhz/kxEsOlUMwmQ7RchGSP/ADAo?=
 =?iso-8859-1?Q?XbaXXEAFXo9itsu7vHoELYCf8DCtUM0zDokrhYiuvNpMvi68K1CreNMzNG?=
 =?iso-8859-1?Q?l6ceO+lVKjpaPsqLQM+3vJUHn/EAG2CI6gif2l8i3oHPcOQmHpk458hTgR?=
 =?iso-8859-1?Q?Kap6darhGdz/LHiP1yPy9jxsMyiZS3vDngyYGSVhqL2S72QDdyL7PBtwEq?=
 =?iso-8859-1?Q?nr46Hd57qyhzYiviH3FiSHg5FtxZxRaxryqIka6Yf6hCeNRHuvkndn4Sfj?=
 =?iso-8859-1?Q?t3Q9TzELubHGeuH6R5fLJ6BWnfgEMdRgb/wuH5HiIht4cQSq0cBr01I4Dt?=
 =?iso-8859-1?Q?TK3uYtaE7r1lpTsRVZW34vte5eJ96ZCvdznAnUJQ8oeyaZJcLeurBOA7Yt?=
 =?iso-8859-1?Q?VmzG8pN1xcXupAEm3R6DV5aWOD1Rf4rhuSlncJnjiXHvDUxDhMOB7oe+0D?=
 =?iso-8859-1?Q?4nRryNwhEKdhLxAlv3BiI+X+u9BU9KKF7lahLMdJfvhwPnrzoTSNQWIIzF?=
 =?iso-8859-1?Q?T6RDOVLouzEU+v+MVzqxIgfOgBJGbSeaG9T4r47qFwnwJbwmatsWOUcn3l?=
 =?iso-8859-1?Q?LXQxC/C1oL8TnJgzRTiWWJ4lNH7tIBRlnV84Mi1UHNb1eZOwnvwgSaCjOu?=
 =?iso-8859-1?Q?6cDdneqL4JWkIb7mA6OuDQPKqb4R4/05gknOjI1F4mhRclmL9L3N0HBd+o?=
 =?iso-8859-1?Q?HxWrsUTVUf0f2tcKx1fAkAxOFBg7kO2nef0lH1GAQkd+lQVSNos2in0mT2?=
 =?iso-8859-1?Q?KPVpMaWx80N5m606E0zw+iAZnqZcRf0eb+FV57aOUBHWEIlK7opNFQ5A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d5b3b6-0e62-40ad-240b-08dd72066477
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 16:49:53.9704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /qtjw2Pow3MIZDQZ0hD/UkQzod7JF6wCzekV0I43OGXX0afLaL1C+jCRpEaeJTKJVUgOQrXCYMtcfaWZwxM8yi8OyroK0X43qFVtShmX4Tw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4953
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

On Wed, Apr 02, 2025 at 02:29:24PM +0200, Thomas Hellström wrote:
>The structure was missing a proper kerneldoc header and once
>that was added a number of typos and errors became obvious.
>Fix those.
>
>Reported-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Closes: https://lore.kernel.org/intel-xe/x53tcs5bjldw6lcorjemuheklxcmepdvr2u7lvt3hpqrzqoc4h@nsu6hs25taqj/
>Fixes: b2d4b03b03a7 ("drm/xe: Make the PT code handle placement per PTE rather than per vma / range")
>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_pt.c | 14 +++++++++-----
> 1 file changed, 9 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>index 82ae159feed1..33839b25d708 100644
>--- a/drivers/gpu/drm/xe/xe_pt.c
>+++ b/drivers/gpu/drm/xe/xe_pt.c
>@@ -269,8 +269,11 @@ struct xe_pt_update {
> 	bool preexisting;
> };
>
>+/**
>+ * struct xe_pt_stage_bind_walk - Walk state for the stage_bind walk.
>+ */
> struct xe_pt_stage_bind_walk {
>-	/** base: The base class. */
>+	/** @base: The base class. */
> 	struct xe_pt_walk base;
>
> 	/* Input parameters for the walk */
>@@ -278,14 +281,14 @@ struct xe_pt_stage_bind_walk {
> 	struct xe_vm *vm;
> 	/** @tile: The tile we're building for. */
> 	struct xe_tile *tile;
>-	/** @default_pte: PTE flag only template for VRAM. No address is associated */
>+	/** @default_vram_pte: PTE flag only template for VRAM. No address is associated */
> 	u64 default_vram_pte;
>-	/** @default_pte: PTE flag only template for VRAM. No address is associated */
>+	/** @default_system_pte: PTE flag only template for System. No address is associated */
> 	u64 default_system_pte;
> 	/** @dma_offset: DMA offset to add to the PTE. */
> 	u64 dma_offset;
> 	/**
>-	 * @needs_64k: This address range enforces 64K alignment and
>+	 * @needs_64K: This address range enforces 64K alignment and
> 	 * granularity on VRAM.
> 	 */
> 	bool needs_64K;
>@@ -301,6 +304,7 @@ struct xe_pt_stage_bind_walk {
> 	u64 va_curs_start;
>
> 	/* Output */
>+	/** @wupd: Walk output data for page-table updates. */
> 	struct xe_walk_update {
> 		/** @wupd.entries: Caller provided storage. */
> 		struct xe_vm_pgtable_update *entries;
>@@ -318,7 +322,7 @@ struct xe_pt_stage_bind_walk {
> 	u64 l0_end_addr;
> 	/** @addr_64K: The start address of the current 64K chunk. */
> 	u64 addr_64K;
>-	/** @found_64: Whether @add_64K actually points to a 64K chunk. */
>+	/** @found_64K: Whether @add_64K actually points to a 64K chunk. */
> 	bool found_64K;
> };
>
>-- 
>2.48.1
>
