Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6212C7EE2A
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 19:57:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939EE10E121;
	Wed, 25 Jun 2025 19:57:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iRP8AKkR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46ACA10E121
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 19:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750881443; x=1782417443;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=POuB1KxQ/ZT1DeuLOmozOHKJpS/uu30NmDEqT2KKX94=;
 b=iRP8AKkRRzAIy0gY0mgNgbOlSaoyYfvi/dULihDQPOkG15UrAP5pJVnQ
 xOc943UtzUKyIEXwGxz8vXyeIm9a3c176zSikHrAdNxbbL2Ko9JKnpOQz
 +msEQlZElDIMZhoBt7wlRHRc2S2be4uQCz2FIq8iZcRW7aFFc1vh9e1G2
 LnxYOwuy5zI5oyUPEKAcGKYw/53HrFnzf8aFEBQWtebv6jIKHoJ/b6uPk
 6t3Vsswkk3ejtnkT/12GtSC+Qe5VS55/HrzZKlEeRbZubO7AMjNJ7xc+P
 eOsCWTesPxHpgn24pkrLMRE8D+Pzrhors5YAIqxfoxtfgdmpvPzBE3o5Y Q==;
X-CSE-ConnectionGUID: OaV+0ujoT1CjwVymVsgRUQ==
X-CSE-MsgGUID: SmL8PzaQQkyNVUFCzWH25w==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53031214"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="53031214"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 12:57:23 -0700
X-CSE-ConnectionGUID: V+k8PijxRrSzK0XsZ9WNGg==
X-CSE-MsgGUID: bhrqcaECSYacM/kmkXXk6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="189496575"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 12:57:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 12:57:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 12:57:22 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.65)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 12:57:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q4FwB7ZHcDIe6tB2qPmMNY+WrkQm6j28prH4OzlCJ+0eHl9I1udIgmxwEVe87W/F9HYb5/QrVi4yVgH/ltBpb/m2g5eH3fpgvgcTpe/FFPkRJsEM4dsSfEtgMJEmahlgDFtJmfJpvpOkP3jJXvSriLWU47QReZ8wkkaYsdqm98JPgL+TdONede4pEgVwQwv5JEmioInNT3Lo43WLDrSDPuVsmo6Tc9NPHdopbWg4gWrgwtaN7YVKUdgKCWu+XfZDuJ6LAYem/ztcN3t3Wqase3mgaEwI7QmBzJ/P3FV8Tuf4CEWErd8MACaIKt3t5/PlD1lwOZ42rhepm6HVX67cMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tYHiE8Qh1W/Bl6y3Mq/CtPb7ZV89KSNQQqUbIPeALY=;
 b=aWX6OhQDCETG+O7ab3pDagG3u24e8VEO97l7JKsJe2F7wrTBxikUm9GvlqPEjimulmQpMfEEXURvIY/Ho33nzH6/SOl7HK37VWLdTYhd8XsaHJX79hAN8hwplpYIiXwvHOtQ8xmLEgAS8qV/N/6d/bqE1aWdhK0Re0qZ/L5cOIE+uwElwfy/c336DwtzvpvVW/0AX0YVaS+MIx84XNXLJR0rKyI1ESf0gkC+o1srq7WGrX6kaUCrHEbkguUYzMbzDfG0l62fsivv0EAJizOe9pBmESsrtAYO1TDfOGnD0x47clugCpo8kuKGoXqUBfaO+W3bkrfQP/c/7MSGMoorGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB7261.namprd11.prod.outlook.com (2603:10b6:8:13d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 19:57:19 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8880.015; Wed, 25 Jun 2025
 19:57:18 +0000
Date: Wed, 25 Jun 2025 12:57:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3 3/5] drm/xe: Move Wa_15015404425 to use the new
 EX_DEVICE_WA macro
Message-ID: <20250625195716.GG4868@mdroper-desk1.amr.corp.intel.com>
References: <20250625193340.38971-1-matthew.s.atwood@intel.com>
 <20250625193340.38971-4-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250625193340.38971-4-matthew.s.atwood@intel.com>
X-ClientProxiedBy: BYAPR06CA0061.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::38) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB7261:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ff81334-a4e6-4edc-fae7-08ddb4227dc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jrr81thKEP37CbIefKwWBPQFboKENeBn4FNTPJllGQviot2a9hnCOTx6f6rN?=
 =?us-ascii?Q?IT0z0R2OVe4D5fgi18v86fA6w9a+cAZz6+Yqwtn3hWpjghfgMvzzfWZtFwME?=
 =?us-ascii?Q?3yCI1HakbMnXYoa+Ht8II/Vc0jy2jYfZRgUUZ11p0B69CBgaL6RTvFvT3/fJ?=
 =?us-ascii?Q?uedUdleuYmEQHXtYyChTzVbIky7UGLwahswsWcarkyb6W8pKu27tBtBdqUiu?=
 =?us-ascii?Q?bb4wgXUZwsTJIzuFynFhh5QWg6bAikOvG1l2M9mefTJWysN5XF+1b0uPE41f?=
 =?us-ascii?Q?z5hnAN+EjfivraqXnhmCM7p0VOQ74PsfFxs0UT25w69VQCdhVzzYMTCLve/b?=
 =?us-ascii?Q?PEA4SnupMhuBnsEDhDAgLHcSCqfDMky0Ebj1vkWU6MnNGACeLjbxDH1slTTg?=
 =?us-ascii?Q?MKMaa3y/b1TqG6xM3TiE0xyCSEiAfqV9Go3oKbYLno9T/4Rdk/per6Lss+tc?=
 =?us-ascii?Q?q21sPOrfe2Zk1hwgKBLLXRfnRKcXlcVU7McEHOd3FADdazZ26bxDvmG9mUXx?=
 =?us-ascii?Q?3ADLYNKZde/PghLzpe5V3AnrVP8SDb83RLDdX9KY/FOLsd+5Sx1D++lv9YkZ?=
 =?us-ascii?Q?MEn0xiifwZr7T/D8UOlEvr+dH0GDYyiG7HTE3pv7fhUADSd7YDgnbNO+9AGY?=
 =?us-ascii?Q?Ysg0+hBY4JCpICd3JcGucFRPMg6PvyFcpJTWRomM3Mj3oAlC4RE2zYxHy8tq?=
 =?us-ascii?Q?CR2xoX1s65q9g5frvGWU+VpnnizK8fnXkgcjKtFotuBpm4pjWxnzYq7y1nj4?=
 =?us-ascii?Q?wBnCLndGx5QwwdEJYqJaLpMQUMew8OLFoYhmijIt+AKxMZ7VWkr110f9MawH?=
 =?us-ascii?Q?cpzL+9sQqXqhLVmapI9SNa7SuR47sdDG3ZtK5pBucwSEwLKzUZ2TOMPjipuM?=
 =?us-ascii?Q?Fg/3DmDlRpzjYtg1ZBFjQ8GzI1srFSaylANHP4EMIcQbSi183y+KPHrX2BXH?=
 =?us-ascii?Q?Ky64CmUwZnHoJ+s+7oTUvDRkE5CjzVkAVcUTUKi2my8Jv+drxjBCtoW267k3?=
 =?us-ascii?Q?y8nbYrLjoR/sCbuTev0FNdDDPXRBtaZW3LKPuFEnOj1A3uPx018bY3xPUVDg?=
 =?us-ascii?Q?sfDqZAw8hnrlT9d1UWRby+NwdSdO/6TXGlE+dymcOKpancl5A0TrdNdNcpJB?=
 =?us-ascii?Q?cSfYL96XUcvZIwx6OLEsfubbA7/GvzS/UZzwMFn5BGBYwdEOmk1ZwuLCisrp?=
 =?us-ascii?Q?tD3sKHqiQby6hByBw1Ggi818xCcUAMevLrRfquamgXuVhlqn+JdIhoYdNC/B?=
 =?us-ascii?Q?rYlRtgnMjE1cApegunfuZU5l9zNFeTV6UF3Bh5+XPJDR8h5pi9aZVGRbeMbz?=
 =?us-ascii?Q?FXmRREXmNTdHV+tA/xuGCCnb4r6U0xCZMr2mlrFa82BIMjU4yZKL6NrndIkA?=
 =?us-ascii?Q?3oCi7pTOWtCpSjRVSOl4noT03bJgTS4QtTjhuQfy83aEvOWXzlKv5wtEXt77?=
 =?us-ascii?Q?0SYU+psOYlQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fAu+MPaTJpduA1wN8xy6Ebuv9nHs5nD5tSWAlyJhybkBNvgamLjBR2d6fIg9?=
 =?us-ascii?Q?rHh+yldGr6SBX7DeR17FpTgZrWMjh6voGR0J4MjYYEwf0JvgV8IEP0jYMzTM?=
 =?us-ascii?Q?5RYglueX69BRyYOviUIj1v+VOBGag+YA945/MYIxTq9Z16qIzXVpBEiX1WHs?=
 =?us-ascii?Q?3s5r2hi8anfS/8e70wrcGLUOCO1LTl9eKeE6+L5JiIyY4m7aWeaH5G71QOk9?=
 =?us-ascii?Q?Kr49uArpNFBNQL/bELs4pOFW5zxMWnFBDme4qdBJ9OFseDRQIIBZp5SSt7HC?=
 =?us-ascii?Q?wrXUdcOGkzoWa6yw8dYBlJK4gxa16Yu/wpGtq0YEGz19oGwKd2hsuLmy4ZuE?=
 =?us-ascii?Q?NVnUW0OGdja+X2gFPG/cLiCR0LyhttA7nUnNQKlfEa6UYd2BE0nsJHPgUZ9q?=
 =?us-ascii?Q?2PwG/VcUnq33FJ0cU4upOw3JsiTKHHJvVug0LOljnHJD/AsUgm1jsaMQCSia?=
 =?us-ascii?Q?oHWO4tXHSCzwyQihP3vL7evwTiCOOs8lLCuSh1EPpYgbX94xxQJTO6Xi0Dn0?=
 =?us-ascii?Q?wayvtUOwikdSll/A1pqrRAtO49MV+D5iWGLPwvZbV0GTSDVBIyaw/knvW8d+?=
 =?us-ascii?Q?lSVeTVzAnek8h2jt+6uwSwkOBRsbNEfqkxOcaK73AIhecR6q8GDV+IOy+qeT?=
 =?us-ascii?Q?JxJJGbDeF1k7mXAn4EdoZXXYuZPc9nOaU6eFaA2Lk7REZA5vQ8zfHkQ1XeAg?=
 =?us-ascii?Q?1r38D956AKS6ZzVmU4hxs+YkO8IrL4LN20VHEGGKDe3249HCFThxijtOE4W1?=
 =?us-ascii?Q?q2xCHyozmODI964zPi4UFMzagafuhPibdyFSj9AvDVCG2eNRkiolOxCt9ewE?=
 =?us-ascii?Q?gajn2kOxYJAIzLGCNsCsP5H1See74hs4PICHjQ4BSPgdyPZYJhygiipr2DdR?=
 =?us-ascii?Q?DL2z8dHVNciOJl51t2vg8VvQr14D6RuPZWmtA0DmL24wv9p26oAl63XTlbGF?=
 =?us-ascii?Q?3GmAmDhQxZ6rim5WFlqVTLV8/xG3rE9w0+nUA5k4spJ5DZBP1R0/SFO0Lk+u?=
 =?us-ascii?Q?aV8+0Ex1aHZ+TjDotrMsr/UzriM7qxnHh/5qtPV4jzgYepGBZp0VCrYIiHUs?=
 =?us-ascii?Q?EhEqZt7dMJcYKMOTCNIcnQcW6zTCNV94HlPxG6mtm5V5gFZvi9Ia5IloW+OY?=
 =?us-ascii?Q?Vg2CxgFUi5z5o4aRPJQw43LN/ArbBW/aZOBCeoWobitThyvEaup9M1z/DURk?=
 =?us-ascii?Q?yAHiABUGs4f/JmB/h6ZPRbWMSeuG16ejFnVc+T/w5U0XPRg/6aWoh9RDIDb6?=
 =?us-ascii?Q?pBNPQZ8LSmPWvwPjeS4068Ahy75ivRqtvrLlxBxCjuoCdzt7p+/BgDOqlUWM?=
 =?us-ascii?Q?8gM6I2Y2xAUaZVng7Jd8d5KiyiJlBQXD4JXU2APrM392lBEEKkVImn/Q2xXL?=
 =?us-ascii?Q?UYZUTI4u1OLmiG5JW7wgxFRynV5ScAKj9OWlWmZ9S7baQ9jeAZoFKbGhHnlQ?=
 =?us-ascii?Q?fvMWfFfIicKq7KlZpfTVav00qNY6QXWJHLxHRRGJ9iXV7P8/u0U4lN1RUYLN?=
 =?us-ascii?Q?d85Jc8FEcdd7ZweOZcFSbDsXQPlD1ALvH0zU05nod1budT9uH+EZ86OWfK5Z?=
 =?us-ascii?Q?c+Cym4vIrktcA/FzVOEz9CFX6hc5v438CMgEiMjSXfYk0l22m6UMPIzDKKOd?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ff81334-a4e6-4edc-fae7-08ddb4227dc9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 19:57:18.9569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cx78HBPkXwLtwsAdqu3t+LJ6MG6cHA70+JVxIsnZxYSqWI/4J0BGv26AIRHkL5/nyDR5Ll8/soZmZNxSThvKo0FlCdXf4JWr08iBJJ/iJeA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7261
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

On Wed, Jun 25, 2025 at 12:33:38PM -0700, Matt Atwood wrote:
> Move Wa_15015404425 to use the new implemented OOB macro XE_DEVICE_WA()
> 
> v2: rename from SoC to Device
> 
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_wa_oob.rules |  1 +
>  drivers/gpu/drm/xe/xe_mmio.c              | 10 +++++-----
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> index e69de29bb2d1..b7d12ea4d65c 100644
> --- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> @@ -0,0 +1 @@
> +15015404425     PLATFORM(LUNARLAKE)
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 7357458bc0d2..4990b3a47afd 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -22,6 +22,9 @@
>  #include "xe_macros.h"
>  #include "xe_sriov.h"
>  #include "xe_trace.h"
> +#include "xe_wa.h"
> +
> +#include "generated/xe_soc_wa_oob.h"

Isn't this the wrong header name?

>  
>  static void tiles_fini(void *arg)
>  {
> @@ -163,9 +166,6 @@ static void mmio_flush_pending_writes(struct xe_mmio *mmio)
>  #define DUMMY_REG_OFFSET	0x130030
>  	int i;
>  
> -	if (mmio->tile->xe->info.platform != XE_LUNARLAKE)
> -		return;
> -
>  	/* 4 dummy writes */
>  	for (i = 0; i < 4; i++)
>  		writel(0, mmio->regs + DUMMY_REG_OFFSET);
> @@ -176,8 +176,8 @@ u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
>  	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
>  	u8 val;
>  
> -	/* Wa_15015404425 */
> -	mmio_flush_pending_writes(mmio);
> +	if (XE_DEVICE_WA(mmio->tile->xe, 15015404425))
> +		mmio_flush_pending_writes(mmio);

Moving the check out of the function to the callsite seems fine to me,
but we need to do it at all the callsites, not just read8.

Also, you have a typo in the patch subject line (s/EX/XE/).


Matt

>  
>  	val = readb(mmio->regs + addr);
>  	trace_xe_reg_rw(mmio, false, addr, val, sizeof(val));
> -- 
> 2.49.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
