Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E390C7115B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 21:12:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504B110E45E;
	Mon, 23 Jun 2025 21:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ivT/lHJu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F5510E45E
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 21:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750713133; x=1782249133;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lx6k/N6d5FzbPBzzaQKbzYZlU88Xc5mD65EbabAiEbw=;
 b=ivT/lHJuEi9IYLagsysFnTLeZKmEsRfp0CeOxetR6FarAcmzjgPpmqYA
 QN/w1qH8bQQs7OOaknLJfKzURXdxTgKgVwfv4sWLu5Lu+o4JKMRK6i+hC
 Edh1TSH7UoSghCsZFXmiDIWendvFcwgcsBZ8knhu1kWWanp49pV+bMdzG
 OO3JGwG2oTk9VOtv+ijPtfZWLwE30yNzDs/KgQ4sZMZ4cUvIzkTDPiIrQ
 K78rB++0anoNycs7AbzNoP1JRfCHR6jGEq0zlLwnDrH8DOPDYh2wb/rHE
 ASleZxZ/d30LvwMKzJQbu0qbyDNeIFGGOfjZShmpKR4+jeaiPbR2fdACk g==;
X-CSE-ConnectionGUID: 0XmITp4ETgOkwsTlmzVUSg==
X-CSE-MsgGUID: YNEKRsbETaSB6W7G2+gpAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="53026434"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="53026434"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 14:12:12 -0700
X-CSE-ConnectionGUID: 5KRXn2GBSTeC+yGUrtyhEQ==
X-CSE-MsgGUID: gyEqfL2RTgaIEgeipd5YiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="157203903"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 14:12:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 14:12:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 14:12:11 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.85)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 14:12:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xbevBrLdjGLtYVLhbpueD5xq8M1gLFM+FK0MxdyGVeHAHtXQrhO4wlsNHlK4FHT/gCEFfndLKtCJhtV88ZllOXHKb0dtN3RyFISicigU4O70CTWpU2X6DihbJ2ynwJmmQnGqiuJiS0sMST9ezW1wPC7v9CZhw8qL4kr/d0D1ClY+6pi8XSTnKjIde5MZ4yV7LFoPRSDEsp6g4kXMIcGDsVfuMKknGxqDzeM4d6d/P1WLsp+XdIAF2FYdV3PM7D62IsOand19+4BSjWVXSwcPxOjf9JM6AbyOnQSUGM62KrvJKxui/Alei2wovVrucPh1ZDWpsPLWyuGQ/DUMUrUFQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1U5ephWcXUXcY0b6PN0oNy/vXTpRV6OzqU970xQetXA=;
 b=Djn2jbH/WMAlHD31h2PY9XvD9O7bUdW974hoIIYHyR2hRFdFTSHxav8+steQLX25LHQ25tDPu6/3rMAME7iyrRPqDjBtVaVmze1dnNZDPnDyUeFrTmRDnsmPjknAVrXnMqKwPd2UEvrtbYqZb0g1GKACplboQtl8FsZuyqfAdey7K1nRJc2mHyW1Jntbj8Qce4FQRD6X1WmAus1ZKRuBzQoSpNTPW2clTI+6CMhDyn6ehd0am6l5Hw5c3H4iedsJnOubvRCUexZCyMmPJOZyKxGpMoOzp0s64mK2wzjFVPXzvtEk6JxmupMyauHc7/DUPyXWMzZhnyjx54Ir6QKeVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH3PR11MB8548.namprd11.prod.outlook.com (2603:10b6:610:1ba::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 21:12:09 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 21:12:09 +0000
Date: Mon, 23 Jun 2025 17:12:05 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>
Subject: Re: [PATCH 5/5] drm/xe: disable wa_15015404425 for PTL B0
Message-ID: <aFnDJdKKgT_-j69u@intel.com>
References: <20250620214920.718179-1-matthew.s.atwood@intel.com>
 <20250620214920.718179-6-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250620214920.718179-6-matthew.s.atwood@intel.com>
X-ClientProxiedBy: BY3PR10CA0017.namprd10.prod.outlook.com
 (2603:10b6:a03:255::22) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH3PR11MB8548:EE_
X-MS-Office365-Filtering-Correlation-Id: f52ee433-1306-40e2-3c67-08ddb29a9d51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fXDjl8BdSj8Cc+SMf7XjqgcqNlUdI1v0fQqMoK4laWo+g/oxjaYqiwaaWAmI?=
 =?us-ascii?Q?SLtzYhnNcOjmuLZTGmdV5xIdLMOEBKhwIRdsPoYTx7JJNdIgBkKfLywfbwAn?=
 =?us-ascii?Q?d+rk5hUugE02r/nKcMcn7e24kS/febRDOHJFirU3Fqu6GnJZBQpqOLaUQmoE?=
 =?us-ascii?Q?nA6E1GQ2QzqCBjR84g2biM2p7n6UjpQfIP1ClYRgjNTJ6brTsUhWIpO3E8R4?=
 =?us-ascii?Q?6jmFBRDFbFzDWEGYifa/rqaC7y6up0C+c1v1X9h0n08CeIzOWWFCthOOUfYS?=
 =?us-ascii?Q?8/qkwBRoTCBqr0+dUSx7L5NDlcBAbTdz7nSP9OLuFPMwcYN7D+29yk+iiWg8?=
 =?us-ascii?Q?OCmKC/fdT7uORmm63QuOVrLzOCYgrrFpaiXpPLISnRt5q1eO6BHB1+ZQmd4f?=
 =?us-ascii?Q?tGznd3lVSdMqPDouq2UI6gzWOkuisNtIt5rqIR2ADEAmdMzpmyZbXhPTLYP8?=
 =?us-ascii?Q?Eyw2WJlV0V1dKOmMK5/kjdHOXovDYa6s+JQ0o0hqu9KQhVOG1/xFvXw2U33P?=
 =?us-ascii?Q?6kwnUPWWoI1Yiz+L4zP1uBme1GIrbXN24X11O5lNGAuE44okULQ+Z49+AmcX?=
 =?us-ascii?Q?jT22mPKUS8hzlLjaVX4beC/L7vixZy0JmOfRIrxMsrGNuN3+QWP3HSzR8u6K?=
 =?us-ascii?Q?PfHV+rSJ1qAGgiOk6fsedhgotXfkQpeiYsyAdnCmlf8qbL92FRtrrqe8mH6A?=
 =?us-ascii?Q?pCcRXcL2HU8rqcqpcMSEjlYBTK7QmGlf2qqSR3zWAw3fy/fSQpUGUB37UUhc?=
 =?us-ascii?Q?fZnKXSrEP5NUtAkNbwtyaKM50m05H7Si3xJgaYqljGKX0DCxX0SZWbJ6waPn?=
 =?us-ascii?Q?mZqTNiFNHwE481fSxg9KGQbkg+QUmHCJ0aRYzyoT9lGVpGpgAQBUzREx4jTX?=
 =?us-ascii?Q?4syhar2ZhKDfoTRX/0FcHI1oi0TbIO18+vB+2jk/9aHck5vAPiDpxhfSqx6q?=
 =?us-ascii?Q?D1BWNOkZVFkeiuZjXKAHlRqt7ol24K2vPenA9bknAKY/UCUdeJR/J9JYZjYF?=
 =?us-ascii?Q?fU23rIstmTys6YBxNOZkkqKy628tshOobtGxwIAtqjkyooDvN0Hfy1g/jAH3?=
 =?us-ascii?Q?xOTSq0zKUiXcZMKW/xQekUC/Mp/oFk++0xnxLZAk7j/v4CwyRd6cYwJz4wj1?=
 =?us-ascii?Q?nNRjSmszH9khyb8GwA9OIwFmH74j96WDizJjRdzK/z9+gpv44g3VkAJfzr6Y?=
 =?us-ascii?Q?D28Kb01Q+NVX+DMs8uccu+MK2uswGKJsNHnQiv/Z96KYeFyv55TpignL9zNQ?=
 =?us-ascii?Q?dWCq+gkJ9tFesFEFnwXXSkGucqMJ9azZynK9Kbmz6QT57nF68LK74g/Se6aP?=
 =?us-ascii?Q?ugbYml6diC8IouPP8PwSsAOyhktwWiuroROJTW3Wef0xDYYwyP791ItrkggV?=
 =?us-ascii?Q?K/bzzASI6UuyoIkZCyq1rDI0NbNePlEfNRiBr/AHQBZXbB1PnpRxNJ4JU7Oy?=
 =?us-ascii?Q?0eDktxVF59w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3hck7A/bMVXqhOABn+w+HRH+Sz4MGbtZmZLLjOcdetv/7d3q2smGrWpaVK8D?=
 =?us-ascii?Q?IW9wCAmiiUPUSADbcisAfsgmNiItwhh/zPrJ6HgzMlWXbNz+B2RWZVdxeYOv?=
 =?us-ascii?Q?hZiuZjtYv50c9tl7gMI9VJiX6Fq2dLf1EVdKc1O/VvrnZdGJS5Pn4+ySqY0i?=
 =?us-ascii?Q?rvJR9+AKiliWDZnae2m5Imf+vm9+zGpQbuKCSiuJ/LHZavXkbaL8SuY2rePx?=
 =?us-ascii?Q?nJGQw5xouBXJR7zft2bW5qvmyNPfDauRWe09sAi3aLWT/yQmDwBKoF5zM772?=
 =?us-ascii?Q?ziypQS/VKduKgnQBwQMPhu8IEyQVL3mmI2224hJ9Ty19rMISobkHHwJDylMk?=
 =?us-ascii?Q?IRoLozkejx9fa/gphCi4VIoO46V5n82PxZSShuAW1az0771kRrtT1DGBvv9B?=
 =?us-ascii?Q?05ILVU8bsHS798t4uXh3QX0t3azlUJQzugO2STsbnKN0aZb/1M/gMsONM17C?=
 =?us-ascii?Q?8lZKDq8ApPqZIKsn3180QhDcwb2Jplom/37FwaEd0JUHnj33RFl5FelWSUzY?=
 =?us-ascii?Q?g25o6Zg8XuMmWMmYNzAG+T4Y8sz8ssRsl2x2rssNmoz/n8rP6Vk8Zi6nGHHp?=
 =?us-ascii?Q?OSoivIeqhRzuw/lQlXdnUTZpKiKmxaM225ZTl0wtBbpNPOhPZVq8OmRoBc1d?=
 =?us-ascii?Q?wxQnkiBXeAQ1OHLrEhB9dVmI4QGpMjYnQ8S+/pylvxbHkCr0YiaBMU2rkE7E?=
 =?us-ascii?Q?n/11W7WZw/Tb5FVRGtRNv39TKcfYEZOOuQSasJnKFy7GJtftbxiElkfkslIf?=
 =?us-ascii?Q?L8stzOuCmMV29M9Py/CdyWa5jgXkEDYoErStvNAZIMgtXhh3KWh2B1/Rd8HK?=
 =?us-ascii?Q?dbt3X9ZzRn7MyzNb3dsfFmBCqoUEKwyJDAoqczx/E08Uiy0FmJXaRJuMJmOC?=
 =?us-ascii?Q?9wfl6G/nO3AVtqgkOWOnIgSDzotOBegoz8eu1PIUQ1LmeSytL7SmEx1/sDpE?=
 =?us-ascii?Q?jznWTdJsbPAguG95As+HZdKENHdXH06aY4FoGce1Xi/wA66c1yetGp00+/eE?=
 =?us-ascii?Q?zCtv6CwnUq+vwBLEYc/wSP9e+4aXgBRaisVD0ligh+T5BunWdg9Qo8IR2zjT?=
 =?us-ascii?Q?eev3G2D7DTaWGDKNVLY3Hlf83ysERc4n4teh1ZswOxsCVlWOV1u3tPb+iad8?=
 =?us-ascii?Q?e5lLAt8TMOMZ5PPZ7tOlRJsU5YyZNgEaBstePfzGl/GYIqR4Ds97DLvsWsvX?=
 =?us-ascii?Q?d2F61q8yHzwM2hI6AAK2BPUk2DWWTh+IWMeoA/uQE+yIPyoKygFNAxwbsbIh?=
 =?us-ascii?Q?lpKna8Po31gCHgboHbF+4hTY7YK2mm3OpAbR53txfbaIyO+uCYeEPSwWYtal?=
 =?us-ascii?Q?nhByN1ujGddNk64kRAYGiafcpxfF1iRqHm+LpWbbRziayCJvIH2579xWDOl3?=
 =?us-ascii?Q?ybxx8q8QGbuRGBpKB1c+bE3cMgwQVF6mfW/uA381tZmVvGjeOEcLWIfRQrMi?=
 =?us-ascii?Q?JyKvTp7acJy4mEwTgSw+03EJtZLznmdqcV8SHy/QZrSnk6h5eoSWMaD8KX/i?=
 =?us-ascii?Q?/uLBG8I5aL3vd+H0mrspmlF74cdGhpv+ZD12OKHhEGm4Y6wFtycgKtAUm8Xy?=
 =?us-ascii?Q?5o1QFKSAlo+VdUb51sK0Oqgx7E7mmtoNa2UGSeRf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f52ee433-1306-40e2-3c67-08ddb29a9d51
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 21:12:09.2831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZ2LFXHQ3KBqdN+eccCNtZztPduhwXYkRxiTcPdzbNPrl4efqFApoGdwUvkYvoLzryEwuw8CulALtxiOAMjr5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8548
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

On Fri, Jun 20, 2025 at 02:49:20PM -0700, Matt Atwood wrote:
> This workaround only applies to PTL Compute Die A0. However, this
> information cannot be determined until after the GT is brought up. This
> means that we will assume that it is required for the initial bring up of
> the gt. After GT init, the oob workarounds are enabled for the GT. Use
> this flag to then manually set the bit in the soc oob bit field to 0
> which will help performance after device bring up.
> 
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c        | 6 ++++++
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index ded0f3dc8d73..a624c3fb9498 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -34,6 +34,9 @@
>  #include "xe_tile.h"
>  #include "xe_wa.h"
>  
> +#include "generated/xe_wa_oob.h"
> +#include "generated/xe_soc_wa_oob.h"
> +
>  enum toggle_d3cold {
>  	D3COLD_DISABLE,
>  	D3COLD_ENABLE,
> @@ -890,6 +893,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	drm_dbg(&xe->drm, "d3cold: capable=%s\n",
>  		str_yes_no(xe->d3cold.capable));
>  
> +	if (XE_WA(xe->tiles->media_gt, 15015404425_disable))
> +		xe->oob[XE_SOC_WA_OOB_15015404425] = 0;

We are discussing this offline, but I need to make it very clear here
that we should not move forward with this as is.

Two unnaceptable points in here:
\
1. _disable. We either enable or we don't. If we need to wait for the gmdid,
let it be and enable the workaround after that. GMDID should be one of the
first things and I confirmed this workaround is so rare that in an a0 situation
you could wait to only enable after you read the gmd-id and confirm the
media is A0.

2. Don't mix SoC with Media. If the Bug is SoC don't wait of the media stepping
and check directly for the SoC that needs this. So, don't create an infra that
already has an exception in it. And if possible, avoid the infra at all. This
might bring even more confusion to the w/a handling.

This w/a in specific here is soc, but it is getting mapped to our media-ip,
so let's use the media check...

> +
>  	return 0;
>  
>  err_driver_cleanup:
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 8c2aa48cb33a..822cbff13819 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -71,3 +71,4 @@ no_media_l3	MEDIA_VERSION(3000)
>  # primary GT GMDID
>  14022085890	GRAPHICS_VERSION(2001)
>  16026007364 	MEDIA_VERSION(3000)
> +15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
> -- 
> 2.49.0
> 
