Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BF3C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 03:40:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9E910E287;
	Thu, 15 Aug 2024 03:40:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WVO09CUt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB52C10E287
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 03:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723693256; x=1755229256;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QuB1+akFa8rZpW7Ezce1VUEjH0BrZQZXDmUVLFjKPsQ=;
 b=WVO09CUtlibAcX5pnmxy6NofEuzt7TRlR5+qL8NApIODsvlk9P18lh2d
 YawNIEy/3hpy2dNSiGjXAT8TKgcmUuvaB3mAEQfw1Bl1PEAcDeCUm8xLw
 uDevwat/xwYoVr3QGnFv2gkWWF4HPwYXF/i9rw3Xas96aHJX7/lw3am+B
 5v5jLKV4DsDjyFXOvQdhMb51y7tlKGLbEUke4Vt6F2o8TP9zhqdp6fGIZ
 2AH1QxY831VEQPlryyCJLipIWi8q1o3fghfpaeUj1Gk77wEc4C2Yi7ra5
 U8T/SMnHwnci3XMs91F8HQZXoLsQ0PR8BD4SIfavVnaIcgPr7e8Bviye4 g==;
X-CSE-ConnectionGUID: D7/uQi7uSKKayY5Z3Be2wQ==
X-CSE-MsgGUID: NsXcp373QX+UWv8gCOW4uA==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="25703909"
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; d="scan'208";a="25703909"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 20:40:56 -0700
X-CSE-ConnectionGUID: WF2DqCCYSNCSqI0GMB+n8Q==
X-CSE-MsgGUID: rTAUnmXoTkqhCZkKNB/nkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; d="scan'208";a="59986174"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Aug 2024 20:40:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 20:40:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 14 Aug 2024 20:40:54 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 14 Aug 2024 20:40:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ND8euXYq5fSApEWRSIIUUjHJFWLoRFZbaPsqOprSsfXCE5JPYdNxujtUDPLI6iHr31+AERI5XNLo8fi6KEd7zeZZ/NKTU/lyuG2Vg+WwvE/fwmsdm+8yGUd/kXmTcrOOdwmcqSpzDNFzkXd3lYRNEwqR+K8gU6loCe2gD54j1rqSFNbBlWfxdqXN9WfjYIONBlvY21FlDZfCs8lk9VgARcPTn+UTLyeDqPbsAeNmw55ZeJkoLDCzIGwP/gmbG2yl7pZQj30qshkLc60G541e1Nfewn0vq4zOQ4zjopJ6no77TPL7R1ujVZCx0O079wYDEEOei+YxcpGQo6dWcGvHEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dh9O8i0deL0tplgJ0YXbgprln40eUsv6DeMeQ3cvQns=;
 b=DXpPAHlBo30iTEisQ+c+3XiC7B81g9RcuQVedlVYLhorfh4D96pJqqqPjBQPsnYsi+86l/2tPZgxGD/baHdBeaqj7/UH5txn4g1RWmmPEvtxNNFWngRxRCNbvYTkHHiDxlsFiJMq0fwBGMbCcpzNHL8I4hsQJP4Z4tRKyoNajScGmOZc2gi0v5E4yo1RnWoF93AXNwYyqQezhYLGU21po2H0X3ivIqoxfjakkFz4A76HW3EZa08BxxQ3k16YtUMQsNju5jSphMTuKavlvb69S6f/FWJjvFO8WQYGpAHMLyLqbrI/CygepEfGHrNse3ISY8/Su9GY8ut0o4L9uUBpjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7633.namprd11.prod.outlook.com (2603:10b6:510:26c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Thu, 15 Aug
 2024 03:40:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.031; Thu, 15 Aug 2024
 03:40:51 +0000
Date: Thu, 15 Aug 2024 03:39:47 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <michal.wajdeczko@intel.com>,
 <karthik.poosa@intel.com>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH v7] drm/xe: remove GuC reload in D3Hot path
Message-ID: <Zr14g9D2jxQ2nKm5@DUT025-TGLU.fm.intel.com>
References: <20240814105919.2408428-1-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240814105919.2408428-1-riana.tauro@intel.com>
X-ClientProxiedBy: BY3PR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:a03:217::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7633:EE_
X-MS-Office365-Filtering-Correlation-Id: 27e288e8-c511-4259-d325-08dcbcdc0ef4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?L6zGfnFaS9ZzgBjJ9JMcR8mx3ieLqauM5bIRr6XEL8VEtrcGwbtlDtLAu24d?=
 =?us-ascii?Q?kre2njd5ai2YBVMIi5a8c0ev9Ln9KP4UPU41Oa+J0+IpjXX6PGuGDJICRBI0?=
 =?us-ascii?Q?rJAUvHEZlo4+VmLNxxzWPj3w2em/XA4vWmJlJla9cXL9GC0AVG9PFE2tSnVD?=
 =?us-ascii?Q?R7pGR9pYpkHMuacKELl8kvVSI8q2EGd4ObU6QRWtw+8HcV6a7/x65ftbNr2s?=
 =?us-ascii?Q?xwX3LMO20BEF2yGuWAc8a9FdvXbreu5RRcd4iJYrqIdixa5KVT2PPqdPJ6x4?=
 =?us-ascii?Q?ISwOPpsnbYDgKzDLAQ4RY8jtj9n9n10Wyx0EZ5vK2fS4LOZawI2Woo+nz1w7?=
 =?us-ascii?Q?FyG8hVj2M3dbmqtt8jQ5wu6+6klHO+Dk06/g0Dl04XYB4GiUPEzlot0qyHEe?=
 =?us-ascii?Q?GFLPhu8Yrp9U7Bf6P57ACqG4xmKDiFk+EP49tFZtRmLDFW+gSu0wKcPOTVJG?=
 =?us-ascii?Q?zSPNmc9V7uZGvleA3pIddyRb8mAxVT8zGnOf7v09G8NGCGPQeq34e/i0BQxg?=
 =?us-ascii?Q?DNbskbTjzD2k7kDCqpaEe59rPXbdSyZVXr/Qzx61wIQbDiZ4n3FbrFt2Vgc9?=
 =?us-ascii?Q?JAzoFTtPxhg4PHllWa7v/JwVUmGFRDgUovPLcRku65sm1pariwhYxsLxQkfn?=
 =?us-ascii?Q?SM1pGSp4Nwa5rI/ZsRsN59yyOR7VZcY57N0jywZV7roT5c3uiF81I+ogUnfh?=
 =?us-ascii?Q?dh9S4QYTKhZsW1It7BOjSryQwR/EyIgqpI4WcTomw5UlO5dlzvp8xWrCOdmE?=
 =?us-ascii?Q?9ZDy3cekUTyY4n/n13PJrHzXzu4GSBLXxMCmqcxct1+2q29A9WcwP+lhXwxs?=
 =?us-ascii?Q?jt7rEcM6cgbs7hgEm/YmvxddnbqdnOpeU4etdNr/iTAVGCfXBJPn08q/Mreh?=
 =?us-ascii?Q?mubUMZ/SmBjszZPgjSAxKUD6Falruok10D0ptlhMWmyMXnFC/Zzg8kTKBdAd?=
 =?us-ascii?Q?hSYvcbFXUEfbIVdY17piT/ZNjgQKceYecbYaUEXkhm5Fx5eibG0+TL+WHWzH?=
 =?us-ascii?Q?BFkCLOAmDORPixZCfJg5oglhnQ0FEFTgpLKO6Z2jNEnx0jXHbNPsSf9l0WAV?=
 =?us-ascii?Q?xryBW7NOEZ7yxlWusincW02aluQrpiW9pC5Me0qVif3nuSwbElpdH1WSVAXT?=
 =?us-ascii?Q?0VWLbY4G7vHVJSkXYGcdGmFDt8+xGDpUzEnJN14i9bLdezrdUA61hcgCbazS?=
 =?us-ascii?Q?uLa+aKumhsNkdqRIapMTgj117jTXFkPRU+MP09lydpXw54ThMthhcJ9N63vM?=
 =?us-ascii?Q?RM2Y2ZAWdUp6GLGFgAy/GXIhXLq+6EEveJiohIlWcqHf/UQczPIK9TnpvUSZ?=
 =?us-ascii?Q?FfPr23J2qC3B+53/DqaHjpe09fsXB5kjHCWQSFDHBBdwpg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q8e3bLAw/psBpnZPXginFAoiNwKPnAR+1fD1iGEam35Qh6qiH9sABRgYBsT1?=
 =?us-ascii?Q?+IhfDJm4gaMw7/lmskKDaVM91aWTw3dKcGepH5Tfjri+G1hsdnn6SfHk49II?=
 =?us-ascii?Q?ptc9aA47UD+Y7/Jt+O4UqIRKv7yRL5CPdKrYIP0s5i6T6jxj2QPym/uIJN2R?=
 =?us-ascii?Q?OR24boQDXy5TAghklmArxybbONo8OttgO6xxew8/Mi1URpZM514EmYgbJYQ7?=
 =?us-ascii?Q?4TGrtZKY2qjBwsKRywDUmkE888lJUqdYgzFtdO2k2RMr4HGC+3x0UxpK9i1N?=
 =?us-ascii?Q?w2WvJ/d8SHbRh8qyXz3H2OBRpLfgOIqNCGB8uJykk9n7Enygk71b068srF8L?=
 =?us-ascii?Q?GF0bhdmMrU5mGvCw6QeqUxYwBjO8EDGkmeVI+VBPIotq/faqIaxrz0z22OXz?=
 =?us-ascii?Q?wv0dFnlmhFk/uAfoGin9Nc9fsCSysZJdyVUnc0jfLnRV4IcKR0cvAZHm8P1Z?=
 =?us-ascii?Q?qIApf5/H/S0fWNA7G/BduoIE0lIyIVguGcy7qrwo4fK7XXkfQpDyLEhwOdIS?=
 =?us-ascii?Q?iDtSBvzITt96w/Hkfst4Anms1XafcShMMmhDyjAmIBEZ57HTJ1aniIQD38iM?=
 =?us-ascii?Q?HCVPs3zyAvSKaQADy1nRPZqec/ktxke/F08hn77sYkQzwRIulDJswudHM8ua?=
 =?us-ascii?Q?BMkEtMifCSMhqAGKUZmOc2eTGb9KCj0pOrBr5i2+qpsrKyfWn8HjIRQfOYNh?=
 =?us-ascii?Q?H4/GVHD/7oNB0wdz1RochTOsJV6vOJ8lmIQZIlD0T2or4CWK5D/QxiPweQ9G?=
 =?us-ascii?Q?mBuWYK0Uw3AP+XBAUzUj+suRxZuRshzF0BWxRzFuyxmmchF/BcmhETAxQmRP?=
 =?us-ascii?Q?lTsAm6adoojkOxdf8nmwPliRsM6vfW93n9xHHCs9Pdex+QT8kvvGc3JcWKVd?=
 =?us-ascii?Q?1GsU1g/3gCvszBBBRKo1jjeI5jSsFiwSnqFEkVliMOTrRGDl4zoMCRbS/ubI?=
 =?us-ascii?Q?Eiu3crEg3OBCz54/qlXbEGQjCnI4AvEi4iKGvwFPC1sVe922DJl4zKssQT+J?=
 =?us-ascii?Q?x3kbw3wZ7Ydx5YnDB9K6u3JSBpGs0OokbBQKua2YgSH3yLFDduR/5ytG/uIb?=
 =?us-ascii?Q?JeoSqRz9+X6yd1VwrAkxDV0epv+82jRFEcnuNAnrjQ9nBlzRQ0XlCamkuO32?=
 =?us-ascii?Q?1aqqaKNr8Ne8H1Mybi5NTRXSBFwR7sOd1UAO8Jf/PadrwuY4CjuSzJI4QrRM?=
 =?us-ascii?Q?DXXBVxmbnVVr0P6HmDn7Ap7cKIXNVRr+l0Aly/DS/PaE9QYzJVcCYh7amEQm?=
 =?us-ascii?Q?1FItt46oYfniS4SjWtF2vVusttXxb2jPEOc+olrMSwMz2I8dccy4/Pg4mcpU?=
 =?us-ascii?Q?ocMnV0wpsKBIWfnXVSehn+jG3dD2IjSG+iR/Rh7T8RGta6v/gRHvEVVeHX7r?=
 =?us-ascii?Q?HxMs+hqD4m+qhxxEHVvMMl0KtZZOeTAGHrAo6VY/7C0dlv6gcXmwGzOw2VJv?=
 =?us-ascii?Q?x8i8oaeay6+WhP2qqmPE29LsLYnqHdewfN0/qqTPugK39qbBovP6QVRlGwTT?=
 =?us-ascii?Q?yZb3c4jq7ILLt65wUDZgbFi7GPcynSdU2JuhqanUsxkNbkcHj7oGDdUdmIrT?=
 =?us-ascii?Q?1H7zoNTu5pxIN7+vz9UzCKuDV30GSzwXficXQh+W8/jJXZQuSuLe/X+/GAl4?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27e288e8-c511-4259-d325-08dcbcdc0ef4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 03:40:51.0667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LcVAiO3NicukWkzlYgJqIANvBACf9/+OYFjxe9mlhm/n2K88q082UWWwNWc1lBcpKypyylaURvx7xAO+K51HuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7633
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

On Wed, Aug 14, 2024 at 04:29:19PM +0530, Riana Tauro wrote:
> Currently GuC is reloaded for both runtime resume and system resume.
> For D3hot <-> D0 transitions no power is lost during suspend so GuC reload
> is not necessary.
> 
> Remove GuC reload from D3Hot path and only enable/disable CTB
> communication.
> 
> v2: rebase
> 
> v3: fix commit message
>     add kernel-doc for gt suspend and resume methods
>     fix comment
>     do not split register and enable calls of CT (Michal)
> 
> v4: fix commit message
>     fix comment (Karthik)
>     split patches
>     correct kernel-doc (Rodrigo)
> 
> v5: do not expose internal function of CT layer (Michal)
>     remove wait for outstanding g2h as it will be always zero,
>     use assert instead (Matthew Brost)
>     use runtime suspend and runtime resume pair for CT layer
>     (Michal / Matthew Brost)
> 
> v6: use xe_gt_WARN_ON instead of xe_gt_assert (Michal)
>     assert and queue handler if g2h head and tail are
>     not equal (Matthew Brost)
> 
> v7: split functions into runtime suspend and resume (Lucas, Rodrigo)
>     move enable irq code to ct runtime resume (Michal)
> 

I know this has been a lot of revs, moving target, a bit conflicting
feedback but IMO looks really good and ready to merge. The CI failures
are a bit concerning though, can you hit retest button or send a rev8?
Hard to tell if noise or genuine issues.

Matt 

> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c     | 76 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt.h     |  2 +
>  drivers/gpu/drm/xe/xe_guc.c    | 45 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc.h    |  2 +
>  drivers/gpu/drm/xe/xe_guc_ct.c | 36 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_ct.h |  3 ++
>  drivers/gpu/drm/xe/xe_pm.c     |  9 ++--
>  drivers/gpu/drm/xe/xe_uc.c     | 30 ++++++++++++++
>  drivers/gpu/drm/xe/xe_uc.h     |  2 +
>  9 files changed, 202 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 58895ed22f6e..466908c91f44 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -831,6 +831,12 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>  }
>  
> +/**
> + * xe_gt_suspend - GT suspend helper
> + * @gt: GT object
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
>  int xe_gt_suspend(struct xe_gt *gt)
>  {
>  	int err;
> @@ -881,6 +887,12 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
>  	return ret;
>  }
>  
> +/**
> + * xe_gt_resume - GT resume helper
> + * @gt: GT object
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
>  int xe_gt_resume(struct xe_gt *gt)
>  {
>  	int err;
> @@ -909,6 +921,70 @@ int xe_gt_resume(struct xe_gt *gt)
>  	return err;
>  }
>  
> +/**
> + * xe_gt_runtime_suspend - GT runtime suspend helper
> + * @gt: GT object
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +int xe_gt_runtime_suspend(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int ret = 0;
> +
> +	if (xe->d3cold.allowed)
> +		return xe_gt_suspend(gt);
> +
> +	xe_gt_dbg(gt, "suspending\n");
> +	xe_gt_sanitize(gt);
> +
> +	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (ret)
> +		goto err_force_wake;
> +
> +	ret = xe_uc_runtime_suspend(&gt->uc);
> +
> +err_force_wake:
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	if (ret)
> +		xe_gt_err(gt, "runtime suspend failed (%pe)\n", ERR_PTR(ret));
> +	else
> +		xe_gt_dbg(gt, "suspended\n");
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_gt_runtime_resume - GT runtime resume helper
> + * @gt: GT object
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +int xe_gt_runtime_resume(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int ret = 0;
> +
> +	if (xe->d3cold.allowed)
> +		return xe_gt_resume(gt);
> +
> +	xe_gt_dbg(gt, "resuming\n");
> +	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (ret)
> +		goto err_force_wake;
> +
> +	ret = xe_uc_runtime_resume(&gt->uc);
> +
> +err_force_wake:
> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	if (ret)
> +		xe_gt_err(gt, "runtime resume failed (%pe)\n", ERR_PTR(ret));
> +	else
> +		xe_gt_dbg(gt, "resumed\n");
> +
> +	return ret;
> +}
> +
>  struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
>  				     enum xe_engine_class class,
>  				     u16 instance, bool logical)
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 8b1a5027dcf2..402322ab8096 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -55,6 +55,8 @@ void xe_gt_record_user_engines(struct xe_gt *gt);
>  void xe_gt_suspend_prepare(struct xe_gt *gt);
>  int xe_gt_suspend(struct xe_gt *gt);
>  int xe_gt_resume(struct xe_gt *gt);
> +int xe_gt_runtime_suspend(struct xe_gt *gt);
> +int xe_gt_runtime_resume(struct xe_gt *gt);
>  void xe_gt_reset_async(struct xe_gt *gt);
>  void xe_gt_sanitize(struct xe_gt *gt);
>  int xe_gt_sanitize_freq(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index de0fe9e65746..bf365c6cea4d 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1101,6 +1101,51 @@ void xe_guc_sanitize(struct xe_guc *guc)
>  	guc->submission_state.enabled = false;
>  }
>  
> +/**
> + * xe_guc_runtime_suspend - GuC runtime suspend
> + * @guc: GuC object
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +int xe_guc_runtime_suspend(struct xe_guc *guc)
> +{
> +	return xe_guc_ct_runtime_suspend(&guc->ct);
> +}
> +
> +/**
> + * xe_guc_runtime_resume - GuC runtime resume
> + * @guc: GuC object
> + *
> + * This function enables interrupts and CTB communication
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +int xe_guc_runtime_resume(struct xe_guc *guc)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +	int err;
> +
> +	/*
> +	 * Power is not lost when in D3Hot state, hence it is not necessary
> +	 * to reload GuC everytime. Only enable interrupts and
> +	 * CTB communication during resume
> +	 */
> +	if (IS_SRIOV_VF(xe) && xe_device_has_memirq(xe)) {
> +		struct xe_gt *gt = guc_to_gt(guc);
> +		struct xe_tile *tile = gt_to_tile(gt);
> +
> +		err = xe_memirq_init_guc(&tile->sriov.vf.memirq, guc);
> +		if (err)
> +			return err;
> +	} else {
> +		guc_enable_irq(guc);
> +	}
> +
> +	xe_guc_ct_runtime_resume(&guc->ct);
> +
> +	return 0;
> +}
> +
>  int xe_guc_reset_prepare(struct xe_guc *guc)
>  {
>  	return xe_guc_submit_reset_prepare(guc);
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index c3e6b51f7a09..cb062f8ad868 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -32,6 +32,8 @@ int xe_guc_upload(struct xe_guc *guc);
>  int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>  int xe_guc_enable_communication(struct xe_guc *guc);
>  int xe_guc_suspend(struct xe_guc *guc);
> +int xe_guc_runtime_suspend(struct xe_guc *guc);
> +int xe_guc_runtime_resume(struct xe_guc *guc);
>  void xe_guc_notify(struct xe_guc *guc);
>  int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
>  int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index beeeb120d1fc..41bdb9437634 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -419,6 +419,42 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  	return err;
>  }
>  
> +/**
> + * xe_guc_ct_runtime_resume- GuC CT runtime resume
> + * @ct: the &xe_guc_ct
> + *
> + * Mark GuC CT as enabled on runtime resume
> + */
> +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct)
> +{
> +	struct guc_ctb *g2h = &ct->ctbs.g2h;
> +
> +	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
> +
> +	/* Assert if g2h head and tail are unequal and queue g2h handler */
> +	if (xe_gt_WARN_ON(ct_to_gt(ct), desc_read(ct_to_xe(ct), g2h, tail) != g2h->info.head))
> +		queue_work(ct->g2h_wq, &ct->g2h_worker);
> +}
> +
> +/**
> + * xe_guc_ct_runtime_suspend- GuC CT runtime suspend
> + * @ct: the &xe_guc_ct
> + *
> + * Mark GuC CT as disabled on runtime suspend
> + *
> + * Return: 0 on success, negative error code otherwise
> + */
> +int xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct)
> +{
> +	/* Assert if there are any outstanding g2h and abort suspend */
> +	if (xe_gt_WARN_ON(ct_to_gt(ct), ct->g2h_outstanding))
> +		return -EBUSY;
> +
> +	xe_guc_ct_disable(ct);
> +
> +	return 0;
> +}
> +
>  static void stop_g2h_handler(struct xe_guc_ct *ct)
>  {
>  	cancel_work_sync(&ct->g2h_worker);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 190202fce2d0..0cf9d77feb35 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -16,6 +16,9 @@ void xe_guc_ct_disable(struct xe_guc_ct *ct);
>  void xe_guc_ct_stop(struct xe_guc_ct *ct);
>  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>  
> +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct);
> +int xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct);
> +
>  struct xe_guc_ct_snapshot *
>  xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct, bool atomic);
>  void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 9f3c14fd9f33..0b8e984ffb5c 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -374,7 +374,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  	}
>  
>  	for_each_gt(gt, xe, id) {
> -		err = xe_gt_suspend(gt);
> +		err = xe_gt_runtime_suspend(gt);
>  		if (err)
>  			goto out;
>  	}
> @@ -427,8 +427,11 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  
>  	xe_irq_resume(xe);
>  
> -	for_each_gt(gt, xe, id)
> -		xe_gt_resume(gt);
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_runtime_resume(gt);
> +		if (err)
> +			goto out;
> +	}
>  
>  	if (xe->d3cold.allowed) {
>  		xe_display_pm_resume(xe, true);
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 0d073a9987c2..7bbc8b3c556f 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -288,6 +288,36 @@ int xe_uc_suspend(struct xe_uc *uc)
>  	return xe_guc_suspend(&uc->guc);
>  }
>  
> +/**
> + * xe_uc_runtime_suspend - uC runtime suspend
> + * @uc: uC object
> + *
> + * Return: 0 on success, negative error code otherwise
> + */
> +int xe_uc_runtime_suspend(struct xe_uc *uc)
> +{
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> +		return 0;
> +
> +	return xe_guc_runtime_suspend(&uc->guc);
> +}
> +
> +/**
> + * xe_uc_runtime_resume - uC runtime resume
> + * @uc: uC object
> + *
> + * Called while resuming from D3Hot
> + *
> + * Return: 0 on success, negative error code otherwise
> + */
> +int xe_uc_runtime_resume(struct xe_uc *uc)
> +{
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> +		return 0;
> +
> +	return xe_guc_runtime_resume(&uc->guc);
> +}
> +
>  /**
>   * xe_uc_remove() - Clean up the UC structures before driver removal
>   * @uc: the UC object
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 506517c11333..0beec5efde6b 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -15,6 +15,8 @@ int xe_uc_init_hw(struct xe_uc *uc);
>  int xe_uc_fini_hw(struct xe_uc *uc);
>  void xe_uc_gucrc_disable(struct xe_uc *uc);
>  int xe_uc_reset_prepare(struct xe_uc *uc);
> +int xe_uc_runtime_suspend(struct xe_uc *uc);
> +int xe_uc_runtime_resume(struct xe_uc *uc);
>  void xe_uc_stop_prepare(struct xe_uc *uc);
>  void xe_uc_stop(struct xe_uc *uc);
>  int xe_uc_start(struct xe_uc *uc);
> -- 
> 2.40.0
> 
